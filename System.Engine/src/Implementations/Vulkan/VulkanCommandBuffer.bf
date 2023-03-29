namespace System.Engine.Implementations.Vulkan;


using System;
using System.Math;
using System.Threading;
using System.Diagnostics;
using System.Collections;

using API.Vulkan;
using static API.Vulkan.VulkanNative;


public class VulkanCommandBuffer : CommandBuffer
{
	override public String name { get; protected set; }

	public VulkanGraphicsContext context;
	public VkCommandBuffer handle;
	public CommandBufferState state;
	public VulkanFence fence;

	public VulkanFramebuffer framebuffer;
	public VulkanRenderPass renderPass;
	public VulkanBuffer indexBuffer;
	public VulkanBuffer vertexBuffer;
	public VulkanPipeline pipeline;
	public VulkanResourceLayout resourceLayout;
	public VulkanResourceSet[8] sets;


	public this (VulkanGraphicsContext context)
	{
		this.context = context;
	}


	override public Result<void, Error> Initialize ()
	{
		VkCommandBufferAllocateInfo allocateInfo = VkCommandBufferAllocateInfo()
		{
			pNext = null,
			commandPool = this.context.commandPool.handle,
			level = .VK_COMMAND_BUFFER_LEVEL_PRIMARY,
			commandBufferCount = 1,
		};

		vkAllocateCommandBuffers(this.context.logicalDevice.handle, &allocateInfo, &this.handle).Resolve!();

		this.fence = this.context.Create(Fence.Description(true))
			.Resolve!() as VulkanFence;

		return .Ok;
	}


	override public void Dispose ()
	{
		if (this.handle != default)
		{
			if (this.fence != null)
				this.fence.Wait().IgnoreError();

			vkFreeCommandBuffers(this.context.logicalDevice.handle, this.context.commandPool.handle, 1, &this.handle);
			this.handle = default;
		}

		if (this.fence != null)
			delete this.fence..Dispose();
	}


	public Result<void, Error> Reset ()
	{
		/*this.fence.Reset().Resolve!();*/

		vkResetCommandBuffer(this.handle, .VK_COMMAND_BUFFER_RESET_RELEASE_RESOURCES_BIT)
			.Resolve!();

		this.state = .isReadyForUse;
		return .Ok;
	}


	override public Result<void, Error> StartRecording ()
	{
		VkCommandBufferBeginInfo beginInfo = VkCommandBufferBeginInfo();
		vkBeginCommandBuffer(this.handle, &beginInfo)
			.Resolve!();
		
		VkViewport viewport = VkViewport()
		{
		    x = 0.0F,
		    y = 0.0F,
		    width = this.context.swapchain.width,
		    height = this.context.swapchain.height,
		    minDepth = 0.0F,
		    maxDepth = 1.0F,
		};

		VkRect2D scissor = VkRect2D()
		{
		    offset = VkOffset2D(0, 0),
		    extent = VkExtent2D(this.context.swapchain.width, this.context.swapchain.height),
		};

		VkViewport[] viewports = scope VkViewport[](viewport, viewport);

		vkCmdSetViewport(this.handle, 0, uint32(viewports.Count), viewports.CArray());
		vkCmdSetScissor(this.handle, 0, 1, &scissor);

		this.state = .isRecording;
		return .Ok;
	}


	override public Result<void, Error> StopRecording ()
	{
		vkCmdEndRenderPass(this.handle);
		vkEndCommandBuffer(this.handle)
			.Resolve!();

		this.state = .isClosed;
		return .Ok;
	}


	override public Result<void, Error> Submit ()
	{
		return .Ok;
	}


	override public Result<void, Error> CopyTexture (Texture source, Texture destination, uint32 sx, uint32 sy, uint32 sw, uint32 sh, uint32 dx, uint32 dy, uint32 dw, uint32 dh)
	{
		return .Err(Error.NotImplemented());
	}


	override public Result<void, Error> UpdateBuffer (Buffer buffer, uint32 offset, uint32 size, void* data)
	{
		return .Err(Error.NotImplemented());
	}


	override public Result<void, Error> Dispatch (uint32 groupCountX, uint32 groupCountY, uint32 groupCountZ)
	{
		return .Err(Error.NotImplemented());
	}


	override public Result<void, Error> DispatchIndirect (Buffer indirectBuffer, uint32 offset)
	{
		return .Err(Error.NotImplemented());
	}


	override public Result<void, Error> DrawIndexed (uint32 indexCount, uint32 instanceCount, uint32 firstIndex, int32 vertexOffset, uint32 firstInstance)
	{
		vkCmdDrawIndexed(this.handle, indexCount, instanceCount, firstIndex, vertexOffset, firstInstance);

		return .Ok;
	}


	override public Result<void, Error> DrawIndexedIndirect (Buffer indirectBuffer, uint32 offset, uint32 drawCount, uint32 stride)
	{
		return .Err(Error.NotImplemented());
	}


	override public Result<void, Error> DrawIndirect (Buffer indirectBuffer, uint32 offset, uint32 drawCount, uint32 stride)
	{
		return .Err(Error.NotImplemented());
	}


	override public Result<void, Error> SetScissors (uint32 index, int32 x, int32 y, int32 width, int32 height)
	{
		VkRect2D pScissors = VkRect2D()
		{
			offset = VkOffset2D(x, y),
			extent = VkExtent2D(width, height)
		};

		vkCmdSetScissor(this.handle, 0, 1, &pScissors);
		return .Ok;
	}


	override public Result<void, Error> SetViewport (uint32 index, Viewport viewport)
	{
		VkViewport pViewports = VulkanFormats.Convert(viewport);
		vkCmdSetViewport(this.handle, 0, 1, &pViewports);
		return .Ok;
	}


	override public Result<void, Error> ClearDepthStencilTarget (float depth, uint8 stencil)
	{
		return .Err(Error.NotImplemented());
	}


	override public Result<void, Error> ClearColorTarget (uint32 index, Color<float> clearColor)
	{
		/*VkClearValue clearValue = VkClearValue()
		{
			color = VkClearColorValue()
			{
				float32 = float[4](1F, 1F, 1F, 1F),
				int32 = int32[4](255, 255, 255, 255),
				uint32 = uint32[4](255, 255, 255, 255),
			},
			depthStencil = default,
		};

		//this.renderPass.colorAttachments[index]
		VkClearAttachment attachment = VkClearAttachment()
		{
			aspectMask = .VK_IMAGE_ASPECT_COLOR_BIT,
			colorAttachment = index,
			clearValue = clearValue,
		};

		VkClearRect rect = VkClearRect()
		{
			rect = VkRect2D()
			{
				offset = VkOffset2D(0, 0),
				extent = VkExtent2D(this.context.swapchain.width, this.context.swapchain.height),
			},
			baseArrayLayer = 0,
			layerCount = 1,
		};
		
		vkCmdClearAttachments(this.handle, 1, &attachment, 1, &rect);*/

		/*VkImageSubresourceRange range = VkImageSubresourceRange(.VK_IMAGE_ASPECT_COLOR_BIT, 0, 1, 0, 1);
		var h = this.context.swapchain.images[this.context.swapchain.imageIndex].handle;
		vkCmdClearColorImage(this.handle, h, .VK_IMAGE_LAYOUT_UNDEFINED, &clearValue.color, 1, &range);*/
		return .Ok;
	}


	override public Result<void, Error> SetFramebuffer (Framebuffer framebuffer)
	{
		this.framebuffer = framebuffer as VulkanFramebuffer;
		this.renderPass = this.framebuffer.renderPass;

		// Attachment #1 (color target)
		// Attachment #2 (depth target)
		VkClearValue[2] clearValues = VkClearValue[2]();
		clearValues[0].color = VkClearColorValue(0.25F, 0.25F, 0.25F, 1F);
		clearValues[1].depthStencil = VkClearDepthStencilValue(1F, 0);

		VkRenderPassBeginInfo beginInfo = VkRenderPassBeginInfo()
		{
			pNext = null,
			renderPass = this.renderPass.handle,
			framebuffer = this.framebuffer.handle,
			renderArea = VkRect2D(0, 0, this.context.swapchain.width, this.context.swapchain.height),
			clearValueCount = uint32(clearValues.Count),
			pClearValues = &clearValues,
		};

		vkCmdBeginRenderPass(this.handle, &beginInfo, .VK_SUBPASS_CONTENTS_INLINE);

		return .Ok;
	}


	override public Result<void, Error> SetIndexBuffer (Buffer buffer, Buffer.IndexFormat format)
	{
		this.indexBuffer = buffer as VulkanBuffer;

		VkIndexType vulkanFormat = VulkanFormats.Convert(format);
		vkCmdBindIndexBuffer(this.handle, this.indexBuffer.handle, 0, vulkanFormat);
		return .Ok;
	}


	override public Result<void, Error> SetVertexBuffer (uint32 index, Buffer buffer)
	{
		// TODO: Add offsets
		VulkanBuffer vulkanBuffer = buffer as VulkanBuffer;
		uint64 offsets = 0;
		vkCmdBindVertexBuffers(this.handle, index, 1, &vulkanBuffer.handle, &offsets);
		return .Ok;
	}


	override public Result<void, Error> SetPipeline (Pipeline pipeline)
	{
		this.pipeline = pipeline as VulkanPipeline;
		vkCmdBindPipeline(this.handle, .VK_PIPELINE_BIND_POINT_GRAPHICS, this.pipeline.handle);

		return .Ok;
	}


	override public Result<void, Error> SetResourceSet (uint32 slot, ResourceSet set)
	{
		VulkanResourceSet descriptorSet = set as VulkanResourceSet;
		vkCmdBindDescriptorSets(this.handle, .VK_PIPELINE_BIND_POINT_GRAPHICS, this.pipeline.layout, slot, 1, &descriptorSet.descriptorAllocationToken.descriptorSet, 0, null);
		return .Ok;
	}


}