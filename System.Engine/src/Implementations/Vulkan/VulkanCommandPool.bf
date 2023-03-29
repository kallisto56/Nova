namespace System.Engine.Implementations.Vulkan;


using System;
using System.Math;
using System.Threading;
using System.Diagnostics;
using System.Collections;

using API.Vulkan;
using static API.Vulkan.VulkanNative;


public class VulkanCommandPool : CommandPool
{
	Monitor lock = new Monitor() ~ delete _;
	VulkanGraphicsContext context;
	override public String name { get; protected set; }

	public VkCommandPool handle;
	public List<VulkanCommandBuffer> commandBuffers;


	public this (VulkanGraphicsContext context)
	{
		this.context = context;
	}


	public ~this ()
	{

	}


	override public Result<void, Error> Initialize (Self.Description description)
	{
		VkCommandPoolCreateInfo createInfo = VkCommandPoolCreateInfo()
		{
			pNext = null,
			flags = .VK_COMMAND_POOL_CREATE_RESET_COMMAND_BUFFER_BIT,
			queueFamilyIndex = this.context.logicalDevice.graphicsQueue.index,
		};

		vkCreateCommandPool(this.context.logicalDevice.handle, &createInfo, this.context.allocationCallbacks, &this.handle)
			.Resolve!();

		this.commandBuffers = new List<VulkanCommandBuffer>();

		return .Ok;
	}


	override public void Dispose ()
	{
		if (this.commandBuffers != null)
		{
			for (uint32 n = 0; n < this.commandBuffers.Count; n++)
				delete this.commandBuffers[n]..Dispose();

			delete this.commandBuffers;
			this.commandBuffers = null;
		}

		if (this.handle != default)
		{
			vkDestroyCommandPool(this.context.logicalDevice.handle, this.handle, this.context.allocationCallbacks);
			this.handle = default;
		}
	}


	override public Result<void, Error> Submit ()
	{
		for (uint32 n = 0; n < this.commandBuffers.Count; n++)
		{
			var commandBuffer = this.commandBuffers[n];

			if (commandBuffer.state == .isClosed)
				commandBuffer.state = .isSubmitted;

			if (commandBuffer.state == .isRecording)
				return .Err(new Error("CommandBuffer was not closed"));
		}

		this.context.swapchain.GetFrameInfo(var onImageAvailableSemaphore, var onRenderFinishedSemaphore, var fence).Resolve!();

		VkSemaphore[?] waitSemaphores = VkSemaphore[?] (onImageAvailableSemaphore);
		VkSemaphore[?] signalSemaphores = VkSemaphore[?] (onRenderFinishedSemaphore);
		VkPipelineStageFlags[?] waitStages = VkPipelineStageFlags[?] (.VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT);

		uint32 countCommandBuffers = 0;
		// TODO: When we'll go out of scope, this array will be freed.
		//       Does Vulkan allocates its own array or does it relies on ours?
		//       Because if it relies on our scoped array, we may catch an
		//       exception with random memory address.
		VkCommandBuffer[] handles = scope VkCommandBuffer[commandBuffers.Count];
		for (uint32 n = 0; n < handles.Count; n++)
		{
			VulkanCommandBuffer commandBuffer = commandBuffers[n];
			if (commandBuffer.state == .isSubmitted)
			{
				handles[countCommandBuffers++] = commandBuffer.handle;
				commandBuffer.state = .isInQueue;
				/*commandBuffer.fence = fence;*/
			}
		}
		
		VkSubmitInfo submitInfo = VkSubmitInfo()
		{
			waitSemaphoreCount = uint32(waitSemaphores.Count),
			pWaitSemaphores = &waitSemaphores,
			pWaitDstStageMask = &waitStages,

			commandBufferCount = countCommandBuffers,
			pCommandBuffers = handles.CArray(),

			signalSemaphoreCount = uint32(signalSemaphores.Count),
			pSignalSemaphores = &signalSemaphores,
		};

		vkQueueSubmit(this.context.logicalDevice.graphicsQueue.handle, 1, &submitInfo, fence.handle).Resolve!();
		

		return .Ok;
	}


	public Result<CommandBuffer, Error> AllocateCommandBuffer ()
	{
		Tracy.Trace();

		VulkanCommandBuffer commandBuffer = new VulkanCommandBuffer(this.context);
		if (commandBuffer.Initialize() case .Err(Error e))
		{
			delete commandBuffer..Dispose();
			return .Err(e);
		}

		this.commandBuffers.Add(commandBuffer);
		return commandBuffer;
	}


	override public Result<CommandBuffer, Error> GetCommandBuffer ()
	{
		using (this.lock.Enter())
		{
			if (this.commandBuffers.Count == 0)
				return this.AllocateCommandBuffer();
	
			for (uint32 n = 0; n < this.commandBuffers.Count; n++)
			{
				VulkanCommandBuffer commandBuffer = this.commandBuffers[n];
				if (commandBuffer.state == .isReadyForUse)
					return commandBuffer;
			}
	
			return this.AllocateCommandBuffer();
		}
	}


	override public Result<void, Error> Reset ()
	{
		for (uint32 n = 0; n < this.commandBuffers.Count; n++)
		{
			var commandBuffer = this.commandBuffers[n];
			if (commandBuffer.state == .isInQueue)
			{
				if (commandBuffer.fence.isSignaled == true)
					commandBuffer.Reset().Resolve!();
			}
		}

		return .Ok;
	}
}




public enum CommandBufferState
{
	isReadyForUse,
	isRecording,
	isClosed,
	isSubmitted,
	isInQueue,
}