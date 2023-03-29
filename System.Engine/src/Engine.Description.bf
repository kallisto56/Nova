namespace System.Engine;


using System;
using System.Diagnostics;


extension Engine
{
	public struct Description : IDisposable
	{
		public InitializeDelegate onInitialize;
		public UpdateDelegate onUpdate;
		public RenderDelegate onRender;
		public ShutdownDelegate onShutdown;
		public bool isDebuggerEnabled;

		public Window.Description window;
		public GraphicsContext.Description graphicsDevice;
		public GraphicsContext.Backend[] backend;


		public delegate Result<void, Error> InitializeDelegate (Engine engine);
		public delegate Result<void, Error> UpdateDelegate (Engine engine);
		public delegate Result<void, Error> RenderDelegate (Engine engine);
		public delegate void ShutdownDelegate (Engine engine);


		public void Dispose () mut
		{
			// Arrays
			DeleteAndNullify!(this.backend);

			// Callbacks
			DeleteAndNullify!(this.onInitialize);
			DeleteAndNullify!(this.onUpdate);
			DeleteAndNullify!(this.onRender);
			DeleteAndNullify!(this.onShutdown);
		}
	}
}