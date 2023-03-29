namespace System.Engine.Implementations.Vulkan;


using System;
using System.Math;
using System.Threading;
using System.Diagnostics;
using System.Collections;

using API.Vulkan;
using static API.Vulkan.VulkanNative;


public class VulkanRenderPass : RenderPass
{
	VulkanGraphicsContext context;
	override public String name { get; protected set; }

	public VkRenderPass handle;

	public VulkanTexture[] colorAttachments;
	public VulkanTexture depthAttachment;


	public this (VulkanGraphicsContext context)
	{
		this.context = context;
	}


	public ~this ()
	{

	}


	override public Result<void, Error> Initialize (Self.Description description)
	{
		uint32 countAttachments = uint32(description.colorAttachments.Count)
			+ (description.depthAttachment != null ? 1 : 0);

		VkAttachmentDescription[] attachments = scope VkAttachmentDescription[countAttachments];
		VkAttachmentReference[] colorReferences = scope VkAttachmentReference[description.colorAttachments.Count];

		VkAttachmentReference depthAttachmentReference = default;

		this.colorAttachments = new VulkanTexture[description.colorAttachments.Count];

		// Color attachments
		for (uint32 n = 0; n < description.colorAttachments.Count; n++)
		{
			VulkanTexture texture = this.colorAttachments[n] = description.colorAttachments[n] as VulkanTexture;
			VkSampleCountFlags sampleCount = VulkanFormats.Convert(texture.sampleCount);
			VkFormat format = VulkanFormats.Convert(texture.format, toDepthFormat: false);

			// TODO: IF SOMETHING GOES WRONG WITH RENDER PASS, LOOK OVER HERE
			attachments[n] = VkAttachmentDescription()
			{
				flags = .None,
				format = format,
				samples = sampleCount,
				loadOp = .VK_ATTACHMENT_LOAD_OP_CLEAR,
				storeOp = .VK_ATTACHMENT_STORE_OP_STORE,
				stencilLoadOp = .VK_ATTACHMENT_LOAD_OP_DONT_CARE,
				stencilStoreOp = .VK_ATTACHMENT_STORE_OP_DONT_CARE,
				initialLayout = .VK_IMAGE_LAYOUT_UNDEFINED,
				finalLayout = .VK_IMAGE_LAYOUT_PRESENT_SRC_KHR,
			};

			colorReferences[n] = VkAttachmentReference()
			{
				attachment = n,
				layout = .VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL,
			};
		}

		// Depth attachment
		if (description.depthAttachment != null)
		{
			VulkanTexture texture = this.depthAttachment = description.depthAttachment as VulkanTexture;
			VkSampleCountFlags sampleCount = VulkanFormats.Convert(texture.sampleCount);
			VkFormat format = VulkanFormats.Convert(texture.format, toDepthFormat: true);
			uint32 index = uint32(attachments.Count - 1);

			// TODO: IF SOMETHING GOES WRONG WITH RENDER PASS, LOOK OVER HERE
			attachments[index] = VkAttachmentDescription()
			{
				flags = .None,
				format = format,
				samples = sampleCount,
				loadOp = .VK_ATTACHMENT_LOAD_OP_CLEAR,
				storeOp = .VK_ATTACHMENT_STORE_OP_DONT_CARE,
				stencilLoadOp = .VK_ATTACHMENT_LOAD_OP_DONT_CARE,
				stencilStoreOp = .VK_ATTACHMENT_STORE_OP_DONT_CARE,
				initialLayout = .VK_IMAGE_LAYOUT_UNDEFINED,
				finalLayout = .VK_IMAGE_LAYOUT_DEPTH_STENCIL_ATTACHMENT_OPTIMAL,
			};

			depthAttachmentReference = VkAttachmentReference()
			{
				attachment = index,
				layout = .VK_IMAGE_LAYOUT_DEPTH_STENCIL_ATTACHMENT_OPTIMAL,
			};
		}

		// Single subpass description
		VkSubpassDescription subpass = VkSubpassDescription()
		{
			flags = .None, // VkSubpassDescriptionFlags
			pipelineBindPoint = .VK_PIPELINE_BIND_POINT_GRAPHICS, // VkPipelineBindPoint

			inputAttachmentCount = 0, // uint32
			pInputAttachments = null, // VkAttachmentReference*

			colorAttachmentCount = uint32(colorReferences.Count), // uint32
			pColorAttachments = colorReferences.CArray(), // VkAttachmentReference*

			pResolveAttachments = null, // VkAttachmentReference*

			preserveAttachmentCount = 0, // uint32
			pPreserveAttachments = null, // uint32*

			pDepthStencilAttachment = null,
		};

		// Depth reference
		if (description.depthAttachment != null)
		{
			subpass.pDepthStencilAttachment = &depthAttachmentReference;
		}

		// Subpass dependency
		VkSubpassDependency[] pDependencies = scope VkSubpassDependency[1];
		pDependencies[0] = VkSubpassDependency()
		{
			srcSubpass = VK_SUBPASS_EXTERNAL,
			srcStageMask = .VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT | .VK_PIPELINE_STAGE_EARLY_FRAGMENT_TESTS_BIT,
			srcAccessMask = .VK_ACCESS_COLOR_ATTACHMENT_READ_BIT | .VK_ACCESS_DEPTH_STENCIL_ATTACHMENT_READ_BIT,

			dstSubpass = 0,
			dstStageMask = .VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT | .VK_PIPELINE_STAGE_EARLY_FRAGMENT_TESTS_BIT,
			dstAccessMask = .VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT | .VK_ACCESS_DEPTH_STENCIL_ATTACHMENT_WRITE_BIT,
		};

		// Render pass create info
		VkRenderPassCreateInfo createInfo = VkRenderPassCreateInfo()
		{
			pNext = null,
			flags = .None,
			attachmentCount = countAttachments,
			pAttachments = attachments.CArray(),
			subpassCount = 1,
			pSubpasses = &subpass,
			dependencyCount = uint32(pDependencies.Count),
			pDependencies = pDependencies.CArray(),
		};

		// ...
		vkCreateRenderPass(this.context.logicalDevice.handle, &createInfo, this.context.allocationCallbacks, &this.handle)
			.Resolve!();

		return .Ok;
	}


	override public void Dispose ()
	{
		if (this.colorAttachments != null)
		{
			delete this.colorAttachments;
			this.colorAttachments = null;
		}

		if (this.handle != default)
		{
			vkDestroyRenderPass(this.context.logicalDevice.handle, this.handle, this.context.allocationCallbacks);
			this.handle = default;
		}
	}


}