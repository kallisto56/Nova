namespace System.Engine.Implementations.Vulkan;


using System;
using System.Threading;
using System.Diagnostics;
using System.Collections;

using API.Vulkan;
using static API.Vulkan.VulkanNative;


public class VulkanFramebuffer : Framebuffer
{
	VulkanGraphicsContext context;
	override public String name { get; protected set; }

	public VkFramebuffer handle;
	public VulkanRenderPass renderPass;

	public uint32 width;
	public uint32 height;

	Pipeline.OutputAttachmentDescription[] colorAttachments;


	public this (VulkanGraphicsContext context)
	{
		this.context = context;
	}


	public ~this ()
	{

	}


	override public Result<void, Error> Initialize (Self.Description description)
	{
		this.width = description.width;
		this.height = description.height;
		this.renderPass = description.renderPass as VulkanRenderPass;

		this.colorAttachments = new Pipeline.OutputAttachmentDescription[description.colorTargets.Count];
		for (uint32 n = 0; n < this.colorAttachments.Count; n++)
			this.colorAttachments[n].format = description.colorTargets[n].format;

		this.outputDescription = Pipeline.OutputDescription()
		{
			sampleCount = description.colorTargets[0].sampleCount,
			colorAttachments = colorAttachments,
			depthAttachment = description.depthTarget != null
				? Pipeline.OutputAttachmentDescription(description.depthTarget.format)
				: null,
		};

		uint32 countAttachments = uint32(description.colorTargets.Count + (description.depthTarget != null ? 1 : 0));
		VkImageView[] pAttachments = scope VkImageView[countAttachments];

		for (uint32 n = 0; n < description.colorTargets.Count; n++)
		{
			VulkanTextureView textureView = description.colorTargets[n].GetView()
				.Resolve!() as VulkanTextureView;

			pAttachments[n] = textureView.handle;
		}

		if (description.depthTarget != null)
		{
			VulkanTextureView textureView = description.depthTarget.GetView()
				.Resolve!() as VulkanTextureView;

			pAttachments[pAttachments.Count - 1] = textureView.handle;
		}

		VkFramebufferCreateInfo createInfo = VkFramebufferCreateInfo()
		{
			pNext = null,
			flags = .None,
			renderPass = this.renderPass.handle,
			attachmentCount = uint32(pAttachments.Count),
			pAttachments = pAttachments.CArray(),
			width = this.width,
			height = this.height,
			layers = 1,
		};

		vkCreateFramebuffer(this.context.logicalDevice.handle, &createInfo, this.context.allocationCallbacks, &this.handle)
			.Resolve!();

		return .Ok;
	}


	override public void Dispose ()
	{
		if (this.colorAttachments != null)
		{
			delete this.colorAttachments;
			this.colorAttachments = null;
		}	

		if (this.handle != default)
		{
			vkDestroyFramebuffer(this.context.logicalDevice.handle, this.handle, this.context.allocationCallbacks);
			this.handle = default;
		}
	}


}