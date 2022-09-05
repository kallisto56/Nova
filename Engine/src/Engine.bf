namespace Engine
{
	using System;
	using System.Collections;
	using System.Diagnostics;
	using System.Threading;


	public static class Engine
	{
		public static State state;
		public static Settings settings;

		public static PlatformLayer platform;
		public static InstructionSet instructionSet = new .(40960) ~ delete _;
		public static SplatsBuffer splatsBuffer = new .(327680) ~ delete _;
		public static TransformBuffer transformBuffer = new .(100, 10) ~ delete _;
		/*public static RenderingPipeline renderingPipeline;*/

		public static Keyboard keyboard;
		public static Mouse mouse;


		public static Result<void> Initialize ()
		{
			if (Engine.settings == null)
			{
				Engine.Create<Engine.Settings>();
			}

			if (Engine.state == null)
			{
				Engine.Create<Engine.State>();
			}

			if (platform.Initialize() case .Err)
			{
				return .Err;
			}

			// TODO: CoordinationBuffer requires count of matrices and count of instructions. Pull those from settings or somewhere else.
			/*Engine.coordinateBuffer.Initialize(50, 10240, 10240, 10240*64);*/
			/*Engine.renderingPipeline.Initialize();*/

			return .Ok;
		}


		public static void PerformCycle ()
		{
			if (Engine.platform.IsPendingClosure() == true)
			{
				Engine.state.isPendingClosure = true;
			}

			// ...
			Engine.platform.PollEvents();

			// ...
			Engine.keyboard.Update();
			Engine.mouse.Update();

			if (ShouldRender() == true)
			{
				double lastFrame = (Engine.state.currentTime - Engine.state.lastRenderTime) / 1000;
				Engine.platform.SetTitle("{0}ms", float(lastFrame));

				Engine.Update(true);
				
				// ...
				Engine.platform.ClearScreen(0.25F, 0.25F, 0.25F);

				/*Engine.renderingPipeline.Compute();*/
				/*Engine.renderingPipeline.Render();*/
				OpenGL.GlDebug.Assert();

				/*Console.WriteLine("Engine.coordinateBuffer(matrices: {0}, instructions: {1})", Engine.coordinateBuffer.countMatrices, Engine.coordinateBuffer.countInstructions);*/

				// ...
				Engine.platform.SwapBuffers();
				Engine.UpdateTimer(true);
			}
			else
			{
				Engine.Update(false);
				Engine.UpdateTimer(false);
			}
		}


		public static void Update (bool isRendering)
		{
			Engine.state.isRendering = isRendering;

			for (int n = 0; n < RootScene.scenes.Count; n++)
			{
				Scene scene = RootScene.scenes[n];
				if (scene.isEnabled == true)
				{
					scene.Update(isRendering);
				}
			}
		}


		public static bool ShouldRender ()
		{
			Engine.state.currentTime = System.Diagnostics.Stopwatch.GetTimestamp();
			double threshold = 1.0 / Engine.state.targetFPS;

			return (Engine.state.currentTime - Engine.state.lastRenderTime) >= threshold;
		}


		public static void UpdateTimer (bool rendered = false)
		{
			if (rendered)
			{
				Engine.state.lastRenderTime = Engine.state.currentTime;
			}
			else
			{
				Engine.state.lastUpdateTime = Engine.state.currentTime;
			}
		}


		public static void Shutdown ()
		{
			RootScene.Shutdown();

			// ...
			/*Engine.renderingPipeline.Shutdown();*/
			Engine.platform?.Shutdown();

			// ...
			if (Engine.state != null) delete Engine.state;
			if (Engine.settings != null) delete Engine.settings;

			if (Engine.platform != null) delete Engine.platform;
			/*if (Engine.renderingPipeline != null) delete Engine.renderingPipeline;*/

			if (Engine.keyboard != null) delete Engine.keyboard;
			if (Engine.mouse != null) delete Engine.mouse;

		}


		public static void Assert (bool condition, String message)
		{
			if (condition == false)
			{
				Console.BackgroundColor = .DarkRed;
				Console.ForegroundColor = .Black;
				Console.WriteLine(message);
				Console.Read();
			}
		}


		public static T Create<T> () where T : PlatformLayer
		{
			LogCreatingInstance(typeof(T), typeof(PlatformLayer));
			
			Engine.platform = new T();
			return (T)Engine.platform;
		}


		public static void Create<T> () where T : State
		{
			LogCreatingInstance(typeof(T), typeof(State));

			Engine.state = new T();
		}


		/*public static void Create<T> () where T : RenderingPipeline
		{
			LogCreatingInstance(typeof(T), typeof(RenderingPipeline));

			Engine.renderingPipeline = new T();
		}*/


		public static void Create<T> (KeyboardInterface keyboardInterface = null) where T : Keyboard
		{
			LogCreatingInstance(typeof(T), typeof(Keyboard));

			Engine.keyboard = new T();
			if (keyboardInterface != null)
			{
				Engine.keyboard.SetInterface(keyboardInterface);
			}
		}


		public static void Create<T> (MouseInterface mouseInterface = null) where T : Mouse
		{
			LogCreatingInstance(typeof(T), typeof(Mouse));

			Engine.mouse = new T();
			if (mouseInterface != null)
			{
				Engine.mouse.SetInterface(mouseInterface);
			}
		}


		public static void Create<T> () where T : Settings
		{
			LogCreatingInstance(typeof(T), typeof(Settings));

			Engine.settings = new T();
		}


	}


}