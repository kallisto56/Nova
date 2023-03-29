namespace System.Engine.Implementations.Vulkan;


using System;
using System.Threading;
using System.Diagnostics;
using System.Collections;

using API.Vulkan;
using static API.Vulkan.VulkanNative;


public class VulkanResourceSet : ResourceSet
{
	VulkanGraphicsContext context;
	override public String name { get; protected set; }

	public DescriptorResourceCounts descriptorCounts;
	public DescriptorAllocationToken descriptorAllocationToken;


	public this (VulkanGraphicsContext context)
	{
		this.context = context;
	}


	public ~this ()
	{

	}


	override public Result<void, Error> Initialize (Self.Description description)
	{
		VulkanResourceLayout vkLayout = description.layout as VulkanResourceLayout;

		VkDescriptorSetLayout descriptorSetLayout = vkLayout.handle;
		this.descriptorCounts = vkLayout.DescriptorResourceCounts;
		this.descriptorAllocationToken = this.context.descriptorPool.Allocate(this.descriptorCounts, descriptorSetLayout);

		IBindableResource[] boundResources = description.boundResources;
		uint32 descriptorWriteCount = uint32(boundResources.Count);

		VkWriteDescriptorSet[] descriptorWrites = scope VkWriteDescriptorSet[descriptorWriteCount];
		VkDescriptorBufferInfo[] bufferInfos = scope VkDescriptorBufferInfo[descriptorWriteCount];
		VkDescriptorImageInfo[] imageInfos = scope VkDescriptorImageInfo[descriptorWriteCount];

		for (uint32 n = 0; n < boundResources.Count; n++)
		{
			VkDescriptorType type = vkLayout.descriptorTypes[n];

			descriptorWrites[n] = VkWriteDescriptorSet()
			{
				descriptorCount = 1,
				descriptorType = type,
				dstBinding = n,
				dstSet = this.descriptorAllocationToken.descriptorSet,
			};

			if (type == .VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER || type == .VK_DESCRIPTOR_TYPE_STORAGE_BUFFER)
			{
			    VulkanBuffer vkBuffer = boundResources[n] as VulkanBuffer;
			    bufferInfos[n].buffer = vkBuffer.handle;
			    bufferInfos[n].range = vkBuffer.sizeInBytes;
			    descriptorWrites[n].pBufferInfo = &bufferInfos[n];
			}
			else if (type == .VK_DESCRIPTOR_TYPE_SAMPLED_IMAGE)
			{
			    VulkanTextureView textureView = boundResources[n] as VulkanTextureView;
			    imageInfos[n].imageView = textureView.handle;
			    imageInfos[n].imageLayout = .VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL;
			    descriptorWrites[n].pImageInfo = &imageInfos[n];
			}
			else if (type == .VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER)
			{
			    VulkanTextureView textureView = boundResources[n] as VulkanTextureView;
				VulkanSampler sampler = this.context.defaultSamplers.pointSampler; // TODO: This is not how it supposed to be

			    imageInfos[n].imageView = textureView.handle;
			    imageInfos[n].imageLayout = .VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL;
				imageInfos[n].sampler = sampler.handle;
			    descriptorWrites[n].pImageInfo = &imageInfos[n];
			}
			else if (type == .VK_DESCRIPTOR_TYPE_STORAGE_IMAGE)
			{
			    VulkanTextureView textureView = boundResources[n] as VulkanTextureView;
			    imageInfos[n].imageView = textureView.handle;
			    imageInfos[n].imageLayout = .VK_IMAGE_LAYOUT_GENERAL;
			    descriptorWrites[n].pImageInfo = &imageInfos[n];
			}
			else if (type == .VK_DESCRIPTOR_TYPE_SAMPLER)
			{
			    VulkanSampler sampler = boundResources[n] as VulkanSampler;
			    imageInfos[n].sampler = sampler.handle;
			    descriptorWrites[n].pImageInfo = &imageInfos[n];
			}
		}

		vkUpdateDescriptorSets(this.context.logicalDevice.handle, uint32(descriptorWrites.Count), descriptorWrites.CArray(), 0, null);

		return .Ok;
	}


	override public void Dispose ()
	{
		if (this.descriptorAllocationToken != default)
		{
			this.context.descriptorPool.Free(this.descriptorAllocationToken, this.descriptorCounts);
			this.descriptorAllocationToken = default;
		}
	}


}