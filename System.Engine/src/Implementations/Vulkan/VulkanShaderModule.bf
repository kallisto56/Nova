namespace System.Engine.Implementations.Vulkan;


using System;
using System.Threading;
using System.Diagnostics;
using System.Collections;

using API.Vulkan;
using static API.Vulkan.VulkanNative;


public class VulkanShaderModule : ShaderModule
{
	VulkanGraphicsContext context;
	override public String name { get; protected set; }

	public VkShaderModule handle;
	public Stages stages;
	public String entryPoint;

	public VkPipelineShaderStageCreateInfo pipelineCreateInfo;


	public this (VulkanGraphicsContext context)
	{
		this.context = context;
	}


	public ~this ()
	{
		if (this.entryPoint != null)
			delete this.entryPoint;

		vkDestroyShaderModule(this.context.logicalDevice.handle, handle, this.context.allocationCallbacks);
	}


	override public Result<void, Error> Initialize (Self.Description description)
	{
		this.stages = description.stages;
		this.entryPoint = new String(description.entryPoint);

		VkShaderModuleCreateInfo createInfo = VkShaderModuleCreateInfo()
		{
			codeSize = uint32(description.sourceCode.Count),
			pCode = (uint32*)description.sourceCode.Ptr,
		};

		vkCreateShaderModule(this.context.logicalDevice.handle, &createInfo, this.context.allocationCallbacks, &this.handle)
			.Resolve!();
		
		this.pipelineCreateInfo = VkPipelineShaderStageCreateInfo()
		{
			stage = VulkanFormats.Convert(description.stages),
			module = this.handle,
			pName = this.entryPoint.CStr(),
			pSpecializationInfo = null,
		};

		return .Ok;
	}


	override public void Dispose ()
	{

	}


}