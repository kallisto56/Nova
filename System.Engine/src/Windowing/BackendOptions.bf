namespace System.Engine;


using System;
using System.Collections;
using System.Diagnostics;


public extension Window
{
	public delegate Result<Window, Error> CreateWindowDelegate (Description description);


	public struct PlatformOption
	{
		public Platform platform;
		public CreateWindowDelegate callback;


		public this (Platform platform, CreateWindowDelegate callback)
		{
			this.platform = platform;
			this.callback = callback;
		}
	}


	static public Result<Window, Error> Create (Self.Description description)
	{
		Window window = null;

		#if BF_PLATFORM_WINDOWS
		/*window = new System.Engine.Windowing.Win64.Win64Window();*/
		window = new System.Engine.Windowing.Glfw.GlfwWindow();
		#endif

		#if BF_PLATFORM_LINUX
		Runtime.FatalError("Window.Create: BF_PLATFORM_LINUX is not implemented");
		#endif

		#if BF_PLATFORM_MACOS
		Runtime.FatalError("Window.Create: BF_PLATFORM_MACOS is not implemented");
		#endif

		if (window.Initialize(description) case .Err(Error e))
		{
			delete window..Dispose();
			return .Err(e);
		}

		return .Ok(window);
	}


}