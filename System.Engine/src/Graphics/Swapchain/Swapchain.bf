namespace System.Engine;


using System;
using System.Diagnostics;


abstract public class Swapchain : IDeviceResource, IDisposable
{
	abstract public String name { get; protected set; }

	abstract public Result<void, Error> Initialize (Self.Description description);
	abstract public void Dispose ();

	abstract public Result<void, Error> AcquireImage ();
	abstract public Result<void, Error> SwapBuffers ();
	abstract public Framebuffer GetFramebuffer ();
	abstract public RenderPass GetRenderPass ();
}