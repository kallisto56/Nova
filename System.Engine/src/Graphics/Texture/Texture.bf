namespace System.Engine;


using System;
using System.Diagnostics;


abstract public class Texture : IDeviceResource, IDisposable
{
	abstract public String name { get; protected set; }

	abstract public Result<void, Error> Initialize (Texture.Description description);
	abstract public void Dispose ();

	abstract public Texture.Format format { get; protected set; }
	abstract public uint32 width { get; protected set; }
	abstract public uint32 height { get; protected set; }
	abstract public uint32 depth { get; protected set; }
	abstract public uint32 mipLevels { get; protected set; }
	abstract public uint32 arrayLayers { get; protected set; }
	abstract public Usage usage { get; protected set; }
	abstract public Type type { get; protected set; }
	abstract public SampleCount sampleCount { get; protected set; }
	abstract public bool isDisposed { get; protected set; }
	abstract public Result<TextureView, Error> GetView ();
}