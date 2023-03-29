namespace System.Engine;


using System;
using System.Collections;
using System.Diagnostics;


abstract public class GraphicsContext : IDisposable
{
	// TODO: public bool isInitialized;
	static public List<BackendOption> backendOptions;
	public Window window;


	static this ()
	{
		Self.backendOptions = new List<BackendOption>();
	}


	static ~this ()
	{
		for (uint32 n = 0; n < Self.backendOptions.Count; n++)
			delete Self.backendOptions[n].callback;

		delete Self.backendOptions;
	}


	abstract public Result<void, Error> Initialize (Self.Description description, Window window);
	abstract public void Dispose ();

	/*abstract public ResourceFactory GetResourceFactory ();*/
	abstract public Swapchain GetSwapchain ();
	abstract public CommandPool GetCommandPool ();

	abstract public Result<void, Error> WaitForIdle ();
	abstract public Result<void, Error> UpdateBuffer (Buffer buffer, uint64 offsetInBytes, uint64 sizeInBytes, void* data);

	abstract public Result<Buffer, Error> Create (Buffer.Description description);
	abstract public Result<Texture, Error> Create (Texture.Description description);
	abstract public Result<TextureView, Error> Create (TextureView.Description description);
	abstract public Result<ResourceLayout, Error> Create (ResourceLayout.Description description);
	abstract public Result<ResourceSet, Error> Create (ResourceSet.Description description);
	abstract public Result<Pipeline, Error> Create (Pipeline.GraphicsDescription description);
	abstract public Result<Pipeline, Error> Create (Pipeline.ComputeDescription description);
	abstract public Result<ShaderModule, Error> Create (ShaderModule.Description description);
	abstract public Result<Sampler, Error> Create (Sampler.Description description);
	abstract public Result<Swapchain, Error> Create (Swapchain.Description description); // TODO: Why ResourceFactory has a Swapchain option?
	abstract public Result<CommandPool, Error> Create (CommandPool.Description description);
	abstract public Result<Framebuffer, Error> Create (Framebuffer.Description description);
	abstract public Result<RenderPass, Error> Create (RenderPass.Description description);
	abstract public Result<Fence, Error> Create (Fence.Description description);

	virtual public Result<void, Error> Validate (Buffer.Description description) => .Ok;
	virtual public Result<void, Error> Validate (Texture.Description description) => .Ok;
	virtual public Result<void, Error> Validate (TextureView.Description description) => .Ok;
	virtual public Result<void, Error> Validate (ResourceLayout.Description description) => .Ok;
	virtual public Result<void, Error> Validate (ResourceSet.Description description) => .Ok;
	virtual public Result<void, Error> Validate (Pipeline.GraphicsDescription description) => .Ok;
	virtual public Result<void, Error> Validate (Pipeline.ComputeDescription description) => .Ok;
	virtual public Result<void, Error> Validate (ShaderModule.Description description) => .Ok;
	virtual public Result<void, Error> Validate (Sampler.Description description) => .Ok;
	virtual public Result<void, Error> Validate (Swapchain.Description description) => .Ok;
	virtual public Result<void, Error> Validate (CommandPool.Description description) => .Ok;
	virtual public Result<void, Error> Validate (Framebuffer.Description description) => .Ok;
	virtual public Result<void, Error> Validate (RenderPass.Description description) => .Ok;
	virtual public Result<void, Error> Validate (Fence.Description description) => .Ok;

	abstract public Result<void, Error> CompileShaders (ShaderModule[] array, params ShaderModule.Description[] descriptions);
}