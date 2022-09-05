namespace Engine
{
	using System;


	public abstract class ComputeShader : IDisposable
	{
		public uint identifier;

		public abstract Result<void> Initialize (String filename);
		public abstract void Dispose ();

		public abstract Result<void> Dispatch (int x = 1, int y = 1, int z = 1);
		public abstract Result<void> SetData (String name, Texture2D texture);
		public abstract Result<void> SetData (String name, int x, int y);
		public abstract Result<void> SetData (String name, float x, float y);
		public abstract Result<void> SetData (String name, ref Matrix4x4 matrix);
		public abstract Result<void> SetData (uint location, ShaderStorageBuffer buffer);
	}


}