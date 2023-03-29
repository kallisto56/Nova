namespace System.Engine.Implementations.Vulkan;


using System;
using System.Threading;
using System.Diagnostics;
using System.Collections;

using API.Vulkan;
using static API.Vulkan.VulkanNative;


public class VulkanDescriptorPool : IDisposable
{
	public VulkanGraphicsContext context;
	public List<DescriptorPoolInfo> collection;
	Monitor lock = new Monitor() ~ delete _;


	public this (VulkanGraphicsContext context)
	{
		this.context = context;
		this.collection = new List<DescriptorPoolInfo>();
	}


	public ~this ()
	{
		delete this.collection;
		this.collection = null;
	}


	public Result<void, Error> Initialize ()
	{
		this.AllocatePool().Resolve!();
		return .Ok;
	}


	public Result<DescriptorAllocationToken, Error> Allocate (DescriptorResourceCounts counts, VkDescriptorSetLayout layout)
	{
		using (this.lock.Enter())
		{
			var layout;
		    VkDescriptorPool descriptorPool = this.GetPool(counts);
			VkDescriptorSet descriptorSet = ?;
		    VkDescriptorSetAllocateInfo createInfo = VkDescriptorSetAllocateInfo()
			{
			    descriptorSetCount = 1,
			    pSetLayouts = &layout,
			    descriptorPool = descriptorPool,
			};

		    vkAllocateDescriptorSets(this.context.logicalDevice.handle, &createInfo, &descriptorSet)
				.Resolve!();

		    return DescriptorAllocationToken(descriptorSet, descriptorPool);
		}
	}


	public Result<void, Error> Free (DescriptorAllocationToken token, DescriptorResourceCounts counts)
	{
		using (this.lock.Enter())
		{
		    for (uint32 n = 0; n < this.collection.Count; n++)
		    {
				DescriptorPoolInfo poolInfo = this.collection[n];
		        if (poolInfo.handle == token.descriptorPool)
		        {
		            poolInfo.Free(this.context.logicalDevice.handle, token, counts);
					return .Ok;
		        }
		    }
		}

		return .Err(new Error("Specified VkDescriptorPool is not present in collection of VulkanDescriptorPool."));
	}

	Result<VkDescriptorPool, Error> GetPool (DescriptorResourceCounts counts)
	{
	    using (this.lock.Enter())
	    {
	        for (uint32 n = 0; n < this.collection.Count; n++)
	        {
				DescriptorPoolInfo poolInfo = this.collection[n];
	            if (poolInfo.Allocate(counts) case .Ok)
	                return poolInfo.handle;
	        }

	        DescriptorPoolInfo descriptorPoolInfo = this.AllocatePool();
	        descriptorPoolInfo.Allocate(counts).Resolve!();
	        return descriptorPoolInfo.handle;
	    }
	}

	Result<DescriptorPoolInfo, Error> AllocatePool ()
	{
	    uint32 totalSets = 1000;
	    uint32 countDescriptors = 100;

	    VkDescriptorPoolSize[] sizes = scope VkDescriptorPoolSize[]
		(
			VkDescriptorPoolSize(.VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER, countDescriptors),
			VkDescriptorPoolSize(.VK_DESCRIPTOR_TYPE_SAMPLED_IMAGE, countDescriptors),
			VkDescriptorPoolSize(.VK_DESCRIPTOR_TYPE_SAMPLER, countDescriptors),
			VkDescriptorPoolSize(.VK_DESCRIPTOR_TYPE_STORAGE_BUFFER, countDescriptors),
			VkDescriptorPoolSize(.VK_DESCRIPTOR_TYPE_STORAGE_IMAGE, countDescriptors),
			VkDescriptorPoolSize(.VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER_DYNAMIC, countDescriptors),
			VkDescriptorPoolSize(.VK_DESCRIPTOR_TYPE_STORAGE_BUFFER_DYNAMIC, countDescriptors),
		);

	    VkDescriptorPoolCreateInfo poolCI = VkDescriptorPoolCreateInfo()
		{
			flags = .VK_DESCRIPTOR_POOL_CREATE_FREE_DESCRIPTOR_SET_BIT,
			maxSets = totalSets,
			poolSizeCount = uint32(sizes.Count),
			pPoolSizes = sizes.CArray(),
		};

		VkDescriptorPool handle = ?;
	    vkCreateDescriptorPool(this.context.logicalDevice.handle, &poolCI, this.context.allocationCallbacks, &handle)
			.Resolve!();

		DescriptorPoolInfo descriptorPoolInfo = new DescriptorPoolInfo(handle, totalSets, countDescriptors);
		this.collection.Add(descriptorPoolInfo);
	    return descriptorPoolInfo;
	}



	public void Dispose ()
	{
		if (this.collection != null)
		{
			for (uint32 n = 0; n < this.collection.Count; n++)
			{
				vkDestroyDescriptorPool(this.context.logicalDevice.handle, this.collection[n].handle, this.context.allocationCallbacks);
				delete this.collection[n];
			}

			this.collection.Clear();
		}
	}


	public class DescriptorPoolInfo
	{
		public VkDescriptorPool handle;

		public int remainingSets;

		public uint32 countUniformBuffers;
		public uint32 countDynamicUniformBuffers;
		public uint32 countSampledImages;
		public uint32 countSamplers;
		public uint32 countStorageBuffers;
		public uint32 countDynamicStorageBuffers;
		public uint32 countStorageImages;


		public this (VkDescriptorPool handle, int totalSets, uint32 countDescriptors)
		{
			this.handle = handle;
			this.remainingSets = totalSets;

			this.countUniformBuffers = countDescriptors;
			this.countDynamicUniformBuffers = countDescriptors;
			this.countSampledImages = countDescriptors;
			this.countSamplers = countDescriptors;
			this.countStorageBuffers = countDescriptors;
			this.countDynamicStorageBuffers = countDescriptors;
			this.countStorageImages = countDescriptors;
		}


		public Result<void, Error> Allocate (DescriptorResourceCounts counts)
		{
			if (this.remainingSets > 0 &&
				this.countUniformBuffers >= counts.countUniformBuffers &&
				this.countDynamicUniformBuffers >= counts.countDynamicUniformBuffers &&
				this.countSampledImages >= counts.countSampledImages &&
				this.countSamplers >= counts.countSamplers &&
				this.countStorageBuffers >= counts.countSamplers &&
				this.countDynamicStorageBuffers >= counts.countDynamicStorageBuffers &&
				this.countStorageImages >= counts.countStorageImages)
			{
				this.remainingSets -= 1;
				this.countUniformBuffers -= counts.countUniformBuffers;
				this.countDynamicUniformBuffers -= counts.countDynamicUniformBuffers;
				this.countSampledImages -= counts.countSampledImages;
				this.countSamplers -= counts.countSamplers;
				this.countStorageBuffers -= counts.countStorageBuffers;
				this.countDynamicStorageBuffers -= counts.countDynamicStorageBuffers;
				this.countStorageImages -= counts.countStorageImages;

				return .Ok;
			}
			else
			{
				return .Err(new Error("Descriptor pool is out of free sets or descriptors"));
			}
		}


		public Result<void, Error> Free (VkDevice logicalDevice, DescriptorAllocationToken token, DescriptorResourceCounts counts)
		{
			VkDescriptorSet handle = token.descriptorSet;
			vkFreeDescriptorSets(logicalDevice, this.handle, 1, &handle)
				.Resolve!();

			this.remainingSets += 1;

			this.countUniformBuffers += counts.countUniformBuffers;
			this.countDynamicUniformBuffers += counts.countDynamicUniformBuffers;
			this.countSampledImages += counts.countSampledImages;
			this.countSamplers += counts.countSamplers;
			this.countStorageBuffers += counts.countStorageBuffers;
			this.countStorageImages += counts.countStorageImages;
			this.countDynamicStorageBuffers += counts.countDynamicStorageBuffers;

			return .Ok;
		}
	}
}

public struct DescriptorAllocationToken
{
    public VkDescriptorSet descriptorSet;
    public VkDescriptorPool descriptorPool;


    public this (VkDescriptorSet descriptorSet, VkDescriptorPool descriptorPool)
    {
        this.descriptorSet = descriptorSet;
        this.descriptorPool = descriptorPool;
    }
}

public struct DescriptorResourceCounts
{
    public uint32 countUniformBuffers;
	public uint32 countDynamicUniformBuffers;
    public uint32 countSampledImages;
    public uint32 countSamplers;
    public uint32 countStorageBuffers;
	public uint32 countDynamicStorageBuffers;
    public uint32 countStorageImages;


    public this (
        uint32 countUniformBuffers,
        uint32 countDynamicUniformBuffers,
        uint32 countSampledImages,
        uint32 countSamplers,
        uint32 countStorageBuffers,
        uint32 countDynamicStorageBuffers,
        uint32 countStorageImages)
    {
        this.countUniformBuffers = countUniformBuffers;
        this.countDynamicUniformBuffers = countDynamicUniformBuffers;
        this.countSampledImages = countSampledImages;
        this.countSamplers = countSamplers;
        this.countStorageBuffers = countStorageBuffers;
        this.countDynamicStorageBuffers = countDynamicStorageBuffers;
        this.countStorageImages = countStorageImages;
    }
}