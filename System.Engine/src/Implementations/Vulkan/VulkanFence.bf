namespace System.Engine.Implementations.Vulkan;


using System;
using System.Threading;
using System.Diagnostics;
using System.Collections;

using API.Vulkan;
using static API.Vulkan.VulkanNative;


public class VulkanFence : Fence
{
	VulkanGraphicsContext context;

	public VkFence handle;
	override public String name { get; protected set; }
	override public bool isSignaled
	{
		get { return vkGetFenceStatus(this.context.logicalDevice.handle, this.handle) == .VK_SUCCESS; }
		protected set;
	}


	public this (VulkanGraphicsContext context)
	{
		this.context = context;
	}


	public ~this ()
	{

	}


	override public Result<void, Error> Initialize (Self.Description description)
	{
		VkFenceCreateInfo createInfo = VkFenceCreateInfo()
		{
			flags = description.isSignaled ? .VK_FENCE_CREATE_SIGNALED_BIT : .None,
			pNext = null,
		};

		vkCreateFence(this.context.logicalDevice.handle, &createInfo, this.context.allocationCallbacks, &this.handle)
			.Resolve!();

		return .Ok;
	}


	override public Result<void, Error> Reset ()
	{
		vkResetFences(this.context.logicalDevice.handle, 1, &this.handle).Resolve!();
		return .Ok;
	}


	public Result<void, Error> Wait ()
	{
		vkWaitForFences(this.context.logicalDevice.handle, 1, &this.handle, true, uint64.MaxValue)
			.Resolve!();

		return .Ok;
	}


	override public void Dispose ()
	{
		if (this.handle != default)
		{
			vkWaitForFences(this.context.logicalDevice.handle, 1, &this.handle, true, uint64.MaxValue);
			vkDestroyFence(this.context.logicalDevice.handle, this.handle, this.context.allocationCallbacks);
			this.handle = default;
		}
	}


}