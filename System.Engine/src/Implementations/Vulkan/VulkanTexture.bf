namespace System.Engine.Implementations.Vulkan;


using System;
using System.Threading;
using System.Diagnostics;
using System.Collections;

using API.Vulkan;
using static API.Vulkan.VulkanNative;


public class VulkanTexture : Texture
{
	VulkanGraphicsContext context;
	override public String name { get; protected set; }
	override public Format format { get; protected set; }
	override public uint32 width { get; protected set; }
	override public uint32 height { get; protected set; }
	override public uint32 depth { get; protected set; }
	override public uint32 mipLevels { get; protected set; }
	override public uint32 arrayLayers { get; protected set; }
	override public Usage usage { get; protected set; }
	override public Type type { get; protected set; }
	override public SampleCount sampleCount { get; protected set; }
	override public bool isDisposed { get; protected set; }

	public bool ownsHandle = true;
	public VkImage handle;
	public VkBuffer staggingBuffer;
	public VkDeviceMemory memory;
	public VkMemoryPropertyFlags memoryProperties;

	/*public VulkanMemoryBlock memory;*/
	public VkFormat vkFormat;
	public VkSampleCountFlags vkSampleCount;

	public VkImageLayout[] imageLayouts;
	public bool isSwapchainTexture;
	public uint32 actualImageArrayLayers;

	public VulkanTextureView view;


	public this (VulkanGraphicsContext context)
	{
		this.context = context;
	}


	public ~this ()
	{

	}


	public Result<void, Error> Initialize (VkImage handle, Self.Description description)
	{
		this.ownsHandle = false;
		this.handle = handle;
		this.width = description.width;
		this.height = description.height;
		this.depth = description.depth;

		this.mipLevels = description.mipLevels;
		this.arrayLayers = description.arrayLayers;

		this.format = description.format;
		this.usage = description.usage;
		this.type = description.type;
		this.sampleCount = description.sampleCount;

		this.vkSampleCount = VulkanFormats.Convert(description.sampleCount);
		bool toDepthFormat = (description.usage & .depthStencil) == .depthStencil;
		this.vkFormat = VulkanFormats.Convert(description.format, toDepthFormat);

		return .Ok;
	}

	override public Result<void, Error> Initialize (Self.Description description)
	{
		this.width = description.width;
		this.height = description.height;
		this.depth = description.depth;

		this.mipLevels = description.mipLevels;
		this.arrayLayers = description.arrayLayers;

		this.format = description.format;
		this.usage = description.usage;
		this.type = description.type;
		this.sampleCount = description.sampleCount;

		this.vkSampleCount = VulkanFormats.Convert(description.sampleCount);
		bool toDepthFormat = (description.usage & .depthStencil) == .depthStencil;
		this.vkFormat = VulkanFormats.Convert(description.format, toDepthFormat);

		if ((this.usage & .staging) == .staging)
		{
			this.CreateStagedTexture(description)
				.Resolve!();
		}
		else
		{
			this.CreateNonStagedTexture(description)
				.Resolve!();
		}

		/*this.ClearIfRenderTarget();
		this.TransitionIfSampled();
		this.refCount = ResourceRefCount(new => RefCountedDispose);*/

		return .Ok;
	}


	Result<void, Error> CreateNonStagedTexture (Self.Description description)
	{
		this.width = description.width;
		this.height = description.height;
		this.depth = description.depth;
		this.usage = description.usage;
		this.type = description.type;
		this.sampleCount = description.sampleCount;
		this.mipLevels = description.mipLevels;
		this.arrayLayers = description.arrayLayers;
		
		/*VkFormat format = .VK_FORMAT_R8G8B8A8_SRGB;*/
		/*VkImageTiling tiling = .VK_IMAGE_TILING_OPTIMAL;*/
		/*VkImageUsageFlags usage = .VK_IMAGE_USAGE_TRANSFER_DST_BIT | .VK_IMAGE_USAGE_SAMPLED_BIT;*/
		this.memoryProperties = .VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT;

		bool isCubemap = ((description.usage) & .cubemap) == .cubemap;
		this.actualImageArrayLayers = isCubemap ? this.arrayLayers * 6 : this.arrayLayers;

		VkImageCreateInfo createInfo = VkImageCreateInfo()
		{
			mipLevels = this.mipLevels,
			arrayLayers = this.actualImageArrayLayers,
			imageType = VulkanFormats.Convert(this.type),
			extent = VkExtent3D(this.width, this.height, this.depth),
			initialLayout = VkImageLayout.VK_IMAGE_LAYOUT_PREINITIALIZED,
			usage = VulkanFormats.Convert(this.usage),
			tiling = .VK_IMAGE_TILING_OPTIMAL,
			format = this.vkFormat,
			flags = .VK_IMAGE_CREATE_MUTABLE_FORMAT_BIT,
		};

		createInfo.samples = this.vkSampleCount;
		if (isCubemap)
		    createInfo.flags |= .VK_IMAGE_CREATE_CUBE_COMPATIBLE_BIT;

		uint32 subresourceCount = this.mipLevels * this.actualImageArrayLayers * this.depth;
		vkCreateImage(this.context.logicalDevice.handle, &createInfo, this.context.allocationCallbacks, &this.handle)
			.Resolve!();

		VkMemoryRequirements memoryRequirements = ?;
		bool prefersDedicatedAllocation;
		/*if (this.context.GetImageMemoryRequirements2 != null)
		{
		    VkImageMemoryRequirementsInfo2KHR memReqsInfo2 = VkImageMemoryRequirementsInfo2KHR();
		    memReqsInfo2.image = _optimalImage;
		    VkMemoryRequirements2KHR memReqs2 = VkMemoryRequirements2KHR.New();
		    VkMemoryDedicatedRequirementsKHR dedicatedReqs = VkMemoryDedicatedRequirementsKHR.New();
		    memReqs2.pNext = &dedicatedReqs;
		    _gd.GetImageMemoryRequirements2(_gd.Device, &memReqsInfo2, &memReqs2);
		    memoryRequirements = memReqs2.memoryRequirements;
		    prefersDedicatedAllocation = dedicatedReqs.prefersDedicatedAllocation || dedicatedReqs.requiresDedicatedAllocation;
		}
		else*/
		{
		    vkGetImageMemoryRequirements(this.context.logicalDevice.handle, this.handle, &memoryRequirements);
		    prefersDedicatedAllocation = false;
		}

		var memoryType = this.context.FindMemoryType(memoryRequirements.memoryTypeBits, this.memoryProperties)
			.Resolve!();

		
		VkMemoryAllocateInfo allocInfo = VkMemoryAllocateInfo()
		{
			allocationSize = memoryRequirements.size,
			memoryTypeIndex = memoryType,
		};

		VulkanNative.vkAllocateMemory(this.context.logicalDevice.handle, &allocInfo, this.context.allocationCallbacks, &this.memory)
			.Resolve!();

		/*VulkanNative.vkBindImageMemory(this.context.logicalDevice.handle, this.handle, this.memory, 0)
			.Resolve!();*/

		/*VulkanMemoryBlock memoryToken = this.context.MemoryManager.Allocate(
		    this.context.physicalDevice.memoryProperties,
		    memoryRequirements.memoryTypeBits,
		    VkMemoryPropertyFlags.VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT,
		    false,
		    memoryRequirements.size,
		    memoryRequirements.alignment,
		    prefersDedicatedAllocation,
		    this.handle,
		    VkBuffer.Null);
		_memoryBlock = memoryToken;*/

		vkBindImageMemory(this.context.logicalDevice.handle, this.handle, this.memory, 0).Resolve!();

		this.imageLayouts = new VkImageLayout[subresourceCount];
		for (int i = 0; i < this.imageLayouts.Count; i++)
		    this.imageLayouts[i] = .VK_IMAGE_LAYOUT_PREINITIALIZED;

		return .Ok;
	}


	Result<void, Error> CreateStagedTexture (Self.Description description)
	{
		/*uint depthPitch = FormatHelpers.GetDepthPitch(
		    FormatHelpers.GetRowPitch(Width, Format),
		    Height,
		    Format);
		uint stagingSize = depthPitch * Depth;
		for (uint level = 1; level < MipLevels; level++)
		{
		    Util.GetMipDimensions(this, level, out uint mipWidth, out uint mipHeight, out uint mipDepth);

		    depthPitch = FormatHelpers.GetDepthPitch(
		        FormatHelpers.GetRowPitch(mipWidth, Format),
		        mipHeight,
		        Format);

		    stagingSize += depthPitch * mipDepth;
		}
		stagingSize *= ArrayLayers;

		VkBufferCreateInfo bufferCI = VkBufferCreateInfo.New();
		bufferCI.usage = VkBufferUsageFlags.TransferSrc | VkBufferUsageFlags.TransferDst;
		bufferCI.size = stagingSize;
		VkResult result = vkCreateBuffer(_gd.Device, ref bufferCI, null, out _stagingBuffer);
		CheckResult(result);

		VkMemoryRequirements bufferMemReqs;
		bool prefersDedicatedAllocation;
		if (_gd.GetBufferMemoryRequirements2 != null)
		{
		    VkBufferMemoryRequirementsInfo2KHR memReqInfo2 = VkBufferMemoryRequirementsInfo2KHR.New();
		    memReqInfo2.buffer = _stagingBuffer;
		    VkMemoryRequirements2KHR memReqs2 = VkMemoryRequirements2KHR.New();
		    VkMemoryDedicatedRequirementsKHR dedicatedReqs = VkMemoryDedicatedRequirementsKHR.New();
		    memReqs2.pNext = &dedicatedReqs;
		    _gd.GetBufferMemoryRequirements2(_gd.Device, &memReqInfo2, &memReqs2);
		    bufferMemReqs = memReqs2.memoryRequirements;
		    prefersDedicatedAllocation = dedicatedReqs.prefersDedicatedAllocation || dedicatedReqs.requiresDedicatedAllocation;
		}
		else
		{
		    vkGetBufferMemoryRequirements(gd.Device, _stagingBuffer, out bufferMemReqs);
		    prefersDedicatedAllocation = false;
		}

		// Use "host cached" memory when available, for better performance of GPU -> CPU transfers
		var propertyFlags = VkMemoryPropertyFlags.HostVisible | VkMemoryPropertyFlags.HostCoherent | VkMemoryPropertyFlags.HostCached;
		if (!TryFindMemoryType(_gd.PhysicalDeviceMemProperties, bufferMemReqs.memoryTypeBits, propertyFlags, out _))
		{
		    propertyFlags ^= VkMemoryPropertyFlags.HostCached;
		}
		_memoryBlock = _gd.MemoryManager.Allocate(
		    _gd.PhysicalDeviceMemProperties,
		    bufferMemReqs.memoryTypeBits,
		    propertyFlags,
		    true,
		    bufferMemReqs.size,
		    bufferMemReqs.alignment,
		    prefersDedicatedAllocation,
		    VkImage.Null,
		    _stagingBuffer);

		result = vkBindBufferMemory(_gd.Device, _stagingBuffer, _memoryBlock.DeviceMemory, _memoryBlock.Offset);
		CheckResult(result);*/

		return .Err(null);
	}


	override public Result<TextureView, Error> GetView ()
	{
		if (this.view != null)
			return this.view;

		this.view = new VulkanTextureView(this.context);
		this.view.Initialize(TextureView.Description(this)).Resolve!();

		return this.view;
	}


	override public void Dispose ()
	{
		if (this.view != null)
		{
			delete this.view..Dispose();
			this.view = null;
		}

		if (this.memory != default)
		{
			vkFreeMemory(this.context.logicalDevice.handle, this.memory, this.context.allocationCallbacks);
			this.memory = default;
		}

		if (this.imageLayouts != null)
		{
			delete this.imageLayouts;
			this.imageLayouts = null;
		}

		if (this.handle != default && this.ownsHandle == true)
		{
			vkDestroyImage(this.context.logicalDevice.handle, this.handle, this.context.allocationCallbacks);
			this.handle = default;
		}
	}


}