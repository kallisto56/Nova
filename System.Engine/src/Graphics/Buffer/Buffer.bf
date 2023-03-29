namespace System.Engine;


using System;
using System.Diagnostics;


abstract public class Buffer : IDeviceResource, IBindableResource, IDisposable
{
	public String name { get; protected set; }
	public uint64 sizeInBytes { get; protected set; }
	public Usage usage { get; protected set; }

	abstract public Result<void, Error> Initialize (Self.Description description);
	abstract public void Dispose ();
}