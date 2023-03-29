namespace System.Engine.Implementations.Vulkan;


using System;
using System.Threading;
using System.Diagnostics;
using System.Collections;

using API.Vulkan;
using static API.Vulkan.VulkanNative;


public class VulkanLogicalDevice : IDisposable
{
	public VulkanGraphicsContext context;
	public VkDevice handle;

	public (uint32 index, VkQueue handle) graphicsQueue;
	public (uint32 index, VkQueue handle) presentationQueue;


	public this (VulkanGraphicsContext context)
	{
		this.context = context;
	}


	public Result<void, Error> Initialize ()
	{
		VulkanPhysicalDevice physicalDevice = this.context.physicalDevice;
		GetQueueFamilyIndices(physicalDevice.handle, this.context.surface, var graphicsQueueIdx, var presentationQueueIdx);

		HashSet<uint32> familyIndices = scope HashSet<uint32>() { graphicsQueueIdx, presentationQueueIdx };
		VkDeviceQueueCreateInfo[] queueCreateInfos = scope VkDeviceQueueCreateInfo[familyIndices.Count];

		float pQueuePriorities = 1F;
		uint32 i = 0;
		for (uint32 index in familyIndices)
		{
			queueCreateInfos[i++] = VkDeviceQueueCreateInfo()
			{
				queueCount = 1,
				queueFamilyIndex = index,
				pQueuePriorities = &pQueuePriorities,
				flags = .None,
			};
		}

		var features = this.context.physicalDevice.features;

		VkPhysicalDeviceFeatures deviceFeatures = VkPhysicalDeviceFeatures()
		{
			samplerAnisotropy = features.samplerAnisotropy,
			fillModeNonSolid = features.fillModeNonSolid,
			geometryShader = features.geometryShader,
			depthClamp = features.depthClamp,
			multiViewport = features.multiViewport,
			textureCompressionBC = features.textureCompressionBC,
			textureCompressionETC2 = features.textureCompressionETC2,
			multiDrawIndirect = features.multiDrawIndirect,
			drawIndirectFirstInstance = features.drawIndirectFirstInstance,
		};

		uint32 countProperties = 0;
		vkEnumerateDeviceExtensionProperties(physicalDevice.handle, null, &countProperties, null)
			.Resolve!();

		VkExtensionProperties[] properties = scope VkExtensionProperties[countProperties];
		vkEnumerateDeviceExtensionProperties(physicalDevice.handle, null, &countProperties, properties.CArray())
			.Resolve!();


		bool _debugMarkerEnabled = false;
		bool _standardValidationSupported = false;

		List<char8*> extensionNames = scope List<char8*>();
		var debugMarkerExtensionName = VK_EXT_DEBUG_MARKER_EXTENSION_NAME; // TODO: Eh?

		for (int property = 0; property < countProperties; property++)
		{
		    char8[(int)VulkanNative.VK_MAX_EXTENSION_NAME_SIZE] extensionName = properties[property].extensionName;//Utilities.GetString(properties[property].extensionName);
		    if (extensionName == "VK_EXT_debug_marker") // VulkanNative.VK_EXT_DEBUG_MARKER_EXTENSION_NAME)//
		    {
		        extensionNames.Add(debugMarkerExtensionName);
		        _debugMarkerEnabled = true;
		    }
		    else if (extensionName == "VK_KHR_swapchain")
		    {
		        extensionNames.Add(&properties[property].extensionName);
		    }
		}

		VkDeviceCreateInfo deviceCreateInfo = VkDeviceCreateInfo()
		{
			queueCreateInfoCount = uint32(queueCreateInfos.Count),
			pQueueCreateInfos = queueCreateInfos.CArray(),
			pEnabledFeatures = &deviceFeatures,
		};

		List<char8*> layerNames = new List<char8*>();
		if (_standardValidationSupported)
		{
		    layerNames.Add(VK_LAYER_KHRONOS_VALIDATION);
		}
		deviceCreateInfo.enabledLayerCount = uint32(layerNames.Count);
		deviceCreateInfo.ppEnabledLayerNames = layerNames.Ptr;

		deviceCreateInfo.enabledExtensionCount = uint32(extensionNames.Count);
		deviceCreateInfo.ppEnabledExtensionNames = extensionNames.Ptr;

		vkCreateDevice(physicalDevice.handle, &deviceCreateInfo, this.context.allocationCallbacks, &this.handle)
			.Resolve!();

		this.graphicsQueue.index = graphicsQueueIdx;
		this.presentationQueue.index = presentationQueueIdx;

		vkGetDeviceQueue(this.handle, graphicsQueueIdx, 0, &this.graphicsQueue.handle);
		vkGetDeviceQueue(this.handle, presentationQueueIdx, 0, &this.presentationQueue.handle);

		if (_debugMarkerEnabled)
		{
			Tracy.WriteLine("WARNING: Debug marker is enabled but not implemented");
		    /*IntPtr setObjectNamePtr;
		    String debugExtFnName = "vkDebugMarkerSetObjectNameEXT";
			setObjectNamePtr = VulkanNative.vkGetInstanceProcAddr(_instance, debugExtFnName);

		    _setObjectNameDelegate = Marshal.GetDelegateForFunctionPointer<vkDebugMarkerSetObjectNameEXT_d>(setObjectNamePtr);*/
		}

		DeleteContainerAndItems!(layerNames);

		return .Ok;
	}


	static Result<bool, Error> GetQueueFamilyIndices (VkPhysicalDevice physicalDevice, VkSurfaceKHR surface, out uint32 graphicsQueueIdx, out uint32 presentationQueueIdx)
	{
	    uint32 countQueueFamilies = 0;
	    VulkanNative.vkGetPhysicalDeviceQueueFamilyProperties(physicalDevice, &countQueueFamilies, null);

	    VkQueueFamilyProperties[] queueFamilies = scope VkQueueFamilyProperties[countQueueFamilies];
	    VulkanNative.vkGetPhysicalDeviceQueueFamilyProperties(physicalDevice, &countQueueFamilies, queueFamilies.CArray());

	    bool foundGraphics = false;
	    bool foundPresent = surface == VkSurfaceKHR.Null;

		graphicsQueueIdx = default;
		presentationQueueIdx = default;

	    for (uint32 index = 0; index < queueFamilies.Count; index++)
	    {
	        if ((queueFamilies[index].queueFlags & .VK_QUEUE_GRAPHICS_BIT) != 0)
	            graphicsQueueIdx = index;

	        if (!foundPresent)
	        {
				VkBool32 isPresentationSupported = ?;
	            VulkanNative.vkGetPhysicalDeviceSurfaceSupportKHR(physicalDevice, index, surface, &isPresentationSupported)
					.Resolve!();

	            if (isPresentationSupported)
	            {
	                presentationQueueIdx = index;
	                foundPresent = true;
	            }
	        }

	        if (foundGraphics && foundPresent)
	            return .Ok(true);
	    }

		return .Ok(foundGraphics && foundPresent);
	}


	public void Dispose ()
	{
		if (this.handle != default)
		{
			vkDestroyDevice(this.handle, this.context.allocationCallbacks);
			this.handle = default;
		}
	}
}