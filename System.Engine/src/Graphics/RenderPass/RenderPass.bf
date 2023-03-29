namespace System.Engine;


using System;
using System.Math;
using System.Diagnostics;


abstract public class RenderPass : IDeviceResource, IDisposable
{
	abstract public String name { get; protected set; }

	abstract public Result<void, Error> Initialize (Self.Description description);
	abstract public void Dispose ();
}