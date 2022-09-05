namespace Engine
{
	using System;


	public abstract class Texture2D : IDisposable
	{
		public uint32 identifier;
		public int2 size;
		public Filtering filtering = .linear;
		public int countChannels;
		public InputFormat inputFormat;
		public InternalFormat internalFormat;


		public abstract Result<void> Initialize (int2 size, void* arrayPointer, int countChannels, InputFormat inputFormat = .unsignedByte, InternalFormat internalFormat = .rgba32f);
		/*public abstract Result<void> Resize (int2 size, void* arrayPointer, int countChannels, InputFormat inputFormat = .unsignedByte, InternalFormat internalFormat = .rgba32f);*/
		public abstract Result<void> SetData (void* arrayPointer);
		public abstract Result<void> SetData (Image image);
		public abstract void Dispose ();

		public enum Filtering
		{
			linear,
			nearest,
		}

		public enum InputFormat
		{
			unsignedByte,
			unsignedInteger,
			float
		}

		public enum InternalFormat
		{
			rgb8,
			rgb32,
			rgba8,
			rgba32,
			rgba32f,
		}
	}


}