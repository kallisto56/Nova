namespace System.Engine.Implementations.Vulkan;

using System;
using System.Diagnostics;
using System.IO;
using API.Vulkan;


class VulkanAllocationCallbacks
{
	public static void* vkAllocateHostMemory(void* pUserData, uint size, uint alignment, VkSystemAllocationScope allocationScope)
	{
		//MaybeUnused(allocationScope);

		DeviceAllocator<uint8> allocator = (DeviceAllocator<uint8>)Internal.UnsafeCastToObject(pUserData);
		readonly var lowLevelAllocator = /*ref*/ allocator.GetInterface();

		return lowLevelAllocator.Allocate(lowLevelAllocator.userArg, size, alignment);
	}

	public static void* vkReallocateHostMemory(void* pUserData, void* pOriginal, uint size, uint alignment, VkSystemAllocationScope allocationScope)
	{
		//MaybeUnused(allocationScope);

		DeviceAllocator<uint8> allocator = (DeviceAllocator<uint8>)Internal.UnsafeCastToObject(pUserData);
		readonly var lowLevelAllocator = /*ref*/ allocator.GetInterface();

		return lowLevelAllocator.Reallocate(lowLevelAllocator.userArg, pOriginal, size, alignment);
	}

	public static void vkFreeHostMemory(void* pUserData, void* pMemory)
	{
		DeviceAllocator<uint8> stdAllocator = (DeviceAllocator<uint8>)Internal.UnsafeCastToObject(pUserData);
		readonly var lowLevelAllocator = /*ref*/ stdAllocator.GetInterface();

		lowLevelAllocator.Free(lowLevelAllocator.userArg, pMemory);
	}

	public static void vkHostMemoryInternalAllocationNotification(void* pUserData, uint size, VkInternalAllocationType allocationType,
		VkSystemAllocationScope allocationScope)
	{
		//MaybeUnused(pUserData);
		//MaybeUnused(size);
		//MaybeUnused(allocationType);
		//MaybeUnused(allocationScope);
	}

	public static void vkHostMemoryInternalFreeNotification(void* pUserData, uint size, VkInternalAllocationType allocationType,
		VkSystemAllocationScope allocationScope)
	{
		//MaybeUnused(pUserData);
		//MaybeUnused(size);
		//MaybeUnused(allocationType);
		//MaybeUnused(allocationScope);
	}


	public sealed class DeviceAllocator<T>
	{
		private MemoryAllocatorInterface m_Interface;

		public this(MemoryAllocatorInterface @interface)
		{
			m_Interface = @interface;
		}

		public readonly ref MemoryAllocatorInterface GetInterface()
		{
			return ref m_Interface;
		}
	}


	public struct MemoryAllocatorInterface
	{
		public function void*(void* userArg, uint size, uint alignment) Allocate;
		public function void*(void* userArg, void* memory, uint size, uint alignment) Reallocate;
		public function void(void* userArg, void* memory) Free;
		public void* userArg;
	}
}