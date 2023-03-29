namespace System.Engine.Implementations.Vulkan;


using System;
using System.Threading;
using System.Diagnostics;
using System.Collections;

using API.Vulkan;
using static API.Vulkan.VulkanNative;


public class VulkanMemoryAllocator : IDisposable
{
	public VulkanGraphicsContext context;
	List<Page> pages;


	public this (VulkanGraphicsContext context)
	{
		this.context = context;
	}


	public ~this ()
	{

	}


	public void Dispose ()
	{

	}


	public Result<void, Error> Initialize (Description description)
	{
		return .Ok;
	}


	public Result<VulkanDeviceMemory, Error> Allocate (AllocateInfo allocateInfo)
	{
		for (uint32 n = 0; n < this.pages.Count; n++)
		{
			Page page = this.pages[n];

			if (page.Match(allocateInfo) == false && page.CanContain(allocateInfo))
				continue;

			return page.Allocate(allocateInfo).Resolve!();
		}

		uint32 sizeInBytes = 0;
		Page page = new Page();
		this.pages.Add(page);
		page.Initialize(this.context, sizeInBytes, allocateInfo.typeBits, allocateInfo.flags).Resolve!();
		return page.Allocate(allocateInfo).Resolve!();
	}


	public Result<void, Error> Free (ref VulkanDeviceMemory token)
	{
		if (token.IsDisposed() == true)
			return .Ok;

		token.handle = default;
		return .Ok;
	}


	public class Page
	{
		public VkDeviceMemory deviceMemory;
		public uint64 sizeInBytes;


		public Result<void, Error> Initialize (VulkanGraphicsContext context, uint64 sizeInBytes, uint32 memoryTypeBits, VkMemoryPropertyFlags properties)
		{
			uint32 memoryTypeIndex = context.FindMemoryType(memoryTypeBits, properties)
				.Resolve!();

			VkMemoryAllocateInfo allocateInfo = VkMemoryAllocateInfo()
			{
				memoryTypeIndex = memoryTypeIndex,
				allocationSize = sizeInBytes,
			};

			vkAllocateMemory(context.logicalDevice.handle, &allocateInfo, context.allocationCallbacks, &this.deviceMemory)
				.Resolve!();

			return .Ok;
		}


		public Result<VulkanDeviceMemory, Error> Allocate (AllocateInfo allocateInfo)
		{
			return .Err(null);
		}


		public bool Match (AllocateInfo e)
		{
			return false;
		}


		public bool CanContain (AllocateInfo e)
		{
			return false;
		}
	}


	public struct Description
	{
		
	}


	public struct AllocateInfo
	{
		public VkPhysicalDeviceMemoryProperties properties;
		public VkMemoryPropertyFlags flags;
		public uint32 typeBits;
		public uint64 sizeInBytes;
		public uint64 alignment;
	}


}


public struct VulkanDeviceMemory
{
	public VkDeviceMemory handle;
	public uint64 offsetInBytes;
	public uint64 sizeInBytes;


	public bool IsDisposed ()
	{
		return this.handle == default;
	}
}