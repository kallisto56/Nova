namespace System.Engine;


using System;
using System.Diagnostics;


abstract public class ResourceSet : IDeviceResource, IDisposable
{
	abstract public String name { get; protected set; }

	abstract public Result<void, Error> Initialize (Self.Description description);
	abstract public void Dispose ();
}