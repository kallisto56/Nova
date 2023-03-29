namespace System.Engine.Implementations.Vulkan;


using System;
using System.Threading;
using System.Diagnostics;
using System.Collections;

using API.Vulkan;
using static API.Vulkan.VulkanNative;


public class VulkanGraphicsContext : GraphicsContext
{
	public VulkanPhysicalDevice physicalDevice;
	public VulkanLogicalDevice logicalDevice;
	public VulkanSwapchain swapchain;
	public VulkanDescriptorPool descriptorPool;
	public VulkanCommandPool commandPool;
	public VulkanDebugger debugger;
	public DefaultSamplers defaultSamplers;

	public VkInstance instance;
	public VkAllocationCallbacks* allocationCallbacks;
	public bool isDebuggerEnabled;
	public VkSurfaceKHR surface;


	public struct DefaultSamplers
	{
		public VulkanSampler pointSampler;
	}


	void OnError (Error e)
	{

	}


	override public Result<void, Error> Initialize (Self.Description description, Window window)
	{
		this.isDebuggerEnabled = description.deviceOptions.isDebuggerEnabled;
		this.window = window;

		VulkanNative.Initialize().Resolve!();
		VulkanNative.LoadPreInstanceFunctions().Resolve!();

		this.CreateInstance(description).Resolve!();

		VulkanNative.LoadInstanceFunctions(this.instance).Resolve!();
		VulkanNative.LoadPostInstanceFunctions().Resolve!();

		this.surface = window
			.CreateVulkanSurface(this.instance, this.allocationCallbacks)
			.Resolve!();

		this.physicalDevice = new VulkanPhysicalDevice(this);
		this.physicalDevice.Initialize().Resolve!();

		this.logicalDevice = new VulkanLogicalDevice(this);
		this.logicalDevice.Initialize().Resolve!();

		/*this.resourceFactory = new VulkanResourceFactory(this);*/
		/*this.resourceFactory.Initialize().Resolve!();*/

		this.commandPool = this.Create(CommandPool.Description())
			.Resolve!() as VulkanCommandPool;

		this.descriptorPool = new VulkanDescriptorPool(this);
		this.descriptorPool.Initialize().Resolve!();

		this.CreateSwapchain(description).Resolve!();

		return .Ok;
	}


	[Inline]
	Result<void, Error> CreateSwapchain (Self.Description description)
	{
		// TODO: expose options for user to tweak
		// TODO: Pick depth format from the list of available formats in physical device properties
		Swapchain.Description swapchainDescription = Swapchain.Description()
		{
			depthFormat = description.depthFormat,
		};

		this.swapchain = this.Create(swapchainDescription)
			.Resolve!() as VulkanSwapchain;

		this.swapchain.AcquireImage()
			.Resolve!();

		return .Ok;
	}


	[Inline]
	Result<void, Error> CreateInstance (Self.Description description)
	{
		VkExtensions availableValidationLayers = scope VkExtensions();
		VkExtensions.GetAvailableValidationLayers(availableValidationLayers).Resolve!();

		VkExtensions availableExtensions = scope VkExtensions();
		VkExtensions.GetAvailableExtensions(availableExtensions).Resolve!();

		VkExtensions requiredExtensions = scope VkExtensions()
			..Add(VK_KHR_SURFACE_EXTENSION_NAME)
			..Add(VK_KHR_WIN32_SURFACE_EXTENSION_NAME)
			..Add(VK_EXT_DEBUG_UTILS_EXTENSION_NAME)
			..Add(VK_EXT_DEBUG_REPORT_EXTENSION_NAME)
			;

		VkExtensions requiredValidationLayers = scope VkExtensions()
			..Add(VK_LAYER_KHRONOS_VALIDATION);


		VkInstanceCreateInfo createInfo = VkInstanceCreateInfo()
		{
			enabledExtensionCount = uint32(requiredExtensions.Count),
			ppEnabledExtensionNames = requiredExtensions.CArray(),
			
			enabledLayerCount = 0,
			ppEnabledLayerNames = null,
			pNext = null,

			pApplicationInfo = &VkApplicationInfo()
			{
				pNext = null,
	
				pApplicationName = description.applicationName.CStr(),
				applicationVersion = description.applicationVersion,
	
				pEngineName = description.engineName.CStr(),
				engineVersion = description.engineVersion,
	
				apiVersion = description.vulkanVersion,
			},
		};

		VkDebugUtilsMessengerCreateInfoEXT debugCreateInfo;
		bool isDebuggerAvailable = VkExtensions.ContainsRequired(availableValidationLayers, requiredValidationLayers);
		this.debugger = new VulkanDebugger(this);

		// Enable debugger to catch any issues before creating and after deleting VkInstance
		if (isDebuggerEnabled == true && isDebuggerAvailable == true)
		{
			createInfo.ppEnabledLayerNames = requiredValidationLayers.CArray();
			createInfo.enabledLayerCount = uint32(requiredValidationLayers.Count);

			this.debugger.PopulateDebugMessengerCreateInfo(out debugCreateInfo);
			createInfo.pNext = &debugCreateInfo;
		}

		// ...
		vkCreateInstance(&createInfo, this.allocationCallbacks, &this.instance).Resolve!();

		// ...
		if (isDebuggerEnabled == true && isDebuggerAvailable == true)
		{
			GraphicsDeviceDebugger.Description debuggerDescription = GraphicsDeviceDebugger.Description()
			{
				onErrorCallback = new => this.OnError,
			};
			this.debugger.Initialize(debuggerDescription).Resolve!();
		}

		return .Ok;
	}


	override public void Dispose ()
	{
		if (this.commandPool != null)
		{
			delete this.commandPool..Dispose();
			this.commandPool = null;
		}

		if (this.descriptorPool != null)
		{
			delete this.descriptorPool..Dispose();
			this.descriptorPool = null;
		}

		if (this.swapchain != null)
		{
			delete this.swapchain..Dispose();
			this.swapchain = null;
		}

		if (this.surface != default)
		{
			vkDestroySurfaceKHR(this.instance, this.surface, this.allocationCallbacks);
			this.surface = default;
		}

		if (this.logicalDevice != null)
		{
			delete this.logicalDevice..Dispose();
			this.logicalDevice = null;
		}

		if (this.physicalDevice != null)
		{
			delete this.physicalDevice..Dispose();
			this.physicalDevice = null;
		}

		if (this.debugger != null)
		{
			delete this.debugger..Dispose();
			this.debugger = null;
		}

		if (this.instance != default)
		{
			vkDestroyInstance(this.instance, this.allocationCallbacks);
			this.instance = default;
		}
	}


	/*override public ResourceFactory GetResourceFactory ()
	{
		return this.resourceFactory;
	}*/


	override public Swapchain GetSwapchain ()
	{
		return this.swapchain;
	}


	override public CommandPool GetCommandPool ()
	{
		return this.commandPool;
	}


	override public Result<void, Error> WaitForIdle ()
	{
		vkDeviceWaitIdle(this.logicalDevice.handle)
			.Resolve!();

		return .Ok;
	}


	override public Result<void, Error> UpdateBuffer (Buffer buffer, uint64 offsetInBytes, uint64 sizeInBytes, void* ptr)
	{
		VulkanBuffer vulkanBuffer = buffer as VulkanBuffer;

		if (vulkanBuffer.properties.HasFlag(.VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT) == true)
		{
			void* data = (void*)0;
			vkMapMemory(this.logicalDevice.handle, vulkanBuffer.memory, 0, (VkDeviceSize)sizeInBytes, 0, &data)
				.Resolve!();

			Internal.MemCpy(data, ptr, (.)sizeInBytes);
			vkUnmapMemory(this.logicalDevice.handle, vulkanBuffer.memory);
		}
		else
		{
			Tracy.WriteLine("TODO: Stagging buffer");
			VulkanBuffer staging = scope VulkanBuffer(this);
			staging.Initialize(.(buffer.sizeInBytes, .staging));

			void* data = ?;
			vkMapMemory(this.logicalDevice.handle, staging.memory, 0, sizeInBytes, 0, &data)
				.Resolve!();
			Internal.MemCpy(data, ptr, (.)sizeInBytes);
			VulkanNative.vkUnmapMemory(this.logicalDevice.handle, staging.memory);

			VkCommandBuffer commandBuffer = BeginSingleTimeCommands();
			VkBufferCopy copyRegion = VkBufferCopy()
			{
				srcOffset = 0,
				dstOffset = 0,
				size = sizeInBytes,
			};

			vkCmdCopyBuffer(commandBuffer, staging.handle, vulkanBuffer.handle, 1, &copyRegion);
			EndSingleTimeCommands(ref commandBuffer);
		}

		return .Ok;
	}


	public Result<VkCommandBuffer, Error> BeginSingleTimeCommands()
	{
		// TODO: This method, and EndSingleTimeCommands should be place in different class
	    VkCommandBufferAllocateInfo allocateInfo = VkCommandBufferAllocateInfo();
	    allocateInfo.level = .VK_COMMAND_BUFFER_LEVEL_PRIMARY;
	    allocateInfo.commandPool = this.commandPool.handle;
	    allocateInfo.commandBufferCount = 1;

	    VkCommandBuffer commandBuffer = ?;
	    vkAllocateCommandBuffers(this.logicalDevice.handle, &allocateInfo, &commandBuffer).Resolve!();

	    VkCommandBufferBeginInfo beginInfo = VkCommandBufferBeginInfo();
	    beginInfo.flags = .VK_COMMAND_BUFFER_USAGE_ONE_TIME_SUBMIT_BIT;

	    vkBeginCommandBuffer(commandBuffer, &beginInfo).Resolve!();
	    return commandBuffer;
	}


	public Result<void, Error> EndSingleTimeCommands (ref VkCommandBuffer commandBuffer)
	{
	    vkEndCommandBuffer(commandBuffer).Resolve!();

	    VkSubmitInfo submitInfo = VkSubmitInfo();
	    submitInfo.commandBufferCount = 1;
	    submitInfo.pCommandBuffers = &commandBuffer;

	    vkQueueSubmit(this.logicalDevice.graphicsQueue.handle, 1, &submitInfo, (VkFence)0).Resolve!();
	    vkQueueWaitIdle(this.logicalDevice.graphicsQueue.handle).Resolve!();

	    vkFreeCommandBuffers(this.logicalDevice.handle, this.commandPool.handle, 1, &commandBuffer);

		return .Ok;
	}


	public Result<uint32, Error> FindMemoryType (uint32 typeFilter, VkMemoryPropertyFlags properties)
	{
		VkPhysicalDeviceMemoryProperties memProperties = ?;
		vkGetPhysicalDeviceMemoryProperties(this.physicalDevice.handle, &memProperties);

		for (uint32 i = 0; i < memProperties.memoryTypeCount; i++)
		{
			bool hasBits = typeFilter & (1 << i) != 0;
			bool containsProperties = memProperties.memoryTypes[i].propertyFlags & properties == properties;

			if (hasBits && containsProperties)
		        return i;
		}

		return .Err(new Error("Failed to find suitable memory type"));
	}


	override public Result<Buffer, Error> Create (Buffer.Description description)
	{
		this.Validate(description).Resolve!();

		VulkanBuffer resource = new VulkanBuffer(this);
		if (resource.Initialize(description) case .Err(var e))
		{
			delete resource..Dispose();
			return .Err(e);
		}

		return .Ok(resource);
	}


	override public Result<Texture, Error> Create (Texture.Description description)
	{
		this.Validate(description).Resolve!();

		VulkanTexture resource = new VulkanTexture(this);
		if (resource.Initialize(description) case .Err(var e))
		{
			delete resource..Dispose();
			return .Err(e);
		}

		return .Ok(resource);
	}


	override public Result<TextureView, Error> Create (TextureView.Description description)
	{
		this.Validate(description).Resolve!();

		VulkanTextureView resource = new VulkanTextureView(this);
		if (resource.Initialize(description) case .Err(var e))
		{
			delete resource..Dispose();
			return .Err(e);
		}

		return .Ok(resource);
	}


	override public Result<ResourceLayout, Error> Create (ResourceLayout.Description description)
	{
		this.Validate(description).Resolve!();

		VulkanResourceLayout resource = new VulkanResourceLayout(this);
		if (resource.Initialize(description) case .Err(var e))
		{
			delete resource..Dispose();
			return .Err(e);
		}

		return .Ok(resource);
	}


	override public Result<ResourceSet, Error> Create (ResourceSet.Description description)
	{
		this.Validate(description).Resolve!();

		VulkanResourceSet resource = new VulkanResourceSet(this);
		if (resource.Initialize(description) case .Err(var e))
		{
			delete resource..Dispose();
			return .Err(e);
		}

		return .Ok(resource);
	}


	override public Result<Pipeline, Error> Create (Pipeline.GraphicsDescription description)
	{
		this.Validate(description).Resolve!();

		VulkanPipeline resource = new VulkanPipeline(this);
		let response = resource.Initialize(description);
		if (response case .Err(var e))
		{
			delete resource..Dispose();
			return .Err(e);
		}

		return .Ok(resource);
	}


	override public Result<Pipeline, Error> Create (Pipeline.ComputeDescription description)
	{
		this.Validate(description).Resolve!();

		VulkanPipeline resource = new VulkanPipeline(this);
		if (resource.Initialize(description) case .Err(var e))
		{
			delete resource..Dispose();
			return .Err(e);
		}

		return .Ok(resource);
	}


	override public Result<ShaderModule, Error> Create (ShaderModule.Description description)
	{
		this.Validate(description).Resolve!();

		VulkanShaderModule resource = new VulkanShaderModule(this);
		if (resource.Initialize(description) case .Err(var e))
		{
			delete resource..Dispose();
			return .Err(e);
		}

		return .Ok(resource);
	}


	override public Result<Sampler, Error> Create (Sampler.Description description)
	{
		this.Validate(description).Resolve!();

		VulkanSampler resource = new VulkanSampler(this);
		if (resource.Initialize(description) case .Err(var e))
		{
			delete resource..Dispose();
			return .Err(e);
		}

		return .Ok(resource);
	}


	override public Result<Swapchain, Error> Create (Swapchain.Description description)
	{
		this.Validate(description).Resolve!();

		VulkanSwapchain resource = new VulkanSwapchain(this);
		if (resource.Initialize(description) case .Err(var e))
		{
			delete resource..Dispose();
			return .Err(e);
		}

		return .Ok(resource);
	}


	override public Result<CommandPool, Error> Create (CommandPool.Description description)
	{
		this.Validate(description).Resolve!();

		VulkanCommandPool resource = new VulkanCommandPool(this);
		if (resource.Initialize(description) case .Err(var e))
		{
			delete resource..Dispose();
			return .Err(e);
		}

		return .Ok(resource);
	}


	override public Result<Framebuffer, Error> Create (Framebuffer.Description description)
	{
		this.Validate(description).Resolve!();

		VulkanFramebuffer resource = new VulkanFramebuffer(this);
		if (resource.Initialize(description) case .Err(var e))
		{
			delete resource..Dispose();
			return .Err(e);
		}

		return .Ok(resource);
	}


	override public Result<RenderPass, Error> Create (RenderPass.Description description)
	{
		this.Validate(description).Resolve!();

		VulkanRenderPass resource = new VulkanRenderPass(this);
		if (resource.Initialize(description) case .Err(var e))
		{
			delete resource..Dispose();
			return .Err(e);
		}

		return .Ok(resource);
	}


	override public Result<Fence, Error> Create (Fence.Description description)
	{
		this.Validate(description).Resolve!();

		VulkanFence resource = new VulkanFence(this);
		if (resource.Initialize(description) case .Err(var e))
		{
			delete resource..Dispose();
			return .Err(e);
		}

		return .Ok(resource);
	}


	override public Result<void, Error> CompileShaders (ShaderModule[] array, params ShaderModule.Description[] descriptions)
	{
		for (uint32 n = 0; n < descriptions.Count; n++)
			array[n] = this.Create(descriptions[n]).Resolve!();

		return .Ok;
	}


	override public Result<void, Error> Validate (Buffer.Description e)
	{
		if (e.sizeInBytes == 0)
			return .Err(new Error("Buffer.Description(sizeInBytes equals to zero)"));

		return .Ok;
	}


}