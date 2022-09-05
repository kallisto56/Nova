namespace Engine
{
	using System;
	using System.IO;
	using System.Collections;
	using System.Threading;


    public abstract class RenderTexture : IDisposable
    {
		public Texture2D texture;

		public abstract Result<void> Initialize ();
		public abstract void Dispose ();

		public abstract void EnsureSize (int width, int height);
		public abstract void Render ();
    }


}