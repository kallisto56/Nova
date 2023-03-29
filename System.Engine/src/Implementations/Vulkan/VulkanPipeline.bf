namespace System.Engine.Implementations.Vulkan;


using System;
using System.Math;
using System.Threading;
using System.Diagnostics;
using System.Collections;

using API.Vulkan;
using static API.Vulkan.VulkanNative;


public class VulkanPipeline : Pipeline
{
	VulkanGraphicsContext context;
	override public String name { get; protected set; }

	public VkPipeline handle;
	public VulkanRenderPass renderPass;

	public VkGraphicsPipelineCreateInfo pipelineInfo;

	public VkPipelineVertexInputStateCreateInfo vertexInputInfo;
	public VkVertexInputBindingDescription[] bingingDescription;
	public VkVertexInputAttributeDescription[] attributeDescriptions;

	public VkPipelineShaderStageCreateInfo[] shaderStages;

	public VkPipelineInputAssemblyStateCreateInfo inputAssembly;

	public VkDynamicState[] dynamicStates;
	public VkPipelineDynamicStateCreateInfo dynamicState;

	public VkViewport viewport;
	public VkRect2D scissor;
	public VkPipelineViewportStateCreateInfo viewportState;

	public VkPipelineRasterizationStateCreateInfo rasterizer;

	public VkPipelineMultisampleStateCreateInfo multisampling;

	public VkPipelineColorBlendAttachmentState[] colorBlendAttachments;
	public VkPipelineColorBlendStateCreateInfo colorBlending;

	public VkPipelineLayoutCreateInfo pipelineLayoutInfo;
	public VkPipelineLayout layout;

	public VkPipelineDepthStencilStateCreateInfo depthStencil;
	public VkDescriptorPool descriptorPool;
	public VkDescriptorSetLayout[] descriptorSetLayouts;
	public VkDescriptorSet[] descriptorSets;


	public this (VulkanGraphicsContext context)
	{
		this.context = context;
	}


	public ~this ()
	{

	}


	override public Result<void, Error> Initialize (Self.ComputeDescription description)
	{
		return .Err(new Error("VulkanPipeline.Initialize(Self.ComputeDescription description) is not implemented"));
	}


	override public void Dispose ()
	{
		if (this.bingingDescription != null)
		{
			delete this.bingingDescription;
			this.bingingDescription = null;
		}

		if (this.attributeDescriptions != null)
		{
			delete this.attributeDescriptions;
			this.attributeDescriptions = null;
		}

		if (this.dynamicStates != null)
		{
			delete this.dynamicStates;
			this.dynamicStates = null;
		}

		if (this.colorBlendAttachments != null)
		{
			delete this.colorBlendAttachments;
			this.colorBlendAttachments = null;
		}

		if (this.shaderStages != null)
		{
			delete this.shaderStages;
			this.shaderStages = null;
		}

		if (this.descriptorSetLayouts != null)
		{
			delete this.descriptorSetLayouts;
			this.descriptorSetLayouts = null;
		}

		if (this.descriptorSets != null)
		{
			delete this.descriptorSets;
			this.descriptorSets = null;
		}

		if (this.layout != default)
		{
			vkDestroyPipelineLayout(this.context.logicalDevice.handle, this.layout, this.context.allocationCallbacks);
			this.layout = default;
		}

		if (this.handle != default)
		{
			vkDestroyPipeline(this.context.logicalDevice.handle, this.handle, this.context.allocationCallbacks);
			this.handle = default;
		}
	}


	[Inline]
	Result<void, Error> CreateInputAssembly (Self.PrimitiveTopology topology, bool primitiveRestartEnable)
	{
		this.inputAssembly = VkPipelineInputAssemblyStateCreateInfo()
		{
			topology = VulkanFormats.Convert(topology),
			primitiveRestartEnable = primitiveRestartEnable
		};

		return .Ok;
	}


	[Inline]
	Result<void, Error> CreateDynamicState ()
	{
		this.dynamicStates = new VkDynamicState[]
		(
		    .VK_DYNAMIC_STATE_VIEWPORT,
		    .VK_DYNAMIC_STATE_SCISSOR
		);

		this.dynamicState = VkPipelineDynamicStateCreateInfo()
		{
			dynamicStateCount = uint32(this.dynamicStates.Count),
			pDynamicStates = this.dynamicStates.CArray(),
		};

		return .Ok;
	}


	[Inline]
	Result<void, Error> CreateViewportState ()
	{
		this.viewport = VkViewport()
		{
			x = 0.0F,
			y = 0.0F,
			width = float(this.context.swapchain.width),
			height = float(this.context.swapchain.height),
			minDepth = 0.0F,
			maxDepth = 1.0F
		};

		this.scissor = VkRect2D()
		{
			offset = VkOffset2D(0, 0),
			extent = VkExtent2D(this.context.swapchain.width, this.context.swapchain.height),
		};

		this.viewportState = VkPipelineViewportStateCreateInfo()
		{
			viewportCount = 1,
			pViewports = &this.viewport,

			scissorCount = 1,
			pScissors = &this.scissor
		};

		return .Ok;
	}


	[Inline]
	Result<void, Error> CreateRasterizer (Self.GraphicsDescription description)
	{
		this.rasterizer = VkPipelineRasterizationStateCreateInfo()
		{
			depthClampEnable = !description.rasterizerState.DepthClipEnabled,
			rasterizerDiscardEnable = false,
			polygonMode = VulkanFormats.Convert(description.rasterizerState.FillMode),
			lineWidth = 1.0F,
			cullMode = VulkanFormats.Convert(description.rasterizerState.CullMode),
			frontFace = VulkanFormats.Convert(description.rasterizerState.FrontFace),
			depthBiasEnable = false,
			depthBiasConstantFactor = 0.0F,
			depthBiasClamp = 0.0F,
			depthBiasSlopeFactor = 0.0F
		};

		return .Ok;
	}


	[Inline]
	Result<void, Error> CreateMultisampling (Self.GraphicsDescription description)
	{
		this.multisampling = VkPipelineMultisampleStateCreateInfo()
		{
			sampleShadingEnable = false,
			rasterizationSamples = VulkanFormats.Convert(description.outputs.sampleCount),
			minSampleShading = 1.0F,
			pSampleMask = null,
			alphaToCoverageEnable = description.blendState.alphaToCoverageEnabled,
			alphaToOneEnable = description.blendState.alphaToOneEnable,
		};

		return .Ok;
	}


	Result<void, Error> CreateColorBlending (Self.GraphicsDescription description)
	{
		this.colorBlendAttachments = new VkPipelineColorBlendAttachmentState[description.blendState.attachmentStates.Count];

		for (uint32 n = 0; n < this.colorBlendAttachments.Count; n++)
		{
		    BlendAttachmentDescription vdDesc = description.blendState.attachmentStates[n];
			VkColorComponentFlags colorWriteMask = vdDesc.ColorWriteMask.HasValue == true
				? VulkanFormats.Convert(vdDesc.ColorWriteMask.Value)
				: .VK_COLOR_COMPONENT_R_BIT | .VK_COLOR_COMPONENT_G_BIT | .VK_COLOR_COMPONENT_B_BIT | .VK_COLOR_COMPONENT_A_BIT;

		    this.colorBlendAttachments[n] = VkPipelineColorBlendAttachmentState()
			{
				srcColorBlendFactor = VulkanFormats.Convert(vdDesc.SourceColorFactor),
				dstColorBlendFactor = VulkanFormats.Convert(vdDesc.DestinationColorFactor),
				colorBlendOp = VulkanFormats.Convert(vdDesc.ColorFunction),
				srcAlphaBlendFactor = VulkanFormats.Convert(vdDesc.SourceAlphaFactor),
				dstAlphaBlendFactor = VulkanFormats.Convert(vdDesc.DestinationAlphaFactor),
				alphaBlendOp = VulkanFormats.Convert(vdDesc.AlphaFunction),
				colorWriteMask = colorWriteMask,
				blendEnable = vdDesc.BlendEnabled,
			};
		}

		Color<float> blendFactor = description.blendState.blendFactor;

		this.colorBlending = VkPipelineColorBlendStateCreateInfo()
		{
			logicOpEnable = false,
			logicOp = .VK_LOGIC_OP_COPY,
			attachmentCount = uint32(this.colorBlendAttachments.Count),
			pAttachments = this.colorBlendAttachments.CArray(),
			blendConstants = float[4](blendFactor.r, blendFactor.g, blendFactor.b, blendFactor.a)
		};

		return .Ok;
	}


	[Inline]
	Result<void, Error> CreatePipelineLayout (Self.GraphicsDescription description)
	{
		ResourceLayout[] resourceLayouts = description.resourceLayouts;

		this.descriptorSetLayouts = new VkDescriptorSetLayout[resourceLayouts.Count];
		for (int n = 0; n < resourceLayouts.Count; n++)
		{
			VulkanResourceLayout resourceLayout = resourceLayouts[n] as VulkanResourceLayout;
		    this.descriptorSetLayouts[n] = resourceLayout.handle;
		}

		this.pipelineLayoutInfo = VkPipelineLayoutCreateInfo()
		{
			pNext = null,
			flags = .None,
			setLayoutCount = uint32(this.descriptorSetLayouts.Count),
			pSetLayouts = this.descriptorSetLayouts.CArray(),
			pushConstantRangeCount = 0,
			pPushConstantRanges = null,
		};

		vkCreatePipelineLayout(this.context.logicalDevice.handle, &this.pipelineLayoutInfo, this.context.allocationCallbacks, &this.layout)
			.Resolve!();

		return .Ok;
	}

	[Inline]
	Result<void, Error> CreateDescriptorSets (Self.GraphicsDescription description)
	{
		return .Ok;
	}

	[Inline]
	Result<void, Error> CreateDepthStencilState (Self.GraphicsDescription description)
	{
		let e = description.depthStencilState;

		this.depthStencil = VkPipelineDepthStencilStateCreateInfo()
		{
			depthWriteEnable = e.DepthWriteEnabled,
			depthTestEnable = e.DepthTestEnabled,
			depthCompareOp = VulkanFormats.Convert(e.DepthComparison),

			depthBoundsTestEnable = false,
			minDepthBounds = 0.0F,
			maxDepthBounds = 1.0F,

			stencilTestEnable = e.StencilTestEnabled,

			front = VkStencilOpState()
			{
				failOp = VulkanFormats.Convert(e.StencilFront.Fail),
				passOp = VulkanFormats.Convert(e.StencilFront.Pass),
				depthFailOp = VulkanFormats.Convert(e.StencilFront.DepthFail),
				compareOp = VulkanFormats.Convert(e.StencilFront.Comparison),
				compareMask = e.StencilReadMask,
				writeMask = e.StencilWriteMask,
				reference = e.StencilReference,
			},

			back = VkStencilOpState()
			{
				failOp = VulkanFormats.Convert(e.StencilBack.Fail),
				passOp = VulkanFormats.Convert(e.StencilBack.Pass),
				depthFailOp = VulkanFormats.Convert(e.StencilBack.DepthFail),
				compareOp = VulkanFormats.Convert(e.StencilBack.Comparison),
				compareMask = e.StencilReadMask,
				writeMask = e.StencilWriteMask,
				reference = e.StencilReference,
			}
		};

		return .Ok;
	}


	Result<void, Error> SetShaders (Self.GraphicsDescription description)
	{
		let shaders = description.shaderSet.shaders;
		this.shaderStages = new VkPipelineShaderStageCreateInfo[shaders.Count];

		for (uint32 n = 0; n < this.shaderStages.Count; n++)
		{
			VulkanShaderModule shaderModule = (VulkanShaderModule)shaders[n];
			// TODO: Should be moved to ResourceFactory.Validate
			if (shaderModule.pipelineCreateInfo == default)
			{
				String message = scope $"GraphicsPipeline.SetShaders: Provided shader at index {n} is not initialized...";
				return .Err(new Error(message));
			}

			this.shaderStages[n] = shaderModule.pipelineCreateInfo;
		}

		return .Ok;
	}


	Result<void, Error> CalculateVertexInputInfo (Self.GraphicsDescription description)
	{
		VertexLayoutDescription[] inputDescriptions = description.shaderSet.vertexLayouts;
		uint32 bindingCount = uint32(inputDescriptions.Count);
		uint32 attributeCount = 0;
		for (int i = 0; i < inputDescriptions.Count; i++)
		{
		    attributeCount += uint32(inputDescriptions[i].Elements.Count);
		}
		
		this.bingingDescription = new VkVertexInputBindingDescription[bindingCount];
		this.attributeDescriptions = new VkVertexInputAttributeDescription[attributeCount];

		uint32 targetIndex = 0;
		uint32 targetLocation = 0;
		for (uint32 binding = 0; binding < inputDescriptions.Count; binding++)
		{
		    VertexLayoutDescription inputDesc = inputDescriptions[binding];
		    bingingDescription[binding] = VkVertexInputBindingDescription()
		    {
		        binding = binding,
		        inputRate = (inputDesc.InstanceStepRate != 0)
					? .VK_VERTEX_INPUT_RATE_INSTANCE
					: .VK_VERTEX_INPUT_RATE_VERTEX,
		        stride = inputDesc.Stride
		    };

		    uint32 currentOffset = 0;
		    for (uint32 location = 0; location < inputDesc.Elements.Count; location++)
		    {
		        VertexElementDescription inputElement = inputDesc.Elements[location];

		        attributeDescriptions[targetIndex] = VkVertexInputAttributeDescription()
		        {
		            format = VulkanFormats.Convert(inputElement.Format),
		            binding = binding,
		            location = (targetLocation + location),
		            offset = currentOffset
		        };

		        targetIndex += 1;
		        currentOffset += FormatHelpers.GetSizeInBytes(inputElement.Format);
		    }

		    targetLocation += uint32(inputDesc.Elements.Count);
		}

		this.vertexInputInfo = VkPipelineVertexInputStateCreateInfo()
		{
			vertexBindingDescriptionCount = bindingCount,
			pVertexBindingDescriptions = this.bingingDescription.CArray(),
			vertexAttributeDescriptionCount = attributeCount,
			pVertexAttributeDescriptions = this.attributeDescriptions.CArray(),
		};

		return .Ok;
	}


	public virtual Result<void, Error> CreatePipeline ()
	{
		this.pipelineInfo = VkGraphicsPipelineCreateInfo()
		{
			stageCount = uint32(this.shaderStages.Count),
			pStages = this.shaderStages.CArray(),
			pVertexInputState = &this.vertexInputInfo,
			pInputAssemblyState = &this.inputAssembly,
			pTessellationState = null,
			pViewportState = &this.viewportState,
			pRasterizationState = &this.rasterizer,
			pMultisampleState = &this.multisampling,
			pDepthStencilState = &this.depthStencil,
			pColorBlendState = &this.colorBlending,
			pDynamicState = &this.dynamicState,
			layout = this.layout,
			renderPass = this.renderPass.handle,
			subpass = 0,
			basePipelineHandle = 0,
			basePipelineIndex = -1,
		};

		vkCreateGraphicsPipelines(
			device: this.context.logicalDevice.handle,
			pipelineCache: .Null,
			createInfoCount: 1,
			pCreateInfos: &this.pipelineInfo,
			pAllocator: this.context.allocationCallbacks,
			pPipelines: &this.handle
		).Resolve!();

		return .Ok;
	}


	override public Result<void, Error> Initialize (Self.GraphicsDescription description)
	{
		this.renderPass = description.renderPass as VulkanRenderPass;

		this.SetShaders(description).Resolve!();

		this.CalculateVertexInputInfo(description).Resolve!();

		this.CreateInputAssembly(description.primitiveTopology, false).Resolve!();
		this.CreateDynamicState().Resolve!();

		this.CreateViewportState().Resolve!();
		
		this.CreateRasterizer(description).Resolve!();
		this.CreateMultisampling(description).Resolve!();

		this.CreateColorBlending(description).Resolve!();
		this.CreateDepthStencilState(description).Resolve!();
		this.CreatePipelineLayout(description).Resolve!();
		this.CreateDescriptorSets(description).Resolve!();

		this.CreatePipeline().Resolve!();

		return .Ok;
	}


}