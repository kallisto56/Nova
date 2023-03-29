namespace System.Engine;


using System;
using System.Math;
using System.Threading;
using System.Diagnostics;
using System.Collections;


abstract public class ApplicationContext : IDisposable
{
	public Description description;

	public GraphicsContext context;
	public Window window;

	public IKeyboard keyboard;
	public IMouse mouse;
	public IGamepad gamepad;


	public Result<void, Error> Run ()
	{
		return .Ok;
	}


	abstract public Result<void, Error> Update ();
	abstract public Result<void, Error> Render ();

	abstract public Result<void, Error> Initialize ();
	abstract public void Dispose ();

	/*abstract public Result<void, Error> TEST ();*/
}

struct DeviceMemoryTag
{

}

class Program
{
	static void Main ()
	{
		// Create instance of application
		ApplicationContext app = new App();

		// Run indefinitely
		if (app.Run() case .Err(Error e))
		{
			// In case of errors, log it anywhere you want
			Tracy.Report(e, isCritical: true);
		}

		// Dispose of resources and delete the instance
		delete app..Dispose();
	}
}

public class App : ApplicationContext
{
	override public Result<void, Error> Update ()
	{
		// This is called multiple times per frame
		return .Ok;
	}

	override public Result<void, Error> Render ()
	{
		// This is called once per frame, when it is time to render new image
		return .Ok;
	}

	override public Result<void, Error> Initialize ()
	{
		// This is called after initial initialization is done
		// Here, you can adjust stuff, create render passes and device memory tags
		return .Ok;
	}

	override public void Dispose ()
	{
		// This is called when application is about to close, either because
		// user requested application to close, or because something went wrong.
	}
}