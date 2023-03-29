/*namespace System.Engine.Implementations.Vulkan;


using System;
using System.Threading;
using System.Diagnostics;
using System.Collections;


public class VulkanResourceFactory : ResourceFactory
{
	VulkanGraphicsContext context;


	public this (VulkanGraphicsContext context)
	{
		this.context = context;
	}


	public ~this ()
	{

	}


	override public Result<void, Error> Initialize ()
	{
		return .Ok;
	}


	override public void Dispose ()
	{
		
	}


	override public Result<Buffer, Error> Create (Buffer.Description description)
	{
		this.Validate(description).Resolve!();

		VulkanBuffer resource = new VulkanBuffer(this.context);
		if (resource.Initialize(description) case .Err(var e))
		{
			delete resource..Dispose();
			return .Err(e);
		}

		return .Ok(resource);
	}


	override public Result<Texture, Error> Create (Texture.Description description)
	{
		this.Validate(description).Resolve!();

		VulkanTexture resource = new VulkanTexture(this.context);
		if (resource.Initialize(description) case .Err(var e))
		{
			delete resource..Dispose();
			return .Err(e);
		}

		return .Ok(resource);
	}


	override public Result<TextureView, Error> Create (TextureView.Description description)
	{
		this.Validate(description).Resolve!();

		VulkanTextureView resource = new VulkanTextureView(this.context);
		if (resource.Initialize(description) case .Err(var e))
		{
			delete resource..Dispose();
			return .Err(e);
		}

		return .Ok(resource);
	}


	override public Result<ResourceLayout, Error> Create (ResourceLayout.Description description)
	{
		this.Validate(description).Resolve!();

		VulkanResourceLayout resource = new VulkanResourceLayout(this.context);
		if (resource.Initialize(description) case .Err(var e))
		{
			delete resource..Dispose();
			return .Err(e);
		}

		return .Ok(resource);
	}


	override public Result<ResourceSet, Error> Create (ResourceSet.Description description)
	{
		this.Validate(description).Resolve!();

		VulkanResourceSet resource = new VulkanResourceSet(this.context);
		if (resource.Initialize(description) case .Err(var e))
		{
			delete resource..Dispose();
			return .Err(e);
		}

		return .Ok(resource);
	}


	override public Result<Pipeline, Error> Create (Pipeline.GraphicsDescription description)
	{
		this.Validate(description).Resolve!();

		VulkanPipeline resource = new VulkanPipeline(this.context);
		if (resource.Initialize(description) case .Err(var e))
		{
			delete resource..Dispose();
			return .Err(e);
		}

		return .Ok(resource);
	}


	override public Result<Pipeline, Error> Create (Pipeline.ComputeDescription description)
	{
		this.Validate(description).Resolve!();

		VulkanPipeline resource = new VulkanPipeline(this.context);
		if (resource.Initialize(description) case .Err(var e))
		{
			delete resource..Dispose();
			return .Err(e);
		}

		return .Ok(resource);
	}


	override public Result<ShaderModule, Error> Create (ShaderModule.Description description)
	{
		this.Validate(description).Resolve!();

		VulkanShaderModule resource = new VulkanShaderModule(this.context);
		if (resource.Initialize(description) case .Err(var e))
		{
			delete resource..Dispose();
			return .Err(e);
		}

		return .Ok(resource);
	}


	override public Result<Sampler, Error> Create (Sampler.Description description)
	{
		this.Validate(description).Resolve!();

		VulkanSampler resource = new VulkanSampler(this.context);
		if (resource.Initialize(description) case .Err(var e))
		{
			delete resource..Dispose();
			return .Err(e);
		}

		return .Ok(resource);
	}


	override public Result<Swapchain, Error> Create (Swapchain.Description description)
	{
		this.Validate(description).Resolve!();

		VulkanSwapchain resource = new VulkanSwapchain(this.context);
		if (resource.Initialize(description) case .Err(var e))
		{
			delete resource..Dispose();
			return .Err(e);
		}

		return .Ok(resource);
	}


	override public Result<CommandPool, Error> Create (CommandPool.Description description)
	{
		this.Validate(description).Resolve!();

		VulkanCommandPool resource = new VulkanCommandPool(this.context);
		if (resource.Initialize(description) case .Err(var e))
		{
			delete resource..Dispose();
			return .Err(e);
		}

		return .Ok(resource);
	}


	override public Result<Framebuffer, Error> Create (Framebuffer.Description description)
	{
		this.Validate(description).Resolve!();

		VulkanFramebuffer resource = new VulkanFramebuffer(this.context);
		if (resource.Initialize(description) case .Err(var e))
		{
			delete resource..Dispose();
			return .Err(e);
		}

		return .Ok(resource);
	}


	override public Result<RenderPass, Error> Create (RenderPass.Description description)
	{
		this.Validate(description).Resolve!();

		VulkanRenderPass resource = new VulkanRenderPass(this.context);
		if (resource.Initialize(description) case .Err(var e))
		{
			delete resource..Dispose();
			return .Err(e);
		}

		return .Ok(resource);
	}


	override public Result<Fence, Error> Create (Fence.Description description)
	{
		this.Validate(description).Resolve!();

		VulkanFence resource = new VulkanFence(this.context);
		if (resource.Initialize(description) case .Err(var e))
		{
			delete resource..Dispose();
			return .Err(e);
		}

		return .Ok(resource);
	}


	override public Result<void, Error> CompileShaders (ShaderModule[] array, params ShaderModule.Description[] descriptions)
	{
		for (uint32 n = 0; n < descriptions.Count; n++)
			array[n] = this.Create(descriptions[n]).Resolve!();

		return .Ok;
	}

}*/