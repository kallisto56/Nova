namespace System.Engine;


using System;
using System.Diagnostics;


abstract public class Pipeline : IDeviceResource, IDisposable
{
	abstract public String name { get; protected set; }

	abstract public Result<void, Error> Initialize (Self.GraphicsDescription description);
	abstract public Result<void, Error> Initialize (Self.ComputeDescription description);
	abstract public void Dispose ();
}