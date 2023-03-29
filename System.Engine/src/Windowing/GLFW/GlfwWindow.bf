namespace System.Engine.Windowing.Glfw;


using System;
using System.Collections;
using System.Diagnostics;
using System.Math;

using API.Glfw;
using API.Vulkan;
using static API.Vulkan.VulkanNative;


public class GlfwWindow : System.Engine.Window
{
	public WindowHandle* handle;
	public GlfwMouse mouse;
	public GlfwKeyboard keyboard;
	public GlfwGamepad gamepad;


	public this ()
	{
		Self.windows.Add(this);

		this.mouse = new GlfwMouse(this);
		this.keyboard = new GlfwKeyboard(this);
	}


	public ~this ()
	{
		Self.windows.Remove(this);

		if (this.mouse != null)
		{
			delete this.mouse..Dispose();
			this.mouse = null;
		}

		if (this.keyboard != null)
		{
			delete this.keyboard..Dispose();
			this.keyboard = null;
		}

		if (this.gamepad != null)
		{
			delete this.gamepad..Dispose();
			this.gamepad = null;
		}
	}

	override public Result<void, Error> Initialize (Window.Description description)
	{
		this.width = description.width;
		this.height = description.height;
		this.title = description.title;

		if (Glfw.Initialize() == .GLFW_FALSE)
			return .Err(new Error("Glfw.Initialize() responded with GLFW_FALSE"));

		// TODO: Window description should have graphics backend,
		// but the problem is that at this stage we do not know,
		// what backend will end up being used.
		Glfw.WindowHint(.GLFW_CLIENT_API, .GLFW_NO_API);

		this.handle = Glfw.CreateWindow(this.width, this.height, this.title.CStr(), null, null);
		if (this.handle == default)
			return .Err(new Error("Glfw.CreateWindow() failed to create window."));

		Glfw.SetKeyCallback(this.handle, => Self.KeyboardCallback);
		Glfw.SetMouseButtonCallback(this.handle, => Self.MouseButtonCallback);
		Glfw.SetCursorPosCallback(this.handle, => Self.MousePositionCallback);
		Glfw.SetScrollCallback(this.handle, => Self.MouseScrollCallback);
		Glfw.SetDropCallback(this.handle, => Self.PathDropCallback);
		Glfw.SetFramebufferSizeCallback(this.handle, => Self.FramebufferSizeCallback);

		this.MakeCentered();

		return .Ok;
	}


	public void MakeCentered ()
	{
		int32 monitorLeft = 0;
		int32 monitorTop = 0;
		int32 monitorWidth = 0;
		int32 monitorHeight = 0;

		int32 left = 0;
		int32 top = 0;
		int32 right = 0;
		int32 bottom = 0;

		int32 width = 0;
		int32 height = 0;

		Glfw.GetWindowSize(this.handle, &width, &height);
		Glfw.GetWindowFrameSize(this.handle, &left, &top, &right, &bottom);

		MonitorHandle* monitor = Glfw.GetPrimaryMonitor();
		Glfw.GetMonitorWorkarea(monitor, &monitorLeft, &monitorTop, &monitorWidth, &monitorHeight);

		width = width + (left + right);
		height = height + (top + bottom);

		int x = ((monitorWidth / 2) - (width / 2)) + left;
		int y = ((monitorHeight / 2) - (height / 2)) + top;

		Glfw.SetWindowPos(this.handle, x, y);
	}

	override public void PollEvents ()
	{
		Glfw.PollEvents();

		if (Glfw.WindowShouldClose(this.handle) == true)
			this.isPendingClosure = true;
	}

	override public void Focus ()
	{
		Glfw.FocusWindow(this.handle);
	}

	override public void Dispose ()
	{
		if (this.handle != default)
		{
			Glfw.DestroyWindow(this.handle);
			this.handle = default;
		}
	}

	override public Result<VkSurfaceKHR, Error> CreateVulkanSurface (VkInstance instance, VkAllocationCallbacks* allocator)
	{
		VkSurfaceKHR surface = ?;
		Glfw.CreateWindowSurface(instance, this.handle, allocator, &surface)
			.Resolve!();

		return surface;
	}

	override public IMouse GetMouse ()
	{
		return this.mouse;
	}

	override public IKeyboard GetKeyboard ()
	{
		return this.keyboard;
	}

	override public IGamepad GetGamepad ()
	{
		return this.gamepad;
	}

	public void OnFramebufferSizeChanged (uint32 width, uint32 height)
	{
		this.width = width;
		this.height = height;
	}

	public void OnPathDrop (int32 path_count, char8** paths)
	{
		Tracy.Trace();
	}


	static List<GlfwWindow> windows;

	static this ()
	{
		Self.windows = new List<GlfwWindow>();
	}

	static ~this ()
	{
		delete Self.windows;
		Glfw.Terminate();
	}

	static Result<GlfwWindow> GetWindow (WindowHandle* handle)
	{
		for (uint32 n = 0; n < Self.windows.Count; n++)
		{
			GlfwWindow window = Self.windows[n];
			if (window.handle == handle)
				return window;
		}

		return .Err;
	}

	static void FramebufferSizeCallback (WindowHandle* handle, int32 width, int32 height)
	{
		if (Self.GetWindow(handle) case .Ok(let window))
			window.OnFramebufferSizeChanged(uint32(width), uint32(height));
	}

	static void KeyboardCallback (WindowHandle* handle, API.Glfw.KeyCode keyCode, int32 scancode, KeyAction action, int32 mods)
	{
		if (Self.GetWindow(handle) case .Ok(let window))
			window.keyboard.OnKeyboard(keyCode, scancode, action, mods);
	}

	static void MouseButtonCallback (WindowHandle* handle, MouseButton button, KeyAction action, int32 mods)
	{
		if (Self.GetWindow(handle) case .Ok(let window))
			window.mouse.OnButton(button, action, mods);
	}

	static void MousePositionCallback (WindowHandle* handle, double xpos, double ypos)
	{
		if (Self.GetWindow(handle) case .Ok(let window))
			window.mouse.OnPosition(int32(xpos), int32(ypos));
	}

	static void MouseScrollCallback (WindowHandle* handle, double xoffset, double yoffset)
	{
		if (Self.GetWindow(handle) case .Ok(let window))
			window.mouse.OnScroll(float(xoffset), float(yoffset));
	}

	static void PathDropCallback (WindowHandle* handle, int32 path_count, char8** paths)
	{
		if (Self.GetWindow(handle) case .Ok(let window))
			window.OnPathDrop(path_count, paths);
	}
}