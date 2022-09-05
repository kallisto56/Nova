namespace Engine
{
	using System;


	public abstract class VertexArrayObject : IDisposable
	{
		public uint32 identifier;

		public abstract Result<void> Initialize ();
		public abstract void Dispose ();
	}


}