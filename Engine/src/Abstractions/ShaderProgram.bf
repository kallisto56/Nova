namespace Engine
{
	using System;


	public abstract class ShaderProgram : IDisposable
	{
		public uint identifier;

		public abstract Result<void> Initialize ();
		public abstract Result<void> Attach (ShaderStage shaderStage);
		public abstract Result<void> Compile ();

		public abstract void Bind ();
		public abstract void Unbind ();

		public abstract void Dispose ();
	}


}