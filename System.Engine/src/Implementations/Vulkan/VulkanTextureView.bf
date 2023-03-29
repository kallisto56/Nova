namespace System.Engine.Implementations.Vulkan;


using System;
using System.Threading;
using System.Diagnostics;
using System.Collections;

using API.Vulkan;
using static API.Vulkan.VulkanNative;


public class VulkanTextureView : TextureView
{
	VulkanGraphicsContext context;
	override public String name { get; protected set; }

	public bool ownsHandle = true;
	public VkImageView handle;


	public this (VulkanGraphicsContext context)
	{
		this.context = context;
	}


	public ~this ()
	{

	}


	/*public Result<void, Error> Initialize (VkImage image, VkFormat format, VkImageAspectFlags aspectFlags)
	{
		Tracy.WriteLine("aspectFlags: {0}", aspectFlags);

		this.ownsHandle = false;
		VkImageViewCreateInfo viewInfo = VkImageViewCreateInfo()
		{
			image = image,
			viewType = .VK_IMAGE_VIEW_TYPE_2D,
			format = format,
			subresourceRange = VkImageSubresourceRange(aspectFlags, 0, 1, 0, 1),
		};

		VkImageView imageView = default;
		VulkanNative.vkCreateImageView(this.context.logicalDevice.handle, &viewInfo, this.context.allocationCallbacks, &imageView)
			.Resolve!();

		return .Ok;
	}*/


	override public Result<void, Error> Initialize (Self.Description description)
	{
		VulkanTexture texture = description.target as VulkanTexture;

		VkImageAspectFlags aspectMask = .VK_IMAGE_ASPECT_NONE;
		if ((description.target.usage & .depthStencil) == .depthStencil)
		{
			aspectMask = .VK_IMAGE_ASPECT_DEPTH_BIT;
		}
		else
		{
			aspectMask = .VK_IMAGE_ASPECT_COLOR_BIT;
		}

		VkImageViewCreateInfo createInfo = VkImageViewCreateInfo()
		{
			image = texture.handle,
			format = VulkanFormats.Convert(texture.format),
			subresourceRange = VkImageSubresourceRange(
				aspectMask,
				description.baseMipLevel,
				description.mipLevels,
				description.baseArrayLayer,
				description.arrayLayers
			),
		};

		if ((texture.usage & .cubemap) == .cubemap)
		{
		    createInfo.viewType = (description.arrayLayers == 1)
				? .VK_IMAGE_VIEW_TYPE_CUBE
				: .VK_IMAGE_VIEW_TYPE_CUBE_ARRAY;
		    createInfo.subresourceRange.layerCount *= 6;
		}
		else if (texture.depth == 1)
		{
		    createInfo.viewType = (description.arrayLayers == 1)
				? .VK_IMAGE_VIEW_TYPE_2D
				: .VK_IMAGE_VIEW_TYPE_2D_ARRAY;
		}
		else
		{
		    createInfo.viewType = .VK_IMAGE_VIEW_TYPE_3D;
		}

		vkCreateImageView(this.context.logicalDevice.handle, &createInfo, this.context.allocationCallbacks, &this.handle)
			.Resolve!();

		return .Ok;
	}


	override public void Dispose ()
	{
		if (this.handle != default && this.ownsHandle == true)
		{
			vkDestroyImageView(this.context.logicalDevice.handle, this.handle, this.context.allocationCallbacks);
			this.handle = default;
		}
	}


}