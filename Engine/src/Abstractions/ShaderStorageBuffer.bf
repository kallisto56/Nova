namespace Engine
{
	using System;


	public abstract class ShaderStorageBuffer : IDisposable
	{
		public uint32 identifier;
		public int capacity;

		public abstract Result<void> Initialize (void* data, StorageUsage usage, DataType type, int countElements);
		public abstract Result<void> SetData (void* data, int offset, int length);
		/*public abstract Result<void> Resize (void* data, StorageUsage usage, DataType type, int countElements);*/
		public abstract void Dispose ();

		public enum StorageUsage
		{
			GL_STREAM_DRAW,
			GL_STREAM_READ,
			GL_STREAM_COPY,
			GL_STATIC_DRAW,
			GL_STATIC_READ,
			GL_STATIC_COPY,
			GL_DYNAMIC_DRAW,
			GL_DYNAMIC_READ,
			GL_DYNAMIC_COPY
		}

		public enum DataType
		{
			uint32,
			uint64,
			matrix4x4,
			vector4,
		}
	}
}