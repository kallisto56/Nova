namespace System.Engine.Implementations.Vulkan;


using System;
using System.Threading;
using System.Diagnostics;
using System.Collections;

using API.Vulkan;
using static API.Vulkan.VulkanNative;


public class VulkanResourceLayout : ResourceLayout
{
	VulkanGraphicsContext context;
	override public String name { get; protected set; }

	public VkDescriptorSetLayout handle;
	public VkDescriptorType[] descriptorTypes;
    public DescriptorResourceCounts DescriptorResourceCounts;
    public int32 DynamicBufferCount;


	public this (VulkanGraphicsContext context)
	{
		this.context = context;
	}


	public ~this ()
	{

	}


	override public Result<void, Error> Initialize (Self.Description description)
	{
		VkDescriptorSetLayoutCreateInfo dslCI = VkDescriptorSetLayoutCreateInfo();
		ResourceLayout.ElementDescription[] elements = description.elements;
		this.descriptorTypes = new VkDescriptorType[elements.Count];
		VkDescriptorSetLayoutBinding[] bindings = scope VkDescriptorSetLayoutBinding[elements.Count];

		uint32 uniformBufferCount = 0;
		uint32 uniformBufferDynamicCount = 0;
		uint32 sampledImageCount = 0;
		uint32 samplerCount = 0;
		uint32 storageBufferCount = 0;
		uint32 storageBufferDynamicCount = 0;
		uint32 storageImageCount = 0;

		for (uint32 n = 0; n < elements.Count; n++)
		{
			VkDescriptorType descriptorType = VulkanFormats.Convert(elements[n].Kind, elements[n].Options);

			bindings[n] = VkDescriptorSetLayoutBinding()
			{
				binding = n,
				descriptorType = descriptorType,
				descriptorCount = 1,
				stageFlags = VulkanFormats.Convert(elements[n].Stages),
				pImmutableSamplers = null,
			};

		    if ((elements[n].Options & .DynamicBinding) != 0)
		    {
		        this.DynamicBufferCount += 1;
		    }

		    this.descriptorTypes[n] = descriptorType;

		    switch (descriptorType)
		    {
		        case .VK_DESCRIPTOR_TYPE_SAMPLER:
		            samplerCount += 1;
		            break;
		        case .VK_DESCRIPTOR_TYPE_SAMPLED_IMAGE:
		            sampledImageCount += 1;
		            break;
		        case .VK_DESCRIPTOR_TYPE_STORAGE_IMAGE:
		            storageImageCount += 1;
		            break;
		        case .VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER:
		            uniformBufferCount += 1;
		            break;
		        case .VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER_DYNAMIC:
		            uniformBufferDynamicCount += 1;
		            break;
		        case .VK_DESCRIPTOR_TYPE_STORAGE_BUFFER:
		            storageBufferCount += 1;
		            break;
		        case .VK_DESCRIPTOR_TYPE_STORAGE_BUFFER_DYNAMIC:
		            storageBufferDynamicCount += 1;
		            break;

				default: break;
		    }
		}

		this.DescriptorResourceCounts = DescriptorResourceCounts(
		    uniformBufferCount,
		    uniformBufferDynamicCount,
		    sampledImageCount,
		    samplerCount,
		    storageBufferCount,
		    storageBufferDynamicCount,
		    storageImageCount
		);

		dslCI.bindingCount = uint32(elements.Count);
		dslCI.pBindings = bindings.CArray();

		vkCreateDescriptorSetLayout(this.context.logicalDevice.handle, &dslCI, this.context.allocationCallbacks, &this.handle)
			.Resolve!();

		return .Ok;
	}


	override public void Dispose ()
	{
		if (this.handle != default)
		{
			vkDestroyDescriptorSetLayout(this.context.logicalDevice.handle, this.handle, this.context.allocationCallbacks);
			this.handle = default;
		}

		if (this.descriptorTypes != null)
		{
			delete this.descriptorTypes;
			this.descriptorTypes = null;
		}
	}


}