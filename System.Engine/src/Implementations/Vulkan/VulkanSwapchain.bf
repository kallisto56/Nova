namespace System.Engine.Implementations.Vulkan;


using System;
using System.Threading;
using System.Diagnostics;
using System.Collections;

using API.Vulkan;
using static API.Vulkan.VulkanNative;


public class VulkanSwapchain : Swapchain
{
	VulkanGraphicsContext context;
	override public String name { get; protected set; }

	public uint32 width;
	public uint32 height;

	public VulkanFramebuffer[] framebuffers;
	public VulkanRenderPass renderPass;
	VkSwapchainKHR handle;

	public VkSurfaceFormatKHR surfaceFormat;
	public VkSemaphore[] imageAvailableSemaphores;
	public VkSemaphore[] renderFinishedSemaphores;
	public VulkanFence[] inFlightFences;
	public VulkanTexture[] images;
	public uint32 currentFrame;
	public uint32 imageIndex;
	public Texture.Format? depthFormat;

	public VulkanTexture depthTexture;


	public this (VulkanGraphicsContext context)
	{
		this.context = context;
	}


	public ~this()
	{
	}


	override public Result<void, Error> Initialize (Self.Description description)
	{
		this.depthFormat = description.depthFormat;

		this.Recreate().Resolve!();

		return .Ok;
	}


	Result<void, Error> Recreate ()
	{
		this.width = Math.Max(32, this.context.window.width);
		this.height = Math.Max(32, this.context.window.height);

		Tracy.WriteLine("Recreate(width: {}, height: {})", this.width, this.height);

		let physicalDevice = this.context.physicalDevice.handle;
		let surface = this.context.surface;

		VkSurfaceCapabilitiesKHR surfaceCapabilities = Self.GetSurfaceCapabilities(physicalDevice, surface).Resolve!();

		uint32 countFormats = ?;
		vkGetPhysicalDeviceSurfaceFormatsKHR(physicalDevice, surface, &countFormats, null)
			.Resolve!();

		VkSurfaceFormatKHR[] surfaceFormats = scope VkSurfaceFormatKHR[countFormats];
		vkGetPhysicalDeviceSurfaceFormatsKHR(physicalDevice, surface, &countFormats, surfaceFormats.CArray())
			.Resolve!();

		uint32 countPresentationModes = ?;
		vkGetPhysicalDeviceSurfacePresentModesKHR(physicalDevice, surface, &countPresentationModes, null)
			.Resolve!();

		VkPresentModeKHR[] presentationModes = scope VkPresentModeKHR[countPresentationModes];
		vkGetPhysicalDeviceSurfacePresentModesKHR(physicalDevice, surface, &countPresentationModes, presentationModes.CArray())
			.Resolve!();

		uint32 imageCount = Self.GetImageCount(surfaceCapabilities);
		this.surfaceFormat = Self.GetFormat(surfaceFormats);
		VkExtent2D extent = Self.CalculateExtent(this.width, this.height, surfaceCapabilities);
		VkImageUsageFlags usage = Self.GetUsageFlags(surfaceCapabilities).Resolve!();
		VkSurfaceTransformFlagsKHR transformation = Self.GetTransformationFlags(surfaceCapabilities);
		VkPresentModeKHR presentMode = Self.GetPresentMode(presentationModes).Resolve!();

		VkSwapchainKHR oldSwapchain = this.handle;
		VkSwapchainCreateInfoKHR createInfo = VkSwapchainCreateInfoKHR()
		{
			pNext = null,
			flags = 0,
			surface = this.context.surface,
			minImageCount = imageCount,
			imageFormat = surfaceFormat.format,
			imageColorSpace = surfaceFormat.colorSpace,
			imageExtent = extent,
			imageArrayLayers = 1,
			imageUsage = usage,
			imageSharingMode = .VK_SHARING_MODE_EXCLUSIVE,
			queueFamilyIndexCount = 0,
			pQueueFamilyIndices = null,
			preTransform = transformation,
			compositeAlpha = .VK_COMPOSITE_ALPHA_OPAQUE_BIT_KHR,
			presentMode = presentMode,
			clipped = .TRUE,
			oldSwapchain = oldSwapchain,
		};

		vkCreateSwapchainKHR(this.context.logicalDevice.handle, &createInfo, this.context.allocationCallbacks, &this.handle)
			.Resolve!();

		if (this.images != null)
		{
			for (uint32 n = 0; n < this.images.Count; n++)
				delete this.images[n]..Dispose();

			delete this.images;
		}

		this.images = new VulkanTexture[imageCount];
		VkImage[] vkImages = scope VkImage[imageCount];

		vkGetSwapchainImagesKHR(this.context.logicalDevice.handle, this.handle, &imageCount, vkImages.CArray())
			.Resolve!();

		for (uint32 n = 0; n < vkImages.Count; n++)
		{
			Texture.Description textureDescription = Texture.Description()
			{
				width = this.width,
				height = this.height,
				depth = 1,
				mipLevels = 1,
				arrayLayers = 1,
				format = VulkanFormats.Convert(this.surfaceFormat.format),
				usage = .renderTarget,
				type = .Texture2D,
				sampleCount = .count1,
			};

			this.images[n] = new VulkanTexture(this.context);
			this.images[n].Initialize(vkImages[n], textureDescription);
		}

		if (oldSwapchain != default)
			vkDestroySwapchainKHR(this.context.logicalDevice.handle, oldSwapchain, this.context.allocationCallbacks);

		this.DestroySyncObjects();
		this.CreateSyncObjects(imageCount).Resolve!();
		this.CreateImageViews().Resolve!();
		this.CreateDepthTexture().Resolve!();
		this.CreateRenderPass().Resolve!();
		this.CreateFramebuffer().Resolve!();

		this.currentFrame = 0;
		this.imageIndex = 0;

		return .Ok;
	}


	Result<void, Error> CreateImageViews ()
	{
		for (uint32 n = 0; n < this.images.Count; n++)
			this.images[n].GetView().Resolve!();

		return .Ok;
	}


	override public Result<void, Error> AcquireImage ()
	{
		let logicalDevice = this.context.logicalDevice.handle;
		this.context.swapchain.GetFrameInfo(var onImageAvailableSemaphore, var onRenderFinishedSemaphore, var fence);

		vkWaitForFences(
			device: logicalDevice,
			fenceCount: 1,
			pFences: &fence.handle,
			waitAll: VK_TRUE,
			timeout: uint64.MaxValue
		).Resolve!();

		vkResetFences(this.context.logicalDevice.handle, 1, &fence.handle)
			.Resolve!();

		this.imageIndex = 0;
		vkAcquireNextImageKHR(
			device: logicalDevice,
			swapchain: this.handle,
			timeout: uint64.MaxValue,
			semaphore: onImageAvailableSemaphore,
			fence: 0,
			pImageIndex: &this.imageIndex
		).Resolve!();

		return .Ok;
	}


	public Result<void, Error> PresentImage ()
	{
		if (this.context.window.isPendingClosure == true)
			return .Ok;

		this.GetFrameInfo(var onImageAvailableSemaphore, var onRenderFinishedSemaphore, var fence);

		VkSemaphore[?] waitSemaphores = VkSemaphore[?] (onRenderFinishedSemaphore);
		VkSwapchainKHR[?] swapchains = VkSwapchainKHR[?] (this.handle);
		uint32[?] imageIndices = uint32[?] (this.imageIndex);

		VkPresentInfoKHR presentInfo = VkPresentInfoKHR()
		{
			waitSemaphoreCount = uint32(waitSemaphores.Count),
			pWaitSemaphores = &waitSemaphores,
			swapchainCount = uint32(swapchains.Count),
			pSwapchains = &swapchains,
			pImageIndices = &imageIndices,
			pResults = null,
		};

		VkResult response = vkQueuePresentKHR(this.context.logicalDevice.presentationQueue.handle, &presentInfo);
		this.currentFrame = uint32((currentFrame + 1) % this.inFlightFences.Count);

		if (response == .VK_ERROR_OUT_OF_DATE_KHR || response == .VK_SUBOPTIMAL_KHR)
		{
			this.Recreate().Resolve!();
		}
		else if (response != .VK_SUCCESS)
		{
			response.Resolve!();
		}

		this.AcquireImage().Resolve!();

		return .Ok;
	}


	public Result<void, Error> GetFrameInfo (out VkSemaphore onImageAvailable, out VkSemaphore onRenderFinished, out VulkanFence fence)
	{
		onImageAvailable = this.imageAvailableSemaphores[this.currentFrame];
		onRenderFinished = this.renderFinishedSemaphores[this.currentFrame];
		fence = this.inFlightFences[this.currentFrame];

		return .Ok;
	}


	void DestroySyncObjects ()
	{
		VkDevice logicalDevice = this.context.logicalDevice.handle;
		VkAllocationCallbacks* allocationCallbacks = this.context.allocationCallbacks;

		if (this.inFlightFences != null)
		{
			for (uint32 n = 0; n < this.inFlightFences.Count; n++)
				delete this.inFlightFences[n]..Dispose();

			delete this.inFlightFences;
		}

		if (this.imageAvailableSemaphores != null)
		{
			for (uint32 n = 0; n < this.imageAvailableSemaphores.Count; n++)
				vkDestroySemaphore(logicalDevice, this.imageAvailableSemaphores[n], allocationCallbacks);

			delete this.imageAvailableSemaphores;
		}

		if (this.renderFinishedSemaphores != null)
		{
			for (uint32 n = 0; n < this.renderFinishedSemaphores.Count; n++)
				vkDestroySemaphore(logicalDevice, this.renderFinishedSemaphores[n], allocationCallbacks);

			delete this.renderFinishedSemaphores;
		}
	}


	public Result<void, Error> CreateSyncObjects (uint32 maxFramesInFlight)
	{
		// Shortcuts
		VkDevice logicalDevice = this.context.logicalDevice.handle;
		VkAllocationCallbacks* allocator = this.context.allocationCallbacks;

		// ...
		this.imageAvailableSemaphores = new VkSemaphore[maxFramesInFlight];
		this.renderFinishedSemaphores = new VkSemaphore[maxFramesInFlight];
		this.inFlightFences = new VulkanFence[maxFramesInFlight];

		// ...
		for (int n = 0; n < maxFramesInFlight; n++)
		{
			vkCreateSemaphore(logicalDevice, &VkSemaphoreCreateInfo(), allocator, &this.imageAvailableSemaphores[n]).Resolve!();
			vkCreateSemaphore(logicalDevice, &VkSemaphoreCreateInfo(), allocator, &this.renderFinishedSemaphores[n]).Resolve!();

			this.inFlightFences[n] = this.context.Create(Fence.Description(isSignaled: true))
				.Resolve!() as VulkanFence;
		}

		return .Ok;
	}


	static Result<VkPresentModeKHR, Error> GetPresentMode (VkPresentModeKHR[] modes)
	{
		bool isMailboxSupported = false;
		bool isFIFOSupported = false;

		for (uint32 n = 0; n < modes.Count; n++)
		{
			if (modes[n] == .VK_PRESENT_MODE_MAILBOX_KHR)
				isMailboxSupported = true;
			
			if (modes[n] == .VK_PRESENT_MODE_FIFO_KHR)
				isFIFOSupported = true;
		}

		if (isMailboxSupported == true)
			return .Ok(.VK_PRESENT_MODE_MAILBOX_KHR);

		if (isFIFOSupported == true)
			return .Ok(.VK_PRESENT_MODE_FIFO_KHR);

		return .Err(new Error("Neither FIFO or MAILBOX is supported by the swapchain."));
	}


	static VkSurfaceTransformFlagsKHR GetTransformationFlags (VkSurfaceCapabilitiesKHR surfaceCapabilities)
	{
		if ((surfaceCapabilities.supportedTransforms & .VK_SURFACE_TRANSFORM_IDENTITY_BIT_KHR) == .VK_SURFACE_TRANSFORM_IDENTITY_BIT_KHR)
			return .VK_SURFACE_TRANSFORM_IDENTITY_BIT_KHR;

		return surfaceCapabilities.currentTransform;
	}


	static Result<VkImageUsageFlags, Error> GetUsageFlags (VkSurfaceCapabilitiesKHR surfaceCapabilities)
	{
		if ((surfaceCapabilities.supportedUsageFlags & .VK_IMAGE_USAGE_TRANSFER_DST_BIT) == .VK_IMAGE_USAGE_TRANSFER_DST_BIT)
			return .Ok(.VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT | .VK_IMAGE_USAGE_TRANSFER_DST_BIT);

		Error e = new Error("");
		e.message.Append(
		    "VK_IMAGE_USAGE_TRANSFER_DST image usage is not supported by the swap chain!",
			"Supported swap chain's image usages include:",
		    ((surfaceCapabilities.supportedUsageFlags & .VK_IMAGE_USAGE_TRANSFER_SRC_BIT) == .VK_IMAGE_USAGE_TRANSFER_SRC_BIT              ? "    VK_IMAGE_USAGE_TRANSFER_SRC\n" : ""),
		    ((surfaceCapabilities.supportedUsageFlags & .VK_IMAGE_USAGE_TRANSFER_DST_BIT) == .VK_IMAGE_USAGE_TRANSFER_DST_BIT              ? "    VK_IMAGE_USAGE_TRANSFER_DST\n" : ""),
		    ((surfaceCapabilities.supportedUsageFlags & .VK_IMAGE_USAGE_SAMPLED_BIT) == .VK_IMAGE_USAGE_SAMPLED_BIT                   ? "    VK_IMAGE_USAGE_SAMPLED\n" : ""),
		    ((surfaceCapabilities.supportedUsageFlags & .VK_IMAGE_USAGE_STORAGE_BIT) == .VK_IMAGE_USAGE_STORAGE_BIT                   ? "    VK_IMAGE_USAGE_STORAGE\n" : ""),
		    ((surfaceCapabilities.supportedUsageFlags & .VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT) == .VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT          ? "    VK_IMAGE_USAGE_COLOR_ATTACHMENT\n" : ""),
		    ((surfaceCapabilities.supportedUsageFlags & .VK_IMAGE_USAGE_DEPTH_STENCIL_ATTACHMENT_BIT) == .VK_IMAGE_USAGE_DEPTH_STENCIL_ATTACHMENT_BIT  ? "    VK_IMAGE_USAGE_DEPTH_STENCIL_ATTACHMENT\n" : ""),
		    ((surfaceCapabilities.supportedUsageFlags & .VK_IMAGE_USAGE_TRANSIENT_ATTACHMENT_BIT) == .VK_IMAGE_USAGE_TRANSIENT_ATTACHMENT_BIT      ? "    VK_IMAGE_USAGE_TRANSIENT_ATTACHMENT\n" : ""),
		    ((surfaceCapabilities.supportedUsageFlags & .VK_IMAGE_USAGE_INPUT_ATTACHMENT_BIT) == .VK_IMAGE_USAGE_INPUT_ATTACHMENT_BIT          ? "    VK_IMAGE_USAGE_INPUT_ATTACHMENT" : "")
		);

		return .Err(e);
	}


	static Result<VkSurfaceCapabilitiesKHR, Error> GetSurfaceCapabilities (VkPhysicalDevice physicalDevice, VkSurfaceKHR surface)
	{
		VkSurfaceCapabilitiesKHR surfaceCapabilities = ?;
		vkGetPhysicalDeviceSurfaceCapabilitiesKHR(physicalDevice, surface, &surfaceCapabilities)
			.Resolve!();

		return .Ok(surfaceCapabilities);
	}


	static uint32 GetImageCount (VkSurfaceCapabilitiesKHR surfaceCapabilities)
	{
		uint32 imageCount = Math.Max(surfaceCapabilities.minImageCount, 3);
		if (surfaceCapabilities.maxImageCount > 0 && imageCount > surfaceCapabilities.maxImageCount)
			imageCount = surfaceCapabilities.maxImageCount;

		Tracy.WriteLine("Swapchain -> Count images that will be in use for swapchain is {0}.", imageCount);

		return imageCount;
	}


	static VkSurfaceFormatKHR GetFormat (VkSurfaceFormatKHR[] surfaceFormats)
	{
		if (surfaceFormats.Count > 1)
		{
			for (uint32 n = 0; n < surfaceFormats.Count; n++)
			{
				let sf = surfaceFormats[n];

				if (sf.format == .VK_FORMAT_R8G8B8A8_UNORM)
					return sf;

				if (sf.format == .VK_FORMAT_B8G8R8A8_UNORM)
					return sf;
			}
		}

		Tracy.WriteLine("WARNING: Swapchain -> Unable to pick desired format from provided surface formats. Available formats are:");
		for (uint32 n = 0; n < surfaceFormats.Count; n++)
			Tracy.WriteLine(" · {0}", surfaceFormats[n].format);

		return surfaceFormats[0];
	}


	static VkExtent2D CalculateExtent (uint32 width, uint32 height, VkSurfaceCapabilitiesKHR capabilities)
	{
		// Special value of surface extent is width == height == -1
		// If this is so we define the size by ourselves but it must fit within defined confines
		if (capabilities.currentExtent.width == 0)
		{
			VkExtent2D extent = VkExtent2D(width, height);

			if (extent.width < capabilities.minImageExtent.width)
				extent.width = capabilities.minImageExtent.width;

			if (extent.height < capabilities.minImageExtent.height)
				extent.height = capabilities.minImageExtent.height;

			if (extent.width > capabilities.maxImageExtent.width)
				extent.width = capabilities.maxImageExtent.width;

			if (extent.height > capabilities.maxImageExtent.height)
				extent.height = capabilities.maxImageExtent.height;

			return extent;
		}

		return capabilities.currentExtent;
	}


	Result<void, Error> CreateRenderPass ()
	{
		if (this.renderPass != null)
		{
			delete this.renderPass..Dispose();
			this.renderPass = null;
		}

		RenderPass.Description description = RenderPass.Description()
		{
			colorAttachments = scope Texture[] (this.images[0]),
			depthAttachment = this.depthTexture,
		};

		this.renderPass = this.context.Create(description)
			.Resolve!() as VulkanRenderPass;

		return .Ok;
	}


	Result<void, Error> CreateFramebuffer ()
	{
		if (this.framebuffers != null)
		{
			for (uint32 n = 0; n < this.framebuffers.Count; n++)
				delete this.framebuffers[n]..Dispose();

			delete this.framebuffers;
			this.framebuffers = null;
		}

		this.framebuffers = new VulkanFramebuffer[this.images.Count];
		for (uint32 n = 0; n < this.images.Count; n++)
		{
			Framebuffer.Description description = Framebuffer.Description()
			{
				width = this.width,
				height = this.height,

				renderPass = this.renderPass,
				colorTargets = scope Texture[] (this.images[n]),
				depthTarget = this.depthTexture,
			};

			this.framebuffers[n] = this.context.Create(description)
				.Resolve!() as VulkanFramebuffer;
		}

		return .Ok;
	}


	Result<void, Error> CreateDepthTexture ()
	{
		if (this.depthTexture != null)
		{
			delete this.depthTexture..Dispose();
			this.depthTexture = null;
		}

		if (this.depthFormat.HasValue == false)
			return .Ok;

		Texture.Description description = Texture.Description()
		{
			width = this.width,
			height = this.height,
			depth = 1,
			mipLevels = 1,
			arrayLayers = 1,
			format = this.depthFormat.Value,
			usage = .depthStencil,
			type = .Texture2D,
			sampleCount = .count1,
		};

		this.depthTexture = this.context.Create(description)
			.Resolve!() as VulkanTexture;

		/*LayoutTransitionInfo transitionInfo = LayoutTransitionInfo()
		{
			context = this.context,
			texture = this.depthTexture,
			format = VulkanFormats.Convert(this.depthTexture.format),
			currentLayout = .VK_IMAGE_LAYOUT_UNDEFINED,
			targetLayout = .VK_IMAGE_LAYOUT_DEPTH_STENCIL_ATTACHMENT_OPTIMAL,
		};

		VulkanImageLayout.Transition(transitionInfo)
			.Resolve!();*/

		this.depthTexture.GetView()
			.Resolve!();
		
		return .Ok;
	}


	/*Result<void, Error> CreateFramebuffers(Texture.Format? depthFormat)
	{
		this.framebuffers = new VulkanFramebuffer[1];

		for (uint32 n = 0; n < this.framebuffers.Count; n++)
		{
			Framebuffer.Description description = Framebuffer.Description()
				{
					width = this.width,
					height = this.height
				};

			if (depthFormat.HasValue == true)
			{
			}

			VulkanFramebuffer framebuffer = this.framebuffers[n] = new VulkanFramebuffer(this.graphicsDevice);
			framebuffer.Initialize(description).Resolve!();
		}

		return .Ok;
	}*/


	override public void Dispose()
	{
		this.DestroySyncObjects();

		if (this.depthTexture != null)
		{
			delete this.depthTexture..Dispose();
			this.depthTexture = null;
		}
		
		if (this.framebuffers != null)
		{
			for (uint32 n = 0; n < this.framebuffers.Count; n++)
				delete this.framebuffers[n]..Dispose();

			delete this.framebuffers;
			this.framebuffers = null;
		}

		if (this.renderPass != null)
		{
			delete this.renderPass..Dispose();
			this.renderPass = null;
		}

		if (this.images != null)
		{
			for (uint32 n = 0; n < this.images.Count; n++)
				delete this.images[n]..Dispose();

			delete this.images;
			this.images = null;
		}

		if (this.handle != default)
		{
			vkDestroySwapchainKHR(this.context.logicalDevice.handle, this.handle, this.context.allocationCallbacks);
			this.handle = default;
		}
	}

	public override Result<void, Error> SwapBuffers()
	{
		this.PresentImage().Resolve!();
		return .Ok;
	}

	override public Framebuffer GetFramebuffer ()
	{
		return this.framebuffers[this.currentFrame];
	}

	override public RenderPass GetRenderPass ()
	{
		return this.renderPass;
	}
}