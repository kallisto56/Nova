namespace System.Engine.Implementations.Vulkan;


using System;
using System.Threading;
using System.Diagnostics;
using System.Collections;

using API.Vulkan;
using static API.Vulkan.VulkanNative;


public class VulkanSampler : Sampler
{
	VulkanGraphicsContext context;
	override public String name { get; protected set; }

	public VkSampler handle;


	public this (VulkanGraphicsContext context)
	{
		this.context = context;
	}


	public ~this ()
	{

	}


	override public Result<void, Error> Initialize (Self.Description description)
	{
		return .Err(null);
	}


	override public void Dispose ()
	{

	}


}