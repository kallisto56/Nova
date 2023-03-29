namespace System.Engine;


using System;
using System.Diagnostics;
using System.Collections;

using API.Vulkan;


abstract public class Window : IDisposable
{
	public virtual bool isPendingClosure { get; protected set; }

	public virtual uint32 top { get; }
	public virtual uint32 left { get; }
	public virtual uint32 right { get; }
	public virtual uint32 bottom { get; }

	public virtual uint32 width { get; protected set; }
	public virtual uint32 height { get; protected set; }

	public virtual String title { get; protected set; }


	abstract public Result<void, Error> Initialize (Self.Description description);
	abstract public void PollEvents();
	abstract public void Focus ();
	abstract public void Dispose ();

	abstract public IMouse GetMouse();
	abstract public IKeyboard GetKeyboard();
	abstract public IGamepad GetGamepad();

	abstract public Result<VkSurfaceKHR, Error> CreateVulkanSurface (VkInstance instance, VkAllocationCallbacks* allocator);


	static public Platform GetCurrentPlatform ()
	{
		#if BF_PLATFORM_WINDOWS
		return .Windows;
		#endif

		#if BF_PLATFORM_LINUX
		return .Linux;
		#endif

		#if BF_PLATFORM_MACOS
		return .MacOS
		#endif
	}
}