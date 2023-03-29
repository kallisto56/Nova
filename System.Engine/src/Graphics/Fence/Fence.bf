namespace System.Engine;


using System;
using System.Diagnostics;


abstract public class Fence : IDeviceResource, IDisposable
{
	abstract public String name { get; protected set; }
	abstract public bool isSignaled { get; protected set; }

	abstract public Result<void, Error> Initialize (Self.Description description);
	abstract public Result<void, Error> Reset ();
	abstract public void Dispose ();
}