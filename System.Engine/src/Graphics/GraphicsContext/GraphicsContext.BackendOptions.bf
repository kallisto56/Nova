namespace System.Engine;


using System;
using System.Collections;
using System.Diagnostics;


public extension GraphicsContext
{
	public delegate Result<GraphicsContext, Error> CreateGraphicsDeviceDelegate (Description description);


	public struct BackendOption
	{
		public Backend backend;
		public CreateGraphicsDeviceDelegate callback;


		public this (Backend backend, CreateGraphicsDeviceDelegate callback)
		{
			this.backend = backend;
			this.callback = callback;
		}
	}


	static public Result<GraphicsContext, Error> Create (Self.Description description, Window window, params Backend[] preferredBackends)
	{
		for (uint32 n = 0; n < preferredBackends.Count; n++)
		{
			let response = Self.Create(preferredBackends[n], description, window);

			if (response case .Ok(GraphicsContext graphicsDevice))
				return graphicsDevice;

			if (response case .Err(Error e))
				Tracy.Report(e, false);
		}

		Error e = new Error("Unable to create graphics device from any of the preferred backends.");
		return .Err(e);
	}


	static public Result<GraphicsContext, Error> Create (Backend backend, Self.Description description, Window window)
	{
		GraphicsContext graphicsDevice = Instantiate(backend);
		if (graphicsDevice == null)
		{
			Error e = new Error("");
			e.message.AppendF("Unable to find or initialize a graphics device type of {0}.", backend);
			return .Err(e);
		}

		if (graphicsDevice.Initialize(description, window) case .Err(Error e))
		{
			delete graphicsDevice..Dispose();
			return .Err(e);
		}

		return graphicsDevice;


		/*for (uint32 n = 0; n < Self.backendOptions.Count; n++)
		{
			BackendOption option = Self.backendOptions[n];
			if (option.backend != backend)
				continue;

			let response = option.callback.Invoke(description);
			if (response case .Ok(GraphicsDevice graphicsDevice))
				return graphicsDevice;

			if (response case .Err(Error e))
				Tracy.Report(e, false);
		}*/
	}


	static GraphicsContext Instantiate (Backend backend)
	{
		switch (backend)
		{
			case .Vulkan: return new System.Engine.Implementations.Vulkan.VulkanGraphicsContext();
			default: return null;
		}
	}


}