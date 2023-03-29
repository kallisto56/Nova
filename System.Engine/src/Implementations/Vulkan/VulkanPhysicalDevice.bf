namespace System.Engine.Implementations.Vulkan;


using System;
using System.Threading;
using System.Diagnostics;
using System.Collections;

using API.Vulkan;
using static API.Vulkan.VulkanNative;


public class VulkanPhysicalDevice : IDisposable
{
	public VulkanGraphicsContext context;
	public VkPhysicalDevice handle;

	public VkPhysicalDeviceProperties properties;
	public VkPhysicalDeviceFeatures features;
	public VkPhysicalDeviceMemoryProperties memoryProperties;


	public this (VulkanGraphicsContext context)
	{
		this.context = context;
	}


	public Result<void, Error> Initialize ()
	{
		uint32 countPhysicalDevices = 0;
		vkEnumeratePhysicalDevices(this.context.instance, &countPhysicalDevices, null)
			.Resolve!();

		if (countPhysicalDevices == 0)
			return .Err(new Error("TODO: No physical devices"));

		VkPhysicalDevice[] physicalDevices = scope VkPhysicalDevice[countPhysicalDevices];
		vkEnumeratePhysicalDevices(this.context.instance, &countPhysicalDevices, physicalDevices.CArray())
			.Resolve!();

		// TODO: Find a better way to pick physical device
		this.handle = physicalDevices[0];

		VulkanNative.vkGetPhysicalDeviceProperties(this.handle, &this.properties);
		VulkanNative.vkGetPhysicalDeviceFeatures(this.handle, &this.features);
		VulkanNative.vkGetPhysicalDeviceMemoryProperties(this.handle, &this.memoryProperties);

		return .Ok;
	}


	public void Dispose ()
	{

	}
}