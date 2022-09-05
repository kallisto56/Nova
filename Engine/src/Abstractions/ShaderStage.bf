namespace Engine
{
	using System;


	public abstract class ShaderStage : IDisposable
	{
		public uint identifier;

		public String filename = null;
		public ShaderType type;

		public abstract Result<void> InitializeFromFile (String filename, ShaderType type);
		public abstract Result<void> InitializeFromString (String string, ShaderType type);
		public abstract void Dispose ();
	}

	public enum ShaderType
	{
		vertex,
		fragment,
		compute,
	}
}