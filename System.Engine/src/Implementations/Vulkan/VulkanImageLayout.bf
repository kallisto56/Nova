namespace System.Engine.Implementations.Vulkan;


using System;
using System.Threading;
using System.Diagnostics;
using System.Collections;

using API.Vulkan;
using static API.Vulkan.VulkanNative;


static public class VulkanImageLayout
{


	static public Result<void, Error> Transition (LayoutTransitionInfo e)
	{
		VkCommandBuffer commandBuffer = Self.BeginSingleTimeCommands(e)
			.Resolve!();

		VkImageMemoryBarrier barrier = VkImageMemoryBarrier()
		{
			oldLayout = e.currentLayout,
			newLayout = e.targetLayout,

			srcQueueFamilyIndex = VulkanNative.VK_QUEUE_FAMILY_IGNORED,
			dstQueueFamilyIndex = VulkanNative.VK_QUEUE_FAMILY_IGNORED,

			image = e.texture.handle,
			subresourceRange = VkImageSubresourceRange(.VK_IMAGE_ASPECT_COLOR_BIT, 0, 1, 0, 1),
		};

		VkPipelineStageFlags sourceStage = ?;
		VkPipelineStageFlags destinationStage = ?;

		if (e.targetLayout == .VK_IMAGE_LAYOUT_DEPTH_STENCIL_ATTACHMENT_OPTIMAL)
		{
		    barrier.subresourceRange.aspectMask = .VK_IMAGE_ASPECT_DEPTH_BIT;
		    if (Self.HasStencilComponent(e.format) == true)
		        barrier.subresourceRange.aspectMask |= .VK_IMAGE_ASPECT_STENCIL_BIT;
		}
		else
		{
		    barrier.subresourceRange.aspectMask = .VK_IMAGE_ASPECT_COLOR_BIT;
		}

		if (e.currentLayout == .VK_IMAGE_LAYOUT_UNDEFINED && e.targetLayout == .VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL)
		{
		    barrier.srcAccessMask = 0;
		    barrier.dstAccessMask = .VK_ACCESS_TRANSFER_WRITE_BIT;

		    sourceStage = .VK_PIPELINE_STAGE_TOP_OF_PIPE_BIT;
		    destinationStage = .VK_PIPELINE_STAGE_TRANSFER_BIT;
		}
		else if (e.currentLayout == .VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL && e.targetLayout == .VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL)
		{
		    barrier.srcAccessMask = .VK_ACCESS_TRANSFER_WRITE_BIT;
		    barrier.dstAccessMask = .VK_ACCESS_SHADER_READ_BIT;

		    sourceStage = .VK_PIPELINE_STAGE_TRANSFER_BIT;
		    destinationStage = .VK_PIPELINE_STAGE_FRAGMENT_SHADER_BIT;
		}
		else if (e.currentLayout == .VK_IMAGE_LAYOUT_UNDEFINED && e.targetLayout == .VK_IMAGE_LAYOUT_DEPTH_STENCIL_ATTACHMENT_OPTIMAL)
		{
		    barrier.srcAccessMask = 0;
		    barrier.dstAccessMask = .VK_ACCESS_DEPTH_STENCIL_ATTACHMENT_READ_BIT | .VK_ACCESS_DEPTH_STENCIL_ATTACHMENT_WRITE_BIT;

		    sourceStage = .VK_PIPELINE_STAGE_TOP_OF_PIPE_BIT;
		    destinationStage = .VK_PIPELINE_STAGE_EARLY_FRAGMENT_TESTS_BIT;
		}
		else
		{
			return .Err(new Error("Unsupported layout transition!"));
		}

		vkCmdPipelineBarrier(
		    commandBuffer: commandBuffer,
		    srcStageMask: sourceStage,
			dstStageMask: destinationStage,
		    dependencyFlags: 0,
		    memoryBarrierCount: 0,
			pMemoryBarriers: null,
		    bufferMemoryBarrierCount: 0,
			pBufferMemoryBarriers: null,
		    imageMemoryBarrierCount: 1,
			pImageMemoryBarriers: &barrier
		);

		Self.EndSingleTimeCommands(e, ref commandBuffer)
			.Resolve!();

		return .Ok;
	}


	static public Result<VkCommandBuffer, Error> BeginSingleTimeCommands (LayoutTransitionInfo e)
	{
		VkCommandBufferAllocateInfo allocateInfo = VkCommandBufferAllocateInfo()
		{
			level = .VK_COMMAND_BUFFER_LEVEL_PRIMARY,
			commandPool = e.context.commandPool.handle,
			commandBufferCount = 1,
		};

		VkCommandBuffer commandBuffer = ?;
		vkAllocateCommandBuffers(e.context.logicalDevice.handle, &allocateInfo, &commandBuffer)
			.Resolve!();

		VkCommandBufferBeginInfo beginInfo = VkCommandBufferBeginInfo()
		{
			flags = .VK_COMMAND_BUFFER_USAGE_ONE_TIME_SUBMIT_BIT,
		};

		vkBeginCommandBuffer(commandBuffer, &beginInfo)
			.Resolve!();

		return commandBuffer;
	}


	static public Result<void, Error> EndSingleTimeCommands (LayoutTransitionInfo e, ref VkCommandBuffer commandBuffer)
	{
		vkEndCommandBuffer(commandBuffer)
			.Resolve!();

	    VkSubmitInfo submitInfo = VkSubmitInfo()
		{
		    commandBufferCount = 1,
		    pCommandBuffers = &commandBuffer,
		};

	    vkQueueSubmit(e.context.logicalDevice.graphicsQueue.handle, 1, &submitInfo, (VkFence)0)
			.Resolve!();

	    vkQueueWaitIdle(e.context.logicalDevice.graphicsQueue.handle)
			.Resolve!();

	    vkFreeCommandBuffers(e.context.logicalDevice.handle, e.context.commandPool.handle, 1, &commandBuffer);
	
		return .Ok;
	}

	
	static public bool HasStencilComponent (VkFormat format)
	{
	    return format == .VK_FORMAT_D32_SFLOAT_S8_UINT || format == .VK_FORMAT_D24_UNORM_S8_UINT;
	}
}


public struct LayoutTransitionInfo
{
	public VulkanGraphicsContext context;
	public VulkanTexture texture;
	public VkFormat format;
	public VkImageLayout currentLayout;
	public VkImageLayout targetLayout;
}