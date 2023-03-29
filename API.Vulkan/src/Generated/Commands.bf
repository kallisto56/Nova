using System;
using System.Collections;
using internal API.Vulkan;
namespace API.Vulkan
{
	public extension VulkanNative
	{
		public typealias vkCreateInstanceFunction = function VkResult(VkInstanceCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkInstance* pInstance);
		private static vkCreateInstanceFunction vkCreateInstance_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCreateInstance(VkInstanceCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkInstance* pInstance)
			=> vkCreateInstance_ptr(pCreateInfo, pAllocator, pInstance);

		public typealias vkDestroyInstanceFunction = function void(VkInstance instance, VkAllocationCallbacks* pAllocator);
		private static vkDestroyInstanceFunction vkDestroyInstance_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkDestroyInstance(VkInstance instance, VkAllocationCallbacks* pAllocator)
			=> vkDestroyInstance_ptr(instance, pAllocator);

		public typealias vkEnumeratePhysicalDevicesFunction = function VkResult(VkInstance instance, uint32* pPhysicalDeviceCount, VkPhysicalDevice* pPhysicalDevices);
		private static vkEnumeratePhysicalDevicesFunction vkEnumeratePhysicalDevices_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkEnumeratePhysicalDevices(VkInstance instance, uint32* pPhysicalDeviceCount, VkPhysicalDevice* pPhysicalDevices)
			=> vkEnumeratePhysicalDevices_ptr(instance, pPhysicalDeviceCount, pPhysicalDevices);

		public typealias vkGetPhysicalDeviceFeaturesFunction = function void(VkPhysicalDevice physicalDevice, VkPhysicalDeviceFeatures* pFeatures);
		private static vkGetPhysicalDeviceFeaturesFunction vkGetPhysicalDeviceFeatures_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkGetPhysicalDeviceFeatures(VkPhysicalDevice physicalDevice, VkPhysicalDeviceFeatures* pFeatures)
			=> vkGetPhysicalDeviceFeatures_ptr(physicalDevice, pFeatures);

		public typealias vkGetPhysicalDeviceFormatPropertiesFunction = function void(VkPhysicalDevice physicalDevice, VkFormat format, VkFormatProperties* pFormatProperties);
		private static vkGetPhysicalDeviceFormatPropertiesFunction vkGetPhysicalDeviceFormatProperties_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkGetPhysicalDeviceFormatProperties(VkPhysicalDevice physicalDevice, VkFormat format, VkFormatProperties* pFormatProperties)
			=> vkGetPhysicalDeviceFormatProperties_ptr(physicalDevice, format, pFormatProperties);

		public typealias vkGetPhysicalDeviceImageFormatPropertiesFunction = function VkResult(VkPhysicalDevice physicalDevice, VkFormat format, VkImageType type, VkImageTiling tiling, VkImageUsageFlags usage, VkImageCreateFlags flags, VkImageFormatProperties* pImageFormatProperties);
		private static vkGetPhysicalDeviceImageFormatPropertiesFunction vkGetPhysicalDeviceImageFormatProperties_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetPhysicalDeviceImageFormatProperties(VkPhysicalDevice physicalDevice, VkFormat format, VkImageType type, VkImageTiling tiling, VkImageUsageFlags usage, VkImageCreateFlags flags, VkImageFormatProperties* pImageFormatProperties)
			=> vkGetPhysicalDeviceImageFormatProperties_ptr(physicalDevice, format, type, tiling, usage, flags, pImageFormatProperties);

		public typealias vkGetPhysicalDevicePropertiesFunction = function void(VkPhysicalDevice physicalDevice, VkPhysicalDeviceProperties* pProperties);
		private static vkGetPhysicalDevicePropertiesFunction vkGetPhysicalDeviceProperties_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkGetPhysicalDeviceProperties(VkPhysicalDevice physicalDevice, VkPhysicalDeviceProperties* pProperties)
			=> vkGetPhysicalDeviceProperties_ptr(physicalDevice, pProperties);

		public typealias vkGetPhysicalDeviceQueueFamilyPropertiesFunction = function void(VkPhysicalDevice physicalDevice, uint32* pQueueFamilyPropertyCount, VkQueueFamilyProperties* pQueueFamilyProperties);
		private static vkGetPhysicalDeviceQueueFamilyPropertiesFunction vkGetPhysicalDeviceQueueFamilyProperties_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkGetPhysicalDeviceQueueFamilyProperties(VkPhysicalDevice physicalDevice, uint32* pQueueFamilyPropertyCount, VkQueueFamilyProperties* pQueueFamilyProperties)
			=> vkGetPhysicalDeviceQueueFamilyProperties_ptr(physicalDevice, pQueueFamilyPropertyCount, pQueueFamilyProperties);

		public typealias vkGetPhysicalDeviceMemoryPropertiesFunction = function void(VkPhysicalDevice physicalDevice, VkPhysicalDeviceMemoryProperties* pMemoryProperties);
		private static vkGetPhysicalDeviceMemoryPropertiesFunction vkGetPhysicalDeviceMemoryProperties_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkGetPhysicalDeviceMemoryProperties(VkPhysicalDevice physicalDevice, VkPhysicalDeviceMemoryProperties* pMemoryProperties)
			=> vkGetPhysicalDeviceMemoryProperties_ptr(physicalDevice, pMemoryProperties);

		public typealias vkGetInstanceProcAddrFunction = function void*(VkInstance instance, char8* pName);
		private static vkGetInstanceProcAddrFunction vkGetInstanceProcAddr_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void* vkGetInstanceProcAddr(VkInstance instance, char8* pName)
			=> vkGetInstanceProcAddr_ptr(instance, pName);

		public typealias vkGetDeviceProcAddrFunction = function void*(VkDevice device, char8* pName);
		private static vkGetDeviceProcAddrFunction vkGetDeviceProcAddr_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void* vkGetDeviceProcAddr(VkDevice device, char8* pName)
			=> vkGetDeviceProcAddr_ptr(device, pName);

		public typealias vkCreateDeviceFunction = function VkResult(VkPhysicalDevice physicalDevice, VkDeviceCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkDevice* pDevice);
		private static vkCreateDeviceFunction vkCreateDevice_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCreateDevice(VkPhysicalDevice physicalDevice, VkDeviceCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkDevice* pDevice)
			=> vkCreateDevice_ptr(physicalDevice, pCreateInfo, pAllocator, pDevice);

		public typealias vkDestroyDeviceFunction = function void(VkDevice device, VkAllocationCallbacks* pAllocator);
		private static vkDestroyDeviceFunction vkDestroyDevice_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkDestroyDevice(VkDevice device, VkAllocationCallbacks* pAllocator)
			=> vkDestroyDevice_ptr(device, pAllocator);

		public typealias vkEnumerateInstanceExtensionPropertiesFunction = function VkResult(char8* pLayerName, uint32* pPropertyCount, VkExtensionProperties* pProperties);
		private static vkEnumerateInstanceExtensionPropertiesFunction vkEnumerateInstanceExtensionProperties_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkEnumerateInstanceExtensionProperties(char8* pLayerName, uint32* pPropertyCount, VkExtensionProperties* pProperties)
			=> vkEnumerateInstanceExtensionProperties_ptr(pLayerName, pPropertyCount, pProperties);

		public typealias vkEnumerateDeviceExtensionPropertiesFunction = function VkResult(VkPhysicalDevice physicalDevice, char8* pLayerName, uint32* pPropertyCount, VkExtensionProperties* pProperties);
		private static vkEnumerateDeviceExtensionPropertiesFunction vkEnumerateDeviceExtensionProperties_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkEnumerateDeviceExtensionProperties(VkPhysicalDevice physicalDevice, char8* pLayerName, uint32* pPropertyCount, VkExtensionProperties* pProperties)
			=> vkEnumerateDeviceExtensionProperties_ptr(physicalDevice, pLayerName, pPropertyCount, pProperties);

		public typealias vkEnumerateInstanceLayerPropertiesFunction = function VkResult(uint32* pPropertyCount, VkLayerProperties* pProperties);
		private static vkEnumerateInstanceLayerPropertiesFunction vkEnumerateInstanceLayerProperties_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkEnumerateInstanceLayerProperties(uint32* pPropertyCount, VkLayerProperties* pProperties)
			=> vkEnumerateInstanceLayerProperties_ptr(pPropertyCount, pProperties);

		public typealias vkEnumerateDeviceLayerPropertiesFunction = function VkResult(VkPhysicalDevice physicalDevice, uint32* pPropertyCount, VkLayerProperties* pProperties);
		private static vkEnumerateDeviceLayerPropertiesFunction vkEnumerateDeviceLayerProperties_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkEnumerateDeviceLayerProperties(VkPhysicalDevice physicalDevice, uint32* pPropertyCount, VkLayerProperties* pProperties)
			=> vkEnumerateDeviceLayerProperties_ptr(physicalDevice, pPropertyCount, pProperties);

		public typealias vkGetDeviceQueueFunction = function void(VkDevice device, uint32 queueFamilyIndex, uint32 queueIndex, VkQueue* pQueue);
		private static vkGetDeviceQueueFunction vkGetDeviceQueue_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkGetDeviceQueue(VkDevice device, uint32 queueFamilyIndex, uint32 queueIndex, VkQueue* pQueue)
			=> vkGetDeviceQueue_ptr(device, queueFamilyIndex, queueIndex, pQueue);

		public typealias vkQueueSubmitFunction = function VkResult(VkQueue queue, uint32 submitCount, VkSubmitInfo* pSubmits, VkFence fence);
		private static vkQueueSubmitFunction vkQueueSubmit_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkQueueSubmit(VkQueue queue, uint32 submitCount, VkSubmitInfo* pSubmits, VkFence fence)
			=> vkQueueSubmit_ptr(queue, submitCount, pSubmits, fence);

		public typealias vkQueueWaitIdleFunction = function VkResult(VkQueue queue);
		private static vkQueueWaitIdleFunction vkQueueWaitIdle_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkQueueWaitIdle(VkQueue queue)
			=> vkQueueWaitIdle_ptr(queue);

		public typealias vkDeviceWaitIdleFunction = function VkResult(VkDevice device);
		private static vkDeviceWaitIdleFunction vkDeviceWaitIdle_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkDeviceWaitIdle(VkDevice device)
			=> vkDeviceWaitIdle_ptr(device);

		public typealias vkAllocateMemoryFunction = function VkResult(VkDevice device, VkMemoryAllocateInfo* pAllocateInfo, VkAllocationCallbacks* pAllocator, VkDeviceMemory* pMemory);
		private static vkAllocateMemoryFunction vkAllocateMemory_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkAllocateMemory(VkDevice device, VkMemoryAllocateInfo* pAllocateInfo, VkAllocationCallbacks* pAllocator, VkDeviceMemory* pMemory)
			=> vkAllocateMemory_ptr(device, pAllocateInfo, pAllocator, pMemory);

		public typealias vkFreeMemoryFunction = function void(VkDevice device, VkDeviceMemory memory, VkAllocationCallbacks* pAllocator);
		private static vkFreeMemoryFunction vkFreeMemory_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkFreeMemory(VkDevice device, VkDeviceMemory memory, VkAllocationCallbacks* pAllocator)
			=> vkFreeMemory_ptr(device, memory, pAllocator);

		public typealias vkMapMemoryFunction = function VkResult(VkDevice device, VkDeviceMemory memory, uint64 offset, uint64 size, uint32 flags, void** ppData);
		private static vkMapMemoryFunction vkMapMemory_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkMapMemory(VkDevice device, VkDeviceMemory memory, uint64 offset, uint64 size, uint32 flags, void** ppData)
			=> vkMapMemory_ptr(device, memory, offset, size, flags, ppData);

		public typealias vkUnmapMemoryFunction = function void(VkDevice device, VkDeviceMemory memory);
		private static vkUnmapMemoryFunction vkUnmapMemory_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkUnmapMemory(VkDevice device, VkDeviceMemory memory)
			=> vkUnmapMemory_ptr(device, memory);

		public typealias vkFlushMappedMemoryRangesFunction = function VkResult(VkDevice device, uint32 memoryRangeCount, VkMappedMemoryRange* pMemoryRanges);
		private static vkFlushMappedMemoryRangesFunction vkFlushMappedMemoryRanges_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkFlushMappedMemoryRanges(VkDevice device, uint32 memoryRangeCount, VkMappedMemoryRange* pMemoryRanges)
			=> vkFlushMappedMemoryRanges_ptr(device, memoryRangeCount, pMemoryRanges);

		public typealias vkInvalidateMappedMemoryRangesFunction = function VkResult(VkDevice device, uint32 memoryRangeCount, VkMappedMemoryRange* pMemoryRanges);
		private static vkInvalidateMappedMemoryRangesFunction vkInvalidateMappedMemoryRanges_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkInvalidateMappedMemoryRanges(VkDevice device, uint32 memoryRangeCount, VkMappedMemoryRange* pMemoryRanges)
			=> vkInvalidateMappedMemoryRanges_ptr(device, memoryRangeCount, pMemoryRanges);

		public typealias vkGetDeviceMemoryCommitmentFunction = function void(VkDevice device, VkDeviceMemory memory, uint64* pCommittedMemoryInBytes);
		private static vkGetDeviceMemoryCommitmentFunction vkGetDeviceMemoryCommitment_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkGetDeviceMemoryCommitment(VkDevice device, VkDeviceMemory memory, uint64* pCommittedMemoryInBytes)
			=> vkGetDeviceMemoryCommitment_ptr(device, memory, pCommittedMemoryInBytes);

		public typealias vkBindBufferMemoryFunction = function VkResult(VkDevice device, VkBuffer buffer, VkDeviceMemory memory, uint64 memoryOffset);
		private static vkBindBufferMemoryFunction vkBindBufferMemory_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkBindBufferMemory(VkDevice device, VkBuffer buffer, VkDeviceMemory memory, uint64 memoryOffset)
			=> vkBindBufferMemory_ptr(device, buffer, memory, memoryOffset);

		public typealias vkBindImageMemoryFunction = function VkResult(VkDevice device, VkImage image, VkDeviceMemory memory, uint64 memoryOffset);
		private static vkBindImageMemoryFunction vkBindImageMemory_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkBindImageMemory(VkDevice device, VkImage image, VkDeviceMemory memory, uint64 memoryOffset)
			=> vkBindImageMemory_ptr(device, image, memory, memoryOffset);

		public typealias vkGetBufferMemoryRequirementsFunction = function void(VkDevice device, VkBuffer buffer, VkMemoryRequirements* pMemoryRequirements);
		private static vkGetBufferMemoryRequirementsFunction vkGetBufferMemoryRequirements_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkGetBufferMemoryRequirements(VkDevice device, VkBuffer buffer, VkMemoryRequirements* pMemoryRequirements)
			=> vkGetBufferMemoryRequirements_ptr(device, buffer, pMemoryRequirements);

		public typealias vkGetImageMemoryRequirementsFunction = function void(VkDevice device, VkImage image, VkMemoryRequirements* pMemoryRequirements);
		private static vkGetImageMemoryRequirementsFunction vkGetImageMemoryRequirements_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkGetImageMemoryRequirements(VkDevice device, VkImage image, VkMemoryRequirements* pMemoryRequirements)
			=> vkGetImageMemoryRequirements_ptr(device, image, pMemoryRequirements);

		public typealias vkGetImageSparseMemoryRequirementsFunction = function void(VkDevice device, VkImage image, uint32* pSparseMemoryRequirementCount, VkSparseImageMemoryRequirements* pSparseMemoryRequirements);
		private static vkGetImageSparseMemoryRequirementsFunction vkGetImageSparseMemoryRequirements_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkGetImageSparseMemoryRequirements(VkDevice device, VkImage image, uint32* pSparseMemoryRequirementCount, VkSparseImageMemoryRequirements* pSparseMemoryRequirements)
			=> vkGetImageSparseMemoryRequirements_ptr(device, image, pSparseMemoryRequirementCount, pSparseMemoryRequirements);

		public typealias vkGetPhysicalDeviceSparseImageFormatPropertiesFunction = function void(VkPhysicalDevice physicalDevice, VkFormat format, VkImageType type, VkSampleCountFlags samples, VkImageUsageFlags usage, VkImageTiling tiling, uint32* pPropertyCount, VkSparseImageFormatProperties* pProperties);
		private static vkGetPhysicalDeviceSparseImageFormatPropertiesFunction vkGetPhysicalDeviceSparseImageFormatProperties_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkGetPhysicalDeviceSparseImageFormatProperties(VkPhysicalDevice physicalDevice, VkFormat format, VkImageType type, VkSampleCountFlags samples, VkImageUsageFlags usage, VkImageTiling tiling, uint32* pPropertyCount, VkSparseImageFormatProperties* pProperties)
			=> vkGetPhysicalDeviceSparseImageFormatProperties_ptr(physicalDevice, format, type, samples, usage, tiling, pPropertyCount, pProperties);

		public typealias vkQueueBindSparseFunction = function VkResult(VkQueue queue, uint32 bindInfoCount, VkBindSparseInfo* pBindInfo, VkFence fence);
		private static vkQueueBindSparseFunction vkQueueBindSparse_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkQueueBindSparse(VkQueue queue, uint32 bindInfoCount, VkBindSparseInfo* pBindInfo, VkFence fence)
			=> vkQueueBindSparse_ptr(queue, bindInfoCount, pBindInfo, fence);

		public typealias vkCreateFenceFunction = function VkResult(VkDevice device, VkFenceCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkFence* pFence);
		private static vkCreateFenceFunction vkCreateFence_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCreateFence(VkDevice device, VkFenceCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkFence* pFence)
			=> vkCreateFence_ptr(device, pCreateInfo, pAllocator, pFence);

		public typealias vkDestroyFenceFunction = function void(VkDevice device, VkFence fence, VkAllocationCallbacks* pAllocator);
		private static vkDestroyFenceFunction vkDestroyFence_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkDestroyFence(VkDevice device, VkFence fence, VkAllocationCallbacks* pAllocator)
			=> vkDestroyFence_ptr(device, fence, pAllocator);

		public typealias vkResetFencesFunction = function VkResult(VkDevice device, uint32 fenceCount, VkFence* pFences);
		private static vkResetFencesFunction vkResetFences_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkResetFences(VkDevice device, uint32 fenceCount, VkFence* pFences)
			=> vkResetFences_ptr(device, fenceCount, pFences);

		public typealias vkGetFenceStatusFunction = function VkResult(VkDevice device, VkFence fence);
		private static vkGetFenceStatusFunction vkGetFenceStatus_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetFenceStatus(VkDevice device, VkFence fence)
			=> vkGetFenceStatus_ptr(device, fence);

		public typealias vkWaitForFencesFunction = function VkResult(VkDevice device, uint32 fenceCount, VkFence* pFences, VkBool32 waitAll, uint64 timeout);
		private static vkWaitForFencesFunction vkWaitForFences_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkWaitForFences(VkDevice device, uint32 fenceCount, VkFence* pFences, VkBool32 waitAll, uint64 timeout)
			=> vkWaitForFences_ptr(device, fenceCount, pFences, waitAll, timeout);

		public typealias vkCreateSemaphoreFunction = function VkResult(VkDevice device, VkSemaphoreCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSemaphore* pSemaphore);
		private static vkCreateSemaphoreFunction vkCreateSemaphore_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCreateSemaphore(VkDevice device, VkSemaphoreCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSemaphore* pSemaphore)
			=> vkCreateSemaphore_ptr(device, pCreateInfo, pAllocator, pSemaphore);

		public typealias vkDestroySemaphoreFunction = function void(VkDevice device, VkSemaphore semaphore, VkAllocationCallbacks* pAllocator);
		private static vkDestroySemaphoreFunction vkDestroySemaphore_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkDestroySemaphore(VkDevice device, VkSemaphore semaphore, VkAllocationCallbacks* pAllocator)
			=> vkDestroySemaphore_ptr(device, semaphore, pAllocator);

		public typealias vkCreateEventFunction = function VkResult(VkDevice device, VkEventCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkEvent* pEvent);
		private static vkCreateEventFunction vkCreateEvent_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCreateEvent(VkDevice device, VkEventCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkEvent* pEvent)
			=> vkCreateEvent_ptr(device, pCreateInfo, pAllocator, pEvent);

		public typealias vkDestroyEventFunction = function void(VkDevice device, VkEvent event, VkAllocationCallbacks* pAllocator);
		private static vkDestroyEventFunction vkDestroyEvent_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkDestroyEvent(VkDevice device, VkEvent event, VkAllocationCallbacks* pAllocator)
			=> vkDestroyEvent_ptr(device, event, pAllocator);

		public typealias vkGetEventStatusFunction = function VkResult(VkDevice device, VkEvent event);
		private static vkGetEventStatusFunction vkGetEventStatus_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetEventStatus(VkDevice device, VkEvent event)
			=> vkGetEventStatus_ptr(device, event);

		public typealias vkSetEventFunction = function VkResult(VkDevice device, VkEvent event);
		private static vkSetEventFunction vkSetEvent_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkSetEvent(VkDevice device, VkEvent event)
			=> vkSetEvent_ptr(device, event);

		public typealias vkResetEventFunction = function VkResult(VkDevice device, VkEvent event);
		private static vkResetEventFunction vkResetEvent_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkResetEvent(VkDevice device, VkEvent event)
			=> vkResetEvent_ptr(device, event);

		public typealias vkCreateQueryPoolFunction = function VkResult(VkDevice device, VkQueryPoolCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkQueryPool* pQueryPool);
		private static vkCreateQueryPoolFunction vkCreateQueryPool_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCreateQueryPool(VkDevice device, VkQueryPoolCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkQueryPool* pQueryPool)
			=> vkCreateQueryPool_ptr(device, pCreateInfo, pAllocator, pQueryPool);

		public typealias vkDestroyQueryPoolFunction = function void(VkDevice device, VkQueryPool queryPool, VkAllocationCallbacks* pAllocator);
		private static vkDestroyQueryPoolFunction vkDestroyQueryPool_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkDestroyQueryPool(VkDevice device, VkQueryPool queryPool, VkAllocationCallbacks* pAllocator)
			=> vkDestroyQueryPool_ptr(device, queryPool, pAllocator);

		public typealias vkGetQueryPoolResultsFunction = function VkResult(VkDevice device, VkQueryPool queryPool, uint32 firstQuery, uint32 queryCount, uint dataSize, void* pData, uint64 stride, VkQueryResultFlags flags);
		private static vkGetQueryPoolResultsFunction vkGetQueryPoolResults_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetQueryPoolResults(VkDevice device, VkQueryPool queryPool, uint32 firstQuery, uint32 queryCount, uint dataSize, void* pData, uint64 stride, VkQueryResultFlags flags)
			=> vkGetQueryPoolResults_ptr(device, queryPool, firstQuery, queryCount, dataSize, pData, stride, flags);

		public typealias vkCreateBufferFunction = function VkResult(VkDevice device, VkBufferCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkBuffer* pBuffer);
		private static vkCreateBufferFunction vkCreateBuffer_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCreateBuffer(VkDevice device, VkBufferCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkBuffer* pBuffer)
			=> vkCreateBuffer_ptr(device, pCreateInfo, pAllocator, pBuffer);

		public typealias vkDestroyBufferFunction = function void(VkDevice device, VkBuffer buffer, VkAllocationCallbacks* pAllocator);
		private static vkDestroyBufferFunction vkDestroyBuffer_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkDestroyBuffer(VkDevice device, VkBuffer buffer, VkAllocationCallbacks* pAllocator)
			=> vkDestroyBuffer_ptr(device, buffer, pAllocator);

		public typealias vkCreateBufferViewFunction = function VkResult(VkDevice device, VkBufferViewCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkBufferView* pView);
		private static vkCreateBufferViewFunction vkCreateBufferView_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCreateBufferView(VkDevice device, VkBufferViewCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkBufferView* pView)
			=> vkCreateBufferView_ptr(device, pCreateInfo, pAllocator, pView);

		public typealias vkDestroyBufferViewFunction = function void(VkDevice device, VkBufferView bufferView, VkAllocationCallbacks* pAllocator);
		private static vkDestroyBufferViewFunction vkDestroyBufferView_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkDestroyBufferView(VkDevice device, VkBufferView bufferView, VkAllocationCallbacks* pAllocator)
			=> vkDestroyBufferView_ptr(device, bufferView, pAllocator);

		public typealias vkCreateImageFunction = function VkResult(VkDevice device, VkImageCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkImage* pImage);
		private static vkCreateImageFunction vkCreateImage_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCreateImage(VkDevice device, VkImageCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkImage* pImage)
			=> vkCreateImage_ptr(device, pCreateInfo, pAllocator, pImage);

		public typealias vkDestroyImageFunction = function void(VkDevice device, VkImage image, VkAllocationCallbacks* pAllocator);
		private static vkDestroyImageFunction vkDestroyImage_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkDestroyImage(VkDevice device, VkImage image, VkAllocationCallbacks* pAllocator)
			=> vkDestroyImage_ptr(device, image, pAllocator);

		public typealias vkGetImageSubresourceLayoutFunction = function void(VkDevice device, VkImage image, VkImageSubresource* pSubresource, VkSubresourceLayout* pLayout);
		private static vkGetImageSubresourceLayoutFunction vkGetImageSubresourceLayout_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkGetImageSubresourceLayout(VkDevice device, VkImage image, VkImageSubresource* pSubresource, VkSubresourceLayout* pLayout)
			=> vkGetImageSubresourceLayout_ptr(device, image, pSubresource, pLayout);

		public typealias vkCreateImageViewFunction = function VkResult(VkDevice device, VkImageViewCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkImageView* pView);
		private static vkCreateImageViewFunction vkCreateImageView_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCreateImageView(VkDevice device, VkImageViewCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkImageView* pView)
			=> vkCreateImageView_ptr(device, pCreateInfo, pAllocator, pView);

		public typealias vkDestroyImageViewFunction = function void(VkDevice device, VkImageView imageView, VkAllocationCallbacks* pAllocator);
		private static vkDestroyImageViewFunction vkDestroyImageView_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkDestroyImageView(VkDevice device, VkImageView imageView, VkAllocationCallbacks* pAllocator)
			=> vkDestroyImageView_ptr(device, imageView, pAllocator);

		public typealias vkCreateShaderModuleFunction = function VkResult(VkDevice device, VkShaderModuleCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkShaderModule* pShaderModule);
		private static vkCreateShaderModuleFunction vkCreateShaderModule_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCreateShaderModule(VkDevice device, VkShaderModuleCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkShaderModule* pShaderModule)
			=> vkCreateShaderModule_ptr(device, pCreateInfo, pAllocator, pShaderModule);

		public typealias vkDestroyShaderModuleFunction = function void(VkDevice device, VkShaderModule shaderModule, VkAllocationCallbacks* pAllocator);
		private static vkDestroyShaderModuleFunction vkDestroyShaderModule_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkDestroyShaderModule(VkDevice device, VkShaderModule shaderModule, VkAllocationCallbacks* pAllocator)
			=> vkDestroyShaderModule_ptr(device, shaderModule, pAllocator);

		public typealias vkCreatePipelineCacheFunction = function VkResult(VkDevice device, VkPipelineCacheCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkPipelineCache* pPipelineCache);
		private static vkCreatePipelineCacheFunction vkCreatePipelineCache_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCreatePipelineCache(VkDevice device, VkPipelineCacheCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkPipelineCache* pPipelineCache)
			=> vkCreatePipelineCache_ptr(device, pCreateInfo, pAllocator, pPipelineCache);

		public typealias vkDestroyPipelineCacheFunction = function void(VkDevice device, VkPipelineCache pipelineCache, VkAllocationCallbacks* pAllocator);
		private static vkDestroyPipelineCacheFunction vkDestroyPipelineCache_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkDestroyPipelineCache(VkDevice device, VkPipelineCache pipelineCache, VkAllocationCallbacks* pAllocator)
			=> vkDestroyPipelineCache_ptr(device, pipelineCache, pAllocator);

		public typealias vkGetPipelineCacheDataFunction = function VkResult(VkDevice device, VkPipelineCache pipelineCache, uint* pDataSize, void* pData);
		private static vkGetPipelineCacheDataFunction vkGetPipelineCacheData_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetPipelineCacheData(VkDevice device, VkPipelineCache pipelineCache, uint* pDataSize, void* pData)
			=> vkGetPipelineCacheData_ptr(device, pipelineCache, pDataSize, pData);

		public typealias vkMergePipelineCachesFunction = function VkResult(VkDevice device, VkPipelineCache dstCache, uint32 srcCacheCount, VkPipelineCache* pSrcCaches);
		private static vkMergePipelineCachesFunction vkMergePipelineCaches_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkMergePipelineCaches(VkDevice device, VkPipelineCache dstCache, uint32 srcCacheCount, VkPipelineCache* pSrcCaches)
			=> vkMergePipelineCaches_ptr(device, dstCache, srcCacheCount, pSrcCaches);

		public typealias vkCreateGraphicsPipelinesFunction = function VkResult(VkDevice device, VkPipelineCache pipelineCache, uint32 createInfoCount, VkGraphicsPipelineCreateInfo* pCreateInfos, VkAllocationCallbacks* pAllocator, VkPipeline* pPipelines);
		private static vkCreateGraphicsPipelinesFunction vkCreateGraphicsPipelines_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCreateGraphicsPipelines(VkDevice device, VkPipelineCache pipelineCache, uint32 createInfoCount, VkGraphicsPipelineCreateInfo* pCreateInfos, VkAllocationCallbacks* pAllocator, VkPipeline* pPipelines)
			=> vkCreateGraphicsPipelines_ptr(device, pipelineCache, createInfoCount, pCreateInfos, pAllocator, pPipelines);

		public typealias vkCreateComputePipelinesFunction = function VkResult(VkDevice device, VkPipelineCache pipelineCache, uint32 createInfoCount, VkComputePipelineCreateInfo* pCreateInfos, VkAllocationCallbacks* pAllocator, VkPipeline* pPipelines);
		private static vkCreateComputePipelinesFunction vkCreateComputePipelines_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCreateComputePipelines(VkDevice device, VkPipelineCache pipelineCache, uint32 createInfoCount, VkComputePipelineCreateInfo* pCreateInfos, VkAllocationCallbacks* pAllocator, VkPipeline* pPipelines)
			=> vkCreateComputePipelines_ptr(device, pipelineCache, createInfoCount, pCreateInfos, pAllocator, pPipelines);

		public typealias vkDestroyPipelineFunction = function void(VkDevice device, VkPipeline pipeline, VkAllocationCallbacks* pAllocator);
		private static vkDestroyPipelineFunction vkDestroyPipeline_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkDestroyPipeline(VkDevice device, VkPipeline pipeline, VkAllocationCallbacks* pAllocator)
			=> vkDestroyPipeline_ptr(device, pipeline, pAllocator);

		public typealias vkCreatePipelineLayoutFunction = function VkResult(VkDevice device, VkPipelineLayoutCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkPipelineLayout* pPipelineLayout);
		private static vkCreatePipelineLayoutFunction vkCreatePipelineLayout_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCreatePipelineLayout(VkDevice device, VkPipelineLayoutCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkPipelineLayout* pPipelineLayout)
			=> vkCreatePipelineLayout_ptr(device, pCreateInfo, pAllocator, pPipelineLayout);

		public typealias vkDestroyPipelineLayoutFunction = function void(VkDevice device, VkPipelineLayout pipelineLayout, VkAllocationCallbacks* pAllocator);
		private static vkDestroyPipelineLayoutFunction vkDestroyPipelineLayout_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkDestroyPipelineLayout(VkDevice device, VkPipelineLayout pipelineLayout, VkAllocationCallbacks* pAllocator)
			=> vkDestroyPipelineLayout_ptr(device, pipelineLayout, pAllocator);

		public typealias vkCreateSamplerFunction = function VkResult(VkDevice device, VkSamplerCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSampler* pSampler);
		private static vkCreateSamplerFunction vkCreateSampler_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCreateSampler(VkDevice device, VkSamplerCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSampler* pSampler)
			=> vkCreateSampler_ptr(device, pCreateInfo, pAllocator, pSampler);

		public typealias vkDestroySamplerFunction = function void(VkDevice device, VkSampler sampler, VkAllocationCallbacks* pAllocator);
		private static vkDestroySamplerFunction vkDestroySampler_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkDestroySampler(VkDevice device, VkSampler sampler, VkAllocationCallbacks* pAllocator)
			=> vkDestroySampler_ptr(device, sampler, pAllocator);

		public typealias vkCreateDescriptorSetLayoutFunction = function VkResult(VkDevice device, VkDescriptorSetLayoutCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkDescriptorSetLayout* pSetLayout);
		private static vkCreateDescriptorSetLayoutFunction vkCreateDescriptorSetLayout_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCreateDescriptorSetLayout(VkDevice device, VkDescriptorSetLayoutCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkDescriptorSetLayout* pSetLayout)
			=> vkCreateDescriptorSetLayout_ptr(device, pCreateInfo, pAllocator, pSetLayout);

		public typealias vkDestroyDescriptorSetLayoutFunction = function void(VkDevice device, VkDescriptorSetLayout descriptorSetLayout, VkAllocationCallbacks* pAllocator);
		private static vkDestroyDescriptorSetLayoutFunction vkDestroyDescriptorSetLayout_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkDestroyDescriptorSetLayout(VkDevice device, VkDescriptorSetLayout descriptorSetLayout, VkAllocationCallbacks* pAllocator)
			=> vkDestroyDescriptorSetLayout_ptr(device, descriptorSetLayout, pAllocator);

		public typealias vkCreateDescriptorPoolFunction = function VkResult(VkDevice device, VkDescriptorPoolCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkDescriptorPool* pDescriptorPool);
		private static vkCreateDescriptorPoolFunction vkCreateDescriptorPool_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCreateDescriptorPool(VkDevice device, VkDescriptorPoolCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkDescriptorPool* pDescriptorPool)
			=> vkCreateDescriptorPool_ptr(device, pCreateInfo, pAllocator, pDescriptorPool);

		public typealias vkDestroyDescriptorPoolFunction = function void(VkDevice device, VkDescriptorPool descriptorPool, VkAllocationCallbacks* pAllocator);
		private static vkDestroyDescriptorPoolFunction vkDestroyDescriptorPool_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkDestroyDescriptorPool(VkDevice device, VkDescriptorPool descriptorPool, VkAllocationCallbacks* pAllocator)
			=> vkDestroyDescriptorPool_ptr(device, descriptorPool, pAllocator);

		public typealias vkResetDescriptorPoolFunction = function VkResult(VkDevice device, VkDescriptorPool descriptorPool, uint32 flags);
		private static vkResetDescriptorPoolFunction vkResetDescriptorPool_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkResetDescriptorPool(VkDevice device, VkDescriptorPool descriptorPool, uint32 flags)
			=> vkResetDescriptorPool_ptr(device, descriptorPool, flags);

		public typealias vkAllocateDescriptorSetsFunction = function VkResult(VkDevice device, VkDescriptorSetAllocateInfo* pAllocateInfo, VkDescriptorSet* pDescriptorSets);
		private static vkAllocateDescriptorSetsFunction vkAllocateDescriptorSets_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkAllocateDescriptorSets(VkDevice device, VkDescriptorSetAllocateInfo* pAllocateInfo, VkDescriptorSet* pDescriptorSets)
			=> vkAllocateDescriptorSets_ptr(device, pAllocateInfo, pDescriptorSets);

		public typealias vkFreeDescriptorSetsFunction = function VkResult(VkDevice device, VkDescriptorPool descriptorPool, uint32 descriptorSetCount, VkDescriptorSet* pDescriptorSets);
		private static vkFreeDescriptorSetsFunction vkFreeDescriptorSets_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkFreeDescriptorSets(VkDevice device, VkDescriptorPool descriptorPool, uint32 descriptorSetCount, VkDescriptorSet* pDescriptorSets)
			=> vkFreeDescriptorSets_ptr(device, descriptorPool, descriptorSetCount, pDescriptorSets);

		public typealias vkUpdateDescriptorSetsFunction = function void(VkDevice device, uint32 descriptorWriteCount, VkWriteDescriptorSet* pDescriptorWrites, uint32 descriptorCopyCount, VkCopyDescriptorSet* pDescriptorCopies);
		private static vkUpdateDescriptorSetsFunction vkUpdateDescriptorSets_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkUpdateDescriptorSets(VkDevice device, uint32 descriptorWriteCount, VkWriteDescriptorSet* pDescriptorWrites, uint32 descriptorCopyCount, VkCopyDescriptorSet* pDescriptorCopies)
			=> vkUpdateDescriptorSets_ptr(device, descriptorWriteCount, pDescriptorWrites, descriptorCopyCount, pDescriptorCopies);

		public typealias vkCreateFramebufferFunction = function VkResult(VkDevice device, VkFramebufferCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkFramebuffer* pFramebuffer);
		private static vkCreateFramebufferFunction vkCreateFramebuffer_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCreateFramebuffer(VkDevice device, VkFramebufferCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkFramebuffer* pFramebuffer)
			=> vkCreateFramebuffer_ptr(device, pCreateInfo, pAllocator, pFramebuffer);

		public typealias vkDestroyFramebufferFunction = function void(VkDevice device, VkFramebuffer framebuffer, VkAllocationCallbacks* pAllocator);
		private static vkDestroyFramebufferFunction vkDestroyFramebuffer_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkDestroyFramebuffer(VkDevice device, VkFramebuffer framebuffer, VkAllocationCallbacks* pAllocator)
			=> vkDestroyFramebuffer_ptr(device, framebuffer, pAllocator);

		public typealias vkCreateRenderPassFunction = function VkResult(VkDevice device, VkRenderPassCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkRenderPass* pRenderPass);
		private static vkCreateRenderPassFunction vkCreateRenderPass_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCreateRenderPass(VkDevice device, VkRenderPassCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkRenderPass* pRenderPass)
			=> vkCreateRenderPass_ptr(device, pCreateInfo, pAllocator, pRenderPass);

		public typealias vkDestroyRenderPassFunction = function void(VkDevice device, VkRenderPass renderPass, VkAllocationCallbacks* pAllocator);
		private static vkDestroyRenderPassFunction vkDestroyRenderPass_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkDestroyRenderPass(VkDevice device, VkRenderPass renderPass, VkAllocationCallbacks* pAllocator)
			=> vkDestroyRenderPass_ptr(device, renderPass, pAllocator);

		public typealias vkGetRenderAreaGranularityFunction = function void(VkDevice device, VkRenderPass renderPass, VkExtent2D* pGranularity);
		private static vkGetRenderAreaGranularityFunction vkGetRenderAreaGranularity_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkGetRenderAreaGranularity(VkDevice device, VkRenderPass renderPass, VkExtent2D* pGranularity)
			=> vkGetRenderAreaGranularity_ptr(device, renderPass, pGranularity);

		public typealias vkCreateCommandPoolFunction = function VkResult(VkDevice device, VkCommandPoolCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkCommandPool* pCommandPool);
		private static vkCreateCommandPoolFunction vkCreateCommandPool_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCreateCommandPool(VkDevice device, VkCommandPoolCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkCommandPool* pCommandPool)
			=> vkCreateCommandPool_ptr(device, pCreateInfo, pAllocator, pCommandPool);

		public typealias vkDestroyCommandPoolFunction = function void(VkDevice device, VkCommandPool commandPool, VkAllocationCallbacks* pAllocator);
		private static vkDestroyCommandPoolFunction vkDestroyCommandPool_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkDestroyCommandPool(VkDevice device, VkCommandPool commandPool, VkAllocationCallbacks* pAllocator)
			=> vkDestroyCommandPool_ptr(device, commandPool, pAllocator);

		public typealias vkResetCommandPoolFunction = function VkResult(VkDevice device, VkCommandPool commandPool, VkCommandPoolResetFlags flags);
		private static vkResetCommandPoolFunction vkResetCommandPool_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkResetCommandPool(VkDevice device, VkCommandPool commandPool, VkCommandPoolResetFlags flags)
			=> vkResetCommandPool_ptr(device, commandPool, flags);

		public typealias vkAllocateCommandBuffersFunction = function VkResult(VkDevice device, VkCommandBufferAllocateInfo* pAllocateInfo, VkCommandBuffer* pCommandBuffers);
		private static vkAllocateCommandBuffersFunction vkAllocateCommandBuffers_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkAllocateCommandBuffers(VkDevice device, VkCommandBufferAllocateInfo* pAllocateInfo, VkCommandBuffer* pCommandBuffers)
			=> vkAllocateCommandBuffers_ptr(device, pAllocateInfo, pCommandBuffers);

		public typealias vkFreeCommandBuffersFunction = function void(VkDevice device, VkCommandPool commandPool, uint32 commandBufferCount, VkCommandBuffer* pCommandBuffers);
		private static vkFreeCommandBuffersFunction vkFreeCommandBuffers_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkFreeCommandBuffers(VkDevice device, VkCommandPool commandPool, uint32 commandBufferCount, VkCommandBuffer* pCommandBuffers)
			=> vkFreeCommandBuffers_ptr(device, commandPool, commandBufferCount, pCommandBuffers);

		public typealias vkBeginCommandBufferFunction = function VkResult(VkCommandBuffer commandBuffer, VkCommandBufferBeginInfo* pBeginInfo);
		private static vkBeginCommandBufferFunction vkBeginCommandBuffer_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkBeginCommandBuffer(VkCommandBuffer commandBuffer, VkCommandBufferBeginInfo* pBeginInfo)
			=> vkBeginCommandBuffer_ptr(commandBuffer, pBeginInfo);

		public typealias vkEndCommandBufferFunction = function VkResult(VkCommandBuffer commandBuffer);
		private static vkEndCommandBufferFunction vkEndCommandBuffer_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkEndCommandBuffer(VkCommandBuffer commandBuffer)
			=> vkEndCommandBuffer_ptr(commandBuffer);

		public typealias vkResetCommandBufferFunction = function VkResult(VkCommandBuffer commandBuffer, VkCommandBufferResetFlags flags);
		private static vkResetCommandBufferFunction vkResetCommandBuffer_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkResetCommandBuffer(VkCommandBuffer commandBuffer, VkCommandBufferResetFlags flags)
			=> vkResetCommandBuffer_ptr(commandBuffer, flags);

		public typealias vkCmdBindPipelineFunction = function void(VkCommandBuffer commandBuffer, VkPipelineBindPoint pipelineBindPoint, VkPipeline pipeline);
		private static vkCmdBindPipelineFunction vkCmdBindPipeline_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdBindPipeline(VkCommandBuffer commandBuffer, VkPipelineBindPoint pipelineBindPoint, VkPipeline pipeline)
			=> vkCmdBindPipeline_ptr(commandBuffer, pipelineBindPoint, pipeline);

		public typealias vkCmdSetViewportFunction = function void(VkCommandBuffer commandBuffer, uint32 firstViewport, uint32 viewportCount, VkViewport* pViewports);
		private static vkCmdSetViewportFunction vkCmdSetViewport_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdSetViewport(VkCommandBuffer commandBuffer, uint32 firstViewport, uint32 viewportCount, VkViewport* pViewports)
			=> vkCmdSetViewport_ptr(commandBuffer, firstViewport, viewportCount, pViewports);

		public typealias vkCmdSetScissorFunction = function void(VkCommandBuffer commandBuffer, uint32 firstScissor, uint32 scissorCount, VkRect2D* pScissors);
		private static vkCmdSetScissorFunction vkCmdSetScissor_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdSetScissor(VkCommandBuffer commandBuffer, uint32 firstScissor, uint32 scissorCount, VkRect2D* pScissors)
			=> vkCmdSetScissor_ptr(commandBuffer, firstScissor, scissorCount, pScissors);

		public typealias vkCmdSetLineWidthFunction = function void(VkCommandBuffer commandBuffer, float lineWidth);
		private static vkCmdSetLineWidthFunction vkCmdSetLineWidth_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdSetLineWidth(VkCommandBuffer commandBuffer, float lineWidth)
			=> vkCmdSetLineWidth_ptr(commandBuffer, lineWidth);

		public typealias vkCmdSetDepthBiasFunction = function void(VkCommandBuffer commandBuffer, float depthBiasConstantFactor, float depthBiasClamp, float depthBiasSlopeFactor);
		private static vkCmdSetDepthBiasFunction vkCmdSetDepthBias_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdSetDepthBias(VkCommandBuffer commandBuffer, float depthBiasConstantFactor, float depthBiasClamp, float depthBiasSlopeFactor)
			=> vkCmdSetDepthBias_ptr(commandBuffer, depthBiasConstantFactor, depthBiasClamp, depthBiasSlopeFactor);

		public typealias vkCmdSetBlendConstantsFunction = function void(VkCommandBuffer commandBuffer, float[4] blendConstants);
		private static vkCmdSetBlendConstantsFunction vkCmdSetBlendConstants_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdSetBlendConstants(VkCommandBuffer commandBuffer, float[4] blendConstants)
			=> vkCmdSetBlendConstants_ptr(commandBuffer, blendConstants);

		public typealias vkCmdSetDepthBoundsFunction = function void(VkCommandBuffer commandBuffer, float minDepthBounds, float maxDepthBounds);
		private static vkCmdSetDepthBoundsFunction vkCmdSetDepthBounds_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdSetDepthBounds(VkCommandBuffer commandBuffer, float minDepthBounds, float maxDepthBounds)
			=> vkCmdSetDepthBounds_ptr(commandBuffer, minDepthBounds, maxDepthBounds);

		public typealias vkCmdSetStencilCompareMaskFunction = function void(VkCommandBuffer commandBuffer, VkStencilFaceFlags faceMask, uint32 compareMask);
		private static vkCmdSetStencilCompareMaskFunction vkCmdSetStencilCompareMask_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdSetStencilCompareMask(VkCommandBuffer commandBuffer, VkStencilFaceFlags faceMask, uint32 compareMask)
			=> vkCmdSetStencilCompareMask_ptr(commandBuffer, faceMask, compareMask);

		public typealias vkCmdSetStencilWriteMaskFunction = function void(VkCommandBuffer commandBuffer, VkStencilFaceFlags faceMask, uint32 writeMask);
		private static vkCmdSetStencilWriteMaskFunction vkCmdSetStencilWriteMask_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdSetStencilWriteMask(VkCommandBuffer commandBuffer, VkStencilFaceFlags faceMask, uint32 writeMask)
			=> vkCmdSetStencilWriteMask_ptr(commandBuffer, faceMask, writeMask);

		public typealias vkCmdSetStencilReferenceFunction = function void(VkCommandBuffer commandBuffer, VkStencilFaceFlags faceMask, uint32 reference);
		private static vkCmdSetStencilReferenceFunction vkCmdSetStencilReference_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdSetStencilReference(VkCommandBuffer commandBuffer, VkStencilFaceFlags faceMask, uint32 reference)
			=> vkCmdSetStencilReference_ptr(commandBuffer, faceMask, reference);

		public typealias vkCmdBindDescriptorSetsFunction = function void(VkCommandBuffer commandBuffer, VkPipelineBindPoint pipelineBindPoint, VkPipelineLayout layout, uint32 firstSet, uint32 descriptorSetCount, VkDescriptorSet* pDescriptorSets, uint32 dynamicOffsetCount, uint32* pDynamicOffsets);
		private static vkCmdBindDescriptorSetsFunction vkCmdBindDescriptorSets_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdBindDescriptorSets(VkCommandBuffer commandBuffer, VkPipelineBindPoint pipelineBindPoint, VkPipelineLayout layout, uint32 firstSet, uint32 descriptorSetCount, VkDescriptorSet* pDescriptorSets, uint32 dynamicOffsetCount, uint32* pDynamicOffsets)
			=> vkCmdBindDescriptorSets_ptr(commandBuffer, pipelineBindPoint, layout, firstSet, descriptorSetCount, pDescriptorSets, dynamicOffsetCount, pDynamicOffsets);

		public typealias vkCmdBindIndexBufferFunction = function void(VkCommandBuffer commandBuffer, VkBuffer buffer, uint64 offset, VkIndexType indexType);
		private static vkCmdBindIndexBufferFunction vkCmdBindIndexBuffer_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdBindIndexBuffer(VkCommandBuffer commandBuffer, VkBuffer buffer, uint64 offset, VkIndexType indexType)
			=> vkCmdBindIndexBuffer_ptr(commandBuffer, buffer, offset, indexType);

		public typealias vkCmdBindVertexBuffersFunction = function void(VkCommandBuffer commandBuffer, uint32 firstBinding, uint32 bindingCount, VkBuffer* pBuffers, uint64* pOffsets);
		private static vkCmdBindVertexBuffersFunction vkCmdBindVertexBuffers_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdBindVertexBuffers(VkCommandBuffer commandBuffer, uint32 firstBinding, uint32 bindingCount, VkBuffer* pBuffers, uint64* pOffsets)
			=> vkCmdBindVertexBuffers_ptr(commandBuffer, firstBinding, bindingCount, pBuffers, pOffsets);

		public typealias vkCmdDrawFunction = function void(VkCommandBuffer commandBuffer, uint32 vertexCount, uint32 instanceCount, uint32 firstVertex, uint32 firstInstance);
		private static vkCmdDrawFunction vkCmdDraw_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdDraw(VkCommandBuffer commandBuffer, uint32 vertexCount, uint32 instanceCount, uint32 firstVertex, uint32 firstInstance)
			=> vkCmdDraw_ptr(commandBuffer, vertexCount, instanceCount, firstVertex, firstInstance);

		public typealias vkCmdDrawIndexedFunction = function void(VkCommandBuffer commandBuffer, uint32 indexCount, uint32 instanceCount, uint32 firstIndex, int32 vertexOffset, uint32 firstInstance);
		private static vkCmdDrawIndexedFunction vkCmdDrawIndexed_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdDrawIndexed(VkCommandBuffer commandBuffer, uint32 indexCount, uint32 instanceCount, uint32 firstIndex, int32 vertexOffset, uint32 firstInstance)
			=> vkCmdDrawIndexed_ptr(commandBuffer, indexCount, instanceCount, firstIndex, vertexOffset, firstInstance);

		public typealias vkCmdDrawIndirectFunction = function void(VkCommandBuffer commandBuffer, VkBuffer buffer, uint64 offset, uint32 drawCount, uint32 stride);
		private static vkCmdDrawIndirectFunction vkCmdDrawIndirect_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdDrawIndirect(VkCommandBuffer commandBuffer, VkBuffer buffer, uint64 offset, uint32 drawCount, uint32 stride)
			=> vkCmdDrawIndirect_ptr(commandBuffer, buffer, offset, drawCount, stride);

		public typealias vkCmdDrawIndexedIndirectFunction = function void(VkCommandBuffer commandBuffer, VkBuffer buffer, uint64 offset, uint32 drawCount, uint32 stride);
		private static vkCmdDrawIndexedIndirectFunction vkCmdDrawIndexedIndirect_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdDrawIndexedIndirect(VkCommandBuffer commandBuffer, VkBuffer buffer, uint64 offset, uint32 drawCount, uint32 stride)
			=> vkCmdDrawIndexedIndirect_ptr(commandBuffer, buffer, offset, drawCount, stride);

		public typealias vkCmdDispatchFunction = function void(VkCommandBuffer commandBuffer, uint32 groupCountX, uint32 groupCountY, uint32 groupCountZ);
		private static vkCmdDispatchFunction vkCmdDispatch_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdDispatch(VkCommandBuffer commandBuffer, uint32 groupCountX, uint32 groupCountY, uint32 groupCountZ)
			=> vkCmdDispatch_ptr(commandBuffer, groupCountX, groupCountY, groupCountZ);

		public typealias vkCmdDispatchIndirectFunction = function void(VkCommandBuffer commandBuffer, VkBuffer buffer, uint64 offset);
		private static vkCmdDispatchIndirectFunction vkCmdDispatchIndirect_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdDispatchIndirect(VkCommandBuffer commandBuffer, VkBuffer buffer, uint64 offset)
			=> vkCmdDispatchIndirect_ptr(commandBuffer, buffer, offset);

		public typealias vkCmdCopyBufferFunction = function void(VkCommandBuffer commandBuffer, VkBuffer srcBuffer, VkBuffer dstBuffer, uint32 regionCount, VkBufferCopy* pRegions);
		private static vkCmdCopyBufferFunction vkCmdCopyBuffer_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdCopyBuffer(VkCommandBuffer commandBuffer, VkBuffer srcBuffer, VkBuffer dstBuffer, uint32 regionCount, VkBufferCopy* pRegions)
			=> vkCmdCopyBuffer_ptr(commandBuffer, srcBuffer, dstBuffer, regionCount, pRegions);

		public typealias vkCmdCopyImageFunction = function void(VkCommandBuffer commandBuffer, VkImage srcImage, VkImageLayout srcImageLayout, VkImage dstImage, VkImageLayout dstImageLayout, uint32 regionCount, VkImageCopy* pRegions);
		private static vkCmdCopyImageFunction vkCmdCopyImage_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdCopyImage(VkCommandBuffer commandBuffer, VkImage srcImage, VkImageLayout srcImageLayout, VkImage dstImage, VkImageLayout dstImageLayout, uint32 regionCount, VkImageCopy* pRegions)
			=> vkCmdCopyImage_ptr(commandBuffer, srcImage, srcImageLayout, dstImage, dstImageLayout, regionCount, pRegions);

		public typealias vkCmdBlitImageFunction = function void(VkCommandBuffer commandBuffer, VkImage srcImage, VkImageLayout srcImageLayout, VkImage dstImage, VkImageLayout dstImageLayout, uint32 regionCount, VkImageBlit* pRegions, VkFilter filter);
		private static vkCmdBlitImageFunction vkCmdBlitImage_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdBlitImage(VkCommandBuffer commandBuffer, VkImage srcImage, VkImageLayout srcImageLayout, VkImage dstImage, VkImageLayout dstImageLayout, uint32 regionCount, VkImageBlit* pRegions, VkFilter filter)
			=> vkCmdBlitImage_ptr(commandBuffer, srcImage, srcImageLayout, dstImage, dstImageLayout, regionCount, pRegions, filter);

		public typealias vkCmdCopyBufferToImageFunction = function void(VkCommandBuffer commandBuffer, VkBuffer srcBuffer, VkImage dstImage, VkImageLayout dstImageLayout, uint32 regionCount, VkBufferImageCopy* pRegions);
		private static vkCmdCopyBufferToImageFunction vkCmdCopyBufferToImage_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdCopyBufferToImage(VkCommandBuffer commandBuffer, VkBuffer srcBuffer, VkImage dstImage, VkImageLayout dstImageLayout, uint32 regionCount, VkBufferImageCopy* pRegions)
			=> vkCmdCopyBufferToImage_ptr(commandBuffer, srcBuffer, dstImage, dstImageLayout, regionCount, pRegions);

		public typealias vkCmdCopyImageToBufferFunction = function void(VkCommandBuffer commandBuffer, VkImage srcImage, VkImageLayout srcImageLayout, VkBuffer dstBuffer, uint32 regionCount, VkBufferImageCopy* pRegions);
		private static vkCmdCopyImageToBufferFunction vkCmdCopyImageToBuffer_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdCopyImageToBuffer(VkCommandBuffer commandBuffer, VkImage srcImage, VkImageLayout srcImageLayout, VkBuffer dstBuffer, uint32 regionCount, VkBufferImageCopy* pRegions)
			=> vkCmdCopyImageToBuffer_ptr(commandBuffer, srcImage, srcImageLayout, dstBuffer, regionCount, pRegions);

		public typealias vkCmdUpdateBufferFunction = function void(VkCommandBuffer commandBuffer, VkBuffer dstBuffer, uint64 dstOffset, uint64 dataSize, void* pData);
		private static vkCmdUpdateBufferFunction vkCmdUpdateBuffer_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdUpdateBuffer(VkCommandBuffer commandBuffer, VkBuffer dstBuffer, uint64 dstOffset, uint64 dataSize, void* pData)
			=> vkCmdUpdateBuffer_ptr(commandBuffer, dstBuffer, dstOffset, dataSize, pData);

		public typealias vkCmdFillBufferFunction = function void(VkCommandBuffer commandBuffer, VkBuffer dstBuffer, uint64 dstOffset, uint64 size, uint32 data);
		private static vkCmdFillBufferFunction vkCmdFillBuffer_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdFillBuffer(VkCommandBuffer commandBuffer, VkBuffer dstBuffer, uint64 dstOffset, uint64 size, uint32 data)
			=> vkCmdFillBuffer_ptr(commandBuffer, dstBuffer, dstOffset, size, data);

		public typealias vkCmdClearColorImageFunction = function void(VkCommandBuffer commandBuffer, VkImage image, VkImageLayout imageLayout, VkClearColorValue* pColor, uint32 rangeCount, VkImageSubresourceRange* pRanges);
		private static vkCmdClearColorImageFunction vkCmdClearColorImage_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdClearColorImage(VkCommandBuffer commandBuffer, VkImage image, VkImageLayout imageLayout, VkClearColorValue* pColor, uint32 rangeCount, VkImageSubresourceRange* pRanges)
			=> vkCmdClearColorImage_ptr(commandBuffer, image, imageLayout, pColor, rangeCount, pRanges);

		public typealias vkCmdClearDepthStencilImageFunction = function void(VkCommandBuffer commandBuffer, VkImage image, VkImageLayout imageLayout, VkClearDepthStencilValue* pDepthStencil, uint32 rangeCount, VkImageSubresourceRange* pRanges);
		private static vkCmdClearDepthStencilImageFunction vkCmdClearDepthStencilImage_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdClearDepthStencilImage(VkCommandBuffer commandBuffer, VkImage image, VkImageLayout imageLayout, VkClearDepthStencilValue* pDepthStencil, uint32 rangeCount, VkImageSubresourceRange* pRanges)
			=> vkCmdClearDepthStencilImage_ptr(commandBuffer, image, imageLayout, pDepthStencil, rangeCount, pRanges);

		public typealias vkCmdClearAttachmentsFunction = function void(VkCommandBuffer commandBuffer, uint32 attachmentCount, VkClearAttachment* pAttachments, uint32 rectCount, VkClearRect* pRects);
		private static vkCmdClearAttachmentsFunction vkCmdClearAttachments_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdClearAttachments(VkCommandBuffer commandBuffer, uint32 attachmentCount, VkClearAttachment* pAttachments, uint32 rectCount, VkClearRect* pRects)
			=> vkCmdClearAttachments_ptr(commandBuffer, attachmentCount, pAttachments, rectCount, pRects);

		public typealias vkCmdResolveImageFunction = function void(VkCommandBuffer commandBuffer, VkImage srcImage, VkImageLayout srcImageLayout, VkImage dstImage, VkImageLayout dstImageLayout, uint32 regionCount, VkImageResolve* pRegions);
		private static vkCmdResolveImageFunction vkCmdResolveImage_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdResolveImage(VkCommandBuffer commandBuffer, VkImage srcImage, VkImageLayout srcImageLayout, VkImage dstImage, VkImageLayout dstImageLayout, uint32 regionCount, VkImageResolve* pRegions)
			=> vkCmdResolveImage_ptr(commandBuffer, srcImage, srcImageLayout, dstImage, dstImageLayout, regionCount, pRegions);

		public typealias vkCmdSetEventFunction = function void(VkCommandBuffer commandBuffer, VkEvent event, VkPipelineStageFlags stageMask);
		private static vkCmdSetEventFunction vkCmdSetEvent_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdSetEvent(VkCommandBuffer commandBuffer, VkEvent event, VkPipelineStageFlags stageMask)
			=> vkCmdSetEvent_ptr(commandBuffer, event, stageMask);

		public typealias vkCmdResetEventFunction = function void(VkCommandBuffer commandBuffer, VkEvent event, VkPipelineStageFlags stageMask);
		private static vkCmdResetEventFunction vkCmdResetEvent_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdResetEvent(VkCommandBuffer commandBuffer, VkEvent event, VkPipelineStageFlags stageMask)
			=> vkCmdResetEvent_ptr(commandBuffer, event, stageMask);

		public typealias vkCmdWaitEventsFunction = function void(VkCommandBuffer commandBuffer, uint32 eventCount, VkEvent* pEvents, VkPipelineStageFlags srcStageMask, VkPipelineStageFlags dstStageMask, uint32 memoryBarrierCount, VkMemoryBarrier* pMemoryBarriers, uint32 bufferMemoryBarrierCount, VkBufferMemoryBarrier* pBufferMemoryBarriers, uint32 imageMemoryBarrierCount, VkImageMemoryBarrier* pImageMemoryBarriers);
		private static vkCmdWaitEventsFunction vkCmdWaitEvents_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdWaitEvents(VkCommandBuffer commandBuffer, uint32 eventCount, VkEvent* pEvents, VkPipelineStageFlags srcStageMask, VkPipelineStageFlags dstStageMask, uint32 memoryBarrierCount, VkMemoryBarrier* pMemoryBarriers, uint32 bufferMemoryBarrierCount, VkBufferMemoryBarrier* pBufferMemoryBarriers, uint32 imageMemoryBarrierCount, VkImageMemoryBarrier* pImageMemoryBarriers)
			=> vkCmdWaitEvents_ptr(commandBuffer, eventCount, pEvents, srcStageMask, dstStageMask, memoryBarrierCount, pMemoryBarriers, bufferMemoryBarrierCount, pBufferMemoryBarriers, imageMemoryBarrierCount, pImageMemoryBarriers);

		public typealias vkCmdPipelineBarrierFunction = function void(VkCommandBuffer commandBuffer, VkPipelineStageFlags srcStageMask, VkPipelineStageFlags dstStageMask, VkDependencyFlags dependencyFlags, uint32 memoryBarrierCount, VkMemoryBarrier* pMemoryBarriers, uint32 bufferMemoryBarrierCount, VkBufferMemoryBarrier* pBufferMemoryBarriers, uint32 imageMemoryBarrierCount, VkImageMemoryBarrier* pImageMemoryBarriers);
		private static vkCmdPipelineBarrierFunction vkCmdPipelineBarrier_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdPipelineBarrier(VkCommandBuffer commandBuffer, VkPipelineStageFlags srcStageMask, VkPipelineStageFlags dstStageMask, VkDependencyFlags dependencyFlags, uint32 memoryBarrierCount, VkMemoryBarrier* pMemoryBarriers, uint32 bufferMemoryBarrierCount, VkBufferMemoryBarrier* pBufferMemoryBarriers, uint32 imageMemoryBarrierCount, VkImageMemoryBarrier* pImageMemoryBarriers)
			=> vkCmdPipelineBarrier_ptr(commandBuffer, srcStageMask, dstStageMask, dependencyFlags, memoryBarrierCount, pMemoryBarriers, bufferMemoryBarrierCount, pBufferMemoryBarriers, imageMemoryBarrierCount, pImageMemoryBarriers);

		public typealias vkCmdBeginQueryFunction = function void(VkCommandBuffer commandBuffer, VkQueryPool queryPool, uint32 query, VkQueryControlFlags flags);
		private static vkCmdBeginQueryFunction vkCmdBeginQuery_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdBeginQuery(VkCommandBuffer commandBuffer, VkQueryPool queryPool, uint32 query, VkQueryControlFlags flags)
			=> vkCmdBeginQuery_ptr(commandBuffer, queryPool, query, flags);

		public typealias vkCmdEndQueryFunction = function void(VkCommandBuffer commandBuffer, VkQueryPool queryPool, uint32 query);
		private static vkCmdEndQueryFunction vkCmdEndQuery_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdEndQuery(VkCommandBuffer commandBuffer, VkQueryPool queryPool, uint32 query)
			=> vkCmdEndQuery_ptr(commandBuffer, queryPool, query);

		public typealias vkCmdResetQueryPoolFunction = function void(VkCommandBuffer commandBuffer, VkQueryPool queryPool, uint32 firstQuery, uint32 queryCount);
		private static vkCmdResetQueryPoolFunction vkCmdResetQueryPool_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdResetQueryPool(VkCommandBuffer commandBuffer, VkQueryPool queryPool, uint32 firstQuery, uint32 queryCount)
			=> vkCmdResetQueryPool_ptr(commandBuffer, queryPool, firstQuery, queryCount);

		public typealias vkCmdWriteTimestampFunction = function void(VkCommandBuffer commandBuffer, VkPipelineStageFlags pipelineStage, VkQueryPool queryPool, uint32 query);
		private static vkCmdWriteTimestampFunction vkCmdWriteTimestamp_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdWriteTimestamp(VkCommandBuffer commandBuffer, VkPipelineStageFlags pipelineStage, VkQueryPool queryPool, uint32 query)
			=> vkCmdWriteTimestamp_ptr(commandBuffer, pipelineStage, queryPool, query);

		public typealias vkCmdCopyQueryPoolResultsFunction = function void(VkCommandBuffer commandBuffer, VkQueryPool queryPool, uint32 firstQuery, uint32 queryCount, VkBuffer dstBuffer, uint64 dstOffset, uint64 stride, VkQueryResultFlags flags);
		private static vkCmdCopyQueryPoolResultsFunction vkCmdCopyQueryPoolResults_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdCopyQueryPoolResults(VkCommandBuffer commandBuffer, VkQueryPool queryPool, uint32 firstQuery, uint32 queryCount, VkBuffer dstBuffer, uint64 dstOffset, uint64 stride, VkQueryResultFlags flags)
			=> vkCmdCopyQueryPoolResults_ptr(commandBuffer, queryPool, firstQuery, queryCount, dstBuffer, dstOffset, stride, flags);

		public typealias vkCmdPushConstantsFunction = function void(VkCommandBuffer commandBuffer, VkPipelineLayout layout, VkShaderStageFlags stageFlags, uint32 offset, uint32 size, void* pValues);
		private static vkCmdPushConstantsFunction vkCmdPushConstants_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdPushConstants(VkCommandBuffer commandBuffer, VkPipelineLayout layout, VkShaderStageFlags stageFlags, uint32 offset, uint32 size, void* pValues)
			=> vkCmdPushConstants_ptr(commandBuffer, layout, stageFlags, offset, size, pValues);

		public typealias vkCmdBeginRenderPassFunction = function void(VkCommandBuffer commandBuffer, VkRenderPassBeginInfo* pRenderPassBegin, VkSubpassContents contents);
		private static vkCmdBeginRenderPassFunction vkCmdBeginRenderPass_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdBeginRenderPass(VkCommandBuffer commandBuffer, VkRenderPassBeginInfo* pRenderPassBegin, VkSubpassContents contents)
			=> vkCmdBeginRenderPass_ptr(commandBuffer, pRenderPassBegin, contents);

		public typealias vkCmdNextSubpassFunction = function void(VkCommandBuffer commandBuffer, VkSubpassContents contents);
		private static vkCmdNextSubpassFunction vkCmdNextSubpass_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdNextSubpass(VkCommandBuffer commandBuffer, VkSubpassContents contents)
			=> vkCmdNextSubpass_ptr(commandBuffer, contents);

		public typealias vkCmdEndRenderPassFunction = function void(VkCommandBuffer commandBuffer);
		private static vkCmdEndRenderPassFunction vkCmdEndRenderPass_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdEndRenderPass(VkCommandBuffer commandBuffer)
			=> vkCmdEndRenderPass_ptr(commandBuffer);

		public typealias vkCmdExecuteCommandsFunction = function void(VkCommandBuffer commandBuffer, uint32 commandBufferCount, VkCommandBuffer* pCommandBuffers);
		private static vkCmdExecuteCommandsFunction vkCmdExecuteCommands_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdExecuteCommands(VkCommandBuffer commandBuffer, uint32 commandBufferCount, VkCommandBuffer* pCommandBuffers)
			=> vkCmdExecuteCommands_ptr(commandBuffer, commandBufferCount, pCommandBuffers);

		public typealias vkEnumerateInstanceVersionFunction = function VkResult(uint32* pApiVersion);
		private static vkEnumerateInstanceVersionFunction vkEnumerateInstanceVersion_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkEnumerateInstanceVersion(uint32* pApiVersion)
			=> vkEnumerateInstanceVersion_ptr(pApiVersion);

		public typealias vkBindBufferMemory2Function = function VkResult(VkDevice device, uint32 bindInfoCount, VkBindBufferMemoryInfo* pBindInfos);
		private static vkBindBufferMemory2Function vkBindBufferMemory2_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkBindBufferMemory2(VkDevice device, uint32 bindInfoCount, VkBindBufferMemoryInfo* pBindInfos)
			=> vkBindBufferMemory2_ptr(device, bindInfoCount, pBindInfos);

		public typealias vkBindImageMemory2Function = function VkResult(VkDevice device, uint32 bindInfoCount, VkBindImageMemoryInfo* pBindInfos);
		private static vkBindImageMemory2Function vkBindImageMemory2_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkBindImageMemory2(VkDevice device, uint32 bindInfoCount, VkBindImageMemoryInfo* pBindInfos)
			=> vkBindImageMemory2_ptr(device, bindInfoCount, pBindInfos);

		public typealias vkGetDeviceGroupPeerMemoryFeaturesFunction = function void(VkDevice device, uint32 heapIndex, uint32 localDeviceIndex, uint32 remoteDeviceIndex, VkPeerMemoryFeatureFlags* pPeerMemoryFeatures);
		private static vkGetDeviceGroupPeerMemoryFeaturesFunction vkGetDeviceGroupPeerMemoryFeatures_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkGetDeviceGroupPeerMemoryFeatures(VkDevice device, uint32 heapIndex, uint32 localDeviceIndex, uint32 remoteDeviceIndex, VkPeerMemoryFeatureFlags* pPeerMemoryFeatures)
			=> vkGetDeviceGroupPeerMemoryFeatures_ptr(device, heapIndex, localDeviceIndex, remoteDeviceIndex, pPeerMemoryFeatures);

		public typealias vkCmdSetDeviceMaskFunction = function void(VkCommandBuffer commandBuffer, uint32 deviceMask);
		private static vkCmdSetDeviceMaskFunction vkCmdSetDeviceMask_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdSetDeviceMask(VkCommandBuffer commandBuffer, uint32 deviceMask)
			=> vkCmdSetDeviceMask_ptr(commandBuffer, deviceMask);

		public typealias vkCmdDispatchBaseFunction = function void(VkCommandBuffer commandBuffer, uint32 baseGroupX, uint32 baseGroupY, uint32 baseGroupZ, uint32 groupCountX, uint32 groupCountY, uint32 groupCountZ);
		private static vkCmdDispatchBaseFunction vkCmdDispatchBase_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdDispatchBase(VkCommandBuffer commandBuffer, uint32 baseGroupX, uint32 baseGroupY, uint32 baseGroupZ, uint32 groupCountX, uint32 groupCountY, uint32 groupCountZ)
			=> vkCmdDispatchBase_ptr(commandBuffer, baseGroupX, baseGroupY, baseGroupZ, groupCountX, groupCountY, groupCountZ);

		public typealias vkEnumeratePhysicalDeviceGroupsFunction = function VkResult(VkInstance instance, uint32* pPhysicalDeviceGroupCount, VkPhysicalDeviceGroupProperties* pPhysicalDeviceGroupProperties);
		private static vkEnumeratePhysicalDeviceGroupsFunction vkEnumeratePhysicalDeviceGroups_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkEnumeratePhysicalDeviceGroups(VkInstance instance, uint32* pPhysicalDeviceGroupCount, VkPhysicalDeviceGroupProperties* pPhysicalDeviceGroupProperties)
			=> vkEnumeratePhysicalDeviceGroups_ptr(instance, pPhysicalDeviceGroupCount, pPhysicalDeviceGroupProperties);

		public typealias vkGetImageMemoryRequirements2Function = function void(VkDevice device, VkImageMemoryRequirementsInfo2* pInfo, VkMemoryRequirements2* pMemoryRequirements);
		private static vkGetImageMemoryRequirements2Function vkGetImageMemoryRequirements2_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkGetImageMemoryRequirements2(VkDevice device, VkImageMemoryRequirementsInfo2* pInfo, VkMemoryRequirements2* pMemoryRequirements)
			=> vkGetImageMemoryRequirements2_ptr(device, pInfo, pMemoryRequirements);

		public typealias vkGetBufferMemoryRequirements2Function = function void(VkDevice device, VkBufferMemoryRequirementsInfo2* pInfo, VkMemoryRequirements2* pMemoryRequirements);
		private static vkGetBufferMemoryRequirements2Function vkGetBufferMemoryRequirements2_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkGetBufferMemoryRequirements2(VkDevice device, VkBufferMemoryRequirementsInfo2* pInfo, VkMemoryRequirements2* pMemoryRequirements)
			=> vkGetBufferMemoryRequirements2_ptr(device, pInfo, pMemoryRequirements);

		public typealias vkGetImageSparseMemoryRequirements2Function = function void(VkDevice device, VkImageSparseMemoryRequirementsInfo2* pInfo, uint32* pSparseMemoryRequirementCount, VkSparseImageMemoryRequirements2* pSparseMemoryRequirements);
		private static vkGetImageSparseMemoryRequirements2Function vkGetImageSparseMemoryRequirements2_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkGetImageSparseMemoryRequirements2(VkDevice device, VkImageSparseMemoryRequirementsInfo2* pInfo, uint32* pSparseMemoryRequirementCount, VkSparseImageMemoryRequirements2* pSparseMemoryRequirements)
			=> vkGetImageSparseMemoryRequirements2_ptr(device, pInfo, pSparseMemoryRequirementCount, pSparseMemoryRequirements);

		public typealias vkGetPhysicalDeviceFeatures2Function = function void(VkPhysicalDevice physicalDevice, VkPhysicalDeviceFeatures2* pFeatures);
		private static vkGetPhysicalDeviceFeatures2Function vkGetPhysicalDeviceFeatures2_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkGetPhysicalDeviceFeatures2(VkPhysicalDevice physicalDevice, VkPhysicalDeviceFeatures2* pFeatures)
			=> vkGetPhysicalDeviceFeatures2_ptr(physicalDevice, pFeatures);

		public typealias vkGetPhysicalDeviceProperties2Function = function void(VkPhysicalDevice physicalDevice, VkPhysicalDeviceProperties2* pProperties);
		private static vkGetPhysicalDeviceProperties2Function vkGetPhysicalDeviceProperties2_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkGetPhysicalDeviceProperties2(VkPhysicalDevice physicalDevice, VkPhysicalDeviceProperties2* pProperties)
			=> vkGetPhysicalDeviceProperties2_ptr(physicalDevice, pProperties);

		public typealias vkGetPhysicalDeviceFormatProperties2Function = function void(VkPhysicalDevice physicalDevice, VkFormat format, VkFormatProperties2* pFormatProperties);
		private static vkGetPhysicalDeviceFormatProperties2Function vkGetPhysicalDeviceFormatProperties2_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkGetPhysicalDeviceFormatProperties2(VkPhysicalDevice physicalDevice, VkFormat format, VkFormatProperties2* pFormatProperties)
			=> vkGetPhysicalDeviceFormatProperties2_ptr(physicalDevice, format, pFormatProperties);

		public typealias vkGetPhysicalDeviceImageFormatProperties2Function = function VkResult(VkPhysicalDevice physicalDevice, VkPhysicalDeviceImageFormatInfo2* pImageFormatInfo, VkImageFormatProperties2* pImageFormatProperties);
		private static vkGetPhysicalDeviceImageFormatProperties2Function vkGetPhysicalDeviceImageFormatProperties2_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetPhysicalDeviceImageFormatProperties2(VkPhysicalDevice physicalDevice, VkPhysicalDeviceImageFormatInfo2* pImageFormatInfo, VkImageFormatProperties2* pImageFormatProperties)
			=> vkGetPhysicalDeviceImageFormatProperties2_ptr(physicalDevice, pImageFormatInfo, pImageFormatProperties);

		public typealias vkGetPhysicalDeviceQueueFamilyProperties2Function = function void(VkPhysicalDevice physicalDevice, uint32* pQueueFamilyPropertyCount, VkQueueFamilyProperties2* pQueueFamilyProperties);
		private static vkGetPhysicalDeviceQueueFamilyProperties2Function vkGetPhysicalDeviceQueueFamilyProperties2_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkGetPhysicalDeviceQueueFamilyProperties2(VkPhysicalDevice physicalDevice, uint32* pQueueFamilyPropertyCount, VkQueueFamilyProperties2* pQueueFamilyProperties)
			=> vkGetPhysicalDeviceQueueFamilyProperties2_ptr(physicalDevice, pQueueFamilyPropertyCount, pQueueFamilyProperties);

		public typealias vkGetPhysicalDeviceMemoryProperties2Function = function void(VkPhysicalDevice physicalDevice, VkPhysicalDeviceMemoryProperties2* pMemoryProperties);
		private static vkGetPhysicalDeviceMemoryProperties2Function vkGetPhysicalDeviceMemoryProperties2_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkGetPhysicalDeviceMemoryProperties2(VkPhysicalDevice physicalDevice, VkPhysicalDeviceMemoryProperties2* pMemoryProperties)
			=> vkGetPhysicalDeviceMemoryProperties2_ptr(physicalDevice, pMemoryProperties);

		public typealias vkGetPhysicalDeviceSparseImageFormatProperties2Function = function void(VkPhysicalDevice physicalDevice, VkPhysicalDeviceSparseImageFormatInfo2* pFormatInfo, uint32* pPropertyCount, VkSparseImageFormatProperties2* pProperties);
		private static vkGetPhysicalDeviceSparseImageFormatProperties2Function vkGetPhysicalDeviceSparseImageFormatProperties2_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkGetPhysicalDeviceSparseImageFormatProperties2(VkPhysicalDevice physicalDevice, VkPhysicalDeviceSparseImageFormatInfo2* pFormatInfo, uint32* pPropertyCount, VkSparseImageFormatProperties2* pProperties)
			=> vkGetPhysicalDeviceSparseImageFormatProperties2_ptr(physicalDevice, pFormatInfo, pPropertyCount, pProperties);

		public typealias vkTrimCommandPoolFunction = function void(VkDevice device, VkCommandPool commandPool, uint32 flags);
		private static vkTrimCommandPoolFunction vkTrimCommandPool_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkTrimCommandPool(VkDevice device, VkCommandPool commandPool, uint32 flags)
			=> vkTrimCommandPool_ptr(device, commandPool, flags);

		public typealias vkGetDeviceQueue2Function = function void(VkDevice device, VkDeviceQueueInfo2* pQueueInfo, VkQueue* pQueue);
		private static vkGetDeviceQueue2Function vkGetDeviceQueue2_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkGetDeviceQueue2(VkDevice device, VkDeviceQueueInfo2* pQueueInfo, VkQueue* pQueue)
			=> vkGetDeviceQueue2_ptr(device, pQueueInfo, pQueue);

		public typealias vkCreateSamplerYcbcrConversionFunction = function VkResult(VkDevice device, VkSamplerYcbcrConversionCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSamplerYcbcrConversion* pYcbcrConversion);
		private static vkCreateSamplerYcbcrConversionFunction vkCreateSamplerYcbcrConversion_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCreateSamplerYcbcrConversion(VkDevice device, VkSamplerYcbcrConversionCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSamplerYcbcrConversion* pYcbcrConversion)
			=> vkCreateSamplerYcbcrConversion_ptr(device, pCreateInfo, pAllocator, pYcbcrConversion);

		public typealias vkDestroySamplerYcbcrConversionFunction = function void(VkDevice device, VkSamplerYcbcrConversion ycbcrConversion, VkAllocationCallbacks* pAllocator);
		private static vkDestroySamplerYcbcrConversionFunction vkDestroySamplerYcbcrConversion_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkDestroySamplerYcbcrConversion(VkDevice device, VkSamplerYcbcrConversion ycbcrConversion, VkAllocationCallbacks* pAllocator)
			=> vkDestroySamplerYcbcrConversion_ptr(device, ycbcrConversion, pAllocator);

		public typealias vkCreateDescriptorUpdateTemplateFunction = function VkResult(VkDevice device, VkDescriptorUpdateTemplateCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkDescriptorUpdateTemplate* pDescriptorUpdateTemplate);
		private static vkCreateDescriptorUpdateTemplateFunction vkCreateDescriptorUpdateTemplate_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCreateDescriptorUpdateTemplate(VkDevice device, VkDescriptorUpdateTemplateCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkDescriptorUpdateTemplate* pDescriptorUpdateTemplate)
			=> vkCreateDescriptorUpdateTemplate_ptr(device, pCreateInfo, pAllocator, pDescriptorUpdateTemplate);

		public typealias vkDestroyDescriptorUpdateTemplateFunction = function void(VkDevice device, VkDescriptorUpdateTemplate descriptorUpdateTemplate, VkAllocationCallbacks* pAllocator);
		private static vkDestroyDescriptorUpdateTemplateFunction vkDestroyDescriptorUpdateTemplate_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkDestroyDescriptorUpdateTemplate(VkDevice device, VkDescriptorUpdateTemplate descriptorUpdateTemplate, VkAllocationCallbacks* pAllocator)
			=> vkDestroyDescriptorUpdateTemplate_ptr(device, descriptorUpdateTemplate, pAllocator);

		public typealias vkUpdateDescriptorSetWithTemplateFunction = function void(VkDevice device, VkDescriptorSet descriptorSet, VkDescriptorUpdateTemplate descriptorUpdateTemplate, void* pData);
		private static vkUpdateDescriptorSetWithTemplateFunction vkUpdateDescriptorSetWithTemplate_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkUpdateDescriptorSetWithTemplate(VkDevice device, VkDescriptorSet descriptorSet, VkDescriptorUpdateTemplate descriptorUpdateTemplate, void* pData)
			=> vkUpdateDescriptorSetWithTemplate_ptr(device, descriptorSet, descriptorUpdateTemplate, pData);

		public typealias vkGetPhysicalDeviceExternalBufferPropertiesFunction = function void(VkPhysicalDevice physicalDevice, VkPhysicalDeviceExternalBufferInfo* pExternalBufferInfo, VkExternalBufferProperties* pExternalBufferProperties);
		private static vkGetPhysicalDeviceExternalBufferPropertiesFunction vkGetPhysicalDeviceExternalBufferProperties_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkGetPhysicalDeviceExternalBufferProperties(VkPhysicalDevice physicalDevice, VkPhysicalDeviceExternalBufferInfo* pExternalBufferInfo, VkExternalBufferProperties* pExternalBufferProperties)
			=> vkGetPhysicalDeviceExternalBufferProperties_ptr(physicalDevice, pExternalBufferInfo, pExternalBufferProperties);

		public typealias vkGetPhysicalDeviceExternalFencePropertiesFunction = function void(VkPhysicalDevice physicalDevice, VkPhysicalDeviceExternalFenceInfo* pExternalFenceInfo, VkExternalFenceProperties* pExternalFenceProperties);
		private static vkGetPhysicalDeviceExternalFencePropertiesFunction vkGetPhysicalDeviceExternalFenceProperties_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkGetPhysicalDeviceExternalFenceProperties(VkPhysicalDevice physicalDevice, VkPhysicalDeviceExternalFenceInfo* pExternalFenceInfo, VkExternalFenceProperties* pExternalFenceProperties)
			=> vkGetPhysicalDeviceExternalFenceProperties_ptr(physicalDevice, pExternalFenceInfo, pExternalFenceProperties);

		public typealias vkGetPhysicalDeviceExternalSemaphorePropertiesFunction = function void(VkPhysicalDevice physicalDevice, VkPhysicalDeviceExternalSemaphoreInfo* pExternalSemaphoreInfo, VkExternalSemaphoreProperties* pExternalSemaphoreProperties);
		private static vkGetPhysicalDeviceExternalSemaphorePropertiesFunction vkGetPhysicalDeviceExternalSemaphoreProperties_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkGetPhysicalDeviceExternalSemaphoreProperties(VkPhysicalDevice physicalDevice, VkPhysicalDeviceExternalSemaphoreInfo* pExternalSemaphoreInfo, VkExternalSemaphoreProperties* pExternalSemaphoreProperties)
			=> vkGetPhysicalDeviceExternalSemaphoreProperties_ptr(physicalDevice, pExternalSemaphoreInfo, pExternalSemaphoreProperties);

		public typealias vkGetDescriptorSetLayoutSupportFunction = function void(VkDevice device, VkDescriptorSetLayoutCreateInfo* pCreateInfo, VkDescriptorSetLayoutSupport* pSupport);
		private static vkGetDescriptorSetLayoutSupportFunction vkGetDescriptorSetLayoutSupport_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkGetDescriptorSetLayoutSupport(VkDevice device, VkDescriptorSetLayoutCreateInfo* pCreateInfo, VkDescriptorSetLayoutSupport* pSupport)
			=> vkGetDescriptorSetLayoutSupport_ptr(device, pCreateInfo, pSupport);

		public typealias vkCmdDrawIndirectCountFunction = function void(VkCommandBuffer commandBuffer, VkBuffer buffer, uint64 offset, VkBuffer countBuffer, uint64 countBufferOffset, uint32 maxDrawCount, uint32 stride);
		private static vkCmdDrawIndirectCountFunction vkCmdDrawIndirectCount_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdDrawIndirectCount(VkCommandBuffer commandBuffer, VkBuffer buffer, uint64 offset, VkBuffer countBuffer, uint64 countBufferOffset, uint32 maxDrawCount, uint32 stride)
			=> vkCmdDrawIndirectCount_ptr(commandBuffer, buffer, offset, countBuffer, countBufferOffset, maxDrawCount, stride);

		public typealias vkCmdDrawIndexedIndirectCountFunction = function void(VkCommandBuffer commandBuffer, VkBuffer buffer, uint64 offset, VkBuffer countBuffer, uint64 countBufferOffset, uint32 maxDrawCount, uint32 stride);
		private static vkCmdDrawIndexedIndirectCountFunction vkCmdDrawIndexedIndirectCount_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdDrawIndexedIndirectCount(VkCommandBuffer commandBuffer, VkBuffer buffer, uint64 offset, VkBuffer countBuffer, uint64 countBufferOffset, uint32 maxDrawCount, uint32 stride)
			=> vkCmdDrawIndexedIndirectCount_ptr(commandBuffer, buffer, offset, countBuffer, countBufferOffset, maxDrawCount, stride);

		public typealias vkCreateRenderPass2Function = function VkResult(VkDevice device, VkRenderPassCreateInfo2* pCreateInfo, VkAllocationCallbacks* pAllocator, VkRenderPass* pRenderPass);
		private static vkCreateRenderPass2Function vkCreateRenderPass2_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCreateRenderPass2(VkDevice device, VkRenderPassCreateInfo2* pCreateInfo, VkAllocationCallbacks* pAllocator, VkRenderPass* pRenderPass)
			=> vkCreateRenderPass2_ptr(device, pCreateInfo, pAllocator, pRenderPass);

		public typealias vkCmdBeginRenderPass2Function = function void(VkCommandBuffer commandBuffer, VkRenderPassBeginInfo* pRenderPassBegin, VkSubpassBeginInfo* pSubpassBeginInfo);
		private static vkCmdBeginRenderPass2Function vkCmdBeginRenderPass2_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdBeginRenderPass2(VkCommandBuffer commandBuffer, VkRenderPassBeginInfo* pRenderPassBegin, VkSubpassBeginInfo* pSubpassBeginInfo)
			=> vkCmdBeginRenderPass2_ptr(commandBuffer, pRenderPassBegin, pSubpassBeginInfo);

		public typealias vkCmdNextSubpass2Function = function void(VkCommandBuffer commandBuffer, VkSubpassBeginInfo* pSubpassBeginInfo, VkSubpassEndInfo* pSubpassEndInfo);
		private static vkCmdNextSubpass2Function vkCmdNextSubpass2_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdNextSubpass2(VkCommandBuffer commandBuffer, VkSubpassBeginInfo* pSubpassBeginInfo, VkSubpassEndInfo* pSubpassEndInfo)
			=> vkCmdNextSubpass2_ptr(commandBuffer, pSubpassBeginInfo, pSubpassEndInfo);

		public typealias vkCmdEndRenderPass2Function = function void(VkCommandBuffer commandBuffer, VkSubpassEndInfo* pSubpassEndInfo);
		private static vkCmdEndRenderPass2Function vkCmdEndRenderPass2_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdEndRenderPass2(VkCommandBuffer commandBuffer, VkSubpassEndInfo* pSubpassEndInfo)
			=> vkCmdEndRenderPass2_ptr(commandBuffer, pSubpassEndInfo);

		public typealias vkResetQueryPoolFunction = function void(VkDevice device, VkQueryPool queryPool, uint32 firstQuery, uint32 queryCount);
		private static vkResetQueryPoolFunction vkResetQueryPool_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkResetQueryPool(VkDevice device, VkQueryPool queryPool, uint32 firstQuery, uint32 queryCount)
			=> vkResetQueryPool_ptr(device, queryPool, firstQuery, queryCount);

		public typealias vkGetSemaphoreCounterValueFunction = function VkResult(VkDevice device, VkSemaphore semaphore, uint64* pValue);
		private static vkGetSemaphoreCounterValueFunction vkGetSemaphoreCounterValue_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetSemaphoreCounterValue(VkDevice device, VkSemaphore semaphore, uint64* pValue)
			=> vkGetSemaphoreCounterValue_ptr(device, semaphore, pValue);

		public typealias vkWaitSemaphoresFunction = function VkResult(VkDevice device, VkSemaphoreWaitInfo* pWaitInfo, uint64 timeout);
		private static vkWaitSemaphoresFunction vkWaitSemaphores_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkWaitSemaphores(VkDevice device, VkSemaphoreWaitInfo* pWaitInfo, uint64 timeout)
			=> vkWaitSemaphores_ptr(device, pWaitInfo, timeout);

		public typealias vkSignalSemaphoreFunction = function VkResult(VkDevice device, VkSemaphoreSignalInfo* pSignalInfo);
		private static vkSignalSemaphoreFunction vkSignalSemaphore_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkSignalSemaphore(VkDevice device, VkSemaphoreSignalInfo* pSignalInfo)
			=> vkSignalSemaphore_ptr(device, pSignalInfo);

		public typealias vkGetBufferDeviceAddressFunction = function uint64(VkDevice device, VkBufferDeviceAddressInfo* pInfo);
		private static vkGetBufferDeviceAddressFunction vkGetBufferDeviceAddress_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static uint64 vkGetBufferDeviceAddress(VkDevice device, VkBufferDeviceAddressInfo* pInfo)
			=> vkGetBufferDeviceAddress_ptr(device, pInfo);

		public typealias vkGetBufferOpaqueCaptureAddressFunction = function uint64(VkDevice device, VkBufferDeviceAddressInfo* pInfo);
		private static vkGetBufferOpaqueCaptureAddressFunction vkGetBufferOpaqueCaptureAddress_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static uint64 vkGetBufferOpaqueCaptureAddress(VkDevice device, VkBufferDeviceAddressInfo* pInfo)
			=> vkGetBufferOpaqueCaptureAddress_ptr(device, pInfo);

		public typealias vkGetDeviceMemoryOpaqueCaptureAddressFunction = function uint64(VkDevice device, VkDeviceMemoryOpaqueCaptureAddressInfo* pInfo);
		private static vkGetDeviceMemoryOpaqueCaptureAddressFunction vkGetDeviceMemoryOpaqueCaptureAddress_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static uint64 vkGetDeviceMemoryOpaqueCaptureAddress(VkDevice device, VkDeviceMemoryOpaqueCaptureAddressInfo* pInfo)
			=> vkGetDeviceMemoryOpaqueCaptureAddress_ptr(device, pInfo);

		public typealias vkGetPhysicalDeviceToolPropertiesFunction = function VkResult(VkPhysicalDevice physicalDevice, uint32* pToolCount, VkPhysicalDeviceToolProperties* pToolProperties);
		private static vkGetPhysicalDeviceToolPropertiesFunction vkGetPhysicalDeviceToolProperties_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetPhysicalDeviceToolProperties(VkPhysicalDevice physicalDevice, uint32* pToolCount, VkPhysicalDeviceToolProperties* pToolProperties)
			=> vkGetPhysicalDeviceToolProperties_ptr(physicalDevice, pToolCount, pToolProperties);

		public typealias vkCreatePrivateDataSlotFunction = function VkResult(VkDevice device, VkPrivateDataSlotCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkPrivateDataSlot* pPrivateDataSlot);
		private static vkCreatePrivateDataSlotFunction vkCreatePrivateDataSlot_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCreatePrivateDataSlot(VkDevice device, VkPrivateDataSlotCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkPrivateDataSlot* pPrivateDataSlot)
			=> vkCreatePrivateDataSlot_ptr(device, pCreateInfo, pAllocator, pPrivateDataSlot);

		public typealias vkDestroyPrivateDataSlotFunction = function void(VkDevice device, VkPrivateDataSlot privateDataSlot, VkAllocationCallbacks* pAllocator);
		private static vkDestroyPrivateDataSlotFunction vkDestroyPrivateDataSlot_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkDestroyPrivateDataSlot(VkDevice device, VkPrivateDataSlot privateDataSlot, VkAllocationCallbacks* pAllocator)
			=> vkDestroyPrivateDataSlot_ptr(device, privateDataSlot, pAllocator);

		public typealias vkSetPrivateDataFunction = function VkResult(VkDevice device, VkObjectType objectType, uint64 objectHandle, VkPrivateDataSlot privateDataSlot, uint64 data);
		private static vkSetPrivateDataFunction vkSetPrivateData_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkSetPrivateData(VkDevice device, VkObjectType objectType, uint64 objectHandle, VkPrivateDataSlot privateDataSlot, uint64 data)
			=> vkSetPrivateData_ptr(device, objectType, objectHandle, privateDataSlot, data);

		public typealias vkGetPrivateDataFunction = function void(VkDevice device, VkObjectType objectType, uint64 objectHandle, VkPrivateDataSlot privateDataSlot, uint64* pData);
		private static vkGetPrivateDataFunction vkGetPrivateData_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkGetPrivateData(VkDevice device, VkObjectType objectType, uint64 objectHandle, VkPrivateDataSlot privateDataSlot, uint64* pData)
			=> vkGetPrivateData_ptr(device, objectType, objectHandle, privateDataSlot, pData);

		public typealias vkCmdSetEvent2Function = function void(VkCommandBuffer commandBuffer, VkEvent event, VkDependencyInfo* pDependencyInfo);
		private static vkCmdSetEvent2Function vkCmdSetEvent2_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdSetEvent2(VkCommandBuffer commandBuffer, VkEvent event, VkDependencyInfo* pDependencyInfo)
			=> vkCmdSetEvent2_ptr(commandBuffer, event, pDependencyInfo);

		public typealias vkCmdResetEvent2Function = function void(VkCommandBuffer commandBuffer, VkEvent event, uint64 stageMask);
		private static vkCmdResetEvent2Function vkCmdResetEvent2_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdResetEvent2(VkCommandBuffer commandBuffer, VkEvent event, uint64 stageMask)
			=> vkCmdResetEvent2_ptr(commandBuffer, event, stageMask);

		public typealias vkCmdWaitEvents2Function = function void(VkCommandBuffer commandBuffer, uint32 eventCount, VkEvent* pEvents, VkDependencyInfo* pDependencyInfos);
		private static vkCmdWaitEvents2Function vkCmdWaitEvents2_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdWaitEvents2(VkCommandBuffer commandBuffer, uint32 eventCount, VkEvent* pEvents, VkDependencyInfo* pDependencyInfos)
			=> vkCmdWaitEvents2_ptr(commandBuffer, eventCount, pEvents, pDependencyInfos);

		public typealias vkCmdPipelineBarrier2Function = function void(VkCommandBuffer commandBuffer, VkDependencyInfo* pDependencyInfo);
		private static vkCmdPipelineBarrier2Function vkCmdPipelineBarrier2_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdPipelineBarrier2(VkCommandBuffer commandBuffer, VkDependencyInfo* pDependencyInfo)
			=> vkCmdPipelineBarrier2_ptr(commandBuffer, pDependencyInfo);

		public typealias vkCmdWriteTimestamp2Function = function void(VkCommandBuffer commandBuffer, uint64 stage, VkQueryPool queryPool, uint32 query);
		private static vkCmdWriteTimestamp2Function vkCmdWriteTimestamp2_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdWriteTimestamp2(VkCommandBuffer commandBuffer, uint64 stage, VkQueryPool queryPool, uint32 query)
			=> vkCmdWriteTimestamp2_ptr(commandBuffer, stage, queryPool, query);

		public typealias vkQueueSubmit2Function = function VkResult(VkQueue queue, uint32 submitCount, VkSubmitInfo2* pSubmits, VkFence fence);
		private static vkQueueSubmit2Function vkQueueSubmit2_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkQueueSubmit2(VkQueue queue, uint32 submitCount, VkSubmitInfo2* pSubmits, VkFence fence)
			=> vkQueueSubmit2_ptr(queue, submitCount, pSubmits, fence);

		public typealias vkCmdCopyBuffer2Function = function void(VkCommandBuffer commandBuffer, VkCopyBufferInfo2* pCopyBufferInfo);
		private static vkCmdCopyBuffer2Function vkCmdCopyBuffer2_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdCopyBuffer2(VkCommandBuffer commandBuffer, VkCopyBufferInfo2* pCopyBufferInfo)
			=> vkCmdCopyBuffer2_ptr(commandBuffer, pCopyBufferInfo);

		public typealias vkCmdCopyImage2Function = function void(VkCommandBuffer commandBuffer, VkCopyImageInfo2* pCopyImageInfo);
		private static vkCmdCopyImage2Function vkCmdCopyImage2_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdCopyImage2(VkCommandBuffer commandBuffer, VkCopyImageInfo2* pCopyImageInfo)
			=> vkCmdCopyImage2_ptr(commandBuffer, pCopyImageInfo);

		public typealias vkCmdCopyBufferToImage2Function = function void(VkCommandBuffer commandBuffer, VkCopyBufferToImageInfo2* pCopyBufferToImageInfo);
		private static vkCmdCopyBufferToImage2Function vkCmdCopyBufferToImage2_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdCopyBufferToImage2(VkCommandBuffer commandBuffer, VkCopyBufferToImageInfo2* pCopyBufferToImageInfo)
			=> vkCmdCopyBufferToImage2_ptr(commandBuffer, pCopyBufferToImageInfo);

		public typealias vkCmdCopyImageToBuffer2Function = function void(VkCommandBuffer commandBuffer, VkCopyImageToBufferInfo2* pCopyImageToBufferInfo);
		private static vkCmdCopyImageToBuffer2Function vkCmdCopyImageToBuffer2_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdCopyImageToBuffer2(VkCommandBuffer commandBuffer, VkCopyImageToBufferInfo2* pCopyImageToBufferInfo)
			=> vkCmdCopyImageToBuffer2_ptr(commandBuffer, pCopyImageToBufferInfo);

		public typealias vkCmdBlitImage2Function = function void(VkCommandBuffer commandBuffer, VkBlitImageInfo2* pBlitImageInfo);
		private static vkCmdBlitImage2Function vkCmdBlitImage2_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdBlitImage2(VkCommandBuffer commandBuffer, VkBlitImageInfo2* pBlitImageInfo)
			=> vkCmdBlitImage2_ptr(commandBuffer, pBlitImageInfo);

		public typealias vkCmdResolveImage2Function = function void(VkCommandBuffer commandBuffer, VkResolveImageInfo2* pResolveImageInfo);
		private static vkCmdResolveImage2Function vkCmdResolveImage2_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdResolveImage2(VkCommandBuffer commandBuffer, VkResolveImageInfo2* pResolveImageInfo)
			=> vkCmdResolveImage2_ptr(commandBuffer, pResolveImageInfo);

		public typealias vkCmdBeginRenderingFunction = function void(VkCommandBuffer commandBuffer, VkRenderingInfo* pRenderingInfo);
		private static vkCmdBeginRenderingFunction vkCmdBeginRendering_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdBeginRendering(VkCommandBuffer commandBuffer, VkRenderingInfo* pRenderingInfo)
			=> vkCmdBeginRendering_ptr(commandBuffer, pRenderingInfo);

		public typealias vkCmdEndRenderingFunction = function void(VkCommandBuffer commandBuffer);
		private static vkCmdEndRenderingFunction vkCmdEndRendering_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdEndRendering(VkCommandBuffer commandBuffer)
			=> vkCmdEndRendering_ptr(commandBuffer);

		public typealias vkCmdSetCullModeFunction = function void(VkCommandBuffer commandBuffer, VkCullModeFlags cullMode);
		private static vkCmdSetCullModeFunction vkCmdSetCullMode_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdSetCullMode(VkCommandBuffer commandBuffer, VkCullModeFlags cullMode)
			=> vkCmdSetCullMode_ptr(commandBuffer, cullMode);

		public typealias vkCmdSetFrontFaceFunction = function void(VkCommandBuffer commandBuffer, VkFrontFace frontFace);
		private static vkCmdSetFrontFaceFunction vkCmdSetFrontFace_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdSetFrontFace(VkCommandBuffer commandBuffer, VkFrontFace frontFace)
			=> vkCmdSetFrontFace_ptr(commandBuffer, frontFace);

		public typealias vkCmdSetPrimitiveTopologyFunction = function void(VkCommandBuffer commandBuffer, VkPrimitiveTopology primitiveTopology);
		private static vkCmdSetPrimitiveTopologyFunction vkCmdSetPrimitiveTopology_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdSetPrimitiveTopology(VkCommandBuffer commandBuffer, VkPrimitiveTopology primitiveTopology)
			=> vkCmdSetPrimitiveTopology_ptr(commandBuffer, primitiveTopology);

		public typealias vkCmdSetViewportWithCountFunction = function void(VkCommandBuffer commandBuffer, uint32 viewportCount, VkViewport* pViewports);
		private static vkCmdSetViewportWithCountFunction vkCmdSetViewportWithCount_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdSetViewportWithCount(VkCommandBuffer commandBuffer, uint32 viewportCount, VkViewport* pViewports)
			=> vkCmdSetViewportWithCount_ptr(commandBuffer, viewportCount, pViewports);

		public typealias vkCmdSetScissorWithCountFunction = function void(VkCommandBuffer commandBuffer, uint32 scissorCount, VkRect2D* pScissors);
		private static vkCmdSetScissorWithCountFunction vkCmdSetScissorWithCount_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdSetScissorWithCount(VkCommandBuffer commandBuffer, uint32 scissorCount, VkRect2D* pScissors)
			=> vkCmdSetScissorWithCount_ptr(commandBuffer, scissorCount, pScissors);

		public typealias vkCmdBindVertexBuffers2Function = function void(VkCommandBuffer commandBuffer, uint32 firstBinding, uint32 bindingCount, VkBuffer* pBuffers, uint64* pOffsets, uint64* pSizes, uint64* pStrides);
		private static vkCmdBindVertexBuffers2Function vkCmdBindVertexBuffers2_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdBindVertexBuffers2(VkCommandBuffer commandBuffer, uint32 firstBinding, uint32 bindingCount, VkBuffer* pBuffers, uint64* pOffsets, uint64* pSizes, uint64* pStrides)
			=> vkCmdBindVertexBuffers2_ptr(commandBuffer, firstBinding, bindingCount, pBuffers, pOffsets, pSizes, pStrides);

		public typealias vkCmdSetDepthTestEnableFunction = function void(VkCommandBuffer commandBuffer, VkBool32 depthTestEnable);
		private static vkCmdSetDepthTestEnableFunction vkCmdSetDepthTestEnable_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdSetDepthTestEnable(VkCommandBuffer commandBuffer, VkBool32 depthTestEnable)
			=> vkCmdSetDepthTestEnable_ptr(commandBuffer, depthTestEnable);

		public typealias vkCmdSetDepthWriteEnableFunction = function void(VkCommandBuffer commandBuffer, VkBool32 depthWriteEnable);
		private static vkCmdSetDepthWriteEnableFunction vkCmdSetDepthWriteEnable_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdSetDepthWriteEnable(VkCommandBuffer commandBuffer, VkBool32 depthWriteEnable)
			=> vkCmdSetDepthWriteEnable_ptr(commandBuffer, depthWriteEnable);

		public typealias vkCmdSetDepthCompareOpFunction = function void(VkCommandBuffer commandBuffer, VkCompareOp depthCompareOp);
		private static vkCmdSetDepthCompareOpFunction vkCmdSetDepthCompareOp_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdSetDepthCompareOp(VkCommandBuffer commandBuffer, VkCompareOp depthCompareOp)
			=> vkCmdSetDepthCompareOp_ptr(commandBuffer, depthCompareOp);

		public typealias vkCmdSetDepthBoundsTestEnableFunction = function void(VkCommandBuffer commandBuffer, VkBool32 depthBoundsTestEnable);
		private static vkCmdSetDepthBoundsTestEnableFunction vkCmdSetDepthBoundsTestEnable_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdSetDepthBoundsTestEnable(VkCommandBuffer commandBuffer, VkBool32 depthBoundsTestEnable)
			=> vkCmdSetDepthBoundsTestEnable_ptr(commandBuffer, depthBoundsTestEnable);

		public typealias vkCmdSetStencilTestEnableFunction = function void(VkCommandBuffer commandBuffer, VkBool32 stencilTestEnable);
		private static vkCmdSetStencilTestEnableFunction vkCmdSetStencilTestEnable_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdSetStencilTestEnable(VkCommandBuffer commandBuffer, VkBool32 stencilTestEnable)
			=> vkCmdSetStencilTestEnable_ptr(commandBuffer, stencilTestEnable);

		public typealias vkCmdSetStencilOpFunction = function void(VkCommandBuffer commandBuffer, VkStencilFaceFlags faceMask, VkStencilOp failOp, VkStencilOp passOp, VkStencilOp depthFailOp, VkCompareOp compareOp);
		private static vkCmdSetStencilOpFunction vkCmdSetStencilOp_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdSetStencilOp(VkCommandBuffer commandBuffer, VkStencilFaceFlags faceMask, VkStencilOp failOp, VkStencilOp passOp, VkStencilOp depthFailOp, VkCompareOp compareOp)
			=> vkCmdSetStencilOp_ptr(commandBuffer, faceMask, failOp, passOp, depthFailOp, compareOp);

		public typealias vkCmdSetRasterizerDiscardEnableFunction = function void(VkCommandBuffer commandBuffer, VkBool32 rasterizerDiscardEnable);
		private static vkCmdSetRasterizerDiscardEnableFunction vkCmdSetRasterizerDiscardEnable_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdSetRasterizerDiscardEnable(VkCommandBuffer commandBuffer, VkBool32 rasterizerDiscardEnable)
			=> vkCmdSetRasterizerDiscardEnable_ptr(commandBuffer, rasterizerDiscardEnable);

		public typealias vkCmdSetDepthBiasEnableFunction = function void(VkCommandBuffer commandBuffer, VkBool32 depthBiasEnable);
		private static vkCmdSetDepthBiasEnableFunction vkCmdSetDepthBiasEnable_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdSetDepthBiasEnable(VkCommandBuffer commandBuffer, VkBool32 depthBiasEnable)
			=> vkCmdSetDepthBiasEnable_ptr(commandBuffer, depthBiasEnable);

		public typealias vkCmdSetPrimitiveRestartEnableFunction = function void(VkCommandBuffer commandBuffer, VkBool32 primitiveRestartEnable);
		private static vkCmdSetPrimitiveRestartEnableFunction vkCmdSetPrimitiveRestartEnable_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdSetPrimitiveRestartEnable(VkCommandBuffer commandBuffer, VkBool32 primitiveRestartEnable)
			=> vkCmdSetPrimitiveRestartEnable_ptr(commandBuffer, primitiveRestartEnable);

		public typealias vkGetDeviceBufferMemoryRequirementsFunction = function void(VkDevice device, VkDeviceBufferMemoryRequirements* pInfo, VkMemoryRequirements2* pMemoryRequirements);
		private static vkGetDeviceBufferMemoryRequirementsFunction vkGetDeviceBufferMemoryRequirements_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkGetDeviceBufferMemoryRequirements(VkDevice device, VkDeviceBufferMemoryRequirements* pInfo, VkMemoryRequirements2* pMemoryRequirements)
			=> vkGetDeviceBufferMemoryRequirements_ptr(device, pInfo, pMemoryRequirements);

		public typealias vkGetDeviceImageMemoryRequirementsFunction = function void(VkDevice device, VkDeviceImageMemoryRequirements* pInfo, VkMemoryRequirements2* pMemoryRequirements);
		private static vkGetDeviceImageMemoryRequirementsFunction vkGetDeviceImageMemoryRequirements_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkGetDeviceImageMemoryRequirements(VkDevice device, VkDeviceImageMemoryRequirements* pInfo, VkMemoryRequirements2* pMemoryRequirements)
			=> vkGetDeviceImageMemoryRequirements_ptr(device, pInfo, pMemoryRequirements);

		public typealias vkGetDeviceImageSparseMemoryRequirementsFunction = function void(VkDevice device, VkDeviceImageMemoryRequirements* pInfo, uint32* pSparseMemoryRequirementCount, VkSparseImageMemoryRequirements2* pSparseMemoryRequirements);
		private static vkGetDeviceImageSparseMemoryRequirementsFunction vkGetDeviceImageSparseMemoryRequirements_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkGetDeviceImageSparseMemoryRequirements(VkDevice device, VkDeviceImageMemoryRequirements* pInfo, uint32* pSparseMemoryRequirementCount, VkSparseImageMemoryRequirements2* pSparseMemoryRequirements)
			=> vkGetDeviceImageSparseMemoryRequirements_ptr(device, pInfo, pSparseMemoryRequirementCount, pSparseMemoryRequirements);

		public typealias vkDestroySurfaceKHRFunction = function void(VkInstance instance, VkSurfaceKHR surface, VkAllocationCallbacks* pAllocator);
		private static vkDestroySurfaceKHRFunction vkDestroySurfaceKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkDestroySurfaceKHR(VkInstance instance, VkSurfaceKHR surface, VkAllocationCallbacks* pAllocator)
			=> vkDestroySurfaceKHR_ptr(instance, surface, pAllocator);

		public typealias vkGetPhysicalDeviceSurfaceSupportKHRFunction = function VkResult(VkPhysicalDevice physicalDevice, uint32 queueFamilyIndex, VkSurfaceKHR surface, VkBool32* pSupported);
		private static vkGetPhysicalDeviceSurfaceSupportKHRFunction vkGetPhysicalDeviceSurfaceSupportKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetPhysicalDeviceSurfaceSupportKHR(VkPhysicalDevice physicalDevice, uint32 queueFamilyIndex, VkSurfaceKHR surface, VkBool32* pSupported)
			=> vkGetPhysicalDeviceSurfaceSupportKHR_ptr(physicalDevice, queueFamilyIndex, surface, pSupported);

		public typealias vkGetPhysicalDeviceSurfaceCapabilitiesKHRFunction = function VkResult(VkPhysicalDevice physicalDevice, VkSurfaceKHR surface, VkSurfaceCapabilitiesKHR* pSurfaceCapabilities);
		private static vkGetPhysicalDeviceSurfaceCapabilitiesKHRFunction vkGetPhysicalDeviceSurfaceCapabilitiesKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetPhysicalDeviceSurfaceCapabilitiesKHR(VkPhysicalDevice physicalDevice, VkSurfaceKHR surface, VkSurfaceCapabilitiesKHR* pSurfaceCapabilities)
			=> vkGetPhysicalDeviceSurfaceCapabilitiesKHR_ptr(physicalDevice, surface, pSurfaceCapabilities);

		public typealias vkGetPhysicalDeviceSurfaceFormatsKHRFunction = function VkResult(VkPhysicalDevice physicalDevice, VkSurfaceKHR surface, uint32* pSurfaceFormatCount, VkSurfaceFormatKHR* pSurfaceFormats);
		private static vkGetPhysicalDeviceSurfaceFormatsKHRFunction vkGetPhysicalDeviceSurfaceFormatsKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetPhysicalDeviceSurfaceFormatsKHR(VkPhysicalDevice physicalDevice, VkSurfaceKHR surface, uint32* pSurfaceFormatCount, VkSurfaceFormatKHR* pSurfaceFormats)
			=> vkGetPhysicalDeviceSurfaceFormatsKHR_ptr(physicalDevice, surface, pSurfaceFormatCount, pSurfaceFormats);

		public typealias vkGetPhysicalDeviceSurfacePresentModesKHRFunction = function VkResult(VkPhysicalDevice physicalDevice, VkSurfaceKHR surface, uint32* pPresentModeCount, VkPresentModeKHR* pPresentModes);
		private static vkGetPhysicalDeviceSurfacePresentModesKHRFunction vkGetPhysicalDeviceSurfacePresentModesKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetPhysicalDeviceSurfacePresentModesKHR(VkPhysicalDevice physicalDevice, VkSurfaceKHR surface, uint32* pPresentModeCount, VkPresentModeKHR* pPresentModes)
			=> vkGetPhysicalDeviceSurfacePresentModesKHR_ptr(physicalDevice, surface, pPresentModeCount, pPresentModes);

		public typealias vkCreateSwapchainKHRFunction = function VkResult(VkDevice device, VkSwapchainCreateInfoKHR* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSwapchainKHR* pSwapchain);
		private static vkCreateSwapchainKHRFunction vkCreateSwapchainKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCreateSwapchainKHR(VkDevice device, VkSwapchainCreateInfoKHR* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSwapchainKHR* pSwapchain)
			=> vkCreateSwapchainKHR_ptr(device, pCreateInfo, pAllocator, pSwapchain);

		public typealias vkDestroySwapchainKHRFunction = function void(VkDevice device, VkSwapchainKHR swapchain, VkAllocationCallbacks* pAllocator);
		private static vkDestroySwapchainKHRFunction vkDestroySwapchainKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkDestroySwapchainKHR(VkDevice device, VkSwapchainKHR swapchain, VkAllocationCallbacks* pAllocator)
			=> vkDestroySwapchainKHR_ptr(device, swapchain, pAllocator);

		public typealias vkGetSwapchainImagesKHRFunction = function VkResult(VkDevice device, VkSwapchainKHR swapchain, uint32* pSwapchainImageCount, VkImage* pSwapchainImages);
		private static vkGetSwapchainImagesKHRFunction vkGetSwapchainImagesKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetSwapchainImagesKHR(VkDevice device, VkSwapchainKHR swapchain, uint32* pSwapchainImageCount, VkImage* pSwapchainImages)
			=> vkGetSwapchainImagesKHR_ptr(device, swapchain, pSwapchainImageCount, pSwapchainImages);

		public typealias vkAcquireNextImageKHRFunction = function VkResult(VkDevice device, VkSwapchainKHR swapchain, uint64 timeout, VkSemaphore semaphore, VkFence fence, uint32* pImageIndex);
		private static vkAcquireNextImageKHRFunction vkAcquireNextImageKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkAcquireNextImageKHR(VkDevice device, VkSwapchainKHR swapchain, uint64 timeout, VkSemaphore semaphore, VkFence fence, uint32* pImageIndex)
			=> vkAcquireNextImageKHR_ptr(device, swapchain, timeout, semaphore, fence, pImageIndex);

		public typealias vkQueuePresentKHRFunction = function VkResult(VkQueue queue, VkPresentInfoKHR* pPresentInfo);
		private static vkQueuePresentKHRFunction vkQueuePresentKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkQueuePresentKHR(VkQueue queue, VkPresentInfoKHR* pPresentInfo)
			=> vkQueuePresentKHR_ptr(queue, pPresentInfo);

		public typealias vkGetPhysicalDeviceDisplayPropertiesKHRFunction = function VkResult(VkPhysicalDevice physicalDevice, uint32* pPropertyCount, VkDisplayPropertiesKHR* pProperties);
		private static vkGetPhysicalDeviceDisplayPropertiesKHRFunction vkGetPhysicalDeviceDisplayPropertiesKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetPhysicalDeviceDisplayPropertiesKHR(VkPhysicalDevice physicalDevice, uint32* pPropertyCount, VkDisplayPropertiesKHR* pProperties)
			=> vkGetPhysicalDeviceDisplayPropertiesKHR_ptr(physicalDevice, pPropertyCount, pProperties);

		public typealias vkGetPhysicalDeviceDisplayPlanePropertiesKHRFunction = function VkResult(VkPhysicalDevice physicalDevice, uint32* pPropertyCount, VkDisplayPlanePropertiesKHR* pProperties);
		private static vkGetPhysicalDeviceDisplayPlanePropertiesKHRFunction vkGetPhysicalDeviceDisplayPlanePropertiesKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetPhysicalDeviceDisplayPlanePropertiesKHR(VkPhysicalDevice physicalDevice, uint32* pPropertyCount, VkDisplayPlanePropertiesKHR* pProperties)
			=> vkGetPhysicalDeviceDisplayPlanePropertiesKHR_ptr(physicalDevice, pPropertyCount, pProperties);

		public typealias vkGetDisplayPlaneSupportedDisplaysKHRFunction = function VkResult(VkPhysicalDevice physicalDevice, uint32 planeIndex, uint32* pDisplayCount, VkDisplayKHR* pDisplays);
		private static vkGetDisplayPlaneSupportedDisplaysKHRFunction vkGetDisplayPlaneSupportedDisplaysKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetDisplayPlaneSupportedDisplaysKHR(VkPhysicalDevice physicalDevice, uint32 planeIndex, uint32* pDisplayCount, VkDisplayKHR* pDisplays)
			=> vkGetDisplayPlaneSupportedDisplaysKHR_ptr(physicalDevice, planeIndex, pDisplayCount, pDisplays);

		public typealias vkGetDisplayModePropertiesKHRFunction = function VkResult(VkPhysicalDevice physicalDevice, VkDisplayKHR display, uint32* pPropertyCount, VkDisplayModePropertiesKHR* pProperties);
		private static vkGetDisplayModePropertiesKHRFunction vkGetDisplayModePropertiesKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetDisplayModePropertiesKHR(VkPhysicalDevice physicalDevice, VkDisplayKHR display, uint32* pPropertyCount, VkDisplayModePropertiesKHR* pProperties)
			=> vkGetDisplayModePropertiesKHR_ptr(physicalDevice, display, pPropertyCount, pProperties);

		public typealias vkCreateDisplayModeKHRFunction = function VkResult(VkPhysicalDevice physicalDevice, VkDisplayKHR display, VkDisplayModeCreateInfoKHR* pCreateInfo, VkAllocationCallbacks* pAllocator, VkDisplayModeKHR* pMode);
		private static vkCreateDisplayModeKHRFunction vkCreateDisplayModeKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCreateDisplayModeKHR(VkPhysicalDevice physicalDevice, VkDisplayKHR display, VkDisplayModeCreateInfoKHR* pCreateInfo, VkAllocationCallbacks* pAllocator, VkDisplayModeKHR* pMode)
			=> vkCreateDisplayModeKHR_ptr(physicalDevice, display, pCreateInfo, pAllocator, pMode);

		public typealias vkGetDisplayPlaneCapabilitiesKHRFunction = function VkResult(VkPhysicalDevice physicalDevice, VkDisplayModeKHR mode, uint32 planeIndex, VkDisplayPlaneCapabilitiesKHR* pCapabilities);
		private static vkGetDisplayPlaneCapabilitiesKHRFunction vkGetDisplayPlaneCapabilitiesKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetDisplayPlaneCapabilitiesKHR(VkPhysicalDevice physicalDevice, VkDisplayModeKHR mode, uint32 planeIndex, VkDisplayPlaneCapabilitiesKHR* pCapabilities)
			=> vkGetDisplayPlaneCapabilitiesKHR_ptr(physicalDevice, mode, planeIndex, pCapabilities);

		public typealias vkCreateDisplayPlaneSurfaceKHRFunction = function VkResult(VkInstance instance, VkDisplaySurfaceCreateInfoKHR* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSurfaceKHR* pSurface);
		private static vkCreateDisplayPlaneSurfaceKHRFunction vkCreateDisplayPlaneSurfaceKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCreateDisplayPlaneSurfaceKHR(VkInstance instance, VkDisplaySurfaceCreateInfoKHR* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSurfaceKHR* pSurface)
			=> vkCreateDisplayPlaneSurfaceKHR_ptr(instance, pCreateInfo, pAllocator, pSurface);

		public typealias vkCreateSharedSwapchainsKHRFunction = function VkResult(VkDevice device, uint32 swapchainCount, VkSwapchainCreateInfoKHR* pCreateInfos, VkAllocationCallbacks* pAllocator, VkSwapchainKHR* pSwapchains);
		private static vkCreateSharedSwapchainsKHRFunction vkCreateSharedSwapchainsKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCreateSharedSwapchainsKHR(VkDevice device, uint32 swapchainCount, VkSwapchainCreateInfoKHR* pCreateInfos, VkAllocationCallbacks* pAllocator, VkSwapchainKHR* pSwapchains)
			=> vkCreateSharedSwapchainsKHR_ptr(device, swapchainCount, pCreateInfos, pAllocator, pSwapchains);

		public typealias vkCreateXlibSurfaceKHRFunction = function VkResult(VkInstance instance, VkXlibSurfaceCreateInfoKHR* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSurfaceKHR* pSurface);
		private static vkCreateXlibSurfaceKHRFunction vkCreateXlibSurfaceKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCreateXlibSurfaceKHR(VkInstance instance, VkXlibSurfaceCreateInfoKHR* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSurfaceKHR* pSurface)
			=> vkCreateXlibSurfaceKHR_ptr(instance, pCreateInfo, pAllocator, pSurface);

		public typealias vkGetPhysicalDeviceXlibPresentationSupportKHRFunction = function VkBool32(VkPhysicalDevice physicalDevice, uint32 queueFamilyIndex, void* dpy, void* visualID);
		private static vkGetPhysicalDeviceXlibPresentationSupportKHRFunction vkGetPhysicalDeviceXlibPresentationSupportKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkBool32 vkGetPhysicalDeviceXlibPresentationSupportKHR(VkPhysicalDevice physicalDevice, uint32 queueFamilyIndex, void* dpy, void* visualID)
			=> vkGetPhysicalDeviceXlibPresentationSupportKHR_ptr(physicalDevice, queueFamilyIndex, dpy, visualID);

		public typealias vkCreateXcbSurfaceKHRFunction = function VkResult(VkInstance instance, VkXcbSurfaceCreateInfoKHR* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSurfaceKHR* pSurface);
		private static vkCreateXcbSurfaceKHRFunction vkCreateXcbSurfaceKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCreateXcbSurfaceKHR(VkInstance instance, VkXcbSurfaceCreateInfoKHR* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSurfaceKHR* pSurface)
			=> vkCreateXcbSurfaceKHR_ptr(instance, pCreateInfo, pAllocator, pSurface);

		public typealias vkGetPhysicalDeviceXcbPresentationSupportKHRFunction = function VkBool32(VkPhysicalDevice physicalDevice, uint32 queueFamilyIndex, void* connection, void* visual_id);
		private static vkGetPhysicalDeviceXcbPresentationSupportKHRFunction vkGetPhysicalDeviceXcbPresentationSupportKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkBool32 vkGetPhysicalDeviceXcbPresentationSupportKHR(VkPhysicalDevice physicalDevice, uint32 queueFamilyIndex, void* connection, void* visual_id)
			=> vkGetPhysicalDeviceXcbPresentationSupportKHR_ptr(physicalDevice, queueFamilyIndex, connection, visual_id);

		public typealias vkCreateWaylandSurfaceKHRFunction = function VkResult(VkInstance instance, VkWaylandSurfaceCreateInfoKHR* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSurfaceKHR* pSurface);
		private static vkCreateWaylandSurfaceKHRFunction vkCreateWaylandSurfaceKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCreateWaylandSurfaceKHR(VkInstance instance, VkWaylandSurfaceCreateInfoKHR* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSurfaceKHR* pSurface)
			=> vkCreateWaylandSurfaceKHR_ptr(instance, pCreateInfo, pAllocator, pSurface);

		public typealias vkGetPhysicalDeviceWaylandPresentationSupportKHRFunction = function VkBool32(VkPhysicalDevice physicalDevice, uint32 queueFamilyIndex, void* display);
		private static vkGetPhysicalDeviceWaylandPresentationSupportKHRFunction vkGetPhysicalDeviceWaylandPresentationSupportKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkBool32 vkGetPhysicalDeviceWaylandPresentationSupportKHR(VkPhysicalDevice physicalDevice, uint32 queueFamilyIndex, void* display)
			=> vkGetPhysicalDeviceWaylandPresentationSupportKHR_ptr(physicalDevice, queueFamilyIndex, display);

		public typealias vkCreateAndroidSurfaceKHRFunction = function VkResult(VkInstance instance, VkAndroidSurfaceCreateInfoKHR* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSurfaceKHR* pSurface);
		private static vkCreateAndroidSurfaceKHRFunction vkCreateAndroidSurfaceKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCreateAndroidSurfaceKHR(VkInstance instance, VkAndroidSurfaceCreateInfoKHR* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSurfaceKHR* pSurface)
			=> vkCreateAndroidSurfaceKHR_ptr(instance, pCreateInfo, pAllocator, pSurface);

		public typealias vkCreateWin32SurfaceKHRFunction = function VkResult(VkInstance instance, VkWin32SurfaceCreateInfoKHR* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSurfaceKHR* pSurface);
		private static vkCreateWin32SurfaceKHRFunction vkCreateWin32SurfaceKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCreateWin32SurfaceKHR(VkInstance instance, VkWin32SurfaceCreateInfoKHR* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSurfaceKHR* pSurface)
			=> vkCreateWin32SurfaceKHR_ptr(instance, pCreateInfo, pAllocator, pSurface);

		public typealias vkGetPhysicalDeviceWin32PresentationSupportKHRFunction = function VkBool32(VkPhysicalDevice physicalDevice, uint32 queueFamilyIndex);
		private static vkGetPhysicalDeviceWin32PresentationSupportKHRFunction vkGetPhysicalDeviceWin32PresentationSupportKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkBool32 vkGetPhysicalDeviceWin32PresentationSupportKHR(VkPhysicalDevice physicalDevice, uint32 queueFamilyIndex)
			=> vkGetPhysicalDeviceWin32PresentationSupportKHR_ptr(physicalDevice, queueFamilyIndex);

		public typealias vkCreateDebugReportCallbackEXTFunction = function VkResult(VkInstance instance, VkDebugReportCallbackCreateInfoEXT* pCreateInfo, VkAllocationCallbacks* pAllocator, VkDebugReportCallbackEXT* pCallback);
		private static vkCreateDebugReportCallbackEXTFunction vkCreateDebugReportCallbackEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCreateDebugReportCallbackEXT(VkInstance instance, VkDebugReportCallbackCreateInfoEXT* pCreateInfo, VkAllocationCallbacks* pAllocator, VkDebugReportCallbackEXT* pCallback)
			=> vkCreateDebugReportCallbackEXT_ptr(instance, pCreateInfo, pAllocator, pCallback);

		public typealias vkDestroyDebugReportCallbackEXTFunction = function void(VkInstance instance, VkDebugReportCallbackEXT callback, VkAllocationCallbacks* pAllocator);
		private static vkDestroyDebugReportCallbackEXTFunction vkDestroyDebugReportCallbackEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkDestroyDebugReportCallbackEXT(VkInstance instance, VkDebugReportCallbackEXT callback, VkAllocationCallbacks* pAllocator)
			=> vkDestroyDebugReportCallbackEXT_ptr(instance, callback, pAllocator);

		public typealias vkDebugReportMessageEXTFunction = function void(VkInstance instance, VkDebugReportFlagsEXT flags, VkDebugReportObjectTypeEXT objectType, uint64 object, uint location, int32 messageCode, char8* pLayerPrefix, char8* pMessage);
		private static vkDebugReportMessageEXTFunction vkDebugReportMessageEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkDebugReportMessageEXT(VkInstance instance, VkDebugReportFlagsEXT flags, VkDebugReportObjectTypeEXT objectType, uint64 object, uint location, int32 messageCode, char8* pLayerPrefix, char8* pMessage)
			=> vkDebugReportMessageEXT_ptr(instance, flags, objectType, object, location, messageCode, pLayerPrefix, pMessage);

		public typealias vkDebugMarkerSetObjectTagEXTFunction = function VkResult(VkDevice device, VkDebugMarkerObjectTagInfoEXT* pTagInfo);
		private static vkDebugMarkerSetObjectTagEXTFunction vkDebugMarkerSetObjectTagEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkDebugMarkerSetObjectTagEXT(VkDevice device, VkDebugMarkerObjectTagInfoEXT* pTagInfo)
			=> vkDebugMarkerSetObjectTagEXT_ptr(device, pTagInfo);

		public typealias vkDebugMarkerSetObjectNameEXTFunction = function VkResult(VkDevice device, VkDebugMarkerObjectNameInfoEXT* pNameInfo);
		private static vkDebugMarkerSetObjectNameEXTFunction vkDebugMarkerSetObjectNameEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkDebugMarkerSetObjectNameEXT(VkDevice device, VkDebugMarkerObjectNameInfoEXT* pNameInfo)
			=> vkDebugMarkerSetObjectNameEXT_ptr(device, pNameInfo);

		public typealias vkCmdDebugMarkerBeginEXTFunction = function void(VkCommandBuffer commandBuffer, VkDebugMarkerMarkerInfoEXT* pMarkerInfo);
		private static vkCmdDebugMarkerBeginEXTFunction vkCmdDebugMarkerBeginEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdDebugMarkerBeginEXT(VkCommandBuffer commandBuffer, VkDebugMarkerMarkerInfoEXT* pMarkerInfo)
			=> vkCmdDebugMarkerBeginEXT_ptr(commandBuffer, pMarkerInfo);

		public typealias vkCmdDebugMarkerEndEXTFunction = function void(VkCommandBuffer commandBuffer);
		private static vkCmdDebugMarkerEndEXTFunction vkCmdDebugMarkerEndEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdDebugMarkerEndEXT(VkCommandBuffer commandBuffer)
			=> vkCmdDebugMarkerEndEXT_ptr(commandBuffer);

		public typealias vkCmdDebugMarkerInsertEXTFunction = function void(VkCommandBuffer commandBuffer, VkDebugMarkerMarkerInfoEXT* pMarkerInfo);
		private static vkCmdDebugMarkerInsertEXTFunction vkCmdDebugMarkerInsertEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdDebugMarkerInsertEXT(VkCommandBuffer commandBuffer, VkDebugMarkerMarkerInfoEXT* pMarkerInfo)
			=> vkCmdDebugMarkerInsertEXT_ptr(commandBuffer, pMarkerInfo);

		public typealias vkGetPhysicalDeviceVideoCapabilitiesKHRFunction = function VkResult(VkPhysicalDevice physicalDevice, VkVideoProfileKHR* pVideoProfile, VkVideoCapabilitiesKHR* pCapabilities);
		private static vkGetPhysicalDeviceVideoCapabilitiesKHRFunction vkGetPhysicalDeviceVideoCapabilitiesKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetPhysicalDeviceVideoCapabilitiesKHR(VkPhysicalDevice physicalDevice, VkVideoProfileKHR* pVideoProfile, VkVideoCapabilitiesKHR* pCapabilities)
			=> vkGetPhysicalDeviceVideoCapabilitiesKHR_ptr(physicalDevice, pVideoProfile, pCapabilities);

		public typealias vkGetPhysicalDeviceVideoFormatPropertiesKHRFunction = function VkResult(VkPhysicalDevice physicalDevice, VkPhysicalDeviceVideoFormatInfoKHR* pVideoFormatInfo, uint32* pVideoFormatPropertyCount, VkVideoFormatPropertiesKHR* pVideoFormatProperties);
		private static vkGetPhysicalDeviceVideoFormatPropertiesKHRFunction vkGetPhysicalDeviceVideoFormatPropertiesKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice physicalDevice, VkPhysicalDeviceVideoFormatInfoKHR* pVideoFormatInfo, uint32* pVideoFormatPropertyCount, VkVideoFormatPropertiesKHR* pVideoFormatProperties)
			=> vkGetPhysicalDeviceVideoFormatPropertiesKHR_ptr(physicalDevice, pVideoFormatInfo, pVideoFormatPropertyCount, pVideoFormatProperties);

		public typealias vkCreateVideoSessionKHRFunction = function VkResult(VkDevice device, VkVideoSessionCreateInfoKHR* pCreateInfo, VkAllocationCallbacks* pAllocator, VkVideoSessionKHR* pVideoSession);
		private static vkCreateVideoSessionKHRFunction vkCreateVideoSessionKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCreateVideoSessionKHR(VkDevice device, VkVideoSessionCreateInfoKHR* pCreateInfo, VkAllocationCallbacks* pAllocator, VkVideoSessionKHR* pVideoSession)
			=> vkCreateVideoSessionKHR_ptr(device, pCreateInfo, pAllocator, pVideoSession);

		public typealias vkDestroyVideoSessionKHRFunction = function void(VkDevice device, VkVideoSessionKHR videoSession, VkAllocationCallbacks* pAllocator);
		private static vkDestroyVideoSessionKHRFunction vkDestroyVideoSessionKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkDestroyVideoSessionKHR(VkDevice device, VkVideoSessionKHR videoSession, VkAllocationCallbacks* pAllocator)
			=> vkDestroyVideoSessionKHR_ptr(device, videoSession, pAllocator);

		public typealias vkGetVideoSessionMemoryRequirementsKHRFunction = function VkResult(VkDevice device, VkVideoSessionKHR videoSession, uint32* pVideoSessionMemoryRequirementsCount, VkVideoGetMemoryPropertiesKHR* pVideoSessionMemoryRequirements);
		private static vkGetVideoSessionMemoryRequirementsKHRFunction vkGetVideoSessionMemoryRequirementsKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetVideoSessionMemoryRequirementsKHR(VkDevice device, VkVideoSessionKHR videoSession, uint32* pVideoSessionMemoryRequirementsCount, VkVideoGetMemoryPropertiesKHR* pVideoSessionMemoryRequirements)
			=> vkGetVideoSessionMemoryRequirementsKHR_ptr(device, videoSession, pVideoSessionMemoryRequirementsCount, pVideoSessionMemoryRequirements);

		public typealias vkBindVideoSessionMemoryKHRFunction = function VkResult(VkDevice device, VkVideoSessionKHR videoSession, uint32 videoSessionBindMemoryCount, VkVideoBindMemoryKHR* pVideoSessionBindMemories);
		private static vkBindVideoSessionMemoryKHRFunction vkBindVideoSessionMemoryKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkBindVideoSessionMemoryKHR(VkDevice device, VkVideoSessionKHR videoSession, uint32 videoSessionBindMemoryCount, VkVideoBindMemoryKHR* pVideoSessionBindMemories)
			=> vkBindVideoSessionMemoryKHR_ptr(device, videoSession, videoSessionBindMemoryCount, pVideoSessionBindMemories);

		public typealias vkCreateVideoSessionParametersKHRFunction = function VkResult(VkDevice device, VkVideoSessionParametersCreateInfoKHR* pCreateInfo, VkAllocationCallbacks* pAllocator, VkVideoSessionParametersKHR* pVideoSessionParameters);
		private static vkCreateVideoSessionParametersKHRFunction vkCreateVideoSessionParametersKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCreateVideoSessionParametersKHR(VkDevice device, VkVideoSessionParametersCreateInfoKHR* pCreateInfo, VkAllocationCallbacks* pAllocator, VkVideoSessionParametersKHR* pVideoSessionParameters)
			=> vkCreateVideoSessionParametersKHR_ptr(device, pCreateInfo, pAllocator, pVideoSessionParameters);

		public typealias vkUpdateVideoSessionParametersKHRFunction = function VkResult(VkDevice device, VkVideoSessionParametersKHR videoSessionParameters, VkVideoSessionParametersUpdateInfoKHR* pUpdateInfo);
		private static vkUpdateVideoSessionParametersKHRFunction vkUpdateVideoSessionParametersKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkUpdateVideoSessionParametersKHR(VkDevice device, VkVideoSessionParametersKHR videoSessionParameters, VkVideoSessionParametersUpdateInfoKHR* pUpdateInfo)
			=> vkUpdateVideoSessionParametersKHR_ptr(device, videoSessionParameters, pUpdateInfo);

		public typealias vkDestroyVideoSessionParametersKHRFunction = function void(VkDevice device, VkVideoSessionParametersKHR videoSessionParameters, VkAllocationCallbacks* pAllocator);
		private static vkDestroyVideoSessionParametersKHRFunction vkDestroyVideoSessionParametersKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkDestroyVideoSessionParametersKHR(VkDevice device, VkVideoSessionParametersKHR videoSessionParameters, VkAllocationCallbacks* pAllocator)
			=> vkDestroyVideoSessionParametersKHR_ptr(device, videoSessionParameters, pAllocator);

		public typealias vkCmdBeginVideoCodingKHRFunction = function void(VkCommandBuffer commandBuffer, VkVideoBeginCodingInfoKHR* pBeginInfo);
		private static vkCmdBeginVideoCodingKHRFunction vkCmdBeginVideoCodingKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdBeginVideoCodingKHR(VkCommandBuffer commandBuffer, VkVideoBeginCodingInfoKHR* pBeginInfo)
			=> vkCmdBeginVideoCodingKHR_ptr(commandBuffer, pBeginInfo);

		public typealias vkCmdEndVideoCodingKHRFunction = function void(VkCommandBuffer commandBuffer, VkVideoEndCodingInfoKHR* pEndCodingInfo);
		private static vkCmdEndVideoCodingKHRFunction vkCmdEndVideoCodingKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdEndVideoCodingKHR(VkCommandBuffer commandBuffer, VkVideoEndCodingInfoKHR* pEndCodingInfo)
			=> vkCmdEndVideoCodingKHR_ptr(commandBuffer, pEndCodingInfo);

		public typealias vkCmdControlVideoCodingKHRFunction = function void(VkCommandBuffer commandBuffer, VkVideoCodingControlInfoKHR* pCodingControlInfo);
		private static vkCmdControlVideoCodingKHRFunction vkCmdControlVideoCodingKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdControlVideoCodingKHR(VkCommandBuffer commandBuffer, VkVideoCodingControlInfoKHR* pCodingControlInfo)
			=> vkCmdControlVideoCodingKHR_ptr(commandBuffer, pCodingControlInfo);

		public typealias vkCmdDecodeVideoKHRFunction = function void(VkCommandBuffer commandBuffer, VkVideoDecodeInfoKHR* pFrameInfo);
		private static vkCmdDecodeVideoKHRFunction vkCmdDecodeVideoKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdDecodeVideoKHR(VkCommandBuffer commandBuffer, VkVideoDecodeInfoKHR* pFrameInfo)
			=> vkCmdDecodeVideoKHR_ptr(commandBuffer, pFrameInfo);

		public typealias vkCmdBindTransformFeedbackBuffersEXTFunction = function void(VkCommandBuffer commandBuffer, uint32 firstBinding, uint32 bindingCount, VkBuffer* pBuffers, uint64* pOffsets, uint64* pSizes);
		private static vkCmdBindTransformFeedbackBuffersEXTFunction vkCmdBindTransformFeedbackBuffersEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdBindTransformFeedbackBuffersEXT(VkCommandBuffer commandBuffer, uint32 firstBinding, uint32 bindingCount, VkBuffer* pBuffers, uint64* pOffsets, uint64* pSizes)
			=> vkCmdBindTransformFeedbackBuffersEXT_ptr(commandBuffer, firstBinding, bindingCount, pBuffers, pOffsets, pSizes);

		public typealias vkCmdBeginTransformFeedbackEXTFunction = function void(VkCommandBuffer commandBuffer, uint32 firstCounterBuffer, uint32 counterBufferCount, VkBuffer* pCounterBuffers, uint64* pCounterBufferOffsets);
		private static vkCmdBeginTransformFeedbackEXTFunction vkCmdBeginTransformFeedbackEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdBeginTransformFeedbackEXT(VkCommandBuffer commandBuffer, uint32 firstCounterBuffer, uint32 counterBufferCount, VkBuffer* pCounterBuffers, uint64* pCounterBufferOffsets)
			=> vkCmdBeginTransformFeedbackEXT_ptr(commandBuffer, firstCounterBuffer, counterBufferCount, pCounterBuffers, pCounterBufferOffsets);

		public typealias vkCmdEndTransformFeedbackEXTFunction = function void(VkCommandBuffer commandBuffer, uint32 firstCounterBuffer, uint32 counterBufferCount, VkBuffer* pCounterBuffers, uint64* pCounterBufferOffsets);
		private static vkCmdEndTransformFeedbackEXTFunction vkCmdEndTransformFeedbackEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdEndTransformFeedbackEXT(VkCommandBuffer commandBuffer, uint32 firstCounterBuffer, uint32 counterBufferCount, VkBuffer* pCounterBuffers, uint64* pCounterBufferOffsets)
			=> vkCmdEndTransformFeedbackEXT_ptr(commandBuffer, firstCounterBuffer, counterBufferCount, pCounterBuffers, pCounterBufferOffsets);

		public typealias vkCmdBeginQueryIndexedEXTFunction = function void(VkCommandBuffer commandBuffer, VkQueryPool queryPool, uint32 query, VkQueryControlFlags flags, uint32 index);
		private static vkCmdBeginQueryIndexedEXTFunction vkCmdBeginQueryIndexedEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdBeginQueryIndexedEXT(VkCommandBuffer commandBuffer, VkQueryPool queryPool, uint32 query, VkQueryControlFlags flags, uint32 index)
			=> vkCmdBeginQueryIndexedEXT_ptr(commandBuffer, queryPool, query, flags, index);

		public typealias vkCmdEndQueryIndexedEXTFunction = function void(VkCommandBuffer commandBuffer, VkQueryPool queryPool, uint32 query, uint32 index);
		private static vkCmdEndQueryIndexedEXTFunction vkCmdEndQueryIndexedEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdEndQueryIndexedEXT(VkCommandBuffer commandBuffer, VkQueryPool queryPool, uint32 query, uint32 index)
			=> vkCmdEndQueryIndexedEXT_ptr(commandBuffer, queryPool, query, index);

		public typealias vkCmdDrawIndirectByteCountEXTFunction = function void(VkCommandBuffer commandBuffer, uint32 instanceCount, uint32 firstInstance, VkBuffer counterBuffer, uint64 counterBufferOffset, uint32 counterOffset, uint32 vertexStride);
		private static vkCmdDrawIndirectByteCountEXTFunction vkCmdDrawIndirectByteCountEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdDrawIndirectByteCountEXT(VkCommandBuffer commandBuffer, uint32 instanceCount, uint32 firstInstance, VkBuffer counterBuffer, uint64 counterBufferOffset, uint32 counterOffset, uint32 vertexStride)
			=> vkCmdDrawIndirectByteCountEXT_ptr(commandBuffer, instanceCount, firstInstance, counterBuffer, counterBufferOffset, counterOffset, vertexStride);

		public typealias vkCreateCuModuleNVXFunction = function VkResult(VkDevice device, VkCuModuleCreateInfoNVX* pCreateInfo, VkAllocationCallbacks* pAllocator, VkCuModuleNVX* pModule);
		private static vkCreateCuModuleNVXFunction vkCreateCuModuleNVX_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCreateCuModuleNVX(VkDevice device, VkCuModuleCreateInfoNVX* pCreateInfo, VkAllocationCallbacks* pAllocator, VkCuModuleNVX* pModule)
			=> vkCreateCuModuleNVX_ptr(device, pCreateInfo, pAllocator, pModule);

		public typealias vkCreateCuFunctionNVXFunction = function VkResult(VkDevice device, VkCuFunctionCreateInfoNVX* pCreateInfo, VkAllocationCallbacks* pAllocator, VkCuFunctionNVX* pFunction);
		private static vkCreateCuFunctionNVXFunction vkCreateCuFunctionNVX_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCreateCuFunctionNVX(VkDevice device, VkCuFunctionCreateInfoNVX* pCreateInfo, VkAllocationCallbacks* pAllocator, VkCuFunctionNVX* pFunction)
			=> vkCreateCuFunctionNVX_ptr(device, pCreateInfo, pAllocator, pFunction);

		public typealias vkDestroyCuModuleNVXFunction = function void(VkDevice device, VkCuModuleNVX module, VkAllocationCallbacks* pAllocator);
		private static vkDestroyCuModuleNVXFunction vkDestroyCuModuleNVX_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkDestroyCuModuleNVX(VkDevice device, VkCuModuleNVX module, VkAllocationCallbacks* pAllocator)
			=> vkDestroyCuModuleNVX_ptr(device, module, pAllocator);

		public typealias vkDestroyCuFunctionNVXFunction = function void(VkDevice device, VkCuFunctionNVX vkfunction, VkAllocationCallbacks* pAllocator);
		private static vkDestroyCuFunctionNVXFunction vkDestroyCuFunctionNVX_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkDestroyCuFunctionNVX(VkDevice device, VkCuFunctionNVX vkfunction, VkAllocationCallbacks* pAllocator)
			=> vkDestroyCuFunctionNVX_ptr(device, vkfunction, pAllocator);

		public typealias vkCmdCuLaunchKernelNVXFunction = function void(VkCommandBuffer commandBuffer, VkCuLaunchInfoNVX* pLaunchInfo);
		private static vkCmdCuLaunchKernelNVXFunction vkCmdCuLaunchKernelNVX_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdCuLaunchKernelNVX(VkCommandBuffer commandBuffer, VkCuLaunchInfoNVX* pLaunchInfo)
			=> vkCmdCuLaunchKernelNVX_ptr(commandBuffer, pLaunchInfo);

		public typealias vkGetImageViewHandleNVXFunction = function uint32(VkDevice device, VkImageViewHandleInfoNVX* pInfo);
		private static vkGetImageViewHandleNVXFunction vkGetImageViewHandleNVX_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static uint32 vkGetImageViewHandleNVX(VkDevice device, VkImageViewHandleInfoNVX* pInfo)
			=> vkGetImageViewHandleNVX_ptr(device, pInfo);

		public typealias vkGetImageViewAddressNVXFunction = function VkResult(VkDevice device, VkImageView imageView, VkImageViewAddressPropertiesNVX* pProperties);
		private static vkGetImageViewAddressNVXFunction vkGetImageViewAddressNVX_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetImageViewAddressNVX(VkDevice device, VkImageView imageView, VkImageViewAddressPropertiesNVX* pProperties)
			=> vkGetImageViewAddressNVX_ptr(device, imageView, pProperties);

		public typealias vkGetShaderInfoAMDFunction = function VkResult(VkDevice device, VkPipeline pipeline, VkShaderStageFlags shaderStage, VkShaderInfoTypeAMD infoType, uint* pInfoSize, void* pInfo);
		private static vkGetShaderInfoAMDFunction vkGetShaderInfoAMD_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetShaderInfoAMD(VkDevice device, VkPipeline pipeline, VkShaderStageFlags shaderStage, VkShaderInfoTypeAMD infoType, uint* pInfoSize, void* pInfo)
			=> vkGetShaderInfoAMD_ptr(device, pipeline, shaderStage, infoType, pInfoSize, pInfo);

		public typealias vkCreateStreamDescriptorSurfaceGGPFunction = function VkResult(VkInstance instance, VkStreamDescriptorSurfaceCreateInfoGGP* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSurfaceKHR* pSurface);
		private static vkCreateStreamDescriptorSurfaceGGPFunction vkCreateStreamDescriptorSurfaceGGP_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCreateStreamDescriptorSurfaceGGP(VkInstance instance, VkStreamDescriptorSurfaceCreateInfoGGP* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSurfaceKHR* pSurface)
			=> vkCreateStreamDescriptorSurfaceGGP_ptr(instance, pCreateInfo, pAllocator, pSurface);

		public typealias vkGetPhysicalDeviceExternalImageFormatPropertiesNVFunction = function VkResult(VkPhysicalDevice physicalDevice, VkFormat format, VkImageType type, VkImageTiling tiling, VkImageUsageFlags usage, VkImageCreateFlags flags, VkExternalMemoryHandleTypeFlagsNV externalHandleType, VkExternalImageFormatPropertiesNV* pExternalImageFormatProperties);
		private static vkGetPhysicalDeviceExternalImageFormatPropertiesNVFunction vkGetPhysicalDeviceExternalImageFormatPropertiesNV_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetPhysicalDeviceExternalImageFormatPropertiesNV(VkPhysicalDevice physicalDevice, VkFormat format, VkImageType type, VkImageTiling tiling, VkImageUsageFlags usage, VkImageCreateFlags flags, VkExternalMemoryHandleTypeFlagsNV externalHandleType, VkExternalImageFormatPropertiesNV* pExternalImageFormatProperties)
			=> vkGetPhysicalDeviceExternalImageFormatPropertiesNV_ptr(physicalDevice, format, type, tiling, usage, flags, externalHandleType, pExternalImageFormatProperties);

		public typealias vkGetMemoryWin32HandleNVFunction = function VkResult(VkDevice device, VkDeviceMemory memory, VkExternalMemoryHandleTypeFlagsNV handleType, void* pHandle);
		private static vkGetMemoryWin32HandleNVFunction vkGetMemoryWin32HandleNV_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetMemoryWin32HandleNV(VkDevice device, VkDeviceMemory memory, VkExternalMemoryHandleTypeFlagsNV handleType, void* pHandle)
			=> vkGetMemoryWin32HandleNV_ptr(device, memory, handleType, pHandle);

		public typealias vkCreateViSurfaceNNFunction = function VkResult(VkInstance instance, VkViSurfaceCreateInfoNN* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSurfaceKHR* pSurface);
		private static vkCreateViSurfaceNNFunction vkCreateViSurfaceNN_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCreateViSurfaceNN(VkInstance instance, VkViSurfaceCreateInfoNN* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSurfaceKHR* pSurface)
			=> vkCreateViSurfaceNN_ptr(instance, pCreateInfo, pAllocator, pSurface);

		public typealias vkGetMemoryWin32HandleKHRFunction = function VkResult(VkDevice device, VkMemoryGetWin32HandleInfoKHR* pGetWin32HandleInfo, void* pHandle);
		private static vkGetMemoryWin32HandleKHRFunction vkGetMemoryWin32HandleKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetMemoryWin32HandleKHR(VkDevice device, VkMemoryGetWin32HandleInfoKHR* pGetWin32HandleInfo, void* pHandle)
			=> vkGetMemoryWin32HandleKHR_ptr(device, pGetWin32HandleInfo, pHandle);

		public typealias vkGetMemoryWin32HandlePropertiesKHRFunction = function VkResult(VkDevice device, VkExternalMemoryHandleTypeFlags handleType, void* handle, VkMemoryWin32HandlePropertiesKHR* pMemoryWin32HandleProperties);
		private static vkGetMemoryWin32HandlePropertiesKHRFunction vkGetMemoryWin32HandlePropertiesKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetMemoryWin32HandlePropertiesKHR(VkDevice device, VkExternalMemoryHandleTypeFlags handleType, void* handle, VkMemoryWin32HandlePropertiesKHR* pMemoryWin32HandleProperties)
			=> vkGetMemoryWin32HandlePropertiesKHR_ptr(device, handleType, handle, pMemoryWin32HandleProperties);

		public typealias vkGetMemoryFdKHRFunction = function VkResult(VkDevice device, VkMemoryGetFdInfoKHR* pGetFdInfo, int* pFd);
		private static vkGetMemoryFdKHRFunction vkGetMemoryFdKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetMemoryFdKHR(VkDevice device, VkMemoryGetFdInfoKHR* pGetFdInfo, int* pFd)
			=> vkGetMemoryFdKHR_ptr(device, pGetFdInfo, pFd);

		public typealias vkGetMemoryFdPropertiesKHRFunction = function VkResult(VkDevice device, VkExternalMemoryHandleTypeFlags handleType, int fd, VkMemoryFdPropertiesKHR* pMemoryFdProperties);
		private static vkGetMemoryFdPropertiesKHRFunction vkGetMemoryFdPropertiesKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetMemoryFdPropertiesKHR(VkDevice device, VkExternalMemoryHandleTypeFlags handleType, int fd, VkMemoryFdPropertiesKHR* pMemoryFdProperties)
			=> vkGetMemoryFdPropertiesKHR_ptr(device, handleType, fd, pMemoryFdProperties);

		public typealias vkImportSemaphoreWin32HandleKHRFunction = function VkResult(VkDevice device, VkImportSemaphoreWin32HandleInfoKHR* pImportSemaphoreWin32HandleInfo);
		private static vkImportSemaphoreWin32HandleKHRFunction vkImportSemaphoreWin32HandleKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkImportSemaphoreWin32HandleKHR(VkDevice device, VkImportSemaphoreWin32HandleInfoKHR* pImportSemaphoreWin32HandleInfo)
			=> vkImportSemaphoreWin32HandleKHR_ptr(device, pImportSemaphoreWin32HandleInfo);

		public typealias vkGetSemaphoreWin32HandleKHRFunction = function VkResult(VkDevice device, VkSemaphoreGetWin32HandleInfoKHR* pGetWin32HandleInfo, void* pHandle);
		private static vkGetSemaphoreWin32HandleKHRFunction vkGetSemaphoreWin32HandleKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetSemaphoreWin32HandleKHR(VkDevice device, VkSemaphoreGetWin32HandleInfoKHR* pGetWin32HandleInfo, void* pHandle)
			=> vkGetSemaphoreWin32HandleKHR_ptr(device, pGetWin32HandleInfo, pHandle);

		public typealias vkImportSemaphoreFdKHRFunction = function VkResult(VkDevice device, VkImportSemaphoreFdInfoKHR* pImportSemaphoreFdInfo);
		private static vkImportSemaphoreFdKHRFunction vkImportSemaphoreFdKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkImportSemaphoreFdKHR(VkDevice device, VkImportSemaphoreFdInfoKHR* pImportSemaphoreFdInfo)
			=> vkImportSemaphoreFdKHR_ptr(device, pImportSemaphoreFdInfo);

		public typealias vkGetSemaphoreFdKHRFunction = function VkResult(VkDevice device, VkSemaphoreGetFdInfoKHR* pGetFdInfo, int* pFd);
		private static vkGetSemaphoreFdKHRFunction vkGetSemaphoreFdKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetSemaphoreFdKHR(VkDevice device, VkSemaphoreGetFdInfoKHR* pGetFdInfo, int* pFd)
			=> vkGetSemaphoreFdKHR_ptr(device, pGetFdInfo, pFd);

		public typealias vkCmdPushDescriptorSetKHRFunction = function void(VkCommandBuffer commandBuffer, VkPipelineBindPoint pipelineBindPoint, VkPipelineLayout layout, uint32 set, uint32 descriptorWriteCount, VkWriteDescriptorSet* pDescriptorWrites);
		private static vkCmdPushDescriptorSetKHRFunction vkCmdPushDescriptorSetKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdPushDescriptorSetKHR(VkCommandBuffer commandBuffer, VkPipelineBindPoint pipelineBindPoint, VkPipelineLayout layout, uint32 set, uint32 descriptorWriteCount, VkWriteDescriptorSet* pDescriptorWrites)
			=> vkCmdPushDescriptorSetKHR_ptr(commandBuffer, pipelineBindPoint, layout, set, descriptorWriteCount, pDescriptorWrites);

		public typealias vkCmdBeginConditionalRenderingEXTFunction = function void(VkCommandBuffer commandBuffer, VkConditionalRenderingBeginInfoEXT* pConditionalRenderingBegin);
		private static vkCmdBeginConditionalRenderingEXTFunction vkCmdBeginConditionalRenderingEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdBeginConditionalRenderingEXT(VkCommandBuffer commandBuffer, VkConditionalRenderingBeginInfoEXT* pConditionalRenderingBegin)
			=> vkCmdBeginConditionalRenderingEXT_ptr(commandBuffer, pConditionalRenderingBegin);

		public typealias vkCmdEndConditionalRenderingEXTFunction = function void(VkCommandBuffer commandBuffer);
		private static vkCmdEndConditionalRenderingEXTFunction vkCmdEndConditionalRenderingEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdEndConditionalRenderingEXT(VkCommandBuffer commandBuffer)
			=> vkCmdEndConditionalRenderingEXT_ptr(commandBuffer);

		public typealias vkCmdSetViewportWScalingNVFunction = function void(VkCommandBuffer commandBuffer, uint32 firstViewport, uint32 viewportCount, VkViewportWScalingNV* pViewportWScalings);
		private static vkCmdSetViewportWScalingNVFunction vkCmdSetViewportWScalingNV_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdSetViewportWScalingNV(VkCommandBuffer commandBuffer, uint32 firstViewport, uint32 viewportCount, VkViewportWScalingNV* pViewportWScalings)
			=> vkCmdSetViewportWScalingNV_ptr(commandBuffer, firstViewport, viewportCount, pViewportWScalings);

		public typealias vkReleaseDisplayEXTFunction = function VkResult(VkPhysicalDevice physicalDevice, VkDisplayKHR display);
		private static vkReleaseDisplayEXTFunction vkReleaseDisplayEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkReleaseDisplayEXT(VkPhysicalDevice physicalDevice, VkDisplayKHR display)
			=> vkReleaseDisplayEXT_ptr(physicalDevice, display);

		public typealias vkAcquireXlibDisplayEXTFunction = function VkResult(VkPhysicalDevice physicalDevice, void* dpy, VkDisplayKHR display);
		private static vkAcquireXlibDisplayEXTFunction vkAcquireXlibDisplayEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkAcquireXlibDisplayEXT(VkPhysicalDevice physicalDevice, void* dpy, VkDisplayKHR display)
			=> vkAcquireXlibDisplayEXT_ptr(physicalDevice, dpy, display);

		public typealias vkGetRandROutputDisplayEXTFunction = function VkResult(VkPhysicalDevice physicalDevice, void* dpy, void* rrOutput, VkDisplayKHR* pDisplay);
		private static vkGetRandROutputDisplayEXTFunction vkGetRandROutputDisplayEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetRandROutputDisplayEXT(VkPhysicalDevice physicalDevice, void* dpy, void* rrOutput, VkDisplayKHR* pDisplay)
			=> vkGetRandROutputDisplayEXT_ptr(physicalDevice, dpy, rrOutput, pDisplay);

		public typealias vkGetPhysicalDeviceSurfaceCapabilities2EXTFunction = function VkResult(VkPhysicalDevice physicalDevice, VkSurfaceKHR surface, VkSurfaceCapabilities2EXT* pSurfaceCapabilities);
		private static vkGetPhysicalDeviceSurfaceCapabilities2EXTFunction vkGetPhysicalDeviceSurfaceCapabilities2EXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetPhysicalDeviceSurfaceCapabilities2EXT(VkPhysicalDevice physicalDevice, VkSurfaceKHR surface, VkSurfaceCapabilities2EXT* pSurfaceCapabilities)
			=> vkGetPhysicalDeviceSurfaceCapabilities2EXT_ptr(physicalDevice, surface, pSurfaceCapabilities);

		public typealias vkDisplayPowerControlEXTFunction = function VkResult(VkDevice device, VkDisplayKHR display, VkDisplayPowerInfoEXT* pDisplayPowerInfo);
		private static vkDisplayPowerControlEXTFunction vkDisplayPowerControlEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkDisplayPowerControlEXT(VkDevice device, VkDisplayKHR display, VkDisplayPowerInfoEXT* pDisplayPowerInfo)
			=> vkDisplayPowerControlEXT_ptr(device, display, pDisplayPowerInfo);

		public typealias vkRegisterDeviceEventEXTFunction = function VkResult(VkDevice device, VkDeviceEventInfoEXT* pDeviceEventInfo, VkAllocationCallbacks* pAllocator, VkFence* pFence);
		private static vkRegisterDeviceEventEXTFunction vkRegisterDeviceEventEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkRegisterDeviceEventEXT(VkDevice device, VkDeviceEventInfoEXT* pDeviceEventInfo, VkAllocationCallbacks* pAllocator, VkFence* pFence)
			=> vkRegisterDeviceEventEXT_ptr(device, pDeviceEventInfo, pAllocator, pFence);

		public typealias vkRegisterDisplayEventEXTFunction = function VkResult(VkDevice device, VkDisplayKHR display, VkDisplayEventInfoEXT* pDisplayEventInfo, VkAllocationCallbacks* pAllocator, VkFence* pFence);
		private static vkRegisterDisplayEventEXTFunction vkRegisterDisplayEventEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkRegisterDisplayEventEXT(VkDevice device, VkDisplayKHR display, VkDisplayEventInfoEXT* pDisplayEventInfo, VkAllocationCallbacks* pAllocator, VkFence* pFence)
			=> vkRegisterDisplayEventEXT_ptr(device, display, pDisplayEventInfo, pAllocator, pFence);

		public typealias vkGetSwapchainCounterEXTFunction = function VkResult(VkDevice device, VkSwapchainKHR swapchain, VkSurfaceCounterFlagsEXT counter, uint64* pCounterValue);
		private static vkGetSwapchainCounterEXTFunction vkGetSwapchainCounterEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetSwapchainCounterEXT(VkDevice device, VkSwapchainKHR swapchain, VkSurfaceCounterFlagsEXT counter, uint64* pCounterValue)
			=> vkGetSwapchainCounterEXT_ptr(device, swapchain, counter, pCounterValue);

		public typealias vkGetRefreshCycleDurationGOOGLEFunction = function VkResult(VkDevice device, VkSwapchainKHR swapchain, VkRefreshCycleDurationGOOGLE* pDisplayTimingProperties);
		private static vkGetRefreshCycleDurationGOOGLEFunction vkGetRefreshCycleDurationGOOGLE_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetRefreshCycleDurationGOOGLE(VkDevice device, VkSwapchainKHR swapchain, VkRefreshCycleDurationGOOGLE* pDisplayTimingProperties)
			=> vkGetRefreshCycleDurationGOOGLE_ptr(device, swapchain, pDisplayTimingProperties);

		public typealias vkGetPastPresentationTimingGOOGLEFunction = function VkResult(VkDevice device, VkSwapchainKHR swapchain, uint32* pPresentationTimingCount, VkPastPresentationTimingGOOGLE* pPresentationTimings);
		private static vkGetPastPresentationTimingGOOGLEFunction vkGetPastPresentationTimingGOOGLE_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetPastPresentationTimingGOOGLE(VkDevice device, VkSwapchainKHR swapchain, uint32* pPresentationTimingCount, VkPastPresentationTimingGOOGLE* pPresentationTimings)
			=> vkGetPastPresentationTimingGOOGLE_ptr(device, swapchain, pPresentationTimingCount, pPresentationTimings);

		public typealias vkCmdSetDiscardRectangleEXTFunction = function void(VkCommandBuffer commandBuffer, uint32 firstDiscardRectangle, uint32 discardRectangleCount, VkRect2D* pDiscardRectangles);
		private static vkCmdSetDiscardRectangleEXTFunction vkCmdSetDiscardRectangleEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdSetDiscardRectangleEXT(VkCommandBuffer commandBuffer, uint32 firstDiscardRectangle, uint32 discardRectangleCount, VkRect2D* pDiscardRectangles)
			=> vkCmdSetDiscardRectangleEXT_ptr(commandBuffer, firstDiscardRectangle, discardRectangleCount, pDiscardRectangles);

		public typealias vkSetHdrMetadataEXTFunction = function void(VkDevice device, uint32 swapchainCount, VkSwapchainKHR* pSwapchains, VkHdrMetadataEXT* pMetadata);
		private static vkSetHdrMetadataEXTFunction vkSetHdrMetadataEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkSetHdrMetadataEXT(VkDevice device, uint32 swapchainCount, VkSwapchainKHR* pSwapchains, VkHdrMetadataEXT* pMetadata)
			=> vkSetHdrMetadataEXT_ptr(device, swapchainCount, pSwapchains, pMetadata);

		public typealias vkGetSwapchainStatusKHRFunction = function VkResult(VkDevice device, VkSwapchainKHR swapchain);
		private static vkGetSwapchainStatusKHRFunction vkGetSwapchainStatusKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetSwapchainStatusKHR(VkDevice device, VkSwapchainKHR swapchain)
			=> vkGetSwapchainStatusKHR_ptr(device, swapchain);

		public typealias vkImportFenceWin32HandleKHRFunction = function VkResult(VkDevice device, VkImportFenceWin32HandleInfoKHR* pImportFenceWin32HandleInfo);
		private static vkImportFenceWin32HandleKHRFunction vkImportFenceWin32HandleKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkImportFenceWin32HandleKHR(VkDevice device, VkImportFenceWin32HandleInfoKHR* pImportFenceWin32HandleInfo)
			=> vkImportFenceWin32HandleKHR_ptr(device, pImportFenceWin32HandleInfo);

		public typealias vkGetFenceWin32HandleKHRFunction = function VkResult(VkDevice device, VkFenceGetWin32HandleInfoKHR* pGetWin32HandleInfo, void* pHandle);
		private static vkGetFenceWin32HandleKHRFunction vkGetFenceWin32HandleKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetFenceWin32HandleKHR(VkDevice device, VkFenceGetWin32HandleInfoKHR* pGetWin32HandleInfo, void* pHandle)
			=> vkGetFenceWin32HandleKHR_ptr(device, pGetWin32HandleInfo, pHandle);

		public typealias vkImportFenceFdKHRFunction = function VkResult(VkDevice device, VkImportFenceFdInfoKHR* pImportFenceFdInfo);
		private static vkImportFenceFdKHRFunction vkImportFenceFdKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkImportFenceFdKHR(VkDevice device, VkImportFenceFdInfoKHR* pImportFenceFdInfo)
			=> vkImportFenceFdKHR_ptr(device, pImportFenceFdInfo);

		public typealias vkGetFenceFdKHRFunction = function VkResult(VkDevice device, VkFenceGetFdInfoKHR* pGetFdInfo, int* pFd);
		private static vkGetFenceFdKHRFunction vkGetFenceFdKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetFenceFdKHR(VkDevice device, VkFenceGetFdInfoKHR* pGetFdInfo, int* pFd)
			=> vkGetFenceFdKHR_ptr(device, pGetFdInfo, pFd);

		public typealias vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHRFunction = function VkResult(VkPhysicalDevice physicalDevice, uint32 queueFamilyIndex, uint32* pCounterCount, VkPerformanceCounterKHR* pCounters, VkPerformanceCounterDescriptionKHR* pCounterDescriptions);
		private static vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHRFunction vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR(VkPhysicalDevice physicalDevice, uint32 queueFamilyIndex, uint32* pCounterCount, VkPerformanceCounterKHR* pCounters, VkPerformanceCounterDescriptionKHR* pCounterDescriptions)
			=> vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR_ptr(physicalDevice, queueFamilyIndex, pCounterCount, pCounters, pCounterDescriptions);

		public typealias vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHRFunction = function void(VkPhysicalDevice physicalDevice, VkQueryPoolPerformanceCreateInfoKHR* pPerformanceQueryCreateInfo, uint32* pNumPasses);
		private static vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHRFunction vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR(VkPhysicalDevice physicalDevice, VkQueryPoolPerformanceCreateInfoKHR* pPerformanceQueryCreateInfo, uint32* pNumPasses)
			=> vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR_ptr(physicalDevice, pPerformanceQueryCreateInfo, pNumPasses);

		public typealias vkAcquireProfilingLockKHRFunction = function VkResult(VkDevice device, VkAcquireProfilingLockInfoKHR* pInfo);
		private static vkAcquireProfilingLockKHRFunction vkAcquireProfilingLockKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkAcquireProfilingLockKHR(VkDevice device, VkAcquireProfilingLockInfoKHR* pInfo)
			=> vkAcquireProfilingLockKHR_ptr(device, pInfo);

		public typealias vkReleaseProfilingLockKHRFunction = function void(VkDevice device);
		private static vkReleaseProfilingLockKHRFunction vkReleaseProfilingLockKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkReleaseProfilingLockKHR(VkDevice device)
			=> vkReleaseProfilingLockKHR_ptr(device);

		public typealias vkGetPhysicalDeviceSurfaceCapabilities2KHRFunction = function VkResult(VkPhysicalDevice physicalDevice, VkPhysicalDeviceSurfaceInfo2KHR* pSurfaceInfo, VkSurfaceCapabilities2KHR* pSurfaceCapabilities);
		private static vkGetPhysicalDeviceSurfaceCapabilities2KHRFunction vkGetPhysicalDeviceSurfaceCapabilities2KHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetPhysicalDeviceSurfaceCapabilities2KHR(VkPhysicalDevice physicalDevice, VkPhysicalDeviceSurfaceInfo2KHR* pSurfaceInfo, VkSurfaceCapabilities2KHR* pSurfaceCapabilities)
			=> vkGetPhysicalDeviceSurfaceCapabilities2KHR_ptr(physicalDevice, pSurfaceInfo, pSurfaceCapabilities);

		public typealias vkGetPhysicalDeviceSurfaceFormats2KHRFunction = function VkResult(VkPhysicalDevice physicalDevice, VkPhysicalDeviceSurfaceInfo2KHR* pSurfaceInfo, uint32* pSurfaceFormatCount, VkSurfaceFormat2KHR* pSurfaceFormats);
		private static vkGetPhysicalDeviceSurfaceFormats2KHRFunction vkGetPhysicalDeviceSurfaceFormats2KHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetPhysicalDeviceSurfaceFormats2KHR(VkPhysicalDevice physicalDevice, VkPhysicalDeviceSurfaceInfo2KHR* pSurfaceInfo, uint32* pSurfaceFormatCount, VkSurfaceFormat2KHR* pSurfaceFormats)
			=> vkGetPhysicalDeviceSurfaceFormats2KHR_ptr(physicalDevice, pSurfaceInfo, pSurfaceFormatCount, pSurfaceFormats);

		public typealias vkGetPhysicalDeviceDisplayProperties2KHRFunction = function VkResult(VkPhysicalDevice physicalDevice, uint32* pPropertyCount, VkDisplayProperties2KHR* pProperties);
		private static vkGetPhysicalDeviceDisplayProperties2KHRFunction vkGetPhysicalDeviceDisplayProperties2KHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetPhysicalDeviceDisplayProperties2KHR(VkPhysicalDevice physicalDevice, uint32* pPropertyCount, VkDisplayProperties2KHR* pProperties)
			=> vkGetPhysicalDeviceDisplayProperties2KHR_ptr(physicalDevice, pPropertyCount, pProperties);

		public typealias vkGetPhysicalDeviceDisplayPlaneProperties2KHRFunction = function VkResult(VkPhysicalDevice physicalDevice, uint32* pPropertyCount, VkDisplayPlaneProperties2KHR* pProperties);
		private static vkGetPhysicalDeviceDisplayPlaneProperties2KHRFunction vkGetPhysicalDeviceDisplayPlaneProperties2KHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetPhysicalDeviceDisplayPlaneProperties2KHR(VkPhysicalDevice physicalDevice, uint32* pPropertyCount, VkDisplayPlaneProperties2KHR* pProperties)
			=> vkGetPhysicalDeviceDisplayPlaneProperties2KHR_ptr(physicalDevice, pPropertyCount, pProperties);

		public typealias vkGetDisplayModeProperties2KHRFunction = function VkResult(VkPhysicalDevice physicalDevice, VkDisplayKHR display, uint32* pPropertyCount, VkDisplayModeProperties2KHR* pProperties);
		private static vkGetDisplayModeProperties2KHRFunction vkGetDisplayModeProperties2KHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetDisplayModeProperties2KHR(VkPhysicalDevice physicalDevice, VkDisplayKHR display, uint32* pPropertyCount, VkDisplayModeProperties2KHR* pProperties)
			=> vkGetDisplayModeProperties2KHR_ptr(physicalDevice, display, pPropertyCount, pProperties);

		public typealias vkGetDisplayPlaneCapabilities2KHRFunction = function VkResult(VkPhysicalDevice physicalDevice, VkDisplayPlaneInfo2KHR* pDisplayPlaneInfo, VkDisplayPlaneCapabilities2KHR* pCapabilities);
		private static vkGetDisplayPlaneCapabilities2KHRFunction vkGetDisplayPlaneCapabilities2KHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetDisplayPlaneCapabilities2KHR(VkPhysicalDevice physicalDevice, VkDisplayPlaneInfo2KHR* pDisplayPlaneInfo, VkDisplayPlaneCapabilities2KHR* pCapabilities)
			=> vkGetDisplayPlaneCapabilities2KHR_ptr(physicalDevice, pDisplayPlaneInfo, pCapabilities);

		public typealias vkCreateIOSSurfaceMVKFunction = function VkResult(VkInstance instance, VkIOSSurfaceCreateInfoMVK* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSurfaceKHR* pSurface);
		private static vkCreateIOSSurfaceMVKFunction vkCreateIOSSurfaceMVK_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCreateIOSSurfaceMVK(VkInstance instance, VkIOSSurfaceCreateInfoMVK* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSurfaceKHR* pSurface)
			=> vkCreateIOSSurfaceMVK_ptr(instance, pCreateInfo, pAllocator, pSurface);

		public typealias vkCreateMacOSSurfaceMVKFunction = function VkResult(VkInstance instance, VkMacOSSurfaceCreateInfoMVK* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSurfaceKHR* pSurface);
		private static vkCreateMacOSSurfaceMVKFunction vkCreateMacOSSurfaceMVK_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCreateMacOSSurfaceMVK(VkInstance instance, VkMacOSSurfaceCreateInfoMVK* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSurfaceKHR* pSurface)
			=> vkCreateMacOSSurfaceMVK_ptr(instance, pCreateInfo, pAllocator, pSurface);

		public typealias vkSetDebugUtilsObjectNameEXTFunction = function VkResult(VkDevice device, VkDebugUtilsObjectNameInfoEXT* pNameInfo);
		private static vkSetDebugUtilsObjectNameEXTFunction vkSetDebugUtilsObjectNameEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkSetDebugUtilsObjectNameEXT(VkDevice device, VkDebugUtilsObjectNameInfoEXT* pNameInfo)
			=> vkSetDebugUtilsObjectNameEXT_ptr(device, pNameInfo);

		public typealias vkSetDebugUtilsObjectTagEXTFunction = function VkResult(VkDevice device, VkDebugUtilsObjectTagInfoEXT* pTagInfo);
		private static vkSetDebugUtilsObjectTagEXTFunction vkSetDebugUtilsObjectTagEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkSetDebugUtilsObjectTagEXT(VkDevice device, VkDebugUtilsObjectTagInfoEXT* pTagInfo)
			=> vkSetDebugUtilsObjectTagEXT_ptr(device, pTagInfo);

		public typealias vkQueueBeginDebugUtilsLabelEXTFunction = function void(VkQueue queue, VkDebugUtilsLabelEXT* pLabelInfo);
		private static vkQueueBeginDebugUtilsLabelEXTFunction vkQueueBeginDebugUtilsLabelEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkQueueBeginDebugUtilsLabelEXT(VkQueue queue, VkDebugUtilsLabelEXT* pLabelInfo)
			=> vkQueueBeginDebugUtilsLabelEXT_ptr(queue, pLabelInfo);

		public typealias vkQueueEndDebugUtilsLabelEXTFunction = function void(VkQueue queue);
		private static vkQueueEndDebugUtilsLabelEXTFunction vkQueueEndDebugUtilsLabelEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkQueueEndDebugUtilsLabelEXT(VkQueue queue)
			=> vkQueueEndDebugUtilsLabelEXT_ptr(queue);

		public typealias vkQueueInsertDebugUtilsLabelEXTFunction = function void(VkQueue queue, VkDebugUtilsLabelEXT* pLabelInfo);
		private static vkQueueInsertDebugUtilsLabelEXTFunction vkQueueInsertDebugUtilsLabelEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkQueueInsertDebugUtilsLabelEXT(VkQueue queue, VkDebugUtilsLabelEXT* pLabelInfo)
			=> vkQueueInsertDebugUtilsLabelEXT_ptr(queue, pLabelInfo);

		public typealias vkCmdBeginDebugUtilsLabelEXTFunction = function void(VkCommandBuffer commandBuffer, VkDebugUtilsLabelEXT* pLabelInfo);
		private static vkCmdBeginDebugUtilsLabelEXTFunction vkCmdBeginDebugUtilsLabelEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdBeginDebugUtilsLabelEXT(VkCommandBuffer commandBuffer, VkDebugUtilsLabelEXT* pLabelInfo)
			=> vkCmdBeginDebugUtilsLabelEXT_ptr(commandBuffer, pLabelInfo);

		public typealias vkCmdEndDebugUtilsLabelEXTFunction = function void(VkCommandBuffer commandBuffer);
		private static vkCmdEndDebugUtilsLabelEXTFunction vkCmdEndDebugUtilsLabelEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdEndDebugUtilsLabelEXT(VkCommandBuffer commandBuffer)
			=> vkCmdEndDebugUtilsLabelEXT_ptr(commandBuffer);

		public typealias vkCmdInsertDebugUtilsLabelEXTFunction = function void(VkCommandBuffer commandBuffer, VkDebugUtilsLabelEXT* pLabelInfo);
		private static vkCmdInsertDebugUtilsLabelEXTFunction vkCmdInsertDebugUtilsLabelEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdInsertDebugUtilsLabelEXT(VkCommandBuffer commandBuffer, VkDebugUtilsLabelEXT* pLabelInfo)
			=> vkCmdInsertDebugUtilsLabelEXT_ptr(commandBuffer, pLabelInfo);

		public typealias vkCreateDebugUtilsMessengerEXTFunction = function VkResult(VkInstance instance, VkDebugUtilsMessengerCreateInfoEXT* pCreateInfo, VkAllocationCallbacks* pAllocator, VkDebugUtilsMessengerEXT* pMessenger);
		private static vkCreateDebugUtilsMessengerEXTFunction vkCreateDebugUtilsMessengerEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCreateDebugUtilsMessengerEXT(VkInstance instance, VkDebugUtilsMessengerCreateInfoEXT* pCreateInfo, VkAllocationCallbacks* pAllocator, VkDebugUtilsMessengerEXT* pMessenger)
			=> vkCreateDebugUtilsMessengerEXT_ptr(instance, pCreateInfo, pAllocator, pMessenger);

		public typealias vkDestroyDebugUtilsMessengerEXTFunction = function void(VkInstance instance, VkDebugUtilsMessengerEXT messenger, VkAllocationCallbacks* pAllocator);
		private static vkDestroyDebugUtilsMessengerEXTFunction vkDestroyDebugUtilsMessengerEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkDestroyDebugUtilsMessengerEXT(VkInstance instance, VkDebugUtilsMessengerEXT messenger, VkAllocationCallbacks* pAllocator)
			=> vkDestroyDebugUtilsMessengerEXT_ptr(instance, messenger, pAllocator);

		public typealias vkSubmitDebugUtilsMessageEXTFunction = function void(VkInstance instance, VkDebugUtilsMessageSeverityFlagsEXT messageSeverity, VkDebugUtilsMessageTypeFlagsEXT messageTypes, VkDebugUtilsMessengerCallbackDataEXT* pCallbackData);
		private static vkSubmitDebugUtilsMessageEXTFunction vkSubmitDebugUtilsMessageEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkSubmitDebugUtilsMessageEXT(VkInstance instance, VkDebugUtilsMessageSeverityFlagsEXT messageSeverity, VkDebugUtilsMessageTypeFlagsEXT messageTypes, VkDebugUtilsMessengerCallbackDataEXT* pCallbackData)
			=> vkSubmitDebugUtilsMessageEXT_ptr(instance, messageSeverity, messageTypes, pCallbackData);

		public typealias vkGetAndroidHardwareBufferPropertiesANDROIDFunction = function VkResult(VkDevice device, void* buffer, VkAndroidHardwareBufferPropertiesANDROID* pProperties);
		private static vkGetAndroidHardwareBufferPropertiesANDROIDFunction vkGetAndroidHardwareBufferPropertiesANDROID_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetAndroidHardwareBufferPropertiesANDROID(VkDevice device, void* buffer, VkAndroidHardwareBufferPropertiesANDROID* pProperties)
			=> vkGetAndroidHardwareBufferPropertiesANDROID_ptr(device, buffer, pProperties);

		public typealias vkGetMemoryAndroidHardwareBufferANDROIDFunction = function VkResult(VkDevice device, VkMemoryGetAndroidHardwareBufferInfoANDROID* pInfo, void* pBuffer);
		private static vkGetMemoryAndroidHardwareBufferANDROIDFunction vkGetMemoryAndroidHardwareBufferANDROID_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetMemoryAndroidHardwareBufferANDROID(VkDevice device, VkMemoryGetAndroidHardwareBufferInfoANDROID* pInfo, void* pBuffer)
			=> vkGetMemoryAndroidHardwareBufferANDROID_ptr(device, pInfo, pBuffer);

		public typealias vkCmdSetSampleLocationsEXTFunction = function void(VkCommandBuffer commandBuffer, VkSampleLocationsInfoEXT* pSampleLocationsInfo);
		private static vkCmdSetSampleLocationsEXTFunction vkCmdSetSampleLocationsEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdSetSampleLocationsEXT(VkCommandBuffer commandBuffer, VkSampleLocationsInfoEXT* pSampleLocationsInfo)
			=> vkCmdSetSampleLocationsEXT_ptr(commandBuffer, pSampleLocationsInfo);

		public typealias vkGetPhysicalDeviceMultisamplePropertiesEXTFunction = function void(VkPhysicalDevice physicalDevice, VkSampleCountFlags samples, VkMultisamplePropertiesEXT* pMultisampleProperties);
		private static vkGetPhysicalDeviceMultisamplePropertiesEXTFunction vkGetPhysicalDeviceMultisamplePropertiesEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkGetPhysicalDeviceMultisamplePropertiesEXT(VkPhysicalDevice physicalDevice, VkSampleCountFlags samples, VkMultisamplePropertiesEXT* pMultisampleProperties)
			=> vkGetPhysicalDeviceMultisamplePropertiesEXT_ptr(physicalDevice, samples, pMultisampleProperties);

		public typealias vkCreateAccelerationStructureKHRFunction = function VkResult(VkDevice device, VkAccelerationStructureCreateInfoKHR* pCreateInfo, VkAllocationCallbacks* pAllocator, VkAccelerationStructureKHR* pAccelerationStructure);
		private static vkCreateAccelerationStructureKHRFunction vkCreateAccelerationStructureKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCreateAccelerationStructureKHR(VkDevice device, VkAccelerationStructureCreateInfoKHR* pCreateInfo, VkAllocationCallbacks* pAllocator, VkAccelerationStructureKHR* pAccelerationStructure)
			=> vkCreateAccelerationStructureKHR_ptr(device, pCreateInfo, pAllocator, pAccelerationStructure);

		public typealias vkDestroyAccelerationStructureKHRFunction = function void(VkDevice device, VkAccelerationStructureKHR accelerationStructure, VkAllocationCallbacks* pAllocator);
		private static vkDestroyAccelerationStructureKHRFunction vkDestroyAccelerationStructureKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkDestroyAccelerationStructureKHR(VkDevice device, VkAccelerationStructureKHR accelerationStructure, VkAllocationCallbacks* pAllocator)
			=> vkDestroyAccelerationStructureKHR_ptr(device, accelerationStructure, pAllocator);

		public typealias vkCmdBuildAccelerationStructuresKHRFunction = function void(VkCommandBuffer commandBuffer, uint32 infoCount, VkAccelerationStructureBuildGeometryInfoKHR* pInfos, VkAccelerationStructureBuildRangeInfoKHR** ppBuildRangeInfos);
		private static vkCmdBuildAccelerationStructuresKHRFunction vkCmdBuildAccelerationStructuresKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdBuildAccelerationStructuresKHR(VkCommandBuffer commandBuffer, uint32 infoCount, VkAccelerationStructureBuildGeometryInfoKHR* pInfos, VkAccelerationStructureBuildRangeInfoKHR** ppBuildRangeInfos)
			=> vkCmdBuildAccelerationStructuresKHR_ptr(commandBuffer, infoCount, pInfos, ppBuildRangeInfos);

		public typealias vkCmdBuildAccelerationStructuresIndirectKHRFunction = function void(VkCommandBuffer commandBuffer, uint32 infoCount, VkAccelerationStructureBuildGeometryInfoKHR* pInfos, uint64* pIndirectDeviceAddresses, uint32* pIndirectStrides, uint32** ppMaxPrimitiveCounts);
		private static vkCmdBuildAccelerationStructuresIndirectKHRFunction vkCmdBuildAccelerationStructuresIndirectKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdBuildAccelerationStructuresIndirectKHR(VkCommandBuffer commandBuffer, uint32 infoCount, VkAccelerationStructureBuildGeometryInfoKHR* pInfos, uint64* pIndirectDeviceAddresses, uint32* pIndirectStrides, uint32** ppMaxPrimitiveCounts)
			=> vkCmdBuildAccelerationStructuresIndirectKHR_ptr(commandBuffer, infoCount, pInfos, pIndirectDeviceAddresses, pIndirectStrides, ppMaxPrimitiveCounts);

		public typealias vkBuildAccelerationStructuresKHRFunction = function VkResult(VkDevice device, VkDeferredOperationKHR deferredOperation, uint32 infoCount, VkAccelerationStructureBuildGeometryInfoKHR* pInfos, VkAccelerationStructureBuildRangeInfoKHR** ppBuildRangeInfos);
		private static vkBuildAccelerationStructuresKHRFunction vkBuildAccelerationStructuresKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkBuildAccelerationStructuresKHR(VkDevice device, VkDeferredOperationKHR deferredOperation, uint32 infoCount, VkAccelerationStructureBuildGeometryInfoKHR* pInfos, VkAccelerationStructureBuildRangeInfoKHR** ppBuildRangeInfos)
			=> vkBuildAccelerationStructuresKHR_ptr(device, deferredOperation, infoCount, pInfos, ppBuildRangeInfos);

		public typealias vkCopyAccelerationStructureKHRFunction = function VkResult(VkDevice device, VkDeferredOperationKHR deferredOperation, VkCopyAccelerationStructureInfoKHR* pInfo);
		private static vkCopyAccelerationStructureKHRFunction vkCopyAccelerationStructureKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCopyAccelerationStructureKHR(VkDevice device, VkDeferredOperationKHR deferredOperation, VkCopyAccelerationStructureInfoKHR* pInfo)
			=> vkCopyAccelerationStructureKHR_ptr(device, deferredOperation, pInfo);

		public typealias vkCopyAccelerationStructureToMemoryKHRFunction = function VkResult(VkDevice device, VkDeferredOperationKHR deferredOperation, VkCopyAccelerationStructureToMemoryInfoKHR* pInfo);
		private static vkCopyAccelerationStructureToMemoryKHRFunction vkCopyAccelerationStructureToMemoryKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCopyAccelerationStructureToMemoryKHR(VkDevice device, VkDeferredOperationKHR deferredOperation, VkCopyAccelerationStructureToMemoryInfoKHR* pInfo)
			=> vkCopyAccelerationStructureToMemoryKHR_ptr(device, deferredOperation, pInfo);

		public typealias vkCopyMemoryToAccelerationStructureKHRFunction = function VkResult(VkDevice device, VkDeferredOperationKHR deferredOperation, VkCopyMemoryToAccelerationStructureInfoKHR* pInfo);
		private static vkCopyMemoryToAccelerationStructureKHRFunction vkCopyMemoryToAccelerationStructureKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCopyMemoryToAccelerationStructureKHR(VkDevice device, VkDeferredOperationKHR deferredOperation, VkCopyMemoryToAccelerationStructureInfoKHR* pInfo)
			=> vkCopyMemoryToAccelerationStructureKHR_ptr(device, deferredOperation, pInfo);

		public typealias vkWriteAccelerationStructuresPropertiesKHRFunction = function VkResult(VkDevice device, uint32 accelerationStructureCount, VkAccelerationStructureKHR* pAccelerationStructures, VkQueryType queryType, uint dataSize, void* pData, uint stride);
		private static vkWriteAccelerationStructuresPropertiesKHRFunction vkWriteAccelerationStructuresPropertiesKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkWriteAccelerationStructuresPropertiesKHR(VkDevice device, uint32 accelerationStructureCount, VkAccelerationStructureKHR* pAccelerationStructures, VkQueryType queryType, uint dataSize, void* pData, uint stride)
			=> vkWriteAccelerationStructuresPropertiesKHR_ptr(device, accelerationStructureCount, pAccelerationStructures, queryType, dataSize, pData, stride);

		public typealias vkCmdCopyAccelerationStructureKHRFunction = function void(VkCommandBuffer commandBuffer, VkCopyAccelerationStructureInfoKHR* pInfo);
		private static vkCmdCopyAccelerationStructureKHRFunction vkCmdCopyAccelerationStructureKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdCopyAccelerationStructureKHR(VkCommandBuffer commandBuffer, VkCopyAccelerationStructureInfoKHR* pInfo)
			=> vkCmdCopyAccelerationStructureKHR_ptr(commandBuffer, pInfo);

		public typealias vkCmdCopyAccelerationStructureToMemoryKHRFunction = function void(VkCommandBuffer commandBuffer, VkCopyAccelerationStructureToMemoryInfoKHR* pInfo);
		private static vkCmdCopyAccelerationStructureToMemoryKHRFunction vkCmdCopyAccelerationStructureToMemoryKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdCopyAccelerationStructureToMemoryKHR(VkCommandBuffer commandBuffer, VkCopyAccelerationStructureToMemoryInfoKHR* pInfo)
			=> vkCmdCopyAccelerationStructureToMemoryKHR_ptr(commandBuffer, pInfo);

		public typealias vkCmdCopyMemoryToAccelerationStructureKHRFunction = function void(VkCommandBuffer commandBuffer, VkCopyMemoryToAccelerationStructureInfoKHR* pInfo);
		private static vkCmdCopyMemoryToAccelerationStructureKHRFunction vkCmdCopyMemoryToAccelerationStructureKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdCopyMemoryToAccelerationStructureKHR(VkCommandBuffer commandBuffer, VkCopyMemoryToAccelerationStructureInfoKHR* pInfo)
			=> vkCmdCopyMemoryToAccelerationStructureKHR_ptr(commandBuffer, pInfo);

		public typealias vkGetAccelerationStructureDeviceAddressKHRFunction = function uint64(VkDevice device, VkAccelerationStructureDeviceAddressInfoKHR* pInfo);
		private static vkGetAccelerationStructureDeviceAddressKHRFunction vkGetAccelerationStructureDeviceAddressKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static uint64 vkGetAccelerationStructureDeviceAddressKHR(VkDevice device, VkAccelerationStructureDeviceAddressInfoKHR* pInfo)
			=> vkGetAccelerationStructureDeviceAddressKHR_ptr(device, pInfo);

		public typealias vkCmdWriteAccelerationStructuresPropertiesKHRFunction = function void(VkCommandBuffer commandBuffer, uint32 accelerationStructureCount, VkAccelerationStructureKHR* pAccelerationStructures, VkQueryType queryType, VkQueryPool queryPool, uint32 firstQuery);
		private static vkCmdWriteAccelerationStructuresPropertiesKHRFunction vkCmdWriteAccelerationStructuresPropertiesKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdWriteAccelerationStructuresPropertiesKHR(VkCommandBuffer commandBuffer, uint32 accelerationStructureCount, VkAccelerationStructureKHR* pAccelerationStructures, VkQueryType queryType, VkQueryPool queryPool, uint32 firstQuery)
			=> vkCmdWriteAccelerationStructuresPropertiesKHR_ptr(commandBuffer, accelerationStructureCount, pAccelerationStructures, queryType, queryPool, firstQuery);

		public typealias vkGetDeviceAccelerationStructureCompatibilityKHRFunction = function void(VkDevice device, VkAccelerationStructureVersionInfoKHR* pVersionInfo, VkAccelerationStructureCompatibilityKHR* pCompatibility);
		private static vkGetDeviceAccelerationStructureCompatibilityKHRFunction vkGetDeviceAccelerationStructureCompatibilityKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkGetDeviceAccelerationStructureCompatibilityKHR(VkDevice device, VkAccelerationStructureVersionInfoKHR* pVersionInfo, VkAccelerationStructureCompatibilityKHR* pCompatibility)
			=> vkGetDeviceAccelerationStructureCompatibilityKHR_ptr(device, pVersionInfo, pCompatibility);

		public typealias vkGetAccelerationStructureBuildSizesKHRFunction = function void(VkDevice device, VkAccelerationStructureBuildTypeKHR buildType, VkAccelerationStructureBuildGeometryInfoKHR* pBuildInfo, uint32* pMaxPrimitiveCounts, VkAccelerationStructureBuildSizesInfoKHR* pSizeInfo);
		private static vkGetAccelerationStructureBuildSizesKHRFunction vkGetAccelerationStructureBuildSizesKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkGetAccelerationStructureBuildSizesKHR(VkDevice device, VkAccelerationStructureBuildTypeKHR buildType, VkAccelerationStructureBuildGeometryInfoKHR* pBuildInfo, uint32* pMaxPrimitiveCounts, VkAccelerationStructureBuildSizesInfoKHR* pSizeInfo)
			=> vkGetAccelerationStructureBuildSizesKHR_ptr(device, buildType, pBuildInfo, pMaxPrimitiveCounts, pSizeInfo);

		public typealias vkCmdTraceRaysKHRFunction = function void(VkCommandBuffer commandBuffer, VkStridedDeviceAddressRegionKHR* pRaygenShaderBindingTable, VkStridedDeviceAddressRegionKHR* pMissShaderBindingTable, VkStridedDeviceAddressRegionKHR* pHitShaderBindingTable, VkStridedDeviceAddressRegionKHR* pCallableShaderBindingTable, uint32 width, uint32 height, uint32 depth);
		private static vkCmdTraceRaysKHRFunction vkCmdTraceRaysKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdTraceRaysKHR(VkCommandBuffer commandBuffer, VkStridedDeviceAddressRegionKHR* pRaygenShaderBindingTable, VkStridedDeviceAddressRegionKHR* pMissShaderBindingTable, VkStridedDeviceAddressRegionKHR* pHitShaderBindingTable, VkStridedDeviceAddressRegionKHR* pCallableShaderBindingTable, uint32 width, uint32 height, uint32 depth)
			=> vkCmdTraceRaysKHR_ptr(commandBuffer, pRaygenShaderBindingTable, pMissShaderBindingTable, pHitShaderBindingTable, pCallableShaderBindingTable, width, height, depth);

		public typealias vkCreateRayTracingPipelinesKHRFunction = function VkResult(VkDevice device, VkDeferredOperationKHR deferredOperation, VkPipelineCache pipelineCache, uint32 createInfoCount, VkRayTracingPipelineCreateInfoKHR* pCreateInfos, VkAllocationCallbacks* pAllocator, VkPipeline* pPipelines);
		private static vkCreateRayTracingPipelinesKHRFunction vkCreateRayTracingPipelinesKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCreateRayTracingPipelinesKHR(VkDevice device, VkDeferredOperationKHR deferredOperation, VkPipelineCache pipelineCache, uint32 createInfoCount, VkRayTracingPipelineCreateInfoKHR* pCreateInfos, VkAllocationCallbacks* pAllocator, VkPipeline* pPipelines)
			=> vkCreateRayTracingPipelinesKHR_ptr(device, deferredOperation, pipelineCache, createInfoCount, pCreateInfos, pAllocator, pPipelines);

		public typealias vkGetRayTracingShaderGroupHandlesKHRFunction = function VkResult(VkDevice device, VkPipeline pipeline, uint32 firstGroup, uint32 groupCount, uint dataSize, void* pData);
		private static vkGetRayTracingShaderGroupHandlesKHRFunction vkGetRayTracingShaderGroupHandlesKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetRayTracingShaderGroupHandlesKHR(VkDevice device, VkPipeline pipeline, uint32 firstGroup, uint32 groupCount, uint dataSize, void* pData)
			=> vkGetRayTracingShaderGroupHandlesKHR_ptr(device, pipeline, firstGroup, groupCount, dataSize, pData);

		public typealias vkGetRayTracingCaptureReplayShaderGroupHandlesKHRFunction = function VkResult(VkDevice device, VkPipeline pipeline, uint32 firstGroup, uint32 groupCount, uint dataSize, void* pData);
		private static vkGetRayTracingCaptureReplayShaderGroupHandlesKHRFunction vkGetRayTracingCaptureReplayShaderGroupHandlesKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetRayTracingCaptureReplayShaderGroupHandlesKHR(VkDevice device, VkPipeline pipeline, uint32 firstGroup, uint32 groupCount, uint dataSize, void* pData)
			=> vkGetRayTracingCaptureReplayShaderGroupHandlesKHR_ptr(device, pipeline, firstGroup, groupCount, dataSize, pData);

		public typealias vkCmdTraceRaysIndirectKHRFunction = function void(VkCommandBuffer commandBuffer, VkStridedDeviceAddressRegionKHR* pRaygenShaderBindingTable, VkStridedDeviceAddressRegionKHR* pMissShaderBindingTable, VkStridedDeviceAddressRegionKHR* pHitShaderBindingTable, VkStridedDeviceAddressRegionKHR* pCallableShaderBindingTable, uint64 indirectDeviceAddress);
		private static vkCmdTraceRaysIndirectKHRFunction vkCmdTraceRaysIndirectKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdTraceRaysIndirectKHR(VkCommandBuffer commandBuffer, VkStridedDeviceAddressRegionKHR* pRaygenShaderBindingTable, VkStridedDeviceAddressRegionKHR* pMissShaderBindingTable, VkStridedDeviceAddressRegionKHR* pHitShaderBindingTable, VkStridedDeviceAddressRegionKHR* pCallableShaderBindingTable, uint64 indirectDeviceAddress)
			=> vkCmdTraceRaysIndirectKHR_ptr(commandBuffer, pRaygenShaderBindingTable, pMissShaderBindingTable, pHitShaderBindingTable, pCallableShaderBindingTable, indirectDeviceAddress);

		public typealias vkGetRayTracingShaderGroupStackSizeKHRFunction = function uint64(VkDevice device, VkPipeline pipeline, uint32 group, VkShaderGroupShaderKHR groupShader);
		private static vkGetRayTracingShaderGroupStackSizeKHRFunction vkGetRayTracingShaderGroupStackSizeKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static uint64 vkGetRayTracingShaderGroupStackSizeKHR(VkDevice device, VkPipeline pipeline, uint32 group, VkShaderGroupShaderKHR groupShader)
			=> vkGetRayTracingShaderGroupStackSizeKHR_ptr(device, pipeline, group, groupShader);

		public typealias vkCmdSetRayTracingPipelineStackSizeKHRFunction = function void(VkCommandBuffer commandBuffer, uint32 pipelineStackSize);
		private static vkCmdSetRayTracingPipelineStackSizeKHRFunction vkCmdSetRayTracingPipelineStackSizeKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdSetRayTracingPipelineStackSizeKHR(VkCommandBuffer commandBuffer, uint32 pipelineStackSize)
			=> vkCmdSetRayTracingPipelineStackSizeKHR_ptr(commandBuffer, pipelineStackSize);

		public typealias vkGetImageDrmFormatModifierPropertiesEXTFunction = function VkResult(VkDevice device, VkImage image, VkImageDrmFormatModifierPropertiesEXT* pProperties);
		private static vkGetImageDrmFormatModifierPropertiesEXTFunction vkGetImageDrmFormatModifierPropertiesEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetImageDrmFormatModifierPropertiesEXT(VkDevice device, VkImage image, VkImageDrmFormatModifierPropertiesEXT* pProperties)
			=> vkGetImageDrmFormatModifierPropertiesEXT_ptr(device, image, pProperties);

		public typealias vkCreateValidationCacheEXTFunction = function VkResult(VkDevice device, VkValidationCacheCreateInfoEXT* pCreateInfo, VkAllocationCallbacks* pAllocator, VkValidationCacheEXT* pValidationCache);
		private static vkCreateValidationCacheEXTFunction vkCreateValidationCacheEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCreateValidationCacheEXT(VkDevice device, VkValidationCacheCreateInfoEXT* pCreateInfo, VkAllocationCallbacks* pAllocator, VkValidationCacheEXT* pValidationCache)
			=> vkCreateValidationCacheEXT_ptr(device, pCreateInfo, pAllocator, pValidationCache);

		public typealias vkDestroyValidationCacheEXTFunction = function void(VkDevice device, VkValidationCacheEXT validationCache, VkAllocationCallbacks* pAllocator);
		private static vkDestroyValidationCacheEXTFunction vkDestroyValidationCacheEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkDestroyValidationCacheEXT(VkDevice device, VkValidationCacheEXT validationCache, VkAllocationCallbacks* pAllocator)
			=> vkDestroyValidationCacheEXT_ptr(device, validationCache, pAllocator);

		public typealias vkMergeValidationCachesEXTFunction = function VkResult(VkDevice device, VkValidationCacheEXT dstCache, uint32 srcCacheCount, VkValidationCacheEXT* pSrcCaches);
		private static vkMergeValidationCachesEXTFunction vkMergeValidationCachesEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkMergeValidationCachesEXT(VkDevice device, VkValidationCacheEXT dstCache, uint32 srcCacheCount, VkValidationCacheEXT* pSrcCaches)
			=> vkMergeValidationCachesEXT_ptr(device, dstCache, srcCacheCount, pSrcCaches);

		public typealias vkGetValidationCacheDataEXTFunction = function VkResult(VkDevice device, VkValidationCacheEXT validationCache, uint* pDataSize, void* pData);
		private static vkGetValidationCacheDataEXTFunction vkGetValidationCacheDataEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetValidationCacheDataEXT(VkDevice device, VkValidationCacheEXT validationCache, uint* pDataSize, void* pData)
			=> vkGetValidationCacheDataEXT_ptr(device, validationCache, pDataSize, pData);

		public typealias vkCmdBindShadingRateImageNVFunction = function void(VkCommandBuffer commandBuffer, VkImageView imageView, VkImageLayout imageLayout);
		private static vkCmdBindShadingRateImageNVFunction vkCmdBindShadingRateImageNV_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdBindShadingRateImageNV(VkCommandBuffer commandBuffer, VkImageView imageView, VkImageLayout imageLayout)
			=> vkCmdBindShadingRateImageNV_ptr(commandBuffer, imageView, imageLayout);

		public typealias vkCmdSetViewportShadingRatePaletteNVFunction = function void(VkCommandBuffer commandBuffer, uint32 firstViewport, uint32 viewportCount, VkShadingRatePaletteNV* pShadingRatePalettes);
		private static vkCmdSetViewportShadingRatePaletteNVFunction vkCmdSetViewportShadingRatePaletteNV_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdSetViewportShadingRatePaletteNV(VkCommandBuffer commandBuffer, uint32 firstViewport, uint32 viewportCount, VkShadingRatePaletteNV* pShadingRatePalettes)
			=> vkCmdSetViewportShadingRatePaletteNV_ptr(commandBuffer, firstViewport, viewportCount, pShadingRatePalettes);

		public typealias vkCmdSetCoarseSampleOrderNVFunction = function void(VkCommandBuffer commandBuffer, VkCoarseSampleOrderTypeNV sampleOrderType, uint32 customSampleOrderCount, VkCoarseSampleOrderCustomNV* pCustomSampleOrders);
		private static vkCmdSetCoarseSampleOrderNVFunction vkCmdSetCoarseSampleOrderNV_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdSetCoarseSampleOrderNV(VkCommandBuffer commandBuffer, VkCoarseSampleOrderTypeNV sampleOrderType, uint32 customSampleOrderCount, VkCoarseSampleOrderCustomNV* pCustomSampleOrders)
			=> vkCmdSetCoarseSampleOrderNV_ptr(commandBuffer, sampleOrderType, customSampleOrderCount, pCustomSampleOrders);

		public typealias vkCreateAccelerationStructureNVFunction = function VkResult(VkDevice device, VkAccelerationStructureCreateInfoNV* pCreateInfo, VkAllocationCallbacks* pAllocator, VkAccelerationStructureNV* pAccelerationStructure);
		private static vkCreateAccelerationStructureNVFunction vkCreateAccelerationStructureNV_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCreateAccelerationStructureNV(VkDevice device, VkAccelerationStructureCreateInfoNV* pCreateInfo, VkAllocationCallbacks* pAllocator, VkAccelerationStructureNV* pAccelerationStructure)
			=> vkCreateAccelerationStructureNV_ptr(device, pCreateInfo, pAllocator, pAccelerationStructure);

		public typealias vkDestroyAccelerationStructureNVFunction = function void(VkDevice device, VkAccelerationStructureNV accelerationStructure, VkAllocationCallbacks* pAllocator);
		private static vkDestroyAccelerationStructureNVFunction vkDestroyAccelerationStructureNV_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkDestroyAccelerationStructureNV(VkDevice device, VkAccelerationStructureNV accelerationStructure, VkAllocationCallbacks* pAllocator)
			=> vkDestroyAccelerationStructureNV_ptr(device, accelerationStructure, pAllocator);

		public typealias vkGetAccelerationStructureMemoryRequirementsNVFunction = function void(VkDevice device, VkAccelerationStructureMemoryRequirementsInfoNV* pInfo, VkMemoryRequirements2* pMemoryRequirements);
		private static vkGetAccelerationStructureMemoryRequirementsNVFunction vkGetAccelerationStructureMemoryRequirementsNV_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkGetAccelerationStructureMemoryRequirementsNV(VkDevice device, VkAccelerationStructureMemoryRequirementsInfoNV* pInfo, VkMemoryRequirements2* pMemoryRequirements)
			=> vkGetAccelerationStructureMemoryRequirementsNV_ptr(device, pInfo, pMemoryRequirements);

		public typealias vkBindAccelerationStructureMemoryNVFunction = function VkResult(VkDevice device, uint32 bindInfoCount, VkBindAccelerationStructureMemoryInfoNV* pBindInfos);
		private static vkBindAccelerationStructureMemoryNVFunction vkBindAccelerationStructureMemoryNV_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkBindAccelerationStructureMemoryNV(VkDevice device, uint32 bindInfoCount, VkBindAccelerationStructureMemoryInfoNV* pBindInfos)
			=> vkBindAccelerationStructureMemoryNV_ptr(device, bindInfoCount, pBindInfos);

		public typealias vkCmdBuildAccelerationStructureNVFunction = function void(VkCommandBuffer commandBuffer, VkAccelerationStructureInfoNV* pInfo, VkBuffer instanceData, uint64 instanceOffset, VkBool32 update, VkAccelerationStructureNV dst, VkAccelerationStructureNV src, VkBuffer scratch, uint64 scratchOffset);
		private static vkCmdBuildAccelerationStructureNVFunction vkCmdBuildAccelerationStructureNV_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdBuildAccelerationStructureNV(VkCommandBuffer commandBuffer, VkAccelerationStructureInfoNV* pInfo, VkBuffer instanceData, uint64 instanceOffset, VkBool32 update, VkAccelerationStructureNV dst, VkAccelerationStructureNV src, VkBuffer scratch, uint64 scratchOffset)
			=> vkCmdBuildAccelerationStructureNV_ptr(commandBuffer, pInfo, instanceData, instanceOffset, update, dst, src, scratch, scratchOffset);

		public typealias vkCmdCopyAccelerationStructureNVFunction = function void(VkCommandBuffer commandBuffer, VkAccelerationStructureNV dst, VkAccelerationStructureNV src, VkCopyAccelerationStructureModeKHR mode);
		private static vkCmdCopyAccelerationStructureNVFunction vkCmdCopyAccelerationStructureNV_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdCopyAccelerationStructureNV(VkCommandBuffer commandBuffer, VkAccelerationStructureNV dst, VkAccelerationStructureNV src, VkCopyAccelerationStructureModeKHR mode)
			=> vkCmdCopyAccelerationStructureNV_ptr(commandBuffer, dst, src, mode);

		public typealias vkCmdTraceRaysNVFunction = function void(VkCommandBuffer commandBuffer, VkBuffer raygenShaderBindingTableBuffer, uint64 raygenShaderBindingOffset, VkBuffer missShaderBindingTableBuffer, uint64 missShaderBindingOffset, uint64 missShaderBindingStride, VkBuffer hitShaderBindingTableBuffer, uint64 hitShaderBindingOffset, uint64 hitShaderBindingStride, VkBuffer callableShaderBindingTableBuffer, uint64 callableShaderBindingOffset, uint64 callableShaderBindingStride, uint32 width, uint32 height, uint32 depth);
		private static vkCmdTraceRaysNVFunction vkCmdTraceRaysNV_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdTraceRaysNV(VkCommandBuffer commandBuffer, VkBuffer raygenShaderBindingTableBuffer, uint64 raygenShaderBindingOffset, VkBuffer missShaderBindingTableBuffer, uint64 missShaderBindingOffset, uint64 missShaderBindingStride, VkBuffer hitShaderBindingTableBuffer, uint64 hitShaderBindingOffset, uint64 hitShaderBindingStride, VkBuffer callableShaderBindingTableBuffer, uint64 callableShaderBindingOffset, uint64 callableShaderBindingStride, uint32 width, uint32 height, uint32 depth)
			=> vkCmdTraceRaysNV_ptr(commandBuffer, raygenShaderBindingTableBuffer, raygenShaderBindingOffset, missShaderBindingTableBuffer, missShaderBindingOffset, missShaderBindingStride, hitShaderBindingTableBuffer, hitShaderBindingOffset, hitShaderBindingStride, callableShaderBindingTableBuffer, callableShaderBindingOffset, callableShaderBindingStride, width, height, depth);

		public typealias vkCreateRayTracingPipelinesNVFunction = function VkResult(VkDevice device, VkPipelineCache pipelineCache, uint32 createInfoCount, VkRayTracingPipelineCreateInfoNV* pCreateInfos, VkAllocationCallbacks* pAllocator, VkPipeline* pPipelines);
		private static vkCreateRayTracingPipelinesNVFunction vkCreateRayTracingPipelinesNV_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCreateRayTracingPipelinesNV(VkDevice device, VkPipelineCache pipelineCache, uint32 createInfoCount, VkRayTracingPipelineCreateInfoNV* pCreateInfos, VkAllocationCallbacks* pAllocator, VkPipeline* pPipelines)
			=> vkCreateRayTracingPipelinesNV_ptr(device, pipelineCache, createInfoCount, pCreateInfos, pAllocator, pPipelines);

		public typealias vkGetAccelerationStructureHandleNVFunction = function VkResult(VkDevice device, VkAccelerationStructureNV accelerationStructure, uint dataSize, void* pData);
		private static vkGetAccelerationStructureHandleNVFunction vkGetAccelerationStructureHandleNV_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetAccelerationStructureHandleNV(VkDevice device, VkAccelerationStructureNV accelerationStructure, uint dataSize, void* pData)
			=> vkGetAccelerationStructureHandleNV_ptr(device, accelerationStructure, dataSize, pData);

		public typealias vkCmdWriteAccelerationStructuresPropertiesNVFunction = function void(VkCommandBuffer commandBuffer, uint32 accelerationStructureCount, VkAccelerationStructureNV* pAccelerationStructures, VkQueryType queryType, VkQueryPool queryPool, uint32 firstQuery);
		private static vkCmdWriteAccelerationStructuresPropertiesNVFunction vkCmdWriteAccelerationStructuresPropertiesNV_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdWriteAccelerationStructuresPropertiesNV(VkCommandBuffer commandBuffer, uint32 accelerationStructureCount, VkAccelerationStructureNV* pAccelerationStructures, VkQueryType queryType, VkQueryPool queryPool, uint32 firstQuery)
			=> vkCmdWriteAccelerationStructuresPropertiesNV_ptr(commandBuffer, accelerationStructureCount, pAccelerationStructures, queryType, queryPool, firstQuery);

		public typealias vkCompileDeferredNVFunction = function VkResult(VkDevice device, VkPipeline pipeline, uint32 shader);
		private static vkCompileDeferredNVFunction vkCompileDeferredNV_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCompileDeferredNV(VkDevice device, VkPipeline pipeline, uint32 shader)
			=> vkCompileDeferredNV_ptr(device, pipeline, shader);

		public typealias vkGetMemoryHostPointerPropertiesEXTFunction = function VkResult(VkDevice device, VkExternalMemoryHandleTypeFlags handleType, void* pHostPointer, VkMemoryHostPointerPropertiesEXT* pMemoryHostPointerProperties);
		private static vkGetMemoryHostPointerPropertiesEXTFunction vkGetMemoryHostPointerPropertiesEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetMemoryHostPointerPropertiesEXT(VkDevice device, VkExternalMemoryHandleTypeFlags handleType, void* pHostPointer, VkMemoryHostPointerPropertiesEXT* pMemoryHostPointerProperties)
			=> vkGetMemoryHostPointerPropertiesEXT_ptr(device, handleType, pHostPointer, pMemoryHostPointerProperties);

		public typealias vkCmdWriteBufferMarkerAMDFunction = function void(VkCommandBuffer commandBuffer, VkPipelineStageFlags pipelineStage, VkBuffer dstBuffer, uint64 dstOffset, uint32 marker);
		private static vkCmdWriteBufferMarkerAMDFunction vkCmdWriteBufferMarkerAMD_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdWriteBufferMarkerAMD(VkCommandBuffer commandBuffer, VkPipelineStageFlags pipelineStage, VkBuffer dstBuffer, uint64 dstOffset, uint32 marker)
			=> vkCmdWriteBufferMarkerAMD_ptr(commandBuffer, pipelineStage, dstBuffer, dstOffset, marker);

		public typealias vkGetPhysicalDeviceCalibrateableTimeDomainsEXTFunction = function VkResult(VkPhysicalDevice physicalDevice, uint32* pTimeDomainCount, VkTimeDomainEXT* pTimeDomains);
		private static vkGetPhysicalDeviceCalibrateableTimeDomainsEXTFunction vkGetPhysicalDeviceCalibrateableTimeDomainsEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetPhysicalDeviceCalibrateableTimeDomainsEXT(VkPhysicalDevice physicalDevice, uint32* pTimeDomainCount, VkTimeDomainEXT* pTimeDomains)
			=> vkGetPhysicalDeviceCalibrateableTimeDomainsEXT_ptr(physicalDevice, pTimeDomainCount, pTimeDomains);

		public typealias vkGetCalibratedTimestampsEXTFunction = function VkResult(VkDevice device, uint32 timestampCount, VkCalibratedTimestampInfoEXT* pTimestampInfos, uint64* pTimestamps, uint64* pMaxDeviation);
		private static vkGetCalibratedTimestampsEXTFunction vkGetCalibratedTimestampsEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetCalibratedTimestampsEXT(VkDevice device, uint32 timestampCount, VkCalibratedTimestampInfoEXT* pTimestampInfos, uint64* pTimestamps, uint64* pMaxDeviation)
			=> vkGetCalibratedTimestampsEXT_ptr(device, timestampCount, pTimestampInfos, pTimestamps, pMaxDeviation);

		public typealias vkCmdDrawMeshTasksNVFunction = function void(VkCommandBuffer commandBuffer, uint32 taskCount, uint32 firstTask);
		private static vkCmdDrawMeshTasksNVFunction vkCmdDrawMeshTasksNV_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdDrawMeshTasksNV(VkCommandBuffer commandBuffer, uint32 taskCount, uint32 firstTask)
			=> vkCmdDrawMeshTasksNV_ptr(commandBuffer, taskCount, firstTask);

		public typealias vkCmdDrawMeshTasksIndirectNVFunction = function void(VkCommandBuffer commandBuffer, VkBuffer buffer, uint64 offset, uint32 drawCount, uint32 stride);
		private static vkCmdDrawMeshTasksIndirectNVFunction vkCmdDrawMeshTasksIndirectNV_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdDrawMeshTasksIndirectNV(VkCommandBuffer commandBuffer, VkBuffer buffer, uint64 offset, uint32 drawCount, uint32 stride)
			=> vkCmdDrawMeshTasksIndirectNV_ptr(commandBuffer, buffer, offset, drawCount, stride);

		public typealias vkCmdDrawMeshTasksIndirectCountNVFunction = function void(VkCommandBuffer commandBuffer, VkBuffer buffer, uint64 offset, VkBuffer countBuffer, uint64 countBufferOffset, uint32 maxDrawCount, uint32 stride);
		private static vkCmdDrawMeshTasksIndirectCountNVFunction vkCmdDrawMeshTasksIndirectCountNV_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdDrawMeshTasksIndirectCountNV(VkCommandBuffer commandBuffer, VkBuffer buffer, uint64 offset, VkBuffer countBuffer, uint64 countBufferOffset, uint32 maxDrawCount, uint32 stride)
			=> vkCmdDrawMeshTasksIndirectCountNV_ptr(commandBuffer, buffer, offset, countBuffer, countBufferOffset, maxDrawCount, stride);

		public typealias vkCmdSetExclusiveScissorNVFunction = function void(VkCommandBuffer commandBuffer, uint32 firstExclusiveScissor, uint32 exclusiveScissorCount, VkRect2D* pExclusiveScissors);
		private static vkCmdSetExclusiveScissorNVFunction vkCmdSetExclusiveScissorNV_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdSetExclusiveScissorNV(VkCommandBuffer commandBuffer, uint32 firstExclusiveScissor, uint32 exclusiveScissorCount, VkRect2D* pExclusiveScissors)
			=> vkCmdSetExclusiveScissorNV_ptr(commandBuffer, firstExclusiveScissor, exclusiveScissorCount, pExclusiveScissors);

		public typealias vkCmdSetCheckpointNVFunction = function void(VkCommandBuffer commandBuffer, void* pCheckpointMarker);
		private static vkCmdSetCheckpointNVFunction vkCmdSetCheckpointNV_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdSetCheckpointNV(VkCommandBuffer commandBuffer, void* pCheckpointMarker)
			=> vkCmdSetCheckpointNV_ptr(commandBuffer, pCheckpointMarker);

		public typealias vkGetQueueCheckpointDataNVFunction = function void(VkQueue queue, uint32* pCheckpointDataCount, VkCheckpointDataNV* pCheckpointData);
		private static vkGetQueueCheckpointDataNVFunction vkGetQueueCheckpointDataNV_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkGetQueueCheckpointDataNV(VkQueue queue, uint32* pCheckpointDataCount, VkCheckpointDataNV* pCheckpointData)
			=> vkGetQueueCheckpointDataNV_ptr(queue, pCheckpointDataCount, pCheckpointData);

		public typealias vkInitializePerformanceApiINTELFunction = function VkResult(VkDevice device, VkInitializePerformanceApiInfoINTEL* pInitializeInfo);
		private static vkInitializePerformanceApiINTELFunction vkInitializePerformanceApiINTEL_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkInitializePerformanceApiINTEL(VkDevice device, VkInitializePerformanceApiInfoINTEL* pInitializeInfo)
			=> vkInitializePerformanceApiINTEL_ptr(device, pInitializeInfo);

		public typealias vkUninitializePerformanceApiINTELFunction = function void(VkDevice device);
		private static vkUninitializePerformanceApiINTELFunction vkUninitializePerformanceApiINTEL_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkUninitializePerformanceApiINTEL(VkDevice device)
			=> vkUninitializePerformanceApiINTEL_ptr(device);

		public typealias vkCmdSetPerformanceMarkerINTELFunction = function VkResult(VkCommandBuffer commandBuffer, VkPerformanceMarkerInfoINTEL* pMarkerInfo);
		private static vkCmdSetPerformanceMarkerINTELFunction vkCmdSetPerformanceMarkerINTEL_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCmdSetPerformanceMarkerINTEL(VkCommandBuffer commandBuffer, VkPerformanceMarkerInfoINTEL* pMarkerInfo)
			=> vkCmdSetPerformanceMarkerINTEL_ptr(commandBuffer, pMarkerInfo);

		public typealias vkCmdSetPerformanceStreamMarkerINTELFunction = function VkResult(VkCommandBuffer commandBuffer, VkPerformanceStreamMarkerInfoINTEL* pMarkerInfo);
		private static vkCmdSetPerformanceStreamMarkerINTELFunction vkCmdSetPerformanceStreamMarkerINTEL_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCmdSetPerformanceStreamMarkerINTEL(VkCommandBuffer commandBuffer, VkPerformanceStreamMarkerInfoINTEL* pMarkerInfo)
			=> vkCmdSetPerformanceStreamMarkerINTEL_ptr(commandBuffer, pMarkerInfo);

		public typealias vkCmdSetPerformanceOverrideINTELFunction = function VkResult(VkCommandBuffer commandBuffer, VkPerformanceOverrideInfoINTEL* pOverrideInfo);
		private static vkCmdSetPerformanceOverrideINTELFunction vkCmdSetPerformanceOverrideINTEL_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCmdSetPerformanceOverrideINTEL(VkCommandBuffer commandBuffer, VkPerformanceOverrideInfoINTEL* pOverrideInfo)
			=> vkCmdSetPerformanceOverrideINTEL_ptr(commandBuffer, pOverrideInfo);

		public typealias vkAcquirePerformanceConfigurationINTELFunction = function VkResult(VkDevice device, VkPerformanceConfigurationAcquireInfoINTEL* pAcquireInfo, VkPerformanceConfigurationINTEL* pConfiguration);
		private static vkAcquirePerformanceConfigurationINTELFunction vkAcquirePerformanceConfigurationINTEL_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkAcquirePerformanceConfigurationINTEL(VkDevice device, VkPerformanceConfigurationAcquireInfoINTEL* pAcquireInfo, VkPerformanceConfigurationINTEL* pConfiguration)
			=> vkAcquirePerformanceConfigurationINTEL_ptr(device, pAcquireInfo, pConfiguration);

		public typealias vkReleasePerformanceConfigurationINTELFunction = function VkResult(VkDevice device, VkPerformanceConfigurationINTEL configuration);
		private static vkReleasePerformanceConfigurationINTELFunction vkReleasePerformanceConfigurationINTEL_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkReleasePerformanceConfigurationINTEL(VkDevice device, VkPerformanceConfigurationINTEL configuration)
			=> vkReleasePerformanceConfigurationINTEL_ptr(device, configuration);

		public typealias vkQueueSetPerformanceConfigurationINTELFunction = function VkResult(VkQueue queue, VkPerformanceConfigurationINTEL configuration);
		private static vkQueueSetPerformanceConfigurationINTELFunction vkQueueSetPerformanceConfigurationINTEL_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkQueueSetPerformanceConfigurationINTEL(VkQueue queue, VkPerformanceConfigurationINTEL configuration)
			=> vkQueueSetPerformanceConfigurationINTEL_ptr(queue, configuration);

		public typealias vkGetPerformanceParameterINTELFunction = function VkResult(VkDevice device, VkPerformanceParameterTypeINTEL parameter, VkPerformanceValueINTEL* pValue);
		private static vkGetPerformanceParameterINTELFunction vkGetPerformanceParameterINTEL_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetPerformanceParameterINTEL(VkDevice device, VkPerformanceParameterTypeINTEL parameter, VkPerformanceValueINTEL* pValue)
			=> vkGetPerformanceParameterINTEL_ptr(device, parameter, pValue);

		public typealias vkSetLocalDimmingAMDFunction = function void(VkDevice device, VkSwapchainKHR swapChain, VkBool32 localDimmingEnable);
		private static vkSetLocalDimmingAMDFunction vkSetLocalDimmingAMD_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkSetLocalDimmingAMD(VkDevice device, VkSwapchainKHR swapChain, VkBool32 localDimmingEnable)
			=> vkSetLocalDimmingAMD_ptr(device, swapChain, localDimmingEnable);

		public typealias vkCreateImagePipeSurfaceFUCHSIAFunction = function VkResult(VkInstance instance, VkImagePipeSurfaceCreateInfoFUCHSIA* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSurfaceKHR* pSurface);
		private static vkCreateImagePipeSurfaceFUCHSIAFunction vkCreateImagePipeSurfaceFUCHSIA_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCreateImagePipeSurfaceFUCHSIA(VkInstance instance, VkImagePipeSurfaceCreateInfoFUCHSIA* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSurfaceKHR* pSurface)
			=> vkCreateImagePipeSurfaceFUCHSIA_ptr(instance, pCreateInfo, pAllocator, pSurface);

		public typealias vkCreateMetalSurfaceEXTFunction = function VkResult(VkInstance instance, VkMetalSurfaceCreateInfoEXT* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSurfaceKHR* pSurface);
		private static vkCreateMetalSurfaceEXTFunction vkCreateMetalSurfaceEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCreateMetalSurfaceEXT(VkInstance instance, VkMetalSurfaceCreateInfoEXT* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSurfaceKHR* pSurface)
			=> vkCreateMetalSurfaceEXT_ptr(instance, pCreateInfo, pAllocator, pSurface);

		public typealias vkGetPhysicalDeviceFragmentShadingRatesKHRFunction = function VkResult(VkPhysicalDevice physicalDevice, uint32* pFragmentShadingRateCount, VkPhysicalDeviceFragmentShadingRateKHR* pFragmentShadingRates);
		private static vkGetPhysicalDeviceFragmentShadingRatesKHRFunction vkGetPhysicalDeviceFragmentShadingRatesKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetPhysicalDeviceFragmentShadingRatesKHR(VkPhysicalDevice physicalDevice, uint32* pFragmentShadingRateCount, VkPhysicalDeviceFragmentShadingRateKHR* pFragmentShadingRates)
			=> vkGetPhysicalDeviceFragmentShadingRatesKHR_ptr(physicalDevice, pFragmentShadingRateCount, pFragmentShadingRates);

		public typealias vkCmdSetFragmentShadingRateKHRFunction = function void(VkCommandBuffer commandBuffer, VkExtent2D* pFragmentSize, VkFragmentShadingRateCombinerOpKHR[2] combinerOps);
		private static vkCmdSetFragmentShadingRateKHRFunction vkCmdSetFragmentShadingRateKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdSetFragmentShadingRateKHR(VkCommandBuffer commandBuffer, VkExtent2D* pFragmentSize, VkFragmentShadingRateCombinerOpKHR[2] combinerOps)
			=> vkCmdSetFragmentShadingRateKHR_ptr(commandBuffer, pFragmentSize, combinerOps);

		public typealias vkWaitForPresentKHRFunction = function VkResult(VkDevice device, VkSwapchainKHR swapchain, uint64 presentId, uint64 timeout);
		private static vkWaitForPresentKHRFunction vkWaitForPresentKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkWaitForPresentKHR(VkDevice device, VkSwapchainKHR swapchain, uint64 presentId, uint64 timeout)
			=> vkWaitForPresentKHR_ptr(device, swapchain, presentId, timeout);

		public typealias vkGetPhysicalDeviceCooperativeMatrixPropertiesNVFunction = function VkResult(VkPhysicalDevice physicalDevice, uint32* pPropertyCount, VkCooperativeMatrixPropertiesNV* pProperties);
		private static vkGetPhysicalDeviceCooperativeMatrixPropertiesNVFunction vkGetPhysicalDeviceCooperativeMatrixPropertiesNV_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetPhysicalDeviceCooperativeMatrixPropertiesNV(VkPhysicalDevice physicalDevice, uint32* pPropertyCount, VkCooperativeMatrixPropertiesNV* pProperties)
			=> vkGetPhysicalDeviceCooperativeMatrixPropertiesNV_ptr(physicalDevice, pPropertyCount, pProperties);

		public typealias vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNVFunction = function VkResult(VkPhysicalDevice physicalDevice, uint32* pCombinationCount, VkFramebufferMixedSamplesCombinationNV* pCombinations);
		private static vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNVFunction vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV(VkPhysicalDevice physicalDevice, uint32* pCombinationCount, VkFramebufferMixedSamplesCombinationNV* pCombinations)
			=> vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV_ptr(physicalDevice, pCombinationCount, pCombinations);

		public typealias vkGetPhysicalDeviceSurfacePresentModes2EXTFunction = function VkResult(VkPhysicalDevice physicalDevice, VkPhysicalDeviceSurfaceInfo2KHR* pSurfaceInfo, uint32* pPresentModeCount, VkPresentModeKHR* pPresentModes);
		private static vkGetPhysicalDeviceSurfacePresentModes2EXTFunction vkGetPhysicalDeviceSurfacePresentModes2EXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetPhysicalDeviceSurfacePresentModes2EXT(VkPhysicalDevice physicalDevice, VkPhysicalDeviceSurfaceInfo2KHR* pSurfaceInfo, uint32* pPresentModeCount, VkPresentModeKHR* pPresentModes)
			=> vkGetPhysicalDeviceSurfacePresentModes2EXT_ptr(physicalDevice, pSurfaceInfo, pPresentModeCount, pPresentModes);

		public typealias vkAcquireFullScreenExclusiveModeEXTFunction = function VkResult(VkDevice device, VkSwapchainKHR swapchain);
		private static vkAcquireFullScreenExclusiveModeEXTFunction vkAcquireFullScreenExclusiveModeEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkAcquireFullScreenExclusiveModeEXT(VkDevice device, VkSwapchainKHR swapchain)
			=> vkAcquireFullScreenExclusiveModeEXT_ptr(device, swapchain);

		public typealias vkReleaseFullScreenExclusiveModeEXTFunction = function VkResult(VkDevice device, VkSwapchainKHR swapchain);
		private static vkReleaseFullScreenExclusiveModeEXTFunction vkReleaseFullScreenExclusiveModeEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkReleaseFullScreenExclusiveModeEXT(VkDevice device, VkSwapchainKHR swapchain)
			=> vkReleaseFullScreenExclusiveModeEXT_ptr(device, swapchain);

		public typealias vkCreateHeadlessSurfaceEXTFunction = function VkResult(VkInstance instance, VkHeadlessSurfaceCreateInfoEXT* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSurfaceKHR* pSurface);
		private static vkCreateHeadlessSurfaceEXTFunction vkCreateHeadlessSurfaceEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCreateHeadlessSurfaceEXT(VkInstance instance, VkHeadlessSurfaceCreateInfoEXT* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSurfaceKHR* pSurface)
			=> vkCreateHeadlessSurfaceEXT_ptr(instance, pCreateInfo, pAllocator, pSurface);

		public typealias vkCmdSetLineStippleEXTFunction = function void(VkCommandBuffer commandBuffer, uint32 lineStippleFactor, uint16 lineStipplePattern);
		private static vkCmdSetLineStippleEXTFunction vkCmdSetLineStippleEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdSetLineStippleEXT(VkCommandBuffer commandBuffer, uint32 lineStippleFactor, uint16 lineStipplePattern)
			=> vkCmdSetLineStippleEXT_ptr(commandBuffer, lineStippleFactor, lineStipplePattern);

		public typealias vkCreateDeferredOperationKHRFunction = function VkResult(VkDevice device, VkAllocationCallbacks* pAllocator, VkDeferredOperationKHR* pDeferredOperation);
		private static vkCreateDeferredOperationKHRFunction vkCreateDeferredOperationKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCreateDeferredOperationKHR(VkDevice device, VkAllocationCallbacks* pAllocator, VkDeferredOperationKHR* pDeferredOperation)
			=> vkCreateDeferredOperationKHR_ptr(device, pAllocator, pDeferredOperation);

		public typealias vkDestroyDeferredOperationKHRFunction = function void(VkDevice device, VkDeferredOperationKHR operation, VkAllocationCallbacks* pAllocator);
		private static vkDestroyDeferredOperationKHRFunction vkDestroyDeferredOperationKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkDestroyDeferredOperationKHR(VkDevice device, VkDeferredOperationKHR operation, VkAllocationCallbacks* pAllocator)
			=> vkDestroyDeferredOperationKHR_ptr(device, operation, pAllocator);

		public typealias vkGetDeferredOperationMaxConcurrencyKHRFunction = function uint32(VkDevice device, VkDeferredOperationKHR operation);
		private static vkGetDeferredOperationMaxConcurrencyKHRFunction vkGetDeferredOperationMaxConcurrencyKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static uint32 vkGetDeferredOperationMaxConcurrencyKHR(VkDevice device, VkDeferredOperationKHR operation)
			=> vkGetDeferredOperationMaxConcurrencyKHR_ptr(device, operation);

		public typealias vkGetDeferredOperationResultKHRFunction = function VkResult(VkDevice device, VkDeferredOperationKHR operation);
		private static vkGetDeferredOperationResultKHRFunction vkGetDeferredOperationResultKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetDeferredOperationResultKHR(VkDevice device, VkDeferredOperationKHR operation)
			=> vkGetDeferredOperationResultKHR_ptr(device, operation);

		public typealias vkDeferredOperationJoinKHRFunction = function VkResult(VkDevice device, VkDeferredOperationKHR operation);
		private static vkDeferredOperationJoinKHRFunction vkDeferredOperationJoinKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkDeferredOperationJoinKHR(VkDevice device, VkDeferredOperationKHR operation)
			=> vkDeferredOperationJoinKHR_ptr(device, operation);

		public typealias vkGetPipelineExecutablePropertiesKHRFunction = function VkResult(VkDevice device, VkPipelineInfoKHR* pPipelineInfo, uint32* pExecutableCount, VkPipelineExecutablePropertiesKHR* pProperties);
		private static vkGetPipelineExecutablePropertiesKHRFunction vkGetPipelineExecutablePropertiesKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetPipelineExecutablePropertiesKHR(VkDevice device, VkPipelineInfoKHR* pPipelineInfo, uint32* pExecutableCount, VkPipelineExecutablePropertiesKHR* pProperties)
			=> vkGetPipelineExecutablePropertiesKHR_ptr(device, pPipelineInfo, pExecutableCount, pProperties);

		public typealias vkGetPipelineExecutableStatisticsKHRFunction = function VkResult(VkDevice device, VkPipelineExecutableInfoKHR* pExecutableInfo, uint32* pStatisticCount, VkPipelineExecutableStatisticKHR* pStatistics);
		private static vkGetPipelineExecutableStatisticsKHRFunction vkGetPipelineExecutableStatisticsKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetPipelineExecutableStatisticsKHR(VkDevice device, VkPipelineExecutableInfoKHR* pExecutableInfo, uint32* pStatisticCount, VkPipelineExecutableStatisticKHR* pStatistics)
			=> vkGetPipelineExecutableStatisticsKHR_ptr(device, pExecutableInfo, pStatisticCount, pStatistics);

		public typealias vkGetPipelineExecutableInternalRepresentationsKHRFunction = function VkResult(VkDevice device, VkPipelineExecutableInfoKHR* pExecutableInfo, uint32* pInternalRepresentationCount, VkPipelineExecutableInternalRepresentationKHR* pInternalRepresentations);
		private static vkGetPipelineExecutableInternalRepresentationsKHRFunction vkGetPipelineExecutableInternalRepresentationsKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetPipelineExecutableInternalRepresentationsKHR(VkDevice device, VkPipelineExecutableInfoKHR* pExecutableInfo, uint32* pInternalRepresentationCount, VkPipelineExecutableInternalRepresentationKHR* pInternalRepresentations)
			=> vkGetPipelineExecutableInternalRepresentationsKHR_ptr(device, pExecutableInfo, pInternalRepresentationCount, pInternalRepresentations);

		public typealias vkGetGeneratedCommandsMemoryRequirementsNVFunction = function void(VkDevice device, VkGeneratedCommandsMemoryRequirementsInfoNV* pInfo, VkMemoryRequirements2* pMemoryRequirements);
		private static vkGetGeneratedCommandsMemoryRequirementsNVFunction vkGetGeneratedCommandsMemoryRequirementsNV_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkGetGeneratedCommandsMemoryRequirementsNV(VkDevice device, VkGeneratedCommandsMemoryRequirementsInfoNV* pInfo, VkMemoryRequirements2* pMemoryRequirements)
			=> vkGetGeneratedCommandsMemoryRequirementsNV_ptr(device, pInfo, pMemoryRequirements);

		public typealias vkCmdPreprocessGeneratedCommandsNVFunction = function void(VkCommandBuffer commandBuffer, VkGeneratedCommandsInfoNV* pGeneratedCommandsInfo);
		private static vkCmdPreprocessGeneratedCommandsNVFunction vkCmdPreprocessGeneratedCommandsNV_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdPreprocessGeneratedCommandsNV(VkCommandBuffer commandBuffer, VkGeneratedCommandsInfoNV* pGeneratedCommandsInfo)
			=> vkCmdPreprocessGeneratedCommandsNV_ptr(commandBuffer, pGeneratedCommandsInfo);

		public typealias vkCmdExecuteGeneratedCommandsNVFunction = function void(VkCommandBuffer commandBuffer, VkBool32 isPreprocessed, VkGeneratedCommandsInfoNV* pGeneratedCommandsInfo);
		private static vkCmdExecuteGeneratedCommandsNVFunction vkCmdExecuteGeneratedCommandsNV_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdExecuteGeneratedCommandsNV(VkCommandBuffer commandBuffer, VkBool32 isPreprocessed, VkGeneratedCommandsInfoNV* pGeneratedCommandsInfo)
			=> vkCmdExecuteGeneratedCommandsNV_ptr(commandBuffer, isPreprocessed, pGeneratedCommandsInfo);

		public typealias vkCmdBindPipelineShaderGroupNVFunction = function void(VkCommandBuffer commandBuffer, VkPipelineBindPoint pipelineBindPoint, VkPipeline pipeline, uint32 groupIndex);
		private static vkCmdBindPipelineShaderGroupNVFunction vkCmdBindPipelineShaderGroupNV_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdBindPipelineShaderGroupNV(VkCommandBuffer commandBuffer, VkPipelineBindPoint pipelineBindPoint, VkPipeline pipeline, uint32 groupIndex)
			=> vkCmdBindPipelineShaderGroupNV_ptr(commandBuffer, pipelineBindPoint, pipeline, groupIndex);

		public typealias vkCreateIndirectCommandsLayoutNVFunction = function VkResult(VkDevice device, VkIndirectCommandsLayoutCreateInfoNV* pCreateInfo, VkAllocationCallbacks* pAllocator, VkIndirectCommandsLayoutNV* pIndirectCommandsLayout);
		private static vkCreateIndirectCommandsLayoutNVFunction vkCreateIndirectCommandsLayoutNV_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCreateIndirectCommandsLayoutNV(VkDevice device, VkIndirectCommandsLayoutCreateInfoNV* pCreateInfo, VkAllocationCallbacks* pAllocator, VkIndirectCommandsLayoutNV* pIndirectCommandsLayout)
			=> vkCreateIndirectCommandsLayoutNV_ptr(device, pCreateInfo, pAllocator, pIndirectCommandsLayout);

		public typealias vkDestroyIndirectCommandsLayoutNVFunction = function void(VkDevice device, VkIndirectCommandsLayoutNV indirectCommandsLayout, VkAllocationCallbacks* pAllocator);
		private static vkDestroyIndirectCommandsLayoutNVFunction vkDestroyIndirectCommandsLayoutNV_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkDestroyIndirectCommandsLayoutNV(VkDevice device, VkIndirectCommandsLayoutNV indirectCommandsLayout, VkAllocationCallbacks* pAllocator)
			=> vkDestroyIndirectCommandsLayoutNV_ptr(device, indirectCommandsLayout, pAllocator);

		public typealias vkAcquireDrmDisplayEXTFunction = function VkResult(VkPhysicalDevice physicalDevice, int32 drmFd, VkDisplayKHR display);
		private static vkAcquireDrmDisplayEXTFunction vkAcquireDrmDisplayEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkAcquireDrmDisplayEXT(VkPhysicalDevice physicalDevice, int32 drmFd, VkDisplayKHR display)
			=> vkAcquireDrmDisplayEXT_ptr(physicalDevice, drmFd, display);

		public typealias vkGetDrmDisplayEXTFunction = function VkResult(VkPhysicalDevice physicalDevice, int32 drmFd, uint32 connectorId, VkDisplayKHR* display);
		private static vkGetDrmDisplayEXTFunction vkGetDrmDisplayEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetDrmDisplayEXT(VkPhysicalDevice physicalDevice, int32 drmFd, uint32 connectorId, VkDisplayKHR* display)
			=> vkGetDrmDisplayEXT_ptr(physicalDevice, drmFd, connectorId, display);

		public typealias vkCmdEncodeVideoKHRFunction = function void(VkCommandBuffer commandBuffer, VkVideoEncodeInfoKHR* pEncodeInfo);
		private static vkCmdEncodeVideoKHRFunction vkCmdEncodeVideoKHR_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdEncodeVideoKHR(VkCommandBuffer commandBuffer, VkVideoEncodeInfoKHR* pEncodeInfo)
			=> vkCmdEncodeVideoKHR_ptr(commandBuffer, pEncodeInfo);

		public typealias vkExportMetalObjectsEXTFunction = function void(VkDevice device, VkExportMetalObjectsInfoEXT* pMetalObjectsInfo);
		private static vkExportMetalObjectsEXTFunction vkExportMetalObjectsEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkExportMetalObjectsEXT(VkDevice device, VkExportMetalObjectsInfoEXT* pMetalObjectsInfo)
			=> vkExportMetalObjectsEXT_ptr(device, pMetalObjectsInfo);

		public typealias vkCmdSetFragmentShadingRateEnumNVFunction = function void(VkCommandBuffer commandBuffer, VkFragmentShadingRateNV shadingRate, VkFragmentShadingRateCombinerOpKHR[2] combinerOps);
		private static vkCmdSetFragmentShadingRateEnumNVFunction vkCmdSetFragmentShadingRateEnumNV_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdSetFragmentShadingRateEnumNV(VkCommandBuffer commandBuffer, VkFragmentShadingRateNV shadingRate, VkFragmentShadingRateCombinerOpKHR[2] combinerOps)
			=> vkCmdSetFragmentShadingRateEnumNV_ptr(commandBuffer, shadingRate, combinerOps);

		public typealias vkGetImageSubresourceLayout2EXTFunction = function void(VkDevice device, VkImage image, VkImageSubresource2EXT* pSubresource, VkSubresourceLayout2EXT* pLayout);
		private static vkGetImageSubresourceLayout2EXTFunction vkGetImageSubresourceLayout2EXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkGetImageSubresourceLayout2EXT(VkDevice device, VkImage image, VkImageSubresource2EXT* pSubresource, VkSubresourceLayout2EXT* pLayout)
			=> vkGetImageSubresourceLayout2EXT_ptr(device, image, pSubresource, pLayout);

		public typealias vkAcquireWinrtDisplayNVFunction = function VkResult(VkPhysicalDevice physicalDevice, VkDisplayKHR display);
		private static vkAcquireWinrtDisplayNVFunction vkAcquireWinrtDisplayNV_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkAcquireWinrtDisplayNV(VkPhysicalDevice physicalDevice, VkDisplayKHR display)
			=> vkAcquireWinrtDisplayNV_ptr(physicalDevice, display);

		public typealias vkGetWinrtDisplayNVFunction = function VkResult(VkPhysicalDevice physicalDevice, uint32 deviceRelativeId, VkDisplayKHR* pDisplay);
		private static vkGetWinrtDisplayNVFunction vkGetWinrtDisplayNV_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetWinrtDisplayNV(VkPhysicalDevice physicalDevice, uint32 deviceRelativeId, VkDisplayKHR* pDisplay)
			=> vkGetWinrtDisplayNV_ptr(physicalDevice, deviceRelativeId, pDisplay);

		public typealias vkCreateDirectFBSurfaceEXTFunction = function VkResult(VkInstance instance, VkDirectFBSurfaceCreateInfoEXT* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSurfaceKHR* pSurface);
		private static vkCreateDirectFBSurfaceEXTFunction vkCreateDirectFBSurfaceEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCreateDirectFBSurfaceEXT(VkInstance instance, VkDirectFBSurfaceCreateInfoEXT* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSurfaceKHR* pSurface)
			=> vkCreateDirectFBSurfaceEXT_ptr(instance, pCreateInfo, pAllocator, pSurface);

		public typealias vkGetPhysicalDeviceDirectFBPresentationSupportEXTFunction = function VkBool32(VkPhysicalDevice physicalDevice, uint32 queueFamilyIndex, void* dfb);
		private static vkGetPhysicalDeviceDirectFBPresentationSupportEXTFunction vkGetPhysicalDeviceDirectFBPresentationSupportEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkBool32 vkGetPhysicalDeviceDirectFBPresentationSupportEXT(VkPhysicalDevice physicalDevice, uint32 queueFamilyIndex, void* dfb)
			=> vkGetPhysicalDeviceDirectFBPresentationSupportEXT_ptr(physicalDevice, queueFamilyIndex, dfb);

		public typealias vkCmdSetVertexInputEXTFunction = function void(VkCommandBuffer commandBuffer, uint32 vertexBindingDescriptionCount, VkVertexInputBindingDescription2EXT* pVertexBindingDescriptions, uint32 vertexAttributeDescriptionCount, VkVertexInputAttributeDescription2EXT* pVertexAttributeDescriptions);
		private static vkCmdSetVertexInputEXTFunction vkCmdSetVertexInputEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdSetVertexInputEXT(VkCommandBuffer commandBuffer, uint32 vertexBindingDescriptionCount, VkVertexInputBindingDescription2EXT* pVertexBindingDescriptions, uint32 vertexAttributeDescriptionCount, VkVertexInputAttributeDescription2EXT* pVertexAttributeDescriptions)
			=> vkCmdSetVertexInputEXT_ptr(commandBuffer, vertexBindingDescriptionCount, pVertexBindingDescriptions, vertexAttributeDescriptionCount, pVertexAttributeDescriptions);

		public typealias vkGetMemoryZirconHandleFUCHSIAFunction = function VkResult(VkDevice device, VkMemoryGetZirconHandleInfoFUCHSIA* pGetZirconHandleInfo, void* pZirconHandle);
		private static vkGetMemoryZirconHandleFUCHSIAFunction vkGetMemoryZirconHandleFUCHSIA_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetMemoryZirconHandleFUCHSIA(VkDevice device, VkMemoryGetZirconHandleInfoFUCHSIA* pGetZirconHandleInfo, void* pZirconHandle)
			=> vkGetMemoryZirconHandleFUCHSIA_ptr(device, pGetZirconHandleInfo, pZirconHandle);

		public typealias vkGetMemoryZirconHandlePropertiesFUCHSIAFunction = function VkResult(VkDevice device, VkExternalMemoryHandleTypeFlags handleType, void* zirconHandle, VkMemoryZirconHandlePropertiesFUCHSIA* pMemoryZirconHandleProperties);
		private static vkGetMemoryZirconHandlePropertiesFUCHSIAFunction vkGetMemoryZirconHandlePropertiesFUCHSIA_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetMemoryZirconHandlePropertiesFUCHSIA(VkDevice device, VkExternalMemoryHandleTypeFlags handleType, void* zirconHandle, VkMemoryZirconHandlePropertiesFUCHSIA* pMemoryZirconHandleProperties)
			=> vkGetMemoryZirconHandlePropertiesFUCHSIA_ptr(device, handleType, zirconHandle, pMemoryZirconHandleProperties);

		public typealias vkImportSemaphoreZirconHandleFUCHSIAFunction = function VkResult(VkDevice device, VkImportSemaphoreZirconHandleInfoFUCHSIA* pImportSemaphoreZirconHandleInfo);
		private static vkImportSemaphoreZirconHandleFUCHSIAFunction vkImportSemaphoreZirconHandleFUCHSIA_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkImportSemaphoreZirconHandleFUCHSIA(VkDevice device, VkImportSemaphoreZirconHandleInfoFUCHSIA* pImportSemaphoreZirconHandleInfo)
			=> vkImportSemaphoreZirconHandleFUCHSIA_ptr(device, pImportSemaphoreZirconHandleInfo);

		public typealias vkGetSemaphoreZirconHandleFUCHSIAFunction = function VkResult(VkDevice device, VkSemaphoreGetZirconHandleInfoFUCHSIA* pGetZirconHandleInfo, void* pZirconHandle);
		private static vkGetSemaphoreZirconHandleFUCHSIAFunction vkGetSemaphoreZirconHandleFUCHSIA_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetSemaphoreZirconHandleFUCHSIA(VkDevice device, VkSemaphoreGetZirconHandleInfoFUCHSIA* pGetZirconHandleInfo, void* pZirconHandle)
			=> vkGetSemaphoreZirconHandleFUCHSIA_ptr(device, pGetZirconHandleInfo, pZirconHandle);

		public typealias vkCreateBufferCollectionFUCHSIAFunction = function VkResult(VkDevice device, VkBufferCollectionCreateInfoFUCHSIA* pCreateInfo, VkAllocationCallbacks* pAllocator, VkBufferCollectionFUCHSIA* pCollection);
		private static vkCreateBufferCollectionFUCHSIAFunction vkCreateBufferCollectionFUCHSIA_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCreateBufferCollectionFUCHSIA(VkDevice device, VkBufferCollectionCreateInfoFUCHSIA* pCreateInfo, VkAllocationCallbacks* pAllocator, VkBufferCollectionFUCHSIA* pCollection)
			=> vkCreateBufferCollectionFUCHSIA_ptr(device, pCreateInfo, pAllocator, pCollection);

		public typealias vkSetBufferCollectionImageConstraintsFUCHSIAFunction = function VkResult(VkDevice device, VkBufferCollectionFUCHSIA collection, VkImageConstraintsInfoFUCHSIA* pImageConstraintsInfo);
		private static vkSetBufferCollectionImageConstraintsFUCHSIAFunction vkSetBufferCollectionImageConstraintsFUCHSIA_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkSetBufferCollectionImageConstraintsFUCHSIA(VkDevice device, VkBufferCollectionFUCHSIA collection, VkImageConstraintsInfoFUCHSIA* pImageConstraintsInfo)
			=> vkSetBufferCollectionImageConstraintsFUCHSIA_ptr(device, collection, pImageConstraintsInfo);

		public typealias vkSetBufferCollectionBufferConstraintsFUCHSIAFunction = function VkResult(VkDevice device, VkBufferCollectionFUCHSIA collection, VkBufferConstraintsInfoFUCHSIA* pBufferConstraintsInfo);
		private static vkSetBufferCollectionBufferConstraintsFUCHSIAFunction vkSetBufferCollectionBufferConstraintsFUCHSIA_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkSetBufferCollectionBufferConstraintsFUCHSIA(VkDevice device, VkBufferCollectionFUCHSIA collection, VkBufferConstraintsInfoFUCHSIA* pBufferConstraintsInfo)
			=> vkSetBufferCollectionBufferConstraintsFUCHSIA_ptr(device, collection, pBufferConstraintsInfo);

		public typealias vkDestroyBufferCollectionFUCHSIAFunction = function void(VkDevice device, VkBufferCollectionFUCHSIA collection, VkAllocationCallbacks* pAllocator);
		private static vkDestroyBufferCollectionFUCHSIAFunction vkDestroyBufferCollectionFUCHSIA_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkDestroyBufferCollectionFUCHSIA(VkDevice device, VkBufferCollectionFUCHSIA collection, VkAllocationCallbacks* pAllocator)
			=> vkDestroyBufferCollectionFUCHSIA_ptr(device, collection, pAllocator);

		public typealias vkGetBufferCollectionPropertiesFUCHSIAFunction = function VkResult(VkDevice device, VkBufferCollectionFUCHSIA collection, VkBufferCollectionPropertiesFUCHSIA* pProperties);
		private static vkGetBufferCollectionPropertiesFUCHSIAFunction vkGetBufferCollectionPropertiesFUCHSIA_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetBufferCollectionPropertiesFUCHSIA(VkDevice device, VkBufferCollectionFUCHSIA collection, VkBufferCollectionPropertiesFUCHSIA* pProperties)
			=> vkGetBufferCollectionPropertiesFUCHSIA_ptr(device, collection, pProperties);

		public typealias vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEIFunction = function VkResult(VkDevice device, VkRenderPass renderpass, VkExtent2D* pMaxWorkgroupSize);
		private static vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEIFunction vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI(VkDevice device, VkRenderPass renderpass, VkExtent2D* pMaxWorkgroupSize)
			=> vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI_ptr(device, renderpass, pMaxWorkgroupSize);

		public typealias vkCmdSubpassShadingHUAWEIFunction = function void(VkCommandBuffer commandBuffer);
		private static vkCmdSubpassShadingHUAWEIFunction vkCmdSubpassShadingHUAWEI_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdSubpassShadingHUAWEI(VkCommandBuffer commandBuffer)
			=> vkCmdSubpassShadingHUAWEI_ptr(commandBuffer);

		public typealias vkCmdBindInvocationMaskHUAWEIFunction = function void(VkCommandBuffer commandBuffer, VkImageView imageView, VkImageLayout imageLayout);
		private static vkCmdBindInvocationMaskHUAWEIFunction vkCmdBindInvocationMaskHUAWEI_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdBindInvocationMaskHUAWEI(VkCommandBuffer commandBuffer, VkImageView imageView, VkImageLayout imageLayout)
			=> vkCmdBindInvocationMaskHUAWEI_ptr(commandBuffer, imageView, imageLayout);

		public typealias vkGetMemoryRemoteAddressNVFunction = function VkResult(VkDevice device, VkMemoryGetRemoteAddressInfoNV* pMemoryGetRemoteAddressInfo, void* pAddress);
		private static vkGetMemoryRemoteAddressNVFunction vkGetMemoryRemoteAddressNV_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetMemoryRemoteAddressNV(VkDevice device, VkMemoryGetRemoteAddressInfoNV* pMemoryGetRemoteAddressInfo, void* pAddress)
			=> vkGetMemoryRemoteAddressNV_ptr(device, pMemoryGetRemoteAddressInfo, pAddress);

		public typealias vkGetPipelinePropertiesEXTFunction = function VkResult(VkDevice device, VkPipelineInfoKHR* pPipelineInfo, VkBaseOutStructure* pPipelineProperties);
		private static vkGetPipelinePropertiesEXTFunction vkGetPipelinePropertiesEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkGetPipelinePropertiesEXT(VkDevice device, VkPipelineInfoKHR* pPipelineInfo, VkBaseOutStructure* pPipelineProperties)
			=> vkGetPipelinePropertiesEXT_ptr(device, pPipelineInfo, pPipelineProperties);

		public typealias vkCmdSetPatchControlPointsEXTFunction = function void(VkCommandBuffer commandBuffer, uint32 patchControlPoints);
		private static vkCmdSetPatchControlPointsEXTFunction vkCmdSetPatchControlPointsEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdSetPatchControlPointsEXT(VkCommandBuffer commandBuffer, uint32 patchControlPoints)
			=> vkCmdSetPatchControlPointsEXT_ptr(commandBuffer, patchControlPoints);

		public typealias vkCmdSetLogicOpEXTFunction = function void(VkCommandBuffer commandBuffer, VkLogicOp logicOp);
		private static vkCmdSetLogicOpEXTFunction vkCmdSetLogicOpEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdSetLogicOpEXT(VkCommandBuffer commandBuffer, VkLogicOp logicOp)
			=> vkCmdSetLogicOpEXT_ptr(commandBuffer, logicOp);

		public typealias vkCreateScreenSurfaceQNXFunction = function VkResult(VkInstance instance, VkScreenSurfaceCreateInfoQNX* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSurfaceKHR* pSurface);
		private static vkCreateScreenSurfaceQNXFunction vkCreateScreenSurfaceQNX_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkResult vkCreateScreenSurfaceQNX(VkInstance instance, VkScreenSurfaceCreateInfoQNX* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSurfaceKHR* pSurface)
			=> vkCreateScreenSurfaceQNX_ptr(instance, pCreateInfo, pAllocator, pSurface);

		public typealias vkGetPhysicalDeviceScreenPresentationSupportQNXFunction = function VkBool32(VkPhysicalDevice physicalDevice, uint32 queueFamilyIndex, void* window);
		private static vkGetPhysicalDeviceScreenPresentationSupportQNXFunction vkGetPhysicalDeviceScreenPresentationSupportQNX_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static VkBool32 vkGetPhysicalDeviceScreenPresentationSupportQNX(VkPhysicalDevice physicalDevice, uint32 queueFamilyIndex, void* window)
			=> vkGetPhysicalDeviceScreenPresentationSupportQNX_ptr(physicalDevice, queueFamilyIndex, window);

		public typealias vkCmdSetColorWriteEnableEXTFunction = function void(VkCommandBuffer commandBuffer, uint32 attachmentCount, VkBool32* pColorWriteEnables);
		private static vkCmdSetColorWriteEnableEXTFunction vkCmdSetColorWriteEnableEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdSetColorWriteEnableEXT(VkCommandBuffer commandBuffer, uint32 attachmentCount, VkBool32* pColorWriteEnables)
			=> vkCmdSetColorWriteEnableEXT_ptr(commandBuffer, attachmentCount, pColorWriteEnables);

		public typealias vkCmdDrawMultiEXTFunction = function void(VkCommandBuffer commandBuffer, uint32 drawCount, VkMultiDrawInfoEXT* pVertexInfo, uint32 instanceCount, uint32 firstInstance, uint32 stride);
		private static vkCmdDrawMultiEXTFunction vkCmdDrawMultiEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdDrawMultiEXT(VkCommandBuffer commandBuffer, uint32 drawCount, VkMultiDrawInfoEXT* pVertexInfo, uint32 instanceCount, uint32 firstInstance, uint32 stride)
			=> vkCmdDrawMultiEXT_ptr(commandBuffer, drawCount, pVertexInfo, instanceCount, firstInstance, stride);

		public typealias vkCmdDrawMultiIndexedEXTFunction = function void(VkCommandBuffer commandBuffer, uint32 drawCount, VkMultiDrawIndexedInfoEXT* pIndexInfo, uint32 instanceCount, uint32 firstInstance, uint32 stride, int32* pVertexOffset);
		private static vkCmdDrawMultiIndexedEXTFunction vkCmdDrawMultiIndexedEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkCmdDrawMultiIndexedEXT(VkCommandBuffer commandBuffer, uint32 drawCount, VkMultiDrawIndexedInfoEXT* pIndexInfo, uint32 instanceCount, uint32 firstInstance, uint32 stride, int32* pVertexOffset)
			=> vkCmdDrawMultiIndexedEXT_ptr(commandBuffer, drawCount, pIndexInfo, instanceCount, firstInstance, stride, pVertexOffset);

		public typealias vkSetDeviceMemoryPriorityEXTFunction = function void(VkDevice device, VkDeviceMemory memory, float priority);
		private static vkSetDeviceMemoryPriorityEXTFunction vkSetDeviceMemoryPriorityEXT_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkSetDeviceMemoryPriorityEXT(VkDevice device, VkDeviceMemory memory, float priority)
			=> vkSetDeviceMemoryPriorityEXT_ptr(device, memory, priority);

		public typealias vkGetDescriptorSetLayoutHostMappingInfoVALVEFunction = function void(VkDevice device, VkDescriptorSetBindingReferenceVALVE* pBindingReference, VkDescriptorSetLayoutHostMappingInfoVALVE* pHostMapping);
		private static vkGetDescriptorSetLayoutHostMappingInfoVALVEFunction vkGetDescriptorSetLayoutHostMappingInfoVALVE_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkGetDescriptorSetLayoutHostMappingInfoVALVE(VkDevice device, VkDescriptorSetBindingReferenceVALVE* pBindingReference, VkDescriptorSetLayoutHostMappingInfoVALVE* pHostMapping)
			=> vkGetDescriptorSetLayoutHostMappingInfoVALVE_ptr(device, pBindingReference, pHostMapping);

		public typealias vkGetDescriptorSetHostMappingVALVEFunction = function void(VkDevice device, VkDescriptorSet descriptorSet, void** ppData);
		private static vkGetDescriptorSetHostMappingVALVEFunction vkGetDescriptorSetHostMappingVALVE_ptr;
		[CallingConvention(VulkanNative.CallConv)]
		public static void vkGetDescriptorSetHostMappingVALVE(VkDevice device, VkDescriptorSet descriptorSet, void** ppData)
			=> vkGetDescriptorSetHostMappingVALVE_ptr(device, descriptorSet, ppData);

		public static void SetInstance(VkInstance instance)
		{
			mNativeLib.mInstance = instance;
		}

		private static void LoadFunction(in StringView name)
		{
			switch (name) {
			case "vkCreateInstance":
				mNativeLib.LoadFunction("vkCreateInstance", out vkCreateInstance_ptr);
				break;

			case "vkDestroyInstance":
				mNativeLib.LoadFunction("vkDestroyInstance", out vkDestroyInstance_ptr);
				break;

			case "vkEnumeratePhysicalDevices":
				mNativeLib.LoadFunction("vkEnumeratePhysicalDevices", out vkEnumeratePhysicalDevices_ptr);
				break;

			case "vkGetPhysicalDeviceFeatures":
				mNativeLib.LoadFunction("vkGetPhysicalDeviceFeatures", out vkGetPhysicalDeviceFeatures_ptr);
				break;

			case "vkGetPhysicalDeviceFormatProperties":
				mNativeLib.LoadFunction("vkGetPhysicalDeviceFormatProperties", out vkGetPhysicalDeviceFormatProperties_ptr);
				break;

			case "vkGetPhysicalDeviceImageFormatProperties":
				mNativeLib.LoadFunction("vkGetPhysicalDeviceImageFormatProperties", out vkGetPhysicalDeviceImageFormatProperties_ptr);
				break;

			case "vkGetPhysicalDeviceProperties":
				mNativeLib.LoadFunction("vkGetPhysicalDeviceProperties", out vkGetPhysicalDeviceProperties_ptr);
				break;

			case "vkGetPhysicalDeviceQueueFamilyProperties":
				mNativeLib.LoadFunction("vkGetPhysicalDeviceQueueFamilyProperties", out vkGetPhysicalDeviceQueueFamilyProperties_ptr);
				break;

			case "vkGetPhysicalDeviceMemoryProperties":
				mNativeLib.LoadFunction("vkGetPhysicalDeviceMemoryProperties", out vkGetPhysicalDeviceMemoryProperties_ptr);
				break;

			case "vkGetInstanceProcAddr":
				mNativeLib.LoadFunction("vkGetInstanceProcAddr", out vkGetInstanceProcAddr_ptr);
				break;

			case "vkGetDeviceProcAddr":
				mNativeLib.LoadFunction("vkGetDeviceProcAddr", out vkGetDeviceProcAddr_ptr);
				break;

			case "vkCreateDevice":
				mNativeLib.LoadFunction("vkCreateDevice", out vkCreateDevice_ptr);
				break;

			case "vkDestroyDevice":
				mNativeLib.LoadFunction("vkDestroyDevice", out vkDestroyDevice_ptr);
				break;

			case "vkEnumerateInstanceExtensionProperties":
				mNativeLib.LoadFunction("vkEnumerateInstanceExtensionProperties", out vkEnumerateInstanceExtensionProperties_ptr);
				break;

			case "vkEnumerateDeviceExtensionProperties":
				mNativeLib.LoadFunction("vkEnumerateDeviceExtensionProperties", out vkEnumerateDeviceExtensionProperties_ptr);
				break;

			case "vkEnumerateInstanceLayerProperties":
				mNativeLib.LoadFunction("vkEnumerateInstanceLayerProperties", out vkEnumerateInstanceLayerProperties_ptr);
				break;

			case "vkEnumerateDeviceLayerProperties":
				mNativeLib.LoadFunction("vkEnumerateDeviceLayerProperties", out vkEnumerateDeviceLayerProperties_ptr);
				break;

			case "vkGetDeviceQueue":
				mNativeLib.LoadFunction("vkGetDeviceQueue", out vkGetDeviceQueue_ptr);
				break;

			case "vkQueueSubmit":
				mNativeLib.LoadFunction("vkQueueSubmit", out vkQueueSubmit_ptr);
				break;

			case "vkQueueWaitIdle":
				mNativeLib.LoadFunction("vkQueueWaitIdle", out vkQueueWaitIdle_ptr);
				break;

			case "vkDeviceWaitIdle":
				mNativeLib.LoadFunction("vkDeviceWaitIdle", out vkDeviceWaitIdle_ptr);
				break;

			case "vkAllocateMemory":
				mNativeLib.LoadFunction("vkAllocateMemory", out vkAllocateMemory_ptr);
				break;

			case "vkFreeMemory":
				mNativeLib.LoadFunction("vkFreeMemory", out vkFreeMemory_ptr);
				break;

			case "vkMapMemory":
				mNativeLib.LoadFunction("vkMapMemory", out vkMapMemory_ptr);
				break;

			case "vkUnmapMemory":
				mNativeLib.LoadFunction("vkUnmapMemory", out vkUnmapMemory_ptr);
				break;

			case "vkFlushMappedMemoryRanges":
				mNativeLib.LoadFunction("vkFlushMappedMemoryRanges", out vkFlushMappedMemoryRanges_ptr);
				break;

			case "vkInvalidateMappedMemoryRanges":
				mNativeLib.LoadFunction("vkInvalidateMappedMemoryRanges", out vkInvalidateMappedMemoryRanges_ptr);
				break;

			case "vkGetDeviceMemoryCommitment":
				mNativeLib.LoadFunction("vkGetDeviceMemoryCommitment", out vkGetDeviceMemoryCommitment_ptr);
				break;

			case "vkBindBufferMemory":
				mNativeLib.LoadFunction("vkBindBufferMemory", out vkBindBufferMemory_ptr);
				break;

			case "vkBindImageMemory":
				mNativeLib.LoadFunction("vkBindImageMemory", out vkBindImageMemory_ptr);
				break;

			case "vkGetBufferMemoryRequirements":
				mNativeLib.LoadFunction("vkGetBufferMemoryRequirements", out vkGetBufferMemoryRequirements_ptr);
				break;

			case "vkGetImageMemoryRequirements":
				mNativeLib.LoadFunction("vkGetImageMemoryRequirements", out vkGetImageMemoryRequirements_ptr);
				break;

			case "vkGetImageSparseMemoryRequirements":
				mNativeLib.LoadFunction("vkGetImageSparseMemoryRequirements", out vkGetImageSparseMemoryRequirements_ptr);
				break;

			case "vkGetPhysicalDeviceSparseImageFormatProperties":
				mNativeLib.LoadFunction("vkGetPhysicalDeviceSparseImageFormatProperties", out vkGetPhysicalDeviceSparseImageFormatProperties_ptr);
				break;

			case "vkQueueBindSparse":
				mNativeLib.LoadFunction("vkQueueBindSparse", out vkQueueBindSparse_ptr);
				break;

			case "vkCreateFence":
				mNativeLib.LoadFunction("vkCreateFence", out vkCreateFence_ptr);
				break;

			case "vkDestroyFence":
				mNativeLib.LoadFunction("vkDestroyFence", out vkDestroyFence_ptr);
				break;

			case "vkResetFences":
				mNativeLib.LoadFunction("vkResetFences", out vkResetFences_ptr);
				break;

			case "vkGetFenceStatus":
				mNativeLib.LoadFunction("vkGetFenceStatus", out vkGetFenceStatus_ptr);
				break;

			case "vkWaitForFences":
				mNativeLib.LoadFunction("vkWaitForFences", out vkWaitForFences_ptr);
				break;

			case "vkCreateSemaphore":
				mNativeLib.LoadFunction("vkCreateSemaphore", out vkCreateSemaphore_ptr);
				break;

			case "vkDestroySemaphore":
				mNativeLib.LoadFunction("vkDestroySemaphore", out vkDestroySemaphore_ptr);
				break;

			case "vkCreateEvent":
				mNativeLib.LoadFunction("vkCreateEvent", out vkCreateEvent_ptr);
				break;

			case "vkDestroyEvent":
				mNativeLib.LoadFunction("vkDestroyEvent", out vkDestroyEvent_ptr);
				break;

			case "vkGetEventStatus":
				mNativeLib.LoadFunction("vkGetEventStatus", out vkGetEventStatus_ptr);
				break;

			case "vkSetEvent":
				mNativeLib.LoadFunction("vkSetEvent", out vkSetEvent_ptr);
				break;

			case "vkResetEvent":
				mNativeLib.LoadFunction("vkResetEvent", out vkResetEvent_ptr);
				break;

			case "vkCreateQueryPool":
				mNativeLib.LoadFunction("vkCreateQueryPool", out vkCreateQueryPool_ptr);
				break;

			case "vkDestroyQueryPool":
				mNativeLib.LoadFunction("vkDestroyQueryPool", out vkDestroyQueryPool_ptr);
				break;

			case "vkGetQueryPoolResults":
				mNativeLib.LoadFunction("vkGetQueryPoolResults", out vkGetQueryPoolResults_ptr);
				break;

			case "vkCreateBuffer":
				mNativeLib.LoadFunction("vkCreateBuffer", out vkCreateBuffer_ptr);
				break;

			case "vkDestroyBuffer":
				mNativeLib.LoadFunction("vkDestroyBuffer", out vkDestroyBuffer_ptr);
				break;

			case "vkCreateBufferView":
				mNativeLib.LoadFunction("vkCreateBufferView", out vkCreateBufferView_ptr);
				break;

			case "vkDestroyBufferView":
				mNativeLib.LoadFunction("vkDestroyBufferView", out vkDestroyBufferView_ptr);
				break;

			case "vkCreateImage":
				mNativeLib.LoadFunction("vkCreateImage", out vkCreateImage_ptr);
				break;

			case "vkDestroyImage":
				mNativeLib.LoadFunction("vkDestroyImage", out vkDestroyImage_ptr);
				break;

			case "vkGetImageSubresourceLayout":
				mNativeLib.LoadFunction("vkGetImageSubresourceLayout", out vkGetImageSubresourceLayout_ptr);
				break;

			case "vkCreateImageView":
				mNativeLib.LoadFunction("vkCreateImageView", out vkCreateImageView_ptr);
				break;

			case "vkDestroyImageView":
				mNativeLib.LoadFunction("vkDestroyImageView", out vkDestroyImageView_ptr);
				break;

			case "vkCreateShaderModule":
				mNativeLib.LoadFunction("vkCreateShaderModule", out vkCreateShaderModule_ptr);
				break;

			case "vkDestroyShaderModule":
				mNativeLib.LoadFunction("vkDestroyShaderModule", out vkDestroyShaderModule_ptr);
				break;

			case "vkCreatePipelineCache":
				mNativeLib.LoadFunction("vkCreatePipelineCache", out vkCreatePipelineCache_ptr);
				break;

			case "vkDestroyPipelineCache":
				mNativeLib.LoadFunction("vkDestroyPipelineCache", out vkDestroyPipelineCache_ptr);
				break;

			case "vkGetPipelineCacheData":
				mNativeLib.LoadFunction("vkGetPipelineCacheData", out vkGetPipelineCacheData_ptr);
				break;

			case "vkMergePipelineCaches":
				mNativeLib.LoadFunction("vkMergePipelineCaches", out vkMergePipelineCaches_ptr);
				break;

			case "vkCreateGraphicsPipelines":
				mNativeLib.LoadFunction("vkCreateGraphicsPipelines", out vkCreateGraphicsPipelines_ptr);
				break;

			case "vkCreateComputePipelines":
				mNativeLib.LoadFunction("vkCreateComputePipelines", out vkCreateComputePipelines_ptr);
				break;

			case "vkDestroyPipeline":
				mNativeLib.LoadFunction("vkDestroyPipeline", out vkDestroyPipeline_ptr);
				break;

			case "vkCreatePipelineLayout":
				mNativeLib.LoadFunction("vkCreatePipelineLayout", out vkCreatePipelineLayout_ptr);
				break;

			case "vkDestroyPipelineLayout":
				mNativeLib.LoadFunction("vkDestroyPipelineLayout", out vkDestroyPipelineLayout_ptr);
				break;

			case "vkCreateSampler":
				mNativeLib.LoadFunction("vkCreateSampler", out vkCreateSampler_ptr);
				break;

			case "vkDestroySampler":
				mNativeLib.LoadFunction("vkDestroySampler", out vkDestroySampler_ptr);
				break;

			case "vkCreateDescriptorSetLayout":
				mNativeLib.LoadFunction("vkCreateDescriptorSetLayout", out vkCreateDescriptorSetLayout_ptr);
				break;

			case "vkDestroyDescriptorSetLayout":
				mNativeLib.LoadFunction("vkDestroyDescriptorSetLayout", out vkDestroyDescriptorSetLayout_ptr);
				break;

			case "vkCreateDescriptorPool":
				mNativeLib.LoadFunction("vkCreateDescriptorPool", out vkCreateDescriptorPool_ptr);
				break;

			case "vkDestroyDescriptorPool":
				mNativeLib.LoadFunction("vkDestroyDescriptorPool", out vkDestroyDescriptorPool_ptr);
				break;

			case "vkResetDescriptorPool":
				mNativeLib.LoadFunction("vkResetDescriptorPool", out vkResetDescriptorPool_ptr);
				break;

			case "vkAllocateDescriptorSets":
				mNativeLib.LoadFunction("vkAllocateDescriptorSets", out vkAllocateDescriptorSets_ptr);
				break;

			case "vkFreeDescriptorSets":
				mNativeLib.LoadFunction("vkFreeDescriptorSets", out vkFreeDescriptorSets_ptr);
				break;

			case "vkUpdateDescriptorSets":
				mNativeLib.LoadFunction("vkUpdateDescriptorSets", out vkUpdateDescriptorSets_ptr);
				break;

			case "vkCreateFramebuffer":
				mNativeLib.LoadFunction("vkCreateFramebuffer", out vkCreateFramebuffer_ptr);
				break;

			case "vkDestroyFramebuffer":
				mNativeLib.LoadFunction("vkDestroyFramebuffer", out vkDestroyFramebuffer_ptr);
				break;

			case "vkCreateRenderPass":
				mNativeLib.LoadFunction("vkCreateRenderPass", out vkCreateRenderPass_ptr);
				break;

			case "vkDestroyRenderPass":
				mNativeLib.LoadFunction("vkDestroyRenderPass", out vkDestroyRenderPass_ptr);
				break;

			case "vkGetRenderAreaGranularity":
				mNativeLib.LoadFunction("vkGetRenderAreaGranularity", out vkGetRenderAreaGranularity_ptr);
				break;

			case "vkCreateCommandPool":
				mNativeLib.LoadFunction("vkCreateCommandPool", out vkCreateCommandPool_ptr);
				break;

			case "vkDestroyCommandPool":
				mNativeLib.LoadFunction("vkDestroyCommandPool", out vkDestroyCommandPool_ptr);
				break;

			case "vkResetCommandPool":
				mNativeLib.LoadFunction("vkResetCommandPool", out vkResetCommandPool_ptr);
				break;

			case "vkAllocateCommandBuffers":
				mNativeLib.LoadFunction("vkAllocateCommandBuffers", out vkAllocateCommandBuffers_ptr);
				break;

			case "vkFreeCommandBuffers":
				mNativeLib.LoadFunction("vkFreeCommandBuffers", out vkFreeCommandBuffers_ptr);
				break;

			case "vkBeginCommandBuffer":
				mNativeLib.LoadFunction("vkBeginCommandBuffer", out vkBeginCommandBuffer_ptr);
				break;

			case "vkEndCommandBuffer":
				mNativeLib.LoadFunction("vkEndCommandBuffer", out vkEndCommandBuffer_ptr);
				break;

			case "vkResetCommandBuffer":
				mNativeLib.LoadFunction("vkResetCommandBuffer", out vkResetCommandBuffer_ptr);
				break;

			case "vkCmdBindPipeline":
				mNativeLib.LoadFunction("vkCmdBindPipeline", out vkCmdBindPipeline_ptr);
				break;

			case "vkCmdSetViewport":
				mNativeLib.LoadFunction("vkCmdSetViewport", out vkCmdSetViewport_ptr);
				break;

			case "vkCmdSetScissor":
				mNativeLib.LoadFunction("vkCmdSetScissor", out vkCmdSetScissor_ptr);
				break;

			case "vkCmdSetLineWidth":
				mNativeLib.LoadFunction("vkCmdSetLineWidth", out vkCmdSetLineWidth_ptr);
				break;

			case "vkCmdSetDepthBias":
				mNativeLib.LoadFunction("vkCmdSetDepthBias", out vkCmdSetDepthBias_ptr);
				break;

			case "vkCmdSetBlendConstants":
				mNativeLib.LoadFunction("vkCmdSetBlendConstants", out vkCmdSetBlendConstants_ptr);
				break;

			case "vkCmdSetDepthBounds":
				mNativeLib.LoadFunction("vkCmdSetDepthBounds", out vkCmdSetDepthBounds_ptr);
				break;

			case "vkCmdSetStencilCompareMask":
				mNativeLib.LoadFunction("vkCmdSetStencilCompareMask", out vkCmdSetStencilCompareMask_ptr);
				break;

			case "vkCmdSetStencilWriteMask":
				mNativeLib.LoadFunction("vkCmdSetStencilWriteMask", out vkCmdSetStencilWriteMask_ptr);
				break;

			case "vkCmdSetStencilReference":
				mNativeLib.LoadFunction("vkCmdSetStencilReference", out vkCmdSetStencilReference_ptr);
				break;

			case "vkCmdBindDescriptorSets":
				mNativeLib.LoadFunction("vkCmdBindDescriptorSets", out vkCmdBindDescriptorSets_ptr);
				break;

			case "vkCmdBindIndexBuffer":
				mNativeLib.LoadFunction("vkCmdBindIndexBuffer", out vkCmdBindIndexBuffer_ptr);
				break;

			case "vkCmdBindVertexBuffers":
				mNativeLib.LoadFunction("vkCmdBindVertexBuffers", out vkCmdBindVertexBuffers_ptr);
				break;

			case "vkCmdDraw":
				mNativeLib.LoadFunction("vkCmdDraw", out vkCmdDraw_ptr);
				break;

			case "vkCmdDrawIndexed":
				mNativeLib.LoadFunction("vkCmdDrawIndexed", out vkCmdDrawIndexed_ptr);
				break;

			case "vkCmdDrawIndirect":
				mNativeLib.LoadFunction("vkCmdDrawIndirect", out vkCmdDrawIndirect_ptr);
				break;

			case "vkCmdDrawIndexedIndirect":
				mNativeLib.LoadFunction("vkCmdDrawIndexedIndirect", out vkCmdDrawIndexedIndirect_ptr);
				break;

			case "vkCmdDispatch":
				mNativeLib.LoadFunction("vkCmdDispatch", out vkCmdDispatch_ptr);
				break;

			case "vkCmdDispatchIndirect":
				mNativeLib.LoadFunction("vkCmdDispatchIndirect", out vkCmdDispatchIndirect_ptr);
				break;

			case "vkCmdCopyBuffer":
				mNativeLib.LoadFunction("vkCmdCopyBuffer", out vkCmdCopyBuffer_ptr);
				break;

			case "vkCmdCopyImage":
				mNativeLib.LoadFunction("vkCmdCopyImage", out vkCmdCopyImage_ptr);
				break;

			case "vkCmdBlitImage":
				mNativeLib.LoadFunction("vkCmdBlitImage", out vkCmdBlitImage_ptr);
				break;

			case "vkCmdCopyBufferToImage":
				mNativeLib.LoadFunction("vkCmdCopyBufferToImage", out vkCmdCopyBufferToImage_ptr);
				break;

			case "vkCmdCopyImageToBuffer":
				mNativeLib.LoadFunction("vkCmdCopyImageToBuffer", out vkCmdCopyImageToBuffer_ptr);
				break;

			case "vkCmdUpdateBuffer":
				mNativeLib.LoadFunction("vkCmdUpdateBuffer", out vkCmdUpdateBuffer_ptr);
				break;

			case "vkCmdFillBuffer":
				mNativeLib.LoadFunction("vkCmdFillBuffer", out vkCmdFillBuffer_ptr);
				break;

			case "vkCmdClearColorImage":
				mNativeLib.LoadFunction("vkCmdClearColorImage", out vkCmdClearColorImage_ptr);
				break;

			case "vkCmdClearDepthStencilImage":
				mNativeLib.LoadFunction("vkCmdClearDepthStencilImage", out vkCmdClearDepthStencilImage_ptr);
				break;

			case "vkCmdClearAttachments":
				mNativeLib.LoadFunction("vkCmdClearAttachments", out vkCmdClearAttachments_ptr);
				break;

			case "vkCmdResolveImage":
				mNativeLib.LoadFunction("vkCmdResolveImage", out vkCmdResolveImage_ptr);
				break;

			case "vkCmdSetEvent":
				mNativeLib.LoadFunction("vkCmdSetEvent", out vkCmdSetEvent_ptr);
				break;

			case "vkCmdResetEvent":
				mNativeLib.LoadFunction("vkCmdResetEvent", out vkCmdResetEvent_ptr);
				break;

			case "vkCmdWaitEvents":
				mNativeLib.LoadFunction("vkCmdWaitEvents", out vkCmdWaitEvents_ptr);
				break;

			case "vkCmdPipelineBarrier":
				mNativeLib.LoadFunction("vkCmdPipelineBarrier", out vkCmdPipelineBarrier_ptr);
				break;

			case "vkCmdBeginQuery":
				mNativeLib.LoadFunction("vkCmdBeginQuery", out vkCmdBeginQuery_ptr);
				break;

			case "vkCmdEndQuery":
				mNativeLib.LoadFunction("vkCmdEndQuery", out vkCmdEndQuery_ptr);
				break;

			case "vkCmdResetQueryPool":
				mNativeLib.LoadFunction("vkCmdResetQueryPool", out vkCmdResetQueryPool_ptr);
				break;

			case "vkCmdWriteTimestamp":
				mNativeLib.LoadFunction("vkCmdWriteTimestamp", out vkCmdWriteTimestamp_ptr);
				break;

			case "vkCmdCopyQueryPoolResults":
				mNativeLib.LoadFunction("vkCmdCopyQueryPoolResults", out vkCmdCopyQueryPoolResults_ptr);
				break;

			case "vkCmdPushConstants":
				mNativeLib.LoadFunction("vkCmdPushConstants", out vkCmdPushConstants_ptr);
				break;

			case "vkCmdBeginRenderPass":
				mNativeLib.LoadFunction("vkCmdBeginRenderPass", out vkCmdBeginRenderPass_ptr);
				break;

			case "vkCmdNextSubpass":
				mNativeLib.LoadFunction("vkCmdNextSubpass", out vkCmdNextSubpass_ptr);
				break;

			case "vkCmdEndRenderPass":
				mNativeLib.LoadFunction("vkCmdEndRenderPass", out vkCmdEndRenderPass_ptr);
				break;

			case "vkCmdExecuteCommands":
				mNativeLib.LoadFunction("vkCmdExecuteCommands", out vkCmdExecuteCommands_ptr);
				break;

			case "vkEnumerateInstanceVersion":
				mNativeLib.LoadFunction("vkEnumerateInstanceVersion", out vkEnumerateInstanceVersion_ptr);
				break;

			case "vkBindBufferMemory2":
				mNativeLib.LoadFunction("vkBindBufferMemory2", out vkBindBufferMemory2_ptr);
				break;

			case "vkBindImageMemory2":
				mNativeLib.LoadFunction("vkBindImageMemory2", out vkBindImageMemory2_ptr);
				break;

			case "vkGetDeviceGroupPeerMemoryFeatures":
				mNativeLib.LoadFunction("vkGetDeviceGroupPeerMemoryFeatures", out vkGetDeviceGroupPeerMemoryFeatures_ptr);
				break;

			case "vkCmdSetDeviceMask":
				mNativeLib.LoadFunction("vkCmdSetDeviceMask", out vkCmdSetDeviceMask_ptr);
				break;

			case "vkCmdDispatchBase":
				mNativeLib.LoadFunction("vkCmdDispatchBase", out vkCmdDispatchBase_ptr);
				break;

			case "vkEnumeratePhysicalDeviceGroups":
				mNativeLib.LoadFunction("vkEnumeratePhysicalDeviceGroups", out vkEnumeratePhysicalDeviceGroups_ptr);
				break;

			case "vkGetImageMemoryRequirements2":
				mNativeLib.LoadFunction("vkGetImageMemoryRequirements2", out vkGetImageMemoryRequirements2_ptr);
				break;

			case "vkGetBufferMemoryRequirements2":
				mNativeLib.LoadFunction("vkGetBufferMemoryRequirements2", out vkGetBufferMemoryRequirements2_ptr);
				break;

			case "vkGetImageSparseMemoryRequirements2":
				mNativeLib.LoadFunction("vkGetImageSparseMemoryRequirements2", out vkGetImageSparseMemoryRequirements2_ptr);
				break;

			case "vkGetPhysicalDeviceFeatures2":
				mNativeLib.LoadFunction("vkGetPhysicalDeviceFeatures2", out vkGetPhysicalDeviceFeatures2_ptr);
				break;

			case "vkGetPhysicalDeviceProperties2":
				mNativeLib.LoadFunction("vkGetPhysicalDeviceProperties2", out vkGetPhysicalDeviceProperties2_ptr);
				break;

			case "vkGetPhysicalDeviceFormatProperties2":
				mNativeLib.LoadFunction("vkGetPhysicalDeviceFormatProperties2", out vkGetPhysicalDeviceFormatProperties2_ptr);
				break;

			case "vkGetPhysicalDeviceImageFormatProperties2":
				mNativeLib.LoadFunction("vkGetPhysicalDeviceImageFormatProperties2", out vkGetPhysicalDeviceImageFormatProperties2_ptr);
				break;

			case "vkGetPhysicalDeviceQueueFamilyProperties2":
				mNativeLib.LoadFunction("vkGetPhysicalDeviceQueueFamilyProperties2", out vkGetPhysicalDeviceQueueFamilyProperties2_ptr);
				break;

			case "vkGetPhysicalDeviceMemoryProperties2":
				mNativeLib.LoadFunction("vkGetPhysicalDeviceMemoryProperties2", out vkGetPhysicalDeviceMemoryProperties2_ptr);
				break;

			case "vkGetPhysicalDeviceSparseImageFormatProperties2":
				mNativeLib.LoadFunction("vkGetPhysicalDeviceSparseImageFormatProperties2", out vkGetPhysicalDeviceSparseImageFormatProperties2_ptr);
				break;

			case "vkTrimCommandPool":
				mNativeLib.LoadFunction("vkTrimCommandPool", out vkTrimCommandPool_ptr);
				break;

			case "vkGetDeviceQueue2":
				mNativeLib.LoadFunction("vkGetDeviceQueue2", out vkGetDeviceQueue2_ptr);
				break;

			case "vkCreateSamplerYcbcrConversion":
				mNativeLib.LoadFunction("vkCreateSamplerYcbcrConversion", out vkCreateSamplerYcbcrConversion_ptr);
				break;

			case "vkDestroySamplerYcbcrConversion":
				mNativeLib.LoadFunction("vkDestroySamplerYcbcrConversion", out vkDestroySamplerYcbcrConversion_ptr);
				break;

			case "vkCreateDescriptorUpdateTemplate":
				mNativeLib.LoadFunction("vkCreateDescriptorUpdateTemplate", out vkCreateDescriptorUpdateTemplate_ptr);
				break;

			case "vkDestroyDescriptorUpdateTemplate":
				mNativeLib.LoadFunction("vkDestroyDescriptorUpdateTemplate", out vkDestroyDescriptorUpdateTemplate_ptr);
				break;

			case "vkUpdateDescriptorSetWithTemplate":
				mNativeLib.LoadFunction("vkUpdateDescriptorSetWithTemplate", out vkUpdateDescriptorSetWithTemplate_ptr);
				break;

			case "vkGetPhysicalDeviceExternalBufferProperties":
				mNativeLib.LoadFunction("vkGetPhysicalDeviceExternalBufferProperties", out vkGetPhysicalDeviceExternalBufferProperties_ptr);
				break;

			case "vkGetPhysicalDeviceExternalFenceProperties":
				mNativeLib.LoadFunction("vkGetPhysicalDeviceExternalFenceProperties", out vkGetPhysicalDeviceExternalFenceProperties_ptr);
				break;

			case "vkGetPhysicalDeviceExternalSemaphoreProperties":
				mNativeLib.LoadFunction("vkGetPhysicalDeviceExternalSemaphoreProperties", out vkGetPhysicalDeviceExternalSemaphoreProperties_ptr);
				break;

			case "vkGetDescriptorSetLayoutSupport":
				mNativeLib.LoadFunction("vkGetDescriptorSetLayoutSupport", out vkGetDescriptorSetLayoutSupport_ptr);
				break;

			case "vkCmdDrawIndirectCount":
				mNativeLib.LoadFunction("vkCmdDrawIndirectCount", out vkCmdDrawIndirectCount_ptr);
				break;

			case "vkCmdDrawIndexedIndirectCount":
				mNativeLib.LoadFunction("vkCmdDrawIndexedIndirectCount", out vkCmdDrawIndexedIndirectCount_ptr);
				break;

			case "vkCreateRenderPass2":
				mNativeLib.LoadFunction("vkCreateRenderPass2", out vkCreateRenderPass2_ptr);
				break;

			case "vkCmdBeginRenderPass2":
				mNativeLib.LoadFunction("vkCmdBeginRenderPass2", out vkCmdBeginRenderPass2_ptr);
				break;

			case "vkCmdNextSubpass2":
				mNativeLib.LoadFunction("vkCmdNextSubpass2", out vkCmdNextSubpass2_ptr);
				break;

			case "vkCmdEndRenderPass2":
				mNativeLib.LoadFunction("vkCmdEndRenderPass2", out vkCmdEndRenderPass2_ptr);
				break;

			case "vkResetQueryPool":
				mNativeLib.LoadFunction("vkResetQueryPool", out vkResetQueryPool_ptr);
				break;

			case "vkGetSemaphoreCounterValue":
				mNativeLib.LoadFunction("vkGetSemaphoreCounterValue", out vkGetSemaphoreCounterValue_ptr);
				break;

			case "vkWaitSemaphores":
				mNativeLib.LoadFunction("vkWaitSemaphores", out vkWaitSemaphores_ptr);
				break;

			case "vkSignalSemaphore":
				mNativeLib.LoadFunction("vkSignalSemaphore", out vkSignalSemaphore_ptr);
				break;

			case "vkGetBufferDeviceAddress":
				mNativeLib.LoadFunction("vkGetBufferDeviceAddress", out vkGetBufferDeviceAddress_ptr);
				break;

			case "vkGetBufferOpaqueCaptureAddress":
				mNativeLib.LoadFunction("vkGetBufferOpaqueCaptureAddress", out vkGetBufferOpaqueCaptureAddress_ptr);
				break;

			case "vkGetDeviceMemoryOpaqueCaptureAddress":
				mNativeLib.LoadFunction("vkGetDeviceMemoryOpaqueCaptureAddress", out vkGetDeviceMemoryOpaqueCaptureAddress_ptr);
				break;

			case "vkGetPhysicalDeviceToolProperties":
				mNativeLib.LoadFunction("vkGetPhysicalDeviceToolProperties", out vkGetPhysicalDeviceToolProperties_ptr);
				break;

			case "vkCreatePrivateDataSlot":
				mNativeLib.LoadFunction("vkCreatePrivateDataSlot", out vkCreatePrivateDataSlot_ptr);
				break;

			case "vkDestroyPrivateDataSlot":
				mNativeLib.LoadFunction("vkDestroyPrivateDataSlot", out vkDestroyPrivateDataSlot_ptr);
				break;

			case "vkSetPrivateData":
				mNativeLib.LoadFunction("vkSetPrivateData", out vkSetPrivateData_ptr);
				break;

			case "vkGetPrivateData":
				mNativeLib.LoadFunction("vkGetPrivateData", out vkGetPrivateData_ptr);
				break;

			case "vkCmdSetEvent2":
				mNativeLib.LoadFunction("vkCmdSetEvent2", out vkCmdSetEvent2_ptr);
				break;

			case "vkCmdResetEvent2":
				mNativeLib.LoadFunction("vkCmdResetEvent2", out vkCmdResetEvent2_ptr);
				break;

			case "vkCmdWaitEvents2":
				mNativeLib.LoadFunction("vkCmdWaitEvents2", out vkCmdWaitEvents2_ptr);
				break;

			case "vkCmdPipelineBarrier2":
				mNativeLib.LoadFunction("vkCmdPipelineBarrier2", out vkCmdPipelineBarrier2_ptr);
				break;

			case "vkCmdWriteTimestamp2":
				mNativeLib.LoadFunction("vkCmdWriteTimestamp2", out vkCmdWriteTimestamp2_ptr);
				break;

			case "vkQueueSubmit2":
				mNativeLib.LoadFunction("vkQueueSubmit2", out vkQueueSubmit2_ptr);
				break;

			case "vkCmdCopyBuffer2":
				mNativeLib.LoadFunction("vkCmdCopyBuffer2", out vkCmdCopyBuffer2_ptr);
				break;

			case "vkCmdCopyImage2":
				mNativeLib.LoadFunction("vkCmdCopyImage2", out vkCmdCopyImage2_ptr);
				break;

			case "vkCmdCopyBufferToImage2":
				mNativeLib.LoadFunction("vkCmdCopyBufferToImage2", out vkCmdCopyBufferToImage2_ptr);
				break;

			case "vkCmdCopyImageToBuffer2":
				mNativeLib.LoadFunction("vkCmdCopyImageToBuffer2", out vkCmdCopyImageToBuffer2_ptr);
				break;

			case "vkCmdBlitImage2":
				mNativeLib.LoadFunction("vkCmdBlitImage2", out vkCmdBlitImage2_ptr);
				break;

			case "vkCmdResolveImage2":
				mNativeLib.LoadFunction("vkCmdResolveImage2", out vkCmdResolveImage2_ptr);
				break;

			case "vkCmdBeginRendering":
				mNativeLib.LoadFunction("vkCmdBeginRendering", out vkCmdBeginRendering_ptr);
				break;

			case "vkCmdEndRendering":
				mNativeLib.LoadFunction("vkCmdEndRendering", out vkCmdEndRendering_ptr);
				break;

			case "vkCmdSetCullMode":
				mNativeLib.LoadFunction("vkCmdSetCullMode", out vkCmdSetCullMode_ptr);
				break;

			case "vkCmdSetFrontFace":
				mNativeLib.LoadFunction("vkCmdSetFrontFace", out vkCmdSetFrontFace_ptr);
				break;

			case "vkCmdSetPrimitiveTopology":
				mNativeLib.LoadFunction("vkCmdSetPrimitiveTopology", out vkCmdSetPrimitiveTopology_ptr);
				break;

			case "vkCmdSetViewportWithCount":
				mNativeLib.LoadFunction("vkCmdSetViewportWithCount", out vkCmdSetViewportWithCount_ptr);
				break;

			case "vkCmdSetScissorWithCount":
				mNativeLib.LoadFunction("vkCmdSetScissorWithCount", out vkCmdSetScissorWithCount_ptr);
				break;

			case "vkCmdBindVertexBuffers2":
				mNativeLib.LoadFunction("vkCmdBindVertexBuffers2", out vkCmdBindVertexBuffers2_ptr);
				break;

			case "vkCmdSetDepthTestEnable":
				mNativeLib.LoadFunction("vkCmdSetDepthTestEnable", out vkCmdSetDepthTestEnable_ptr);
				break;

			case "vkCmdSetDepthWriteEnable":
				mNativeLib.LoadFunction("vkCmdSetDepthWriteEnable", out vkCmdSetDepthWriteEnable_ptr);
				break;

			case "vkCmdSetDepthCompareOp":
				mNativeLib.LoadFunction("vkCmdSetDepthCompareOp", out vkCmdSetDepthCompareOp_ptr);
				break;

			case "vkCmdSetDepthBoundsTestEnable":
				mNativeLib.LoadFunction("vkCmdSetDepthBoundsTestEnable", out vkCmdSetDepthBoundsTestEnable_ptr);
				break;

			case "vkCmdSetStencilTestEnable":
				mNativeLib.LoadFunction("vkCmdSetStencilTestEnable", out vkCmdSetStencilTestEnable_ptr);
				break;

			case "vkCmdSetStencilOp":
				mNativeLib.LoadFunction("vkCmdSetStencilOp", out vkCmdSetStencilOp_ptr);
				break;

			case "vkCmdSetRasterizerDiscardEnable":
				mNativeLib.LoadFunction("vkCmdSetRasterizerDiscardEnable", out vkCmdSetRasterizerDiscardEnable_ptr);
				break;

			case "vkCmdSetDepthBiasEnable":
				mNativeLib.LoadFunction("vkCmdSetDepthBiasEnable", out vkCmdSetDepthBiasEnable_ptr);
				break;

			case "vkCmdSetPrimitiveRestartEnable":
				mNativeLib.LoadFunction("vkCmdSetPrimitiveRestartEnable", out vkCmdSetPrimitiveRestartEnable_ptr);
				break;

			case "vkGetDeviceBufferMemoryRequirements":
				mNativeLib.LoadFunction("vkGetDeviceBufferMemoryRequirements", out vkGetDeviceBufferMemoryRequirements_ptr);
				break;

			case "vkGetDeviceImageMemoryRequirements":
				mNativeLib.LoadFunction("vkGetDeviceImageMemoryRequirements", out vkGetDeviceImageMemoryRequirements_ptr);
				break;

			case "vkGetDeviceImageSparseMemoryRequirements":
				mNativeLib.LoadFunction("vkGetDeviceImageSparseMemoryRequirements", out vkGetDeviceImageSparseMemoryRequirements_ptr);
				break;

			case "vkDestroySurfaceKHR":
				mNativeLib.LoadFunction("vkDestroySurfaceKHR", out vkDestroySurfaceKHR_ptr);
				break;

			case "vkGetPhysicalDeviceSurfaceSupportKHR":
				mNativeLib.LoadFunction("vkGetPhysicalDeviceSurfaceSupportKHR", out vkGetPhysicalDeviceSurfaceSupportKHR_ptr);
				break;

			case "vkGetPhysicalDeviceSurfaceCapabilitiesKHR":
				mNativeLib.LoadFunction("vkGetPhysicalDeviceSurfaceCapabilitiesKHR", out vkGetPhysicalDeviceSurfaceCapabilitiesKHR_ptr);
				break;

			case "vkGetPhysicalDeviceSurfaceFormatsKHR":
				mNativeLib.LoadFunction("vkGetPhysicalDeviceSurfaceFormatsKHR", out vkGetPhysicalDeviceSurfaceFormatsKHR_ptr);
				break;

			case "vkGetPhysicalDeviceSurfacePresentModesKHR":
				mNativeLib.LoadFunction("vkGetPhysicalDeviceSurfacePresentModesKHR", out vkGetPhysicalDeviceSurfacePresentModesKHR_ptr);
				break;

			case "vkCreateSwapchainKHR":
				mNativeLib.LoadFunction("vkCreateSwapchainKHR", out vkCreateSwapchainKHR_ptr);
				break;

			case "vkDestroySwapchainKHR":
				mNativeLib.LoadFunction("vkDestroySwapchainKHR", out vkDestroySwapchainKHR_ptr);
				break;

			case "vkGetSwapchainImagesKHR":
				mNativeLib.LoadFunction("vkGetSwapchainImagesKHR", out vkGetSwapchainImagesKHR_ptr);
				break;

			case "vkAcquireNextImageKHR":
				mNativeLib.LoadFunction("vkAcquireNextImageKHR", out vkAcquireNextImageKHR_ptr);
				break;

			case "vkQueuePresentKHR":
				mNativeLib.LoadFunction("vkQueuePresentKHR", out vkQueuePresentKHR_ptr);
				break;

			case "vkGetPhysicalDeviceDisplayPropertiesKHR":
				mNativeLib.LoadFunction("vkGetPhysicalDeviceDisplayPropertiesKHR", out vkGetPhysicalDeviceDisplayPropertiesKHR_ptr);
				break;

			case "vkGetPhysicalDeviceDisplayPlanePropertiesKHR":
				mNativeLib.LoadFunction("vkGetPhysicalDeviceDisplayPlanePropertiesKHR", out vkGetPhysicalDeviceDisplayPlanePropertiesKHR_ptr);
				break;

			case "vkGetDisplayPlaneSupportedDisplaysKHR":
				mNativeLib.LoadFunction("vkGetDisplayPlaneSupportedDisplaysKHR", out vkGetDisplayPlaneSupportedDisplaysKHR_ptr);
				break;

			case "vkGetDisplayModePropertiesKHR":
				mNativeLib.LoadFunction("vkGetDisplayModePropertiesKHR", out vkGetDisplayModePropertiesKHR_ptr);
				break;

			case "vkCreateDisplayModeKHR":
				mNativeLib.LoadFunction("vkCreateDisplayModeKHR", out vkCreateDisplayModeKHR_ptr);
				break;

			case "vkGetDisplayPlaneCapabilitiesKHR":
				mNativeLib.LoadFunction("vkGetDisplayPlaneCapabilitiesKHR", out vkGetDisplayPlaneCapabilitiesKHR_ptr);
				break;

			case "vkCreateDisplayPlaneSurfaceKHR":
				mNativeLib.LoadFunction("vkCreateDisplayPlaneSurfaceKHR", out vkCreateDisplayPlaneSurfaceKHR_ptr);
				break;

			case "vkCreateSharedSwapchainsKHR":
				mNativeLib.LoadFunction("vkCreateSharedSwapchainsKHR", out vkCreateSharedSwapchainsKHR_ptr);
				break;

			case "vkCreateXlibSurfaceKHR":
				mNativeLib.LoadFunction("vkCreateXlibSurfaceKHR", out vkCreateXlibSurfaceKHR_ptr);
				break;

			case "vkGetPhysicalDeviceXlibPresentationSupportKHR":
				mNativeLib.LoadFunction("vkGetPhysicalDeviceXlibPresentationSupportKHR", out vkGetPhysicalDeviceXlibPresentationSupportKHR_ptr);
				break;

			case "vkCreateXcbSurfaceKHR":
				mNativeLib.LoadFunction("vkCreateXcbSurfaceKHR", out vkCreateXcbSurfaceKHR_ptr);
				break;

			case "vkGetPhysicalDeviceXcbPresentationSupportKHR":
				mNativeLib.LoadFunction("vkGetPhysicalDeviceXcbPresentationSupportKHR", out vkGetPhysicalDeviceXcbPresentationSupportKHR_ptr);
				break;

			case "vkCreateWaylandSurfaceKHR":
				mNativeLib.LoadFunction("vkCreateWaylandSurfaceKHR", out vkCreateWaylandSurfaceKHR_ptr);
				break;

			case "vkGetPhysicalDeviceWaylandPresentationSupportKHR":
				mNativeLib.LoadFunction("vkGetPhysicalDeviceWaylandPresentationSupportKHR", out vkGetPhysicalDeviceWaylandPresentationSupportKHR_ptr);
				break;

			case "vkCreateAndroidSurfaceKHR":
				mNativeLib.LoadFunction("vkCreateAndroidSurfaceKHR", out vkCreateAndroidSurfaceKHR_ptr);
				break;

			case "vkCreateWin32SurfaceKHR":
				mNativeLib.LoadFunction("vkCreateWin32SurfaceKHR", out vkCreateWin32SurfaceKHR_ptr);
				break;

			case "vkGetPhysicalDeviceWin32PresentationSupportKHR":
				mNativeLib.LoadFunction("vkGetPhysicalDeviceWin32PresentationSupportKHR", out vkGetPhysicalDeviceWin32PresentationSupportKHR_ptr);
				break;

			case "vkCreateDebugReportCallbackEXT":
				mNativeLib.LoadFunction("vkCreateDebugReportCallbackEXT", out vkCreateDebugReportCallbackEXT_ptr);
				break;

			case "vkDestroyDebugReportCallbackEXT":
				mNativeLib.LoadFunction("vkDestroyDebugReportCallbackEXT", out vkDestroyDebugReportCallbackEXT_ptr);
				break;

			case "vkDebugReportMessageEXT":
				mNativeLib.LoadFunction("vkDebugReportMessageEXT", out vkDebugReportMessageEXT_ptr);
				break;

			case "vkDebugMarkerSetObjectTagEXT":
				mNativeLib.LoadFunction("vkDebugMarkerSetObjectTagEXT", out vkDebugMarkerSetObjectTagEXT_ptr);
				break;

			case "vkDebugMarkerSetObjectNameEXT":
				mNativeLib.LoadFunction("vkDebugMarkerSetObjectNameEXT", out vkDebugMarkerSetObjectNameEXT_ptr);
				break;

			case "vkCmdDebugMarkerBeginEXT":
				mNativeLib.LoadFunction("vkCmdDebugMarkerBeginEXT", out vkCmdDebugMarkerBeginEXT_ptr);
				break;

			case "vkCmdDebugMarkerEndEXT":
				mNativeLib.LoadFunction("vkCmdDebugMarkerEndEXT", out vkCmdDebugMarkerEndEXT_ptr);
				break;

			case "vkCmdDebugMarkerInsertEXT":
				mNativeLib.LoadFunction("vkCmdDebugMarkerInsertEXT", out vkCmdDebugMarkerInsertEXT_ptr);
				break;

			case "vkGetPhysicalDeviceVideoCapabilitiesKHR":
				mNativeLib.LoadFunction("vkGetPhysicalDeviceVideoCapabilitiesKHR", out vkGetPhysicalDeviceVideoCapabilitiesKHR_ptr);
				break;

			case "vkGetPhysicalDeviceVideoFormatPropertiesKHR":
				mNativeLib.LoadFunction("vkGetPhysicalDeviceVideoFormatPropertiesKHR", out vkGetPhysicalDeviceVideoFormatPropertiesKHR_ptr);
				break;

			case "vkCreateVideoSessionKHR":
				mNativeLib.LoadFunction("vkCreateVideoSessionKHR", out vkCreateVideoSessionKHR_ptr);
				break;

			case "vkDestroyVideoSessionKHR":
				mNativeLib.LoadFunction("vkDestroyVideoSessionKHR", out vkDestroyVideoSessionKHR_ptr);
				break;

			case "vkGetVideoSessionMemoryRequirementsKHR":
				mNativeLib.LoadFunction("vkGetVideoSessionMemoryRequirementsKHR", out vkGetVideoSessionMemoryRequirementsKHR_ptr);
				break;

			case "vkBindVideoSessionMemoryKHR":
				mNativeLib.LoadFunction("vkBindVideoSessionMemoryKHR", out vkBindVideoSessionMemoryKHR_ptr);
				break;

			case "vkCreateVideoSessionParametersKHR":
				mNativeLib.LoadFunction("vkCreateVideoSessionParametersKHR", out vkCreateVideoSessionParametersKHR_ptr);
				break;

			case "vkUpdateVideoSessionParametersKHR":
				mNativeLib.LoadFunction("vkUpdateVideoSessionParametersKHR", out vkUpdateVideoSessionParametersKHR_ptr);
				break;

			case "vkDestroyVideoSessionParametersKHR":
				mNativeLib.LoadFunction("vkDestroyVideoSessionParametersKHR", out vkDestroyVideoSessionParametersKHR_ptr);
				break;

			case "vkCmdBeginVideoCodingKHR":
				mNativeLib.LoadFunction("vkCmdBeginVideoCodingKHR", out vkCmdBeginVideoCodingKHR_ptr);
				break;

			case "vkCmdEndVideoCodingKHR":
				mNativeLib.LoadFunction("vkCmdEndVideoCodingKHR", out vkCmdEndVideoCodingKHR_ptr);
				break;

			case "vkCmdControlVideoCodingKHR":
				mNativeLib.LoadFunction("vkCmdControlVideoCodingKHR", out vkCmdControlVideoCodingKHR_ptr);
				break;

			case "vkCmdDecodeVideoKHR":
				mNativeLib.LoadFunction("vkCmdDecodeVideoKHR", out vkCmdDecodeVideoKHR_ptr);
				break;

			case "vkCmdBindTransformFeedbackBuffersEXT":
				mNativeLib.LoadFunction("vkCmdBindTransformFeedbackBuffersEXT", out vkCmdBindTransformFeedbackBuffersEXT_ptr);
				break;

			case "vkCmdBeginTransformFeedbackEXT":
				mNativeLib.LoadFunction("vkCmdBeginTransformFeedbackEXT", out vkCmdBeginTransformFeedbackEXT_ptr);
				break;

			case "vkCmdEndTransformFeedbackEXT":
				mNativeLib.LoadFunction("vkCmdEndTransformFeedbackEXT", out vkCmdEndTransformFeedbackEXT_ptr);
				break;

			case "vkCmdBeginQueryIndexedEXT":
				mNativeLib.LoadFunction("vkCmdBeginQueryIndexedEXT", out vkCmdBeginQueryIndexedEXT_ptr);
				break;

			case "vkCmdEndQueryIndexedEXT":
				mNativeLib.LoadFunction("vkCmdEndQueryIndexedEXT", out vkCmdEndQueryIndexedEXT_ptr);
				break;

			case "vkCmdDrawIndirectByteCountEXT":
				mNativeLib.LoadFunction("vkCmdDrawIndirectByteCountEXT", out vkCmdDrawIndirectByteCountEXT_ptr);
				break;

			case "vkCreateCuModuleNVX":
				mNativeLib.LoadFunction("vkCreateCuModuleNVX", out vkCreateCuModuleNVX_ptr);
				break;

			case "vkCreateCuFunctionNVX":
				mNativeLib.LoadFunction("vkCreateCuFunctionNVX", out vkCreateCuFunctionNVX_ptr);
				break;

			case "vkDestroyCuModuleNVX":
				mNativeLib.LoadFunction("vkDestroyCuModuleNVX", out vkDestroyCuModuleNVX_ptr);
				break;

			case "vkDestroyCuFunctionNVX":
				mNativeLib.LoadFunction("vkDestroyCuFunctionNVX", out vkDestroyCuFunctionNVX_ptr);
				break;

			case "vkCmdCuLaunchKernelNVX":
				mNativeLib.LoadFunction("vkCmdCuLaunchKernelNVX", out vkCmdCuLaunchKernelNVX_ptr);
				break;

			case "vkGetImageViewHandleNVX":
				mNativeLib.LoadFunction("vkGetImageViewHandleNVX", out vkGetImageViewHandleNVX_ptr);
				break;

			case "vkGetImageViewAddressNVX":
				mNativeLib.LoadFunction("vkGetImageViewAddressNVX", out vkGetImageViewAddressNVX_ptr);
				break;

			case "vkGetShaderInfoAMD":
				mNativeLib.LoadFunction("vkGetShaderInfoAMD", out vkGetShaderInfoAMD_ptr);
				break;

			case "vkCreateStreamDescriptorSurfaceGGP":
				mNativeLib.LoadFunction("vkCreateStreamDescriptorSurfaceGGP", out vkCreateStreamDescriptorSurfaceGGP_ptr);
				break;

			case "vkGetPhysicalDeviceExternalImageFormatPropertiesNV":
				mNativeLib.LoadFunction("vkGetPhysicalDeviceExternalImageFormatPropertiesNV", out vkGetPhysicalDeviceExternalImageFormatPropertiesNV_ptr);
				break;

			case "vkGetMemoryWin32HandleNV":
				mNativeLib.LoadFunction("vkGetMemoryWin32HandleNV", out vkGetMemoryWin32HandleNV_ptr);
				break;

			case "vkCreateViSurfaceNN":
				mNativeLib.LoadFunction("vkCreateViSurfaceNN", out vkCreateViSurfaceNN_ptr);
				break;

			case "vkGetMemoryWin32HandleKHR":
				mNativeLib.LoadFunction("vkGetMemoryWin32HandleKHR", out vkGetMemoryWin32HandleKHR_ptr);
				break;

			case "vkGetMemoryWin32HandlePropertiesKHR":
				mNativeLib.LoadFunction("vkGetMemoryWin32HandlePropertiesKHR", out vkGetMemoryWin32HandlePropertiesKHR_ptr);
				break;

			case "vkGetMemoryFdKHR":
				mNativeLib.LoadFunction("vkGetMemoryFdKHR", out vkGetMemoryFdKHR_ptr);
				break;

			case "vkGetMemoryFdPropertiesKHR":
				mNativeLib.LoadFunction("vkGetMemoryFdPropertiesKHR", out vkGetMemoryFdPropertiesKHR_ptr);
				break;

			case "vkImportSemaphoreWin32HandleKHR":
				mNativeLib.LoadFunction("vkImportSemaphoreWin32HandleKHR", out vkImportSemaphoreWin32HandleKHR_ptr);
				break;

			case "vkGetSemaphoreWin32HandleKHR":
				mNativeLib.LoadFunction("vkGetSemaphoreWin32HandleKHR", out vkGetSemaphoreWin32HandleKHR_ptr);
				break;

			case "vkImportSemaphoreFdKHR":
				mNativeLib.LoadFunction("vkImportSemaphoreFdKHR", out vkImportSemaphoreFdKHR_ptr);
				break;

			case "vkGetSemaphoreFdKHR":
				mNativeLib.LoadFunction("vkGetSemaphoreFdKHR", out vkGetSemaphoreFdKHR_ptr);
				break;

			case "vkCmdPushDescriptorSetKHR":
				mNativeLib.LoadFunction("vkCmdPushDescriptorSetKHR", out vkCmdPushDescriptorSetKHR_ptr);
				break;

			case "vkCmdBeginConditionalRenderingEXT":
				mNativeLib.LoadFunction("vkCmdBeginConditionalRenderingEXT", out vkCmdBeginConditionalRenderingEXT_ptr);
				break;

			case "vkCmdEndConditionalRenderingEXT":
				mNativeLib.LoadFunction("vkCmdEndConditionalRenderingEXT", out vkCmdEndConditionalRenderingEXT_ptr);
				break;

			case "vkCmdSetViewportWScalingNV":
				mNativeLib.LoadFunction("vkCmdSetViewportWScalingNV", out vkCmdSetViewportWScalingNV_ptr);
				break;

			case "vkReleaseDisplayEXT":
				mNativeLib.LoadFunction("vkReleaseDisplayEXT", out vkReleaseDisplayEXT_ptr);
				break;

			case "vkAcquireXlibDisplayEXT":
				mNativeLib.LoadFunction("vkAcquireXlibDisplayEXT", out vkAcquireXlibDisplayEXT_ptr);
				break;

			case "vkGetRandROutputDisplayEXT":
				mNativeLib.LoadFunction("vkGetRandROutputDisplayEXT", out vkGetRandROutputDisplayEXT_ptr);
				break;

			case "vkGetPhysicalDeviceSurfaceCapabilities2EXT":
				mNativeLib.LoadFunction("vkGetPhysicalDeviceSurfaceCapabilities2EXT", out vkGetPhysicalDeviceSurfaceCapabilities2EXT_ptr);
				break;

			case "vkDisplayPowerControlEXT":
				mNativeLib.LoadFunction("vkDisplayPowerControlEXT", out vkDisplayPowerControlEXT_ptr);
				break;

			case "vkRegisterDeviceEventEXT":
				mNativeLib.LoadFunction("vkRegisterDeviceEventEXT", out vkRegisterDeviceEventEXT_ptr);
				break;

			case "vkRegisterDisplayEventEXT":
				mNativeLib.LoadFunction("vkRegisterDisplayEventEXT", out vkRegisterDisplayEventEXT_ptr);
				break;

			case "vkGetSwapchainCounterEXT":
				mNativeLib.LoadFunction("vkGetSwapchainCounterEXT", out vkGetSwapchainCounterEXT_ptr);
				break;

			case "vkGetRefreshCycleDurationGOOGLE":
				mNativeLib.LoadFunction("vkGetRefreshCycleDurationGOOGLE", out vkGetRefreshCycleDurationGOOGLE_ptr);
				break;

			case "vkGetPastPresentationTimingGOOGLE":
				mNativeLib.LoadFunction("vkGetPastPresentationTimingGOOGLE", out vkGetPastPresentationTimingGOOGLE_ptr);
				break;

			case "vkCmdSetDiscardRectangleEXT":
				mNativeLib.LoadFunction("vkCmdSetDiscardRectangleEXT", out vkCmdSetDiscardRectangleEXT_ptr);
				break;

			case "vkSetHdrMetadataEXT":
				mNativeLib.LoadFunction("vkSetHdrMetadataEXT", out vkSetHdrMetadataEXT_ptr);
				break;

			case "vkGetSwapchainStatusKHR":
				mNativeLib.LoadFunction("vkGetSwapchainStatusKHR", out vkGetSwapchainStatusKHR_ptr);
				break;

			case "vkImportFenceWin32HandleKHR":
				mNativeLib.LoadFunction("vkImportFenceWin32HandleKHR", out vkImportFenceWin32HandleKHR_ptr);
				break;

			case "vkGetFenceWin32HandleKHR":
				mNativeLib.LoadFunction("vkGetFenceWin32HandleKHR", out vkGetFenceWin32HandleKHR_ptr);
				break;

			case "vkImportFenceFdKHR":
				mNativeLib.LoadFunction("vkImportFenceFdKHR", out vkImportFenceFdKHR_ptr);
				break;

			case "vkGetFenceFdKHR":
				mNativeLib.LoadFunction("vkGetFenceFdKHR", out vkGetFenceFdKHR_ptr);
				break;

			case "vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR":
				mNativeLib.LoadFunction("vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR", out vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR_ptr);
				break;

			case "vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR":
				mNativeLib.LoadFunction("vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR", out vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR_ptr);
				break;

			case "vkAcquireProfilingLockKHR":
				mNativeLib.LoadFunction("vkAcquireProfilingLockKHR", out vkAcquireProfilingLockKHR_ptr);
				break;

			case "vkReleaseProfilingLockKHR":
				mNativeLib.LoadFunction("vkReleaseProfilingLockKHR", out vkReleaseProfilingLockKHR_ptr);
				break;

			case "vkGetPhysicalDeviceSurfaceCapabilities2KHR":
				mNativeLib.LoadFunction("vkGetPhysicalDeviceSurfaceCapabilities2KHR", out vkGetPhysicalDeviceSurfaceCapabilities2KHR_ptr);
				break;

			case "vkGetPhysicalDeviceSurfaceFormats2KHR":
				mNativeLib.LoadFunction("vkGetPhysicalDeviceSurfaceFormats2KHR", out vkGetPhysicalDeviceSurfaceFormats2KHR_ptr);
				break;

			case "vkGetPhysicalDeviceDisplayProperties2KHR":
				mNativeLib.LoadFunction("vkGetPhysicalDeviceDisplayProperties2KHR", out vkGetPhysicalDeviceDisplayProperties2KHR_ptr);
				break;

			case "vkGetPhysicalDeviceDisplayPlaneProperties2KHR":
				mNativeLib.LoadFunction("vkGetPhysicalDeviceDisplayPlaneProperties2KHR", out vkGetPhysicalDeviceDisplayPlaneProperties2KHR_ptr);
				break;

			case "vkGetDisplayModeProperties2KHR":
				mNativeLib.LoadFunction("vkGetDisplayModeProperties2KHR", out vkGetDisplayModeProperties2KHR_ptr);
				break;

			case "vkGetDisplayPlaneCapabilities2KHR":
				mNativeLib.LoadFunction("vkGetDisplayPlaneCapabilities2KHR", out vkGetDisplayPlaneCapabilities2KHR_ptr);
				break;

			case "vkCreateIOSSurfaceMVK":
				mNativeLib.LoadFunction("vkCreateIOSSurfaceMVK", out vkCreateIOSSurfaceMVK_ptr);
				break;

			case "vkCreateMacOSSurfaceMVK":
				mNativeLib.LoadFunction("vkCreateMacOSSurfaceMVK", out vkCreateMacOSSurfaceMVK_ptr);
				break;

			case "vkSetDebugUtilsObjectNameEXT":
				mNativeLib.LoadFunction("vkSetDebugUtilsObjectNameEXT", out vkSetDebugUtilsObjectNameEXT_ptr);
				break;

			case "vkSetDebugUtilsObjectTagEXT":
				mNativeLib.LoadFunction("vkSetDebugUtilsObjectTagEXT", out vkSetDebugUtilsObjectTagEXT_ptr);
				break;

			case "vkQueueBeginDebugUtilsLabelEXT":
				mNativeLib.LoadFunction("vkQueueBeginDebugUtilsLabelEXT", out vkQueueBeginDebugUtilsLabelEXT_ptr);
				break;

			case "vkQueueEndDebugUtilsLabelEXT":
				mNativeLib.LoadFunction("vkQueueEndDebugUtilsLabelEXT", out vkQueueEndDebugUtilsLabelEXT_ptr);
				break;

			case "vkQueueInsertDebugUtilsLabelEXT":
				mNativeLib.LoadFunction("vkQueueInsertDebugUtilsLabelEXT", out vkQueueInsertDebugUtilsLabelEXT_ptr);
				break;

			case "vkCmdBeginDebugUtilsLabelEXT":
				mNativeLib.LoadFunction("vkCmdBeginDebugUtilsLabelEXT", out vkCmdBeginDebugUtilsLabelEXT_ptr);
				break;

			case "vkCmdEndDebugUtilsLabelEXT":
				mNativeLib.LoadFunction("vkCmdEndDebugUtilsLabelEXT", out vkCmdEndDebugUtilsLabelEXT_ptr);
				break;

			case "vkCmdInsertDebugUtilsLabelEXT":
				mNativeLib.LoadFunction("vkCmdInsertDebugUtilsLabelEXT", out vkCmdInsertDebugUtilsLabelEXT_ptr);
				break;

			case "vkCreateDebugUtilsMessengerEXT":
				mNativeLib.LoadFunction("vkCreateDebugUtilsMessengerEXT", out vkCreateDebugUtilsMessengerEXT_ptr);
				break;

			case "vkDestroyDebugUtilsMessengerEXT":
				mNativeLib.LoadFunction("vkDestroyDebugUtilsMessengerEXT", out vkDestroyDebugUtilsMessengerEXT_ptr);
				break;

			case "vkSubmitDebugUtilsMessageEXT":
				mNativeLib.LoadFunction("vkSubmitDebugUtilsMessageEXT", out vkSubmitDebugUtilsMessageEXT_ptr);
				break;

			case "vkGetAndroidHardwareBufferPropertiesANDROID":
				mNativeLib.LoadFunction("vkGetAndroidHardwareBufferPropertiesANDROID", out vkGetAndroidHardwareBufferPropertiesANDROID_ptr);
				break;

			case "vkGetMemoryAndroidHardwareBufferANDROID":
				mNativeLib.LoadFunction("vkGetMemoryAndroidHardwareBufferANDROID", out vkGetMemoryAndroidHardwareBufferANDROID_ptr);
				break;

			case "vkCmdSetSampleLocationsEXT":
				mNativeLib.LoadFunction("vkCmdSetSampleLocationsEXT", out vkCmdSetSampleLocationsEXT_ptr);
				break;

			case "vkGetPhysicalDeviceMultisamplePropertiesEXT":
				mNativeLib.LoadFunction("vkGetPhysicalDeviceMultisamplePropertiesEXT", out vkGetPhysicalDeviceMultisamplePropertiesEXT_ptr);
				break;

			case "vkCreateAccelerationStructureKHR":
				mNativeLib.LoadFunction("vkCreateAccelerationStructureKHR", out vkCreateAccelerationStructureKHR_ptr);
				break;

			case "vkDestroyAccelerationStructureKHR":
				mNativeLib.LoadFunction("vkDestroyAccelerationStructureKHR", out vkDestroyAccelerationStructureKHR_ptr);
				break;

			case "vkCmdBuildAccelerationStructuresKHR":
				mNativeLib.LoadFunction("vkCmdBuildAccelerationStructuresKHR", out vkCmdBuildAccelerationStructuresKHR_ptr);
				break;

			case "vkCmdBuildAccelerationStructuresIndirectKHR":
				mNativeLib.LoadFunction("vkCmdBuildAccelerationStructuresIndirectKHR", out vkCmdBuildAccelerationStructuresIndirectKHR_ptr);
				break;

			case "vkBuildAccelerationStructuresKHR":
				mNativeLib.LoadFunction("vkBuildAccelerationStructuresKHR", out vkBuildAccelerationStructuresKHR_ptr);
				break;

			case "vkCopyAccelerationStructureKHR":
				mNativeLib.LoadFunction("vkCopyAccelerationStructureKHR", out vkCopyAccelerationStructureKHR_ptr);
				break;

			case "vkCopyAccelerationStructureToMemoryKHR":
				mNativeLib.LoadFunction("vkCopyAccelerationStructureToMemoryKHR", out vkCopyAccelerationStructureToMemoryKHR_ptr);
				break;

			case "vkCopyMemoryToAccelerationStructureKHR":
				mNativeLib.LoadFunction("vkCopyMemoryToAccelerationStructureKHR", out vkCopyMemoryToAccelerationStructureKHR_ptr);
				break;

			case "vkWriteAccelerationStructuresPropertiesKHR":
				mNativeLib.LoadFunction("vkWriteAccelerationStructuresPropertiesKHR", out vkWriteAccelerationStructuresPropertiesKHR_ptr);
				break;

			case "vkCmdCopyAccelerationStructureKHR":
				mNativeLib.LoadFunction("vkCmdCopyAccelerationStructureKHR", out vkCmdCopyAccelerationStructureKHR_ptr);
				break;

			case "vkCmdCopyAccelerationStructureToMemoryKHR":
				mNativeLib.LoadFunction("vkCmdCopyAccelerationStructureToMemoryKHR", out vkCmdCopyAccelerationStructureToMemoryKHR_ptr);
				break;

			case "vkCmdCopyMemoryToAccelerationStructureKHR":
				mNativeLib.LoadFunction("vkCmdCopyMemoryToAccelerationStructureKHR", out vkCmdCopyMemoryToAccelerationStructureKHR_ptr);
				break;

			case "vkGetAccelerationStructureDeviceAddressKHR":
				mNativeLib.LoadFunction("vkGetAccelerationStructureDeviceAddressKHR", out vkGetAccelerationStructureDeviceAddressKHR_ptr);
				break;

			case "vkCmdWriteAccelerationStructuresPropertiesKHR":
				mNativeLib.LoadFunction("vkCmdWriteAccelerationStructuresPropertiesKHR", out vkCmdWriteAccelerationStructuresPropertiesKHR_ptr);
				break;

			case "vkGetDeviceAccelerationStructureCompatibilityKHR":
				mNativeLib.LoadFunction("vkGetDeviceAccelerationStructureCompatibilityKHR", out vkGetDeviceAccelerationStructureCompatibilityKHR_ptr);
				break;

			case "vkGetAccelerationStructureBuildSizesKHR":
				mNativeLib.LoadFunction("vkGetAccelerationStructureBuildSizesKHR", out vkGetAccelerationStructureBuildSizesKHR_ptr);
				break;

			case "vkCmdTraceRaysKHR":
				mNativeLib.LoadFunction("vkCmdTraceRaysKHR", out vkCmdTraceRaysKHR_ptr);
				break;

			case "vkCreateRayTracingPipelinesKHR":
				mNativeLib.LoadFunction("vkCreateRayTracingPipelinesKHR", out vkCreateRayTracingPipelinesKHR_ptr);
				break;

			case "vkGetRayTracingShaderGroupHandlesKHR":
				mNativeLib.LoadFunction("vkGetRayTracingShaderGroupHandlesKHR", out vkGetRayTracingShaderGroupHandlesKHR_ptr);
				break;

			case "vkGetRayTracingCaptureReplayShaderGroupHandlesKHR":
				mNativeLib.LoadFunction("vkGetRayTracingCaptureReplayShaderGroupHandlesKHR", out vkGetRayTracingCaptureReplayShaderGroupHandlesKHR_ptr);
				break;

			case "vkCmdTraceRaysIndirectKHR":
				mNativeLib.LoadFunction("vkCmdTraceRaysIndirectKHR", out vkCmdTraceRaysIndirectKHR_ptr);
				break;

			case "vkGetRayTracingShaderGroupStackSizeKHR":
				mNativeLib.LoadFunction("vkGetRayTracingShaderGroupStackSizeKHR", out vkGetRayTracingShaderGroupStackSizeKHR_ptr);
				break;

			case "vkCmdSetRayTracingPipelineStackSizeKHR":
				mNativeLib.LoadFunction("vkCmdSetRayTracingPipelineStackSizeKHR", out vkCmdSetRayTracingPipelineStackSizeKHR_ptr);
				break;

			case "vkGetImageDrmFormatModifierPropertiesEXT":
				mNativeLib.LoadFunction("vkGetImageDrmFormatModifierPropertiesEXT", out vkGetImageDrmFormatModifierPropertiesEXT_ptr);
				break;

			case "vkCreateValidationCacheEXT":
				mNativeLib.LoadFunction("vkCreateValidationCacheEXT", out vkCreateValidationCacheEXT_ptr);
				break;

			case "vkDestroyValidationCacheEXT":
				mNativeLib.LoadFunction("vkDestroyValidationCacheEXT", out vkDestroyValidationCacheEXT_ptr);
				break;

			case "vkMergeValidationCachesEXT":
				mNativeLib.LoadFunction("vkMergeValidationCachesEXT", out vkMergeValidationCachesEXT_ptr);
				break;

			case "vkGetValidationCacheDataEXT":
				mNativeLib.LoadFunction("vkGetValidationCacheDataEXT", out vkGetValidationCacheDataEXT_ptr);
				break;

			case "vkCmdBindShadingRateImageNV":
				mNativeLib.LoadFunction("vkCmdBindShadingRateImageNV", out vkCmdBindShadingRateImageNV_ptr);
				break;

			case "vkCmdSetViewportShadingRatePaletteNV":
				mNativeLib.LoadFunction("vkCmdSetViewportShadingRatePaletteNV", out vkCmdSetViewportShadingRatePaletteNV_ptr);
				break;

			case "vkCmdSetCoarseSampleOrderNV":
				mNativeLib.LoadFunction("vkCmdSetCoarseSampleOrderNV", out vkCmdSetCoarseSampleOrderNV_ptr);
				break;

			case "vkCreateAccelerationStructureNV":
				mNativeLib.LoadFunction("vkCreateAccelerationStructureNV", out vkCreateAccelerationStructureNV_ptr);
				break;

			case "vkDestroyAccelerationStructureNV":
				mNativeLib.LoadFunction("vkDestroyAccelerationStructureNV", out vkDestroyAccelerationStructureNV_ptr);
				break;

			case "vkGetAccelerationStructureMemoryRequirementsNV":
				mNativeLib.LoadFunction("vkGetAccelerationStructureMemoryRequirementsNV", out vkGetAccelerationStructureMemoryRequirementsNV_ptr);
				break;

			case "vkBindAccelerationStructureMemoryNV":
				mNativeLib.LoadFunction("vkBindAccelerationStructureMemoryNV", out vkBindAccelerationStructureMemoryNV_ptr);
				break;

			case "vkCmdBuildAccelerationStructureNV":
				mNativeLib.LoadFunction("vkCmdBuildAccelerationStructureNV", out vkCmdBuildAccelerationStructureNV_ptr);
				break;

			case "vkCmdCopyAccelerationStructureNV":
				mNativeLib.LoadFunction("vkCmdCopyAccelerationStructureNV", out vkCmdCopyAccelerationStructureNV_ptr);
				break;

			case "vkCmdTraceRaysNV":
				mNativeLib.LoadFunction("vkCmdTraceRaysNV", out vkCmdTraceRaysNV_ptr);
				break;

			case "vkCreateRayTracingPipelinesNV":
				mNativeLib.LoadFunction("vkCreateRayTracingPipelinesNV", out vkCreateRayTracingPipelinesNV_ptr);
				break;

			case "vkGetAccelerationStructureHandleNV":
				mNativeLib.LoadFunction("vkGetAccelerationStructureHandleNV", out vkGetAccelerationStructureHandleNV_ptr);
				break;

			case "vkCmdWriteAccelerationStructuresPropertiesNV":
				mNativeLib.LoadFunction("vkCmdWriteAccelerationStructuresPropertiesNV", out vkCmdWriteAccelerationStructuresPropertiesNV_ptr);
				break;

			case "vkCompileDeferredNV":
				mNativeLib.LoadFunction("vkCompileDeferredNV", out vkCompileDeferredNV_ptr);
				break;

			case "vkGetMemoryHostPointerPropertiesEXT":
				mNativeLib.LoadFunction("vkGetMemoryHostPointerPropertiesEXT", out vkGetMemoryHostPointerPropertiesEXT_ptr);
				break;

			case "vkCmdWriteBufferMarkerAMD":
				mNativeLib.LoadFunction("vkCmdWriteBufferMarkerAMD", out vkCmdWriteBufferMarkerAMD_ptr);
				break;

			case "vkGetPhysicalDeviceCalibrateableTimeDomainsEXT":
				mNativeLib.LoadFunction("vkGetPhysicalDeviceCalibrateableTimeDomainsEXT", out vkGetPhysicalDeviceCalibrateableTimeDomainsEXT_ptr);
				break;

			case "vkGetCalibratedTimestampsEXT":
				mNativeLib.LoadFunction("vkGetCalibratedTimestampsEXT", out vkGetCalibratedTimestampsEXT_ptr);
				break;

			case "vkCmdDrawMeshTasksNV":
				mNativeLib.LoadFunction("vkCmdDrawMeshTasksNV", out vkCmdDrawMeshTasksNV_ptr);
				break;

			case "vkCmdDrawMeshTasksIndirectNV":
				mNativeLib.LoadFunction("vkCmdDrawMeshTasksIndirectNV", out vkCmdDrawMeshTasksIndirectNV_ptr);
				break;

			case "vkCmdDrawMeshTasksIndirectCountNV":
				mNativeLib.LoadFunction("vkCmdDrawMeshTasksIndirectCountNV", out vkCmdDrawMeshTasksIndirectCountNV_ptr);
				break;

			case "vkCmdSetExclusiveScissorNV":
				mNativeLib.LoadFunction("vkCmdSetExclusiveScissorNV", out vkCmdSetExclusiveScissorNV_ptr);
				break;

			case "vkCmdSetCheckpointNV":
				mNativeLib.LoadFunction("vkCmdSetCheckpointNV", out vkCmdSetCheckpointNV_ptr);
				break;

			case "vkGetQueueCheckpointDataNV":
				mNativeLib.LoadFunction("vkGetQueueCheckpointDataNV", out vkGetQueueCheckpointDataNV_ptr);
				break;

			case "vkInitializePerformanceApiINTEL":
				mNativeLib.LoadFunction("vkInitializePerformanceApiINTEL", out vkInitializePerformanceApiINTEL_ptr);
				break;

			case "vkUninitializePerformanceApiINTEL":
				mNativeLib.LoadFunction("vkUninitializePerformanceApiINTEL", out vkUninitializePerformanceApiINTEL_ptr);
				break;

			case "vkCmdSetPerformanceMarkerINTEL":
				mNativeLib.LoadFunction("vkCmdSetPerformanceMarkerINTEL", out vkCmdSetPerformanceMarkerINTEL_ptr);
				break;

			case "vkCmdSetPerformanceStreamMarkerINTEL":
				mNativeLib.LoadFunction("vkCmdSetPerformanceStreamMarkerINTEL", out vkCmdSetPerformanceStreamMarkerINTEL_ptr);
				break;

			case "vkCmdSetPerformanceOverrideINTEL":
				mNativeLib.LoadFunction("vkCmdSetPerformanceOverrideINTEL", out vkCmdSetPerformanceOverrideINTEL_ptr);
				break;

			case "vkAcquirePerformanceConfigurationINTEL":
				mNativeLib.LoadFunction("vkAcquirePerformanceConfigurationINTEL", out vkAcquirePerformanceConfigurationINTEL_ptr);
				break;

			case "vkReleasePerformanceConfigurationINTEL":
				mNativeLib.LoadFunction("vkReleasePerformanceConfigurationINTEL", out vkReleasePerformanceConfigurationINTEL_ptr);
				break;

			case "vkQueueSetPerformanceConfigurationINTEL":
				mNativeLib.LoadFunction("vkQueueSetPerformanceConfigurationINTEL", out vkQueueSetPerformanceConfigurationINTEL_ptr);
				break;

			case "vkGetPerformanceParameterINTEL":
				mNativeLib.LoadFunction("vkGetPerformanceParameterINTEL", out vkGetPerformanceParameterINTEL_ptr);
				break;

			case "vkSetLocalDimmingAMD":
				mNativeLib.LoadFunction("vkSetLocalDimmingAMD", out vkSetLocalDimmingAMD_ptr);
				break;

			case "vkCreateImagePipeSurfaceFUCHSIA":
				mNativeLib.LoadFunction("vkCreateImagePipeSurfaceFUCHSIA", out vkCreateImagePipeSurfaceFUCHSIA_ptr);
				break;

			case "vkCreateMetalSurfaceEXT":
				mNativeLib.LoadFunction("vkCreateMetalSurfaceEXT", out vkCreateMetalSurfaceEXT_ptr);
				break;

			case "vkGetPhysicalDeviceFragmentShadingRatesKHR":
				mNativeLib.LoadFunction("vkGetPhysicalDeviceFragmentShadingRatesKHR", out vkGetPhysicalDeviceFragmentShadingRatesKHR_ptr);
				break;

			case "vkCmdSetFragmentShadingRateKHR":
				mNativeLib.LoadFunction("vkCmdSetFragmentShadingRateKHR", out vkCmdSetFragmentShadingRateKHR_ptr);
				break;

			case "vkWaitForPresentKHR":
				mNativeLib.LoadFunction("vkWaitForPresentKHR", out vkWaitForPresentKHR_ptr);
				break;

			case "vkGetPhysicalDeviceCooperativeMatrixPropertiesNV":
				mNativeLib.LoadFunction("vkGetPhysicalDeviceCooperativeMatrixPropertiesNV", out vkGetPhysicalDeviceCooperativeMatrixPropertiesNV_ptr);
				break;

			case "vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV":
				mNativeLib.LoadFunction("vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV", out vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV_ptr);
				break;

			case "vkGetPhysicalDeviceSurfacePresentModes2EXT":
				mNativeLib.LoadFunction("vkGetPhysicalDeviceSurfacePresentModes2EXT", out vkGetPhysicalDeviceSurfacePresentModes2EXT_ptr);
				break;

			case "vkAcquireFullScreenExclusiveModeEXT":
				mNativeLib.LoadFunction("vkAcquireFullScreenExclusiveModeEXT", out vkAcquireFullScreenExclusiveModeEXT_ptr);
				break;

			case "vkReleaseFullScreenExclusiveModeEXT":
				mNativeLib.LoadFunction("vkReleaseFullScreenExclusiveModeEXT", out vkReleaseFullScreenExclusiveModeEXT_ptr);
				break;

			case "vkCreateHeadlessSurfaceEXT":
				mNativeLib.LoadFunction("vkCreateHeadlessSurfaceEXT", out vkCreateHeadlessSurfaceEXT_ptr);
				break;

			case "vkCmdSetLineStippleEXT":
				mNativeLib.LoadFunction("vkCmdSetLineStippleEXT", out vkCmdSetLineStippleEXT_ptr);
				break;

			case "vkCreateDeferredOperationKHR":
				mNativeLib.LoadFunction("vkCreateDeferredOperationKHR", out vkCreateDeferredOperationKHR_ptr);
				break;

			case "vkDestroyDeferredOperationKHR":
				mNativeLib.LoadFunction("vkDestroyDeferredOperationKHR", out vkDestroyDeferredOperationKHR_ptr);
				break;

			case "vkGetDeferredOperationMaxConcurrencyKHR":
				mNativeLib.LoadFunction("vkGetDeferredOperationMaxConcurrencyKHR", out vkGetDeferredOperationMaxConcurrencyKHR_ptr);
				break;

			case "vkGetDeferredOperationResultKHR":
				mNativeLib.LoadFunction("vkGetDeferredOperationResultKHR", out vkGetDeferredOperationResultKHR_ptr);
				break;

			case "vkDeferredOperationJoinKHR":
				mNativeLib.LoadFunction("vkDeferredOperationJoinKHR", out vkDeferredOperationJoinKHR_ptr);
				break;

			case "vkGetPipelineExecutablePropertiesKHR":
				mNativeLib.LoadFunction("vkGetPipelineExecutablePropertiesKHR", out vkGetPipelineExecutablePropertiesKHR_ptr);
				break;

			case "vkGetPipelineExecutableStatisticsKHR":
				mNativeLib.LoadFunction("vkGetPipelineExecutableStatisticsKHR", out vkGetPipelineExecutableStatisticsKHR_ptr);
				break;

			case "vkGetPipelineExecutableInternalRepresentationsKHR":
				mNativeLib.LoadFunction("vkGetPipelineExecutableInternalRepresentationsKHR", out vkGetPipelineExecutableInternalRepresentationsKHR_ptr);
				break;

			case "vkGetGeneratedCommandsMemoryRequirementsNV":
				mNativeLib.LoadFunction("vkGetGeneratedCommandsMemoryRequirementsNV", out vkGetGeneratedCommandsMemoryRequirementsNV_ptr);
				break;

			case "vkCmdPreprocessGeneratedCommandsNV":
				mNativeLib.LoadFunction("vkCmdPreprocessGeneratedCommandsNV", out vkCmdPreprocessGeneratedCommandsNV_ptr);
				break;

			case "vkCmdExecuteGeneratedCommandsNV":
				mNativeLib.LoadFunction("vkCmdExecuteGeneratedCommandsNV", out vkCmdExecuteGeneratedCommandsNV_ptr);
				break;

			case "vkCmdBindPipelineShaderGroupNV":
				mNativeLib.LoadFunction("vkCmdBindPipelineShaderGroupNV", out vkCmdBindPipelineShaderGroupNV_ptr);
				break;

			case "vkCreateIndirectCommandsLayoutNV":
				mNativeLib.LoadFunction("vkCreateIndirectCommandsLayoutNV", out vkCreateIndirectCommandsLayoutNV_ptr);
				break;

			case "vkDestroyIndirectCommandsLayoutNV":
				mNativeLib.LoadFunction("vkDestroyIndirectCommandsLayoutNV", out vkDestroyIndirectCommandsLayoutNV_ptr);
				break;

			case "vkAcquireDrmDisplayEXT":
				mNativeLib.LoadFunction("vkAcquireDrmDisplayEXT", out vkAcquireDrmDisplayEXT_ptr);
				break;

			case "vkGetDrmDisplayEXT":
				mNativeLib.LoadFunction("vkGetDrmDisplayEXT", out vkGetDrmDisplayEXT_ptr);
				break;

			case "vkCmdEncodeVideoKHR":
				mNativeLib.LoadFunction("vkCmdEncodeVideoKHR", out vkCmdEncodeVideoKHR_ptr);
				break;

			case "vkExportMetalObjectsEXT":
				mNativeLib.LoadFunction("vkExportMetalObjectsEXT", out vkExportMetalObjectsEXT_ptr);
				break;

			case "vkCmdSetFragmentShadingRateEnumNV":
				mNativeLib.LoadFunction("vkCmdSetFragmentShadingRateEnumNV", out vkCmdSetFragmentShadingRateEnumNV_ptr);
				break;

			case "vkGetImageSubresourceLayout2EXT":
				mNativeLib.LoadFunction("vkGetImageSubresourceLayout2EXT", out vkGetImageSubresourceLayout2EXT_ptr);
				break;

			case "vkAcquireWinrtDisplayNV":
				mNativeLib.LoadFunction("vkAcquireWinrtDisplayNV", out vkAcquireWinrtDisplayNV_ptr);
				break;

			case "vkGetWinrtDisplayNV":
				mNativeLib.LoadFunction("vkGetWinrtDisplayNV", out vkGetWinrtDisplayNV_ptr);
				break;

			case "vkCreateDirectFBSurfaceEXT":
				mNativeLib.LoadFunction("vkCreateDirectFBSurfaceEXT", out vkCreateDirectFBSurfaceEXT_ptr);
				break;

			case "vkGetPhysicalDeviceDirectFBPresentationSupportEXT":
				mNativeLib.LoadFunction("vkGetPhysicalDeviceDirectFBPresentationSupportEXT", out vkGetPhysicalDeviceDirectFBPresentationSupportEXT_ptr);
				break;

			case "vkCmdSetVertexInputEXT":
				mNativeLib.LoadFunction("vkCmdSetVertexInputEXT", out vkCmdSetVertexInputEXT_ptr);
				break;

			case "vkGetMemoryZirconHandleFUCHSIA":
				mNativeLib.LoadFunction("vkGetMemoryZirconHandleFUCHSIA", out vkGetMemoryZirconHandleFUCHSIA_ptr);
				break;

			case "vkGetMemoryZirconHandlePropertiesFUCHSIA":
				mNativeLib.LoadFunction("vkGetMemoryZirconHandlePropertiesFUCHSIA", out vkGetMemoryZirconHandlePropertiesFUCHSIA_ptr);
				break;

			case "vkImportSemaphoreZirconHandleFUCHSIA":
				mNativeLib.LoadFunction("vkImportSemaphoreZirconHandleFUCHSIA", out vkImportSemaphoreZirconHandleFUCHSIA_ptr);
				break;

			case "vkGetSemaphoreZirconHandleFUCHSIA":
				mNativeLib.LoadFunction("vkGetSemaphoreZirconHandleFUCHSIA", out vkGetSemaphoreZirconHandleFUCHSIA_ptr);
				break;

			case "vkCreateBufferCollectionFUCHSIA":
				mNativeLib.LoadFunction("vkCreateBufferCollectionFUCHSIA", out vkCreateBufferCollectionFUCHSIA_ptr);
				break;

			case "vkSetBufferCollectionImageConstraintsFUCHSIA":
				mNativeLib.LoadFunction("vkSetBufferCollectionImageConstraintsFUCHSIA", out vkSetBufferCollectionImageConstraintsFUCHSIA_ptr);
				break;

			case "vkSetBufferCollectionBufferConstraintsFUCHSIA":
				mNativeLib.LoadFunction("vkSetBufferCollectionBufferConstraintsFUCHSIA", out vkSetBufferCollectionBufferConstraintsFUCHSIA_ptr);
				break;

			case "vkDestroyBufferCollectionFUCHSIA":
				mNativeLib.LoadFunction("vkDestroyBufferCollectionFUCHSIA", out vkDestroyBufferCollectionFUCHSIA_ptr);
				break;

			case "vkGetBufferCollectionPropertiesFUCHSIA":
				mNativeLib.LoadFunction("vkGetBufferCollectionPropertiesFUCHSIA", out vkGetBufferCollectionPropertiesFUCHSIA_ptr);
				break;

			case "vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI":
				mNativeLib.LoadFunction("vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI", out vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI_ptr);
				break;

			case "vkCmdSubpassShadingHUAWEI":
				mNativeLib.LoadFunction("vkCmdSubpassShadingHUAWEI", out vkCmdSubpassShadingHUAWEI_ptr);
				break;

			case "vkCmdBindInvocationMaskHUAWEI":
				mNativeLib.LoadFunction("vkCmdBindInvocationMaskHUAWEI", out vkCmdBindInvocationMaskHUAWEI_ptr);
				break;

			case "vkGetMemoryRemoteAddressNV":
				mNativeLib.LoadFunction("vkGetMemoryRemoteAddressNV", out vkGetMemoryRemoteAddressNV_ptr);
				break;

			case "vkGetPipelinePropertiesEXT":
				mNativeLib.LoadFunction("vkGetPipelinePropertiesEXT", out vkGetPipelinePropertiesEXT_ptr);
				break;

			case "vkCmdSetPatchControlPointsEXT":
				mNativeLib.LoadFunction("vkCmdSetPatchControlPointsEXT", out vkCmdSetPatchControlPointsEXT_ptr);
				break;

			case "vkCmdSetLogicOpEXT":
				mNativeLib.LoadFunction("vkCmdSetLogicOpEXT", out vkCmdSetLogicOpEXT_ptr);
				break;

			case "vkCreateScreenSurfaceQNX":
				mNativeLib.LoadFunction("vkCreateScreenSurfaceQNX", out vkCreateScreenSurfaceQNX_ptr);
				break;

			case "vkGetPhysicalDeviceScreenPresentationSupportQNX":
				mNativeLib.LoadFunction("vkGetPhysicalDeviceScreenPresentationSupportQNX", out vkGetPhysicalDeviceScreenPresentationSupportQNX_ptr);
				break;

			case "vkCmdSetColorWriteEnableEXT":
				mNativeLib.LoadFunction("vkCmdSetColorWriteEnableEXT", out vkCmdSetColorWriteEnableEXT_ptr);
				break;

			case "vkCmdDrawMultiEXT":
				mNativeLib.LoadFunction("vkCmdDrawMultiEXT", out vkCmdDrawMultiEXT_ptr);
				break;

			case "vkCmdDrawMultiIndexedEXT":
				mNativeLib.LoadFunction("vkCmdDrawMultiIndexedEXT", out vkCmdDrawMultiIndexedEXT_ptr);
				break;

			case "vkSetDeviceMemoryPriorityEXT":
				mNativeLib.LoadFunction("vkSetDeviceMemoryPriorityEXT", out vkSetDeviceMemoryPriorityEXT_ptr);
				break;

			case "vkGetDescriptorSetLayoutHostMappingInfoVALVE":
				mNativeLib.LoadFunction("vkGetDescriptorSetLayoutHostMappingInfoVALVE", out vkGetDescriptorSetLayoutHostMappingInfoVALVE_ptr);
				break;

			case "vkGetDescriptorSetHostMappingVALVE":
				mNativeLib.LoadFunction("vkGetDescriptorSetHostMappingVALVE", out vkGetDescriptorSetHostMappingVALVE_ptr);
				break;

			default:
				Runtime.FatalError(scope $"Unknown function name '{name}'.");
			}
		}

		public static void LoadFunctions(in Span<StringView> functions, VkInstance? instance = null)
		{
			if(instance != null)
				SetInstance(instance.Value);

			for (var func in functions)
			{
				LoadFunction(func);
			}
		}

		private static void LoadAllFuncions(VkInstance? instance = null, List<StringView> excludeFunctions = null)
		{
			if (instance != null)
				SetInstance(instance.Value);

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCreateInstance"))
				LoadFunction("vkCreateInstance");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkDestroyInstance"))
				LoadFunction("vkDestroyInstance");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkEnumeratePhysicalDevices"))
				LoadFunction("vkEnumeratePhysicalDevices");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetPhysicalDeviceFeatures"))
				LoadFunction("vkGetPhysicalDeviceFeatures");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetPhysicalDeviceFormatProperties"))
				LoadFunction("vkGetPhysicalDeviceFormatProperties");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetPhysicalDeviceImageFormatProperties"))
				LoadFunction("vkGetPhysicalDeviceImageFormatProperties");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetPhysicalDeviceProperties"))
				LoadFunction("vkGetPhysicalDeviceProperties");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetPhysicalDeviceQueueFamilyProperties"))
				LoadFunction("vkGetPhysicalDeviceQueueFamilyProperties");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetPhysicalDeviceMemoryProperties"))
				LoadFunction("vkGetPhysicalDeviceMemoryProperties");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetInstanceProcAddr"))
				LoadFunction("vkGetInstanceProcAddr");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetDeviceProcAddr"))
				LoadFunction("vkGetDeviceProcAddr");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCreateDevice"))
				LoadFunction("vkCreateDevice");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkDestroyDevice"))
				LoadFunction("vkDestroyDevice");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkEnumerateInstanceExtensionProperties"))
				LoadFunction("vkEnumerateInstanceExtensionProperties");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkEnumerateDeviceExtensionProperties"))
				LoadFunction("vkEnumerateDeviceExtensionProperties");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkEnumerateInstanceLayerProperties"))
				LoadFunction("vkEnumerateInstanceLayerProperties");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkEnumerateDeviceLayerProperties"))
				LoadFunction("vkEnumerateDeviceLayerProperties");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetDeviceQueue"))
				LoadFunction("vkGetDeviceQueue");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkQueueSubmit"))
				LoadFunction("vkQueueSubmit");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkQueueWaitIdle"))
				LoadFunction("vkQueueWaitIdle");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkDeviceWaitIdle"))
				LoadFunction("vkDeviceWaitIdle");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkAllocateMemory"))
				LoadFunction("vkAllocateMemory");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkFreeMemory"))
				LoadFunction("vkFreeMemory");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkMapMemory"))
				LoadFunction("vkMapMemory");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkUnmapMemory"))
				LoadFunction("vkUnmapMemory");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkFlushMappedMemoryRanges"))
				LoadFunction("vkFlushMappedMemoryRanges");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkInvalidateMappedMemoryRanges"))
				LoadFunction("vkInvalidateMappedMemoryRanges");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetDeviceMemoryCommitment"))
				LoadFunction("vkGetDeviceMemoryCommitment");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkBindBufferMemory"))
				LoadFunction("vkBindBufferMemory");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkBindImageMemory"))
				LoadFunction("vkBindImageMemory");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetBufferMemoryRequirements"))
				LoadFunction("vkGetBufferMemoryRequirements");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetImageMemoryRequirements"))
				LoadFunction("vkGetImageMemoryRequirements");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetImageSparseMemoryRequirements"))
				LoadFunction("vkGetImageSparseMemoryRequirements");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetPhysicalDeviceSparseImageFormatProperties"))
				LoadFunction("vkGetPhysicalDeviceSparseImageFormatProperties");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkQueueBindSparse"))
				LoadFunction("vkQueueBindSparse");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCreateFence"))
				LoadFunction("vkCreateFence");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkDestroyFence"))
				LoadFunction("vkDestroyFence");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkResetFences"))
				LoadFunction("vkResetFences");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetFenceStatus"))
				LoadFunction("vkGetFenceStatus");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkWaitForFences"))
				LoadFunction("vkWaitForFences");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCreateSemaphore"))
				LoadFunction("vkCreateSemaphore");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkDestroySemaphore"))
				LoadFunction("vkDestroySemaphore");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCreateEvent"))
				LoadFunction("vkCreateEvent");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkDestroyEvent"))
				LoadFunction("vkDestroyEvent");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetEventStatus"))
				LoadFunction("vkGetEventStatus");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkSetEvent"))
				LoadFunction("vkSetEvent");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkResetEvent"))
				LoadFunction("vkResetEvent");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCreateQueryPool"))
				LoadFunction("vkCreateQueryPool");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkDestroyQueryPool"))
				LoadFunction("vkDestroyQueryPool");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetQueryPoolResults"))
				LoadFunction("vkGetQueryPoolResults");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCreateBuffer"))
				LoadFunction("vkCreateBuffer");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkDestroyBuffer"))
				LoadFunction("vkDestroyBuffer");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCreateBufferView"))
				LoadFunction("vkCreateBufferView");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkDestroyBufferView"))
				LoadFunction("vkDestroyBufferView");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCreateImage"))
				LoadFunction("vkCreateImage");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkDestroyImage"))
				LoadFunction("vkDestroyImage");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetImageSubresourceLayout"))
				LoadFunction("vkGetImageSubresourceLayout");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCreateImageView"))
				LoadFunction("vkCreateImageView");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkDestroyImageView"))
				LoadFunction("vkDestroyImageView");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCreateShaderModule"))
				LoadFunction("vkCreateShaderModule");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkDestroyShaderModule"))
				LoadFunction("vkDestroyShaderModule");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCreatePipelineCache"))
				LoadFunction("vkCreatePipelineCache");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkDestroyPipelineCache"))
				LoadFunction("vkDestroyPipelineCache");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetPipelineCacheData"))
				LoadFunction("vkGetPipelineCacheData");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkMergePipelineCaches"))
				LoadFunction("vkMergePipelineCaches");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCreateGraphicsPipelines"))
				LoadFunction("vkCreateGraphicsPipelines");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCreateComputePipelines"))
				LoadFunction("vkCreateComputePipelines");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkDestroyPipeline"))
				LoadFunction("vkDestroyPipeline");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCreatePipelineLayout"))
				LoadFunction("vkCreatePipelineLayout");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkDestroyPipelineLayout"))
				LoadFunction("vkDestroyPipelineLayout");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCreateSampler"))
				LoadFunction("vkCreateSampler");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkDestroySampler"))
				LoadFunction("vkDestroySampler");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCreateDescriptorSetLayout"))
				LoadFunction("vkCreateDescriptorSetLayout");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkDestroyDescriptorSetLayout"))
				LoadFunction("vkDestroyDescriptorSetLayout");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCreateDescriptorPool"))
				LoadFunction("vkCreateDescriptorPool");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkDestroyDescriptorPool"))
				LoadFunction("vkDestroyDescriptorPool");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkResetDescriptorPool"))
				LoadFunction("vkResetDescriptorPool");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkAllocateDescriptorSets"))
				LoadFunction("vkAllocateDescriptorSets");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkFreeDescriptorSets"))
				LoadFunction("vkFreeDescriptorSets");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkUpdateDescriptorSets"))
				LoadFunction("vkUpdateDescriptorSets");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCreateFramebuffer"))
				LoadFunction("vkCreateFramebuffer");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkDestroyFramebuffer"))
				LoadFunction("vkDestroyFramebuffer");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCreateRenderPass"))
				LoadFunction("vkCreateRenderPass");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkDestroyRenderPass"))
				LoadFunction("vkDestroyRenderPass");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetRenderAreaGranularity"))
				LoadFunction("vkGetRenderAreaGranularity");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCreateCommandPool"))
				LoadFunction("vkCreateCommandPool");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkDestroyCommandPool"))
				LoadFunction("vkDestroyCommandPool");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkResetCommandPool"))
				LoadFunction("vkResetCommandPool");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkAllocateCommandBuffers"))
				LoadFunction("vkAllocateCommandBuffers");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkFreeCommandBuffers"))
				LoadFunction("vkFreeCommandBuffers");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkBeginCommandBuffer"))
				LoadFunction("vkBeginCommandBuffer");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkEndCommandBuffer"))
				LoadFunction("vkEndCommandBuffer");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkResetCommandBuffer"))
				LoadFunction("vkResetCommandBuffer");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdBindPipeline"))
				LoadFunction("vkCmdBindPipeline");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdSetViewport"))
				LoadFunction("vkCmdSetViewport");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdSetScissor"))
				LoadFunction("vkCmdSetScissor");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdSetLineWidth"))
				LoadFunction("vkCmdSetLineWidth");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdSetDepthBias"))
				LoadFunction("vkCmdSetDepthBias");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdSetBlendConstants"))
				LoadFunction("vkCmdSetBlendConstants");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdSetDepthBounds"))
				LoadFunction("vkCmdSetDepthBounds");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdSetStencilCompareMask"))
				LoadFunction("vkCmdSetStencilCompareMask");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdSetStencilWriteMask"))
				LoadFunction("vkCmdSetStencilWriteMask");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdSetStencilReference"))
				LoadFunction("vkCmdSetStencilReference");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdBindDescriptorSets"))
				LoadFunction("vkCmdBindDescriptorSets");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdBindIndexBuffer"))
				LoadFunction("vkCmdBindIndexBuffer");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdBindVertexBuffers"))
				LoadFunction("vkCmdBindVertexBuffers");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdDraw"))
				LoadFunction("vkCmdDraw");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdDrawIndexed"))
				LoadFunction("vkCmdDrawIndexed");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdDrawIndirect"))
				LoadFunction("vkCmdDrawIndirect");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdDrawIndexedIndirect"))
				LoadFunction("vkCmdDrawIndexedIndirect");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdDispatch"))
				LoadFunction("vkCmdDispatch");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdDispatchIndirect"))
				LoadFunction("vkCmdDispatchIndirect");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdCopyBuffer"))
				LoadFunction("vkCmdCopyBuffer");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdCopyImage"))
				LoadFunction("vkCmdCopyImage");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdBlitImage"))
				LoadFunction("vkCmdBlitImage");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdCopyBufferToImage"))
				LoadFunction("vkCmdCopyBufferToImage");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdCopyImageToBuffer"))
				LoadFunction("vkCmdCopyImageToBuffer");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdUpdateBuffer"))
				LoadFunction("vkCmdUpdateBuffer");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdFillBuffer"))
				LoadFunction("vkCmdFillBuffer");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdClearColorImage"))
				LoadFunction("vkCmdClearColorImage");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdClearDepthStencilImage"))
				LoadFunction("vkCmdClearDepthStencilImage");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdClearAttachments"))
				LoadFunction("vkCmdClearAttachments");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdResolveImage"))
				LoadFunction("vkCmdResolveImage");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdSetEvent"))
				LoadFunction("vkCmdSetEvent");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdResetEvent"))
				LoadFunction("vkCmdResetEvent");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdWaitEvents"))
				LoadFunction("vkCmdWaitEvents");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdPipelineBarrier"))
				LoadFunction("vkCmdPipelineBarrier");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdBeginQuery"))
				LoadFunction("vkCmdBeginQuery");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdEndQuery"))
				LoadFunction("vkCmdEndQuery");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdResetQueryPool"))
				LoadFunction("vkCmdResetQueryPool");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdWriteTimestamp"))
				LoadFunction("vkCmdWriteTimestamp");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdCopyQueryPoolResults"))
				LoadFunction("vkCmdCopyQueryPoolResults");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdPushConstants"))
				LoadFunction("vkCmdPushConstants");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdBeginRenderPass"))
				LoadFunction("vkCmdBeginRenderPass");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdNextSubpass"))
				LoadFunction("vkCmdNextSubpass");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdEndRenderPass"))
				LoadFunction("vkCmdEndRenderPass");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdExecuteCommands"))
				LoadFunction("vkCmdExecuteCommands");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkEnumerateInstanceVersion"))
				LoadFunction("vkEnumerateInstanceVersion");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkBindBufferMemory2"))
				LoadFunction("vkBindBufferMemory2");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkBindImageMemory2"))
				LoadFunction("vkBindImageMemory2");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetDeviceGroupPeerMemoryFeatures"))
				LoadFunction("vkGetDeviceGroupPeerMemoryFeatures");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdSetDeviceMask"))
				LoadFunction("vkCmdSetDeviceMask");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdDispatchBase"))
				LoadFunction("vkCmdDispatchBase");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkEnumeratePhysicalDeviceGroups"))
				LoadFunction("vkEnumeratePhysicalDeviceGroups");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetImageMemoryRequirements2"))
				LoadFunction("vkGetImageMemoryRequirements2");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetBufferMemoryRequirements2"))
				LoadFunction("vkGetBufferMemoryRequirements2");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetImageSparseMemoryRequirements2"))
				LoadFunction("vkGetImageSparseMemoryRequirements2");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetPhysicalDeviceFeatures2"))
				LoadFunction("vkGetPhysicalDeviceFeatures2");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetPhysicalDeviceProperties2"))
				LoadFunction("vkGetPhysicalDeviceProperties2");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetPhysicalDeviceFormatProperties2"))
				LoadFunction("vkGetPhysicalDeviceFormatProperties2");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetPhysicalDeviceImageFormatProperties2"))
				LoadFunction("vkGetPhysicalDeviceImageFormatProperties2");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetPhysicalDeviceQueueFamilyProperties2"))
				LoadFunction("vkGetPhysicalDeviceQueueFamilyProperties2");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetPhysicalDeviceMemoryProperties2"))
				LoadFunction("vkGetPhysicalDeviceMemoryProperties2");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetPhysicalDeviceSparseImageFormatProperties2"))
				LoadFunction("vkGetPhysicalDeviceSparseImageFormatProperties2");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkTrimCommandPool"))
				LoadFunction("vkTrimCommandPool");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetDeviceQueue2"))
				LoadFunction("vkGetDeviceQueue2");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCreateSamplerYcbcrConversion"))
				LoadFunction("vkCreateSamplerYcbcrConversion");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkDestroySamplerYcbcrConversion"))
				LoadFunction("vkDestroySamplerYcbcrConversion");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCreateDescriptorUpdateTemplate"))
				LoadFunction("vkCreateDescriptorUpdateTemplate");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkDestroyDescriptorUpdateTemplate"))
				LoadFunction("vkDestroyDescriptorUpdateTemplate");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkUpdateDescriptorSetWithTemplate"))
				LoadFunction("vkUpdateDescriptorSetWithTemplate");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetPhysicalDeviceExternalBufferProperties"))
				LoadFunction("vkGetPhysicalDeviceExternalBufferProperties");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetPhysicalDeviceExternalFenceProperties"))
				LoadFunction("vkGetPhysicalDeviceExternalFenceProperties");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetPhysicalDeviceExternalSemaphoreProperties"))
				LoadFunction("vkGetPhysicalDeviceExternalSemaphoreProperties");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetDescriptorSetLayoutSupport"))
				LoadFunction("vkGetDescriptorSetLayoutSupport");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdDrawIndirectCount"))
				LoadFunction("vkCmdDrawIndirectCount");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdDrawIndexedIndirectCount"))
				LoadFunction("vkCmdDrawIndexedIndirectCount");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCreateRenderPass2"))
				LoadFunction("vkCreateRenderPass2");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdBeginRenderPass2"))
				LoadFunction("vkCmdBeginRenderPass2");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdNextSubpass2"))
				LoadFunction("vkCmdNextSubpass2");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdEndRenderPass2"))
				LoadFunction("vkCmdEndRenderPass2");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkResetQueryPool"))
				LoadFunction("vkResetQueryPool");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetSemaphoreCounterValue"))
				LoadFunction("vkGetSemaphoreCounterValue");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkWaitSemaphores"))
				LoadFunction("vkWaitSemaphores");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkSignalSemaphore"))
				LoadFunction("vkSignalSemaphore");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetBufferDeviceAddress"))
				LoadFunction("vkGetBufferDeviceAddress");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetBufferOpaqueCaptureAddress"))
				LoadFunction("vkGetBufferOpaqueCaptureAddress");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetDeviceMemoryOpaqueCaptureAddress"))
				LoadFunction("vkGetDeviceMemoryOpaqueCaptureAddress");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetPhysicalDeviceToolProperties"))
				LoadFunction("vkGetPhysicalDeviceToolProperties");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCreatePrivateDataSlot"))
				LoadFunction("vkCreatePrivateDataSlot");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkDestroyPrivateDataSlot"))
				LoadFunction("vkDestroyPrivateDataSlot");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkSetPrivateData"))
				LoadFunction("vkSetPrivateData");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetPrivateData"))
				LoadFunction("vkGetPrivateData");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdSetEvent2"))
				LoadFunction("vkCmdSetEvent2");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdResetEvent2"))
				LoadFunction("vkCmdResetEvent2");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdWaitEvents2"))
				LoadFunction("vkCmdWaitEvents2");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdPipelineBarrier2"))
				LoadFunction("vkCmdPipelineBarrier2");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdWriteTimestamp2"))
				LoadFunction("vkCmdWriteTimestamp2");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkQueueSubmit2"))
				LoadFunction("vkQueueSubmit2");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdCopyBuffer2"))
				LoadFunction("vkCmdCopyBuffer2");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdCopyImage2"))
				LoadFunction("vkCmdCopyImage2");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdCopyBufferToImage2"))
				LoadFunction("vkCmdCopyBufferToImage2");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdCopyImageToBuffer2"))
				LoadFunction("vkCmdCopyImageToBuffer2");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdBlitImage2"))
				LoadFunction("vkCmdBlitImage2");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdResolveImage2"))
				LoadFunction("vkCmdResolveImage2");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdBeginRendering"))
				LoadFunction("vkCmdBeginRendering");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdEndRendering"))
				LoadFunction("vkCmdEndRendering");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdSetCullMode"))
				LoadFunction("vkCmdSetCullMode");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdSetFrontFace"))
				LoadFunction("vkCmdSetFrontFace");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdSetPrimitiveTopology"))
				LoadFunction("vkCmdSetPrimitiveTopology");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdSetViewportWithCount"))
				LoadFunction("vkCmdSetViewportWithCount");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdSetScissorWithCount"))
				LoadFunction("vkCmdSetScissorWithCount");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdBindVertexBuffers2"))
				LoadFunction("vkCmdBindVertexBuffers2");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdSetDepthTestEnable"))
				LoadFunction("vkCmdSetDepthTestEnable");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdSetDepthWriteEnable"))
				LoadFunction("vkCmdSetDepthWriteEnable");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdSetDepthCompareOp"))
				LoadFunction("vkCmdSetDepthCompareOp");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdSetDepthBoundsTestEnable"))
				LoadFunction("vkCmdSetDepthBoundsTestEnable");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdSetStencilTestEnable"))
				LoadFunction("vkCmdSetStencilTestEnable");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdSetStencilOp"))
				LoadFunction("vkCmdSetStencilOp");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdSetRasterizerDiscardEnable"))
				LoadFunction("vkCmdSetRasterizerDiscardEnable");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdSetDepthBiasEnable"))
				LoadFunction("vkCmdSetDepthBiasEnable");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdSetPrimitiveRestartEnable"))
				LoadFunction("vkCmdSetPrimitiveRestartEnable");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetDeviceBufferMemoryRequirements"))
				LoadFunction("vkGetDeviceBufferMemoryRequirements");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetDeviceImageMemoryRequirements"))
				LoadFunction("vkGetDeviceImageMemoryRequirements");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetDeviceImageSparseMemoryRequirements"))
				LoadFunction("vkGetDeviceImageSparseMemoryRequirements");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkDestroySurfaceKHR"))
				LoadFunction("vkDestroySurfaceKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetPhysicalDeviceSurfaceSupportKHR"))
				LoadFunction("vkGetPhysicalDeviceSurfaceSupportKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetPhysicalDeviceSurfaceCapabilitiesKHR"))
				LoadFunction("vkGetPhysicalDeviceSurfaceCapabilitiesKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetPhysicalDeviceSurfaceFormatsKHR"))
				LoadFunction("vkGetPhysicalDeviceSurfaceFormatsKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetPhysicalDeviceSurfacePresentModesKHR"))
				LoadFunction("vkGetPhysicalDeviceSurfacePresentModesKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCreateSwapchainKHR"))
				LoadFunction("vkCreateSwapchainKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkDestroySwapchainKHR"))
				LoadFunction("vkDestroySwapchainKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetSwapchainImagesKHR"))
				LoadFunction("vkGetSwapchainImagesKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkAcquireNextImageKHR"))
				LoadFunction("vkAcquireNextImageKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkQueuePresentKHR"))
				LoadFunction("vkQueuePresentKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetPhysicalDeviceDisplayPropertiesKHR"))
				LoadFunction("vkGetPhysicalDeviceDisplayPropertiesKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetPhysicalDeviceDisplayPlanePropertiesKHR"))
				LoadFunction("vkGetPhysicalDeviceDisplayPlanePropertiesKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetDisplayPlaneSupportedDisplaysKHR"))
				LoadFunction("vkGetDisplayPlaneSupportedDisplaysKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetDisplayModePropertiesKHR"))
				LoadFunction("vkGetDisplayModePropertiesKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCreateDisplayModeKHR"))
				LoadFunction("vkCreateDisplayModeKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetDisplayPlaneCapabilitiesKHR"))
				LoadFunction("vkGetDisplayPlaneCapabilitiesKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCreateDisplayPlaneSurfaceKHR"))
				LoadFunction("vkCreateDisplayPlaneSurfaceKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCreateSharedSwapchainsKHR"))
				LoadFunction("vkCreateSharedSwapchainsKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCreateXlibSurfaceKHR"))
				LoadFunction("vkCreateXlibSurfaceKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetPhysicalDeviceXlibPresentationSupportKHR"))
				LoadFunction("vkGetPhysicalDeviceXlibPresentationSupportKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCreateXcbSurfaceKHR"))
				LoadFunction("vkCreateXcbSurfaceKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetPhysicalDeviceXcbPresentationSupportKHR"))
				LoadFunction("vkGetPhysicalDeviceXcbPresentationSupportKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCreateWaylandSurfaceKHR"))
				LoadFunction("vkCreateWaylandSurfaceKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetPhysicalDeviceWaylandPresentationSupportKHR"))
				LoadFunction("vkGetPhysicalDeviceWaylandPresentationSupportKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCreateAndroidSurfaceKHR"))
				LoadFunction("vkCreateAndroidSurfaceKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCreateWin32SurfaceKHR"))
				LoadFunction("vkCreateWin32SurfaceKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetPhysicalDeviceWin32PresentationSupportKHR"))
				LoadFunction("vkGetPhysicalDeviceWin32PresentationSupportKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCreateDebugReportCallbackEXT"))
				LoadFunction("vkCreateDebugReportCallbackEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkDestroyDebugReportCallbackEXT"))
				LoadFunction("vkDestroyDebugReportCallbackEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkDebugReportMessageEXT"))
				LoadFunction("vkDebugReportMessageEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkDebugMarkerSetObjectTagEXT"))
				LoadFunction("vkDebugMarkerSetObjectTagEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkDebugMarkerSetObjectNameEXT"))
				LoadFunction("vkDebugMarkerSetObjectNameEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdDebugMarkerBeginEXT"))
				LoadFunction("vkCmdDebugMarkerBeginEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdDebugMarkerEndEXT"))
				LoadFunction("vkCmdDebugMarkerEndEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdDebugMarkerInsertEXT"))
				LoadFunction("vkCmdDebugMarkerInsertEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetPhysicalDeviceVideoCapabilitiesKHR"))
				LoadFunction("vkGetPhysicalDeviceVideoCapabilitiesKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetPhysicalDeviceVideoFormatPropertiesKHR"))
				LoadFunction("vkGetPhysicalDeviceVideoFormatPropertiesKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCreateVideoSessionKHR"))
				LoadFunction("vkCreateVideoSessionKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkDestroyVideoSessionKHR"))
				LoadFunction("vkDestroyVideoSessionKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetVideoSessionMemoryRequirementsKHR"))
				LoadFunction("vkGetVideoSessionMemoryRequirementsKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkBindVideoSessionMemoryKHR"))
				LoadFunction("vkBindVideoSessionMemoryKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCreateVideoSessionParametersKHR"))
				LoadFunction("vkCreateVideoSessionParametersKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkUpdateVideoSessionParametersKHR"))
				LoadFunction("vkUpdateVideoSessionParametersKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkDestroyVideoSessionParametersKHR"))
				LoadFunction("vkDestroyVideoSessionParametersKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdBeginVideoCodingKHR"))
				LoadFunction("vkCmdBeginVideoCodingKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdEndVideoCodingKHR"))
				LoadFunction("vkCmdEndVideoCodingKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdControlVideoCodingKHR"))
				LoadFunction("vkCmdControlVideoCodingKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdDecodeVideoKHR"))
				LoadFunction("vkCmdDecodeVideoKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdBindTransformFeedbackBuffersEXT"))
				LoadFunction("vkCmdBindTransformFeedbackBuffersEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdBeginTransformFeedbackEXT"))
				LoadFunction("vkCmdBeginTransformFeedbackEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdEndTransformFeedbackEXT"))
				LoadFunction("vkCmdEndTransformFeedbackEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdBeginQueryIndexedEXT"))
				LoadFunction("vkCmdBeginQueryIndexedEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdEndQueryIndexedEXT"))
				LoadFunction("vkCmdEndQueryIndexedEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdDrawIndirectByteCountEXT"))
				LoadFunction("vkCmdDrawIndirectByteCountEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCreateCuModuleNVX"))
				LoadFunction("vkCreateCuModuleNVX");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCreateCuFunctionNVX"))
				LoadFunction("vkCreateCuFunctionNVX");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkDestroyCuModuleNVX"))
				LoadFunction("vkDestroyCuModuleNVX");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkDestroyCuFunctionNVX"))
				LoadFunction("vkDestroyCuFunctionNVX");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdCuLaunchKernelNVX"))
				LoadFunction("vkCmdCuLaunchKernelNVX");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetImageViewHandleNVX"))
				LoadFunction("vkGetImageViewHandleNVX");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetImageViewAddressNVX"))
				LoadFunction("vkGetImageViewAddressNVX");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetShaderInfoAMD"))
				LoadFunction("vkGetShaderInfoAMD");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCreateStreamDescriptorSurfaceGGP"))
				LoadFunction("vkCreateStreamDescriptorSurfaceGGP");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetPhysicalDeviceExternalImageFormatPropertiesNV"))
				LoadFunction("vkGetPhysicalDeviceExternalImageFormatPropertiesNV");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetMemoryWin32HandleNV"))
				LoadFunction("vkGetMemoryWin32HandleNV");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCreateViSurfaceNN"))
				LoadFunction("vkCreateViSurfaceNN");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetMemoryWin32HandleKHR"))
				LoadFunction("vkGetMemoryWin32HandleKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetMemoryWin32HandlePropertiesKHR"))
				LoadFunction("vkGetMemoryWin32HandlePropertiesKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetMemoryFdKHR"))
				LoadFunction("vkGetMemoryFdKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetMemoryFdPropertiesKHR"))
				LoadFunction("vkGetMemoryFdPropertiesKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkImportSemaphoreWin32HandleKHR"))
				LoadFunction("vkImportSemaphoreWin32HandleKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetSemaphoreWin32HandleKHR"))
				LoadFunction("vkGetSemaphoreWin32HandleKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkImportSemaphoreFdKHR"))
				LoadFunction("vkImportSemaphoreFdKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetSemaphoreFdKHR"))
				LoadFunction("vkGetSemaphoreFdKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdPushDescriptorSetKHR"))
				LoadFunction("vkCmdPushDescriptorSetKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdBeginConditionalRenderingEXT"))
				LoadFunction("vkCmdBeginConditionalRenderingEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdEndConditionalRenderingEXT"))
				LoadFunction("vkCmdEndConditionalRenderingEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdSetViewportWScalingNV"))
				LoadFunction("vkCmdSetViewportWScalingNV");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkReleaseDisplayEXT"))
				LoadFunction("vkReleaseDisplayEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkAcquireXlibDisplayEXT"))
				LoadFunction("vkAcquireXlibDisplayEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetRandROutputDisplayEXT"))
				LoadFunction("vkGetRandROutputDisplayEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetPhysicalDeviceSurfaceCapabilities2EXT"))
				LoadFunction("vkGetPhysicalDeviceSurfaceCapabilities2EXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkDisplayPowerControlEXT"))
				LoadFunction("vkDisplayPowerControlEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkRegisterDeviceEventEXT"))
				LoadFunction("vkRegisterDeviceEventEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkRegisterDisplayEventEXT"))
				LoadFunction("vkRegisterDisplayEventEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetSwapchainCounterEXT"))
				LoadFunction("vkGetSwapchainCounterEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetRefreshCycleDurationGOOGLE"))
				LoadFunction("vkGetRefreshCycleDurationGOOGLE");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetPastPresentationTimingGOOGLE"))
				LoadFunction("vkGetPastPresentationTimingGOOGLE");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdSetDiscardRectangleEXT"))
				LoadFunction("vkCmdSetDiscardRectangleEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkSetHdrMetadataEXT"))
				LoadFunction("vkSetHdrMetadataEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetSwapchainStatusKHR"))
				LoadFunction("vkGetSwapchainStatusKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkImportFenceWin32HandleKHR"))
				LoadFunction("vkImportFenceWin32HandleKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetFenceWin32HandleKHR"))
				LoadFunction("vkGetFenceWin32HandleKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkImportFenceFdKHR"))
				LoadFunction("vkImportFenceFdKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetFenceFdKHR"))
				LoadFunction("vkGetFenceFdKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR"))
				LoadFunction("vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR"))
				LoadFunction("vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkAcquireProfilingLockKHR"))
				LoadFunction("vkAcquireProfilingLockKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkReleaseProfilingLockKHR"))
				LoadFunction("vkReleaseProfilingLockKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetPhysicalDeviceSurfaceCapabilities2KHR"))
				LoadFunction("vkGetPhysicalDeviceSurfaceCapabilities2KHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetPhysicalDeviceSurfaceFormats2KHR"))
				LoadFunction("vkGetPhysicalDeviceSurfaceFormats2KHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetPhysicalDeviceDisplayProperties2KHR"))
				LoadFunction("vkGetPhysicalDeviceDisplayProperties2KHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetPhysicalDeviceDisplayPlaneProperties2KHR"))
				LoadFunction("vkGetPhysicalDeviceDisplayPlaneProperties2KHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetDisplayModeProperties2KHR"))
				LoadFunction("vkGetDisplayModeProperties2KHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetDisplayPlaneCapabilities2KHR"))
				LoadFunction("vkGetDisplayPlaneCapabilities2KHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCreateIOSSurfaceMVK"))
				LoadFunction("vkCreateIOSSurfaceMVK");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCreateMacOSSurfaceMVK"))
				LoadFunction("vkCreateMacOSSurfaceMVK");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkSetDebugUtilsObjectNameEXT"))
				LoadFunction("vkSetDebugUtilsObjectNameEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkSetDebugUtilsObjectTagEXT"))
				LoadFunction("vkSetDebugUtilsObjectTagEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkQueueBeginDebugUtilsLabelEXT"))
				LoadFunction("vkQueueBeginDebugUtilsLabelEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkQueueEndDebugUtilsLabelEXT"))
				LoadFunction("vkQueueEndDebugUtilsLabelEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkQueueInsertDebugUtilsLabelEXT"))
				LoadFunction("vkQueueInsertDebugUtilsLabelEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdBeginDebugUtilsLabelEXT"))
				LoadFunction("vkCmdBeginDebugUtilsLabelEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdEndDebugUtilsLabelEXT"))
				LoadFunction("vkCmdEndDebugUtilsLabelEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdInsertDebugUtilsLabelEXT"))
				LoadFunction("vkCmdInsertDebugUtilsLabelEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCreateDebugUtilsMessengerEXT"))
				LoadFunction("vkCreateDebugUtilsMessengerEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkDestroyDebugUtilsMessengerEXT"))
				LoadFunction("vkDestroyDebugUtilsMessengerEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkSubmitDebugUtilsMessageEXT"))
				LoadFunction("vkSubmitDebugUtilsMessageEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetAndroidHardwareBufferPropertiesANDROID"))
				LoadFunction("vkGetAndroidHardwareBufferPropertiesANDROID");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetMemoryAndroidHardwareBufferANDROID"))
				LoadFunction("vkGetMemoryAndroidHardwareBufferANDROID");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdSetSampleLocationsEXT"))
				LoadFunction("vkCmdSetSampleLocationsEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetPhysicalDeviceMultisamplePropertiesEXT"))
				LoadFunction("vkGetPhysicalDeviceMultisamplePropertiesEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCreateAccelerationStructureKHR"))
				LoadFunction("vkCreateAccelerationStructureKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkDestroyAccelerationStructureKHR"))
				LoadFunction("vkDestroyAccelerationStructureKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdBuildAccelerationStructuresKHR"))
				LoadFunction("vkCmdBuildAccelerationStructuresKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdBuildAccelerationStructuresIndirectKHR"))
				LoadFunction("vkCmdBuildAccelerationStructuresIndirectKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkBuildAccelerationStructuresKHR"))
				LoadFunction("vkBuildAccelerationStructuresKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCopyAccelerationStructureKHR"))
				LoadFunction("vkCopyAccelerationStructureKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCopyAccelerationStructureToMemoryKHR"))
				LoadFunction("vkCopyAccelerationStructureToMemoryKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCopyMemoryToAccelerationStructureKHR"))
				LoadFunction("vkCopyMemoryToAccelerationStructureKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkWriteAccelerationStructuresPropertiesKHR"))
				LoadFunction("vkWriteAccelerationStructuresPropertiesKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdCopyAccelerationStructureKHR"))
				LoadFunction("vkCmdCopyAccelerationStructureKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdCopyAccelerationStructureToMemoryKHR"))
				LoadFunction("vkCmdCopyAccelerationStructureToMemoryKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdCopyMemoryToAccelerationStructureKHR"))
				LoadFunction("vkCmdCopyMemoryToAccelerationStructureKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetAccelerationStructureDeviceAddressKHR"))
				LoadFunction("vkGetAccelerationStructureDeviceAddressKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdWriteAccelerationStructuresPropertiesKHR"))
				LoadFunction("vkCmdWriteAccelerationStructuresPropertiesKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetDeviceAccelerationStructureCompatibilityKHR"))
				LoadFunction("vkGetDeviceAccelerationStructureCompatibilityKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetAccelerationStructureBuildSizesKHR"))
				LoadFunction("vkGetAccelerationStructureBuildSizesKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdTraceRaysKHR"))
				LoadFunction("vkCmdTraceRaysKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCreateRayTracingPipelinesKHR"))
				LoadFunction("vkCreateRayTracingPipelinesKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetRayTracingShaderGroupHandlesKHR"))
				LoadFunction("vkGetRayTracingShaderGroupHandlesKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetRayTracingCaptureReplayShaderGroupHandlesKHR"))
				LoadFunction("vkGetRayTracingCaptureReplayShaderGroupHandlesKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdTraceRaysIndirectKHR"))
				LoadFunction("vkCmdTraceRaysIndirectKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetRayTracingShaderGroupStackSizeKHR"))
				LoadFunction("vkGetRayTracingShaderGroupStackSizeKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdSetRayTracingPipelineStackSizeKHR"))
				LoadFunction("vkCmdSetRayTracingPipelineStackSizeKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetImageDrmFormatModifierPropertiesEXT"))
				LoadFunction("vkGetImageDrmFormatModifierPropertiesEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCreateValidationCacheEXT"))
				LoadFunction("vkCreateValidationCacheEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkDestroyValidationCacheEXT"))
				LoadFunction("vkDestroyValidationCacheEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkMergeValidationCachesEXT"))
				LoadFunction("vkMergeValidationCachesEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetValidationCacheDataEXT"))
				LoadFunction("vkGetValidationCacheDataEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdBindShadingRateImageNV"))
				LoadFunction("vkCmdBindShadingRateImageNV");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdSetViewportShadingRatePaletteNV"))
				LoadFunction("vkCmdSetViewportShadingRatePaletteNV");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdSetCoarseSampleOrderNV"))
				LoadFunction("vkCmdSetCoarseSampleOrderNV");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCreateAccelerationStructureNV"))
				LoadFunction("vkCreateAccelerationStructureNV");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkDestroyAccelerationStructureNV"))
				LoadFunction("vkDestroyAccelerationStructureNV");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetAccelerationStructureMemoryRequirementsNV"))
				LoadFunction("vkGetAccelerationStructureMemoryRequirementsNV");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkBindAccelerationStructureMemoryNV"))
				LoadFunction("vkBindAccelerationStructureMemoryNV");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdBuildAccelerationStructureNV"))
				LoadFunction("vkCmdBuildAccelerationStructureNV");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdCopyAccelerationStructureNV"))
				LoadFunction("vkCmdCopyAccelerationStructureNV");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdTraceRaysNV"))
				LoadFunction("vkCmdTraceRaysNV");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCreateRayTracingPipelinesNV"))
				LoadFunction("vkCreateRayTracingPipelinesNV");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetAccelerationStructureHandleNV"))
				LoadFunction("vkGetAccelerationStructureHandleNV");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdWriteAccelerationStructuresPropertiesNV"))
				LoadFunction("vkCmdWriteAccelerationStructuresPropertiesNV");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCompileDeferredNV"))
				LoadFunction("vkCompileDeferredNV");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetMemoryHostPointerPropertiesEXT"))
				LoadFunction("vkGetMemoryHostPointerPropertiesEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdWriteBufferMarkerAMD"))
				LoadFunction("vkCmdWriteBufferMarkerAMD");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetPhysicalDeviceCalibrateableTimeDomainsEXT"))
				LoadFunction("vkGetPhysicalDeviceCalibrateableTimeDomainsEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetCalibratedTimestampsEXT"))
				LoadFunction("vkGetCalibratedTimestampsEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdDrawMeshTasksNV"))
				LoadFunction("vkCmdDrawMeshTasksNV");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdDrawMeshTasksIndirectNV"))
				LoadFunction("vkCmdDrawMeshTasksIndirectNV");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdDrawMeshTasksIndirectCountNV"))
				LoadFunction("vkCmdDrawMeshTasksIndirectCountNV");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdSetExclusiveScissorNV"))
				LoadFunction("vkCmdSetExclusiveScissorNV");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdSetCheckpointNV"))
				LoadFunction("vkCmdSetCheckpointNV");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetQueueCheckpointDataNV"))
				LoadFunction("vkGetQueueCheckpointDataNV");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkInitializePerformanceApiINTEL"))
				LoadFunction("vkInitializePerformanceApiINTEL");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkUninitializePerformanceApiINTEL"))
				LoadFunction("vkUninitializePerformanceApiINTEL");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdSetPerformanceMarkerINTEL"))
				LoadFunction("vkCmdSetPerformanceMarkerINTEL");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdSetPerformanceStreamMarkerINTEL"))
				LoadFunction("vkCmdSetPerformanceStreamMarkerINTEL");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdSetPerformanceOverrideINTEL"))
				LoadFunction("vkCmdSetPerformanceOverrideINTEL");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkAcquirePerformanceConfigurationINTEL"))
				LoadFunction("vkAcquirePerformanceConfigurationINTEL");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkReleasePerformanceConfigurationINTEL"))
				LoadFunction("vkReleasePerformanceConfigurationINTEL");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkQueueSetPerformanceConfigurationINTEL"))
				LoadFunction("vkQueueSetPerformanceConfigurationINTEL");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetPerformanceParameterINTEL"))
				LoadFunction("vkGetPerformanceParameterINTEL");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkSetLocalDimmingAMD"))
				LoadFunction("vkSetLocalDimmingAMD");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCreateImagePipeSurfaceFUCHSIA"))
				LoadFunction("vkCreateImagePipeSurfaceFUCHSIA");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCreateMetalSurfaceEXT"))
				LoadFunction("vkCreateMetalSurfaceEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetPhysicalDeviceFragmentShadingRatesKHR"))
				LoadFunction("vkGetPhysicalDeviceFragmentShadingRatesKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdSetFragmentShadingRateKHR"))
				LoadFunction("vkCmdSetFragmentShadingRateKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkWaitForPresentKHR"))
				LoadFunction("vkWaitForPresentKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetPhysicalDeviceCooperativeMatrixPropertiesNV"))
				LoadFunction("vkGetPhysicalDeviceCooperativeMatrixPropertiesNV");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV"))
				LoadFunction("vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetPhysicalDeviceSurfacePresentModes2EXT"))
				LoadFunction("vkGetPhysicalDeviceSurfacePresentModes2EXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkAcquireFullScreenExclusiveModeEXT"))
				LoadFunction("vkAcquireFullScreenExclusiveModeEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkReleaseFullScreenExclusiveModeEXT"))
				LoadFunction("vkReleaseFullScreenExclusiveModeEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCreateHeadlessSurfaceEXT"))
				LoadFunction("vkCreateHeadlessSurfaceEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdSetLineStippleEXT"))
				LoadFunction("vkCmdSetLineStippleEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCreateDeferredOperationKHR"))
				LoadFunction("vkCreateDeferredOperationKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkDestroyDeferredOperationKHR"))
				LoadFunction("vkDestroyDeferredOperationKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetDeferredOperationMaxConcurrencyKHR"))
				LoadFunction("vkGetDeferredOperationMaxConcurrencyKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetDeferredOperationResultKHR"))
				LoadFunction("vkGetDeferredOperationResultKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkDeferredOperationJoinKHR"))
				LoadFunction("vkDeferredOperationJoinKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetPipelineExecutablePropertiesKHR"))
				LoadFunction("vkGetPipelineExecutablePropertiesKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetPipelineExecutableStatisticsKHR"))
				LoadFunction("vkGetPipelineExecutableStatisticsKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetPipelineExecutableInternalRepresentationsKHR"))
				LoadFunction("vkGetPipelineExecutableInternalRepresentationsKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetGeneratedCommandsMemoryRequirementsNV"))
				LoadFunction("vkGetGeneratedCommandsMemoryRequirementsNV");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdPreprocessGeneratedCommandsNV"))
				LoadFunction("vkCmdPreprocessGeneratedCommandsNV");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdExecuteGeneratedCommandsNV"))
				LoadFunction("vkCmdExecuteGeneratedCommandsNV");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdBindPipelineShaderGroupNV"))
				LoadFunction("vkCmdBindPipelineShaderGroupNV");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCreateIndirectCommandsLayoutNV"))
				LoadFunction("vkCreateIndirectCommandsLayoutNV");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkDestroyIndirectCommandsLayoutNV"))
				LoadFunction("vkDestroyIndirectCommandsLayoutNV");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkAcquireDrmDisplayEXT"))
				LoadFunction("vkAcquireDrmDisplayEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetDrmDisplayEXT"))
				LoadFunction("vkGetDrmDisplayEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdEncodeVideoKHR"))
				LoadFunction("vkCmdEncodeVideoKHR");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkExportMetalObjectsEXT"))
				LoadFunction("vkExportMetalObjectsEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdSetFragmentShadingRateEnumNV"))
				LoadFunction("vkCmdSetFragmentShadingRateEnumNV");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetImageSubresourceLayout2EXT"))
				LoadFunction("vkGetImageSubresourceLayout2EXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkAcquireWinrtDisplayNV"))
				LoadFunction("vkAcquireWinrtDisplayNV");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetWinrtDisplayNV"))
				LoadFunction("vkGetWinrtDisplayNV");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCreateDirectFBSurfaceEXT"))
				LoadFunction("vkCreateDirectFBSurfaceEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetPhysicalDeviceDirectFBPresentationSupportEXT"))
				LoadFunction("vkGetPhysicalDeviceDirectFBPresentationSupportEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdSetVertexInputEXT"))
				LoadFunction("vkCmdSetVertexInputEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetMemoryZirconHandleFUCHSIA"))
				LoadFunction("vkGetMemoryZirconHandleFUCHSIA");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetMemoryZirconHandlePropertiesFUCHSIA"))
				LoadFunction("vkGetMemoryZirconHandlePropertiesFUCHSIA");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkImportSemaphoreZirconHandleFUCHSIA"))
				LoadFunction("vkImportSemaphoreZirconHandleFUCHSIA");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetSemaphoreZirconHandleFUCHSIA"))
				LoadFunction("vkGetSemaphoreZirconHandleFUCHSIA");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCreateBufferCollectionFUCHSIA"))
				LoadFunction("vkCreateBufferCollectionFUCHSIA");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkSetBufferCollectionImageConstraintsFUCHSIA"))
				LoadFunction("vkSetBufferCollectionImageConstraintsFUCHSIA");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkSetBufferCollectionBufferConstraintsFUCHSIA"))
				LoadFunction("vkSetBufferCollectionBufferConstraintsFUCHSIA");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkDestroyBufferCollectionFUCHSIA"))
				LoadFunction("vkDestroyBufferCollectionFUCHSIA");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetBufferCollectionPropertiesFUCHSIA"))
				LoadFunction("vkGetBufferCollectionPropertiesFUCHSIA");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI"))
				LoadFunction("vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdSubpassShadingHUAWEI"))
				LoadFunction("vkCmdSubpassShadingHUAWEI");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdBindInvocationMaskHUAWEI"))
				LoadFunction("vkCmdBindInvocationMaskHUAWEI");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetMemoryRemoteAddressNV"))
				LoadFunction("vkGetMemoryRemoteAddressNV");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetPipelinePropertiesEXT"))
				LoadFunction("vkGetPipelinePropertiesEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdSetPatchControlPointsEXT"))
				LoadFunction("vkCmdSetPatchControlPointsEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdSetLogicOpEXT"))
				LoadFunction("vkCmdSetLogicOpEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCreateScreenSurfaceQNX"))
				LoadFunction("vkCreateScreenSurfaceQNX");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetPhysicalDeviceScreenPresentationSupportQNX"))
				LoadFunction("vkGetPhysicalDeviceScreenPresentationSupportQNX");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdSetColorWriteEnableEXT"))
				LoadFunction("vkCmdSetColorWriteEnableEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdDrawMultiEXT"))
				LoadFunction("vkCmdDrawMultiEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkCmdDrawMultiIndexedEXT"))
				LoadFunction("vkCmdDrawMultiIndexedEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkSetDeviceMemoryPriorityEXT"))
				LoadFunction("vkSetDeviceMemoryPriorityEXT");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetDescriptorSetLayoutHostMappingInfoVALVE"))
				LoadFunction("vkGetDescriptorSetLayoutHostMappingInfoVALVE");

			if(excludeFunctions == null || !excludeFunctions.Contains("vkGetDescriptorSetHostMappingVALVE"))
				LoadFunction("vkGetDescriptorSetHostMappingVALVE");

		}

		public static void LoadFunction<T>(in StringView name, out T funcPtr)
		{
			mNativeLib.LoadFunction(name, out funcPtr);
		}
	}
}
