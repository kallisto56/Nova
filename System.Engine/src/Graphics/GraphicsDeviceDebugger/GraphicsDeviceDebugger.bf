namespace System.Engine;


using System;
using System.Diagnostics;


abstract public class GraphicsDeviceDebugger : IDisposable
{
	public delegate void OnError(Error e);
	
	abstract public Result<void, Error> Initialize (Self.Description description);
	abstract public void Dispose ();
}