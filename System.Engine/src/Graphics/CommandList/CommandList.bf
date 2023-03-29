namespace System.Engine;


using System;
using System.Math;
using System.Diagnostics;


abstract public class CommandPool : IDeviceResource, IDisposable
{
	abstract public String name { get; protected set; }

	abstract public Result<void, Error> Initialize (Self.Description description);
	abstract public Result<void, Error> Submit ();
	abstract public Result<CommandBuffer, Error> GetCommandBuffer ();
	abstract public Result<void, Error> Reset ();
	abstract public void Dispose ();
}