/*namespace System.Engine;


using System;
using System.Diagnostics;


abstract public class ResourceFactory : IDisposable
{
	abstract public Result<void, Error> Initialize ();
	abstract public void Dispose ();

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
}*/