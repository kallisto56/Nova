namespace System.Engine.Implementations.Vulkan;


using System;
using System.Threading;
using System.Diagnostics;
using System.Collections;

using API.Vulkan;
using static API.Vulkan.VulkanNative;


public class VulkanBuffer : Buffer
{
	VulkanGraphicsContext context;

	public VkBuffer handle;
	public VkDeviceMemory memory;
	public VkMemoryPropertyFlags properties;


	public this (VulkanGraphicsContext context)
	{
		this.context = context;
	}


	public ~this ()
	{

	}


	override public Result<void, Error> Initialize (Self.Description description)
	{
		// Shortcuts
		let logicalDevice = this.context.logicalDevice.handle;
		let allocationCallbacks = this.context.allocationCallbacks;

		// ...
		this.properties = .VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT | .VK_MEMORY_PROPERTY_HOST_COHERENT_BIT;
		this.sizeInBytes = description.sizeInBytes;
		this.usage = description.usage;

		// ...
		VkBufferCreateInfo createInfo = VkBufferCreateInfo()
		{
			pNext = null,
			flags = .None,

			size = this.sizeInBytes,
			usage = VulkanFormats.Convert(this.usage, .VK_BUFFER_USAGE_TRANSFER_SRC_BIT | .VK_BUFFER_USAGE_TRANSFER_DST_BIT),
			sharingMode = .VK_SHARING_MODE_EXCLUSIVE,

			queueFamilyIndexCount = 0,
			pQueueFamilyIndices = null,
		};

		// Creating VkBuffer
		vkCreateBuffer(logicalDevice, &createInfo, allocationCallbacks, &this.handle)
			.Resolve!();

		// Retrieving memory requirements based on newly created VkBuffer
		VkMemoryRequirements requirements = ?;
		vkGetBufferMemoryRequirements(logicalDevice, this.handle, &requirements);

		// Searching for memory type based on gatheed information
		uint32 memoryType = this.context.FindMemoryType(requirements.memoryTypeBits, this.properties)
			.Resolve!();

		VkMemoryAllocateInfo allocateInfo = VkMemoryAllocateInfo()
		{
			allocationSize = requirements.size,
			memoryTypeIndex = memoryType,
			pNext = null,
		};

		vkAllocateMemory(logicalDevice, &allocateInfo, allocationCallbacks, &this.memory)
			.Resolve!();

		vkBindBufferMemory(logicalDevice, this.handle, this.memory, memoryOffset: 0)
			.Resolve!();

		return .Ok;
	}


	override public void Dispose ()
	{
		if (this.handle != default)
		{
			vkDestroyBuffer(this.context.logicalDevice.handle, this.handle, this.context.allocationCallbacks);
			this.handle = default;
		}

		if (this.memory != default)
		{
			vkFreeMemory(this.context.logicalDevice.handle, this.memory, this.context.allocationCallbacks);
			this.memory = default;
		}
	}


}