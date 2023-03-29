namespace System.Engine;


using System;
using System.Diagnostics;
using System.Math;

using System.Engine.Implementations.Vulkan;


public class Engine : IDisposable
{
	public GraphicsContext graphicsContext;
	public Window window;
	public IKeyboard keyboard;
	public IMouse mouse;
	public IGamepad gamepad;

	public Description description;

	public int64 targetFramesPerSecond;
	public int64 currentTime;
	public int64 lastUpdateTime;
	public int64 lastRenderTime;


	public virtual Result<void, Error> Initialize (Engine.Description description)
	{
		Console.MaximizeConsoleWindow();
		this.description = Self.Validate(description).Resolve!();

		this.window = Window
			.Create(description.window)
			.Resolve!();

		this.mouse = this.window.GetMouse();
		this.keyboard = this.window.GetKeyboard();
		this.gamepad = this.window.GetGamepad();

		this.graphicsContext = GraphicsContext
			.Create(this.description.graphicsDevice, window, params description.backend)
			.Resolve!();

		return .Ok;
	}


	public virtual void Dispose ()
	{
		this.graphicsContext?.WaitForIdle();
		this.description.onShutdown?.Invoke(this);

		if (this.graphicsContext != null)
			delete this.graphicsContext..Dispose();

		if (this.window != null)
			delete this.window..Dispose();

		this.description.Dispose();
	}


	public virtual Result<void, Error> Update ()
	{
		this.window.PollEvents();
		this.description.onUpdate?.Invoke(this).Resolve!();

		return .Ok;
	}


	public virtual Result<void, Error> Render ()
	{
		this.description.onRender?.Invoke(this).Resolve!();
		
		return .Ok;
	}


	public virtual Result<void, Error> Run (Engine.Description createInfo)
	{
		this.Initialize(createInfo).Resolve!();
		this.description.onInitialize?.Invoke(this).Resolve!();

		this.window.Focus();

		while (this.window.isPendingClosure == false)
		{
			this.Update().Resolve!();

			if (this.window.width > 0 && this.window.height > 0)
				this.Render().Resolve!();
		}

		return .Ok;
	}


	public virtual bool ShouldRender (int64 time)
	{
		this.currentTime = time;
		int64 delta = TimeSpan.TicksPerSecond / this.targetFramesPerSecond;
		return (this.currentTime - (this.lastRenderTime + delta) >= 0);
	}


	public virtual void UpdateTimer (int64 time, bool isRendering)
	{
		this.currentTime = time;

		if (isRendering)
			this.lastRenderTime = this.currentTime;
		else
			this.lastUpdateTime = this.currentTime;
	}


	static public Result<Description, Error> Validate (Description description)
	{
		return .Ok(description);
	}


}