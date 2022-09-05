namespace Game
{
	using System;
	using System.Collections;
	using Engine;
	using Engine.Misc;
	using Platforms;
	using OpenGL;


	public class Program
	{
		static Surface surface;

		static GeometryBuffer geometryBuffer;

		static TransformationStage transformationStage;
		static SortingStage sortingStage;
		static SortingVisualizationStage sortingVisualizationStage;
		static NaiveSplattingStage naiveSplattingStage;
		static SplattingStage splattingStage;
		static LightingStage lightingStage;
		static BlittingStage blittingStage;


		public static int2 CalculateTiledSize (int2 screenResolution, int tileSize, int tileAdd)
		{
			return int2(
				Math.Ceiling((float(screenResolution.width) / tileSize) + tileAdd) * tileSize,
				Math.Ceiling((float(screenResolution.height) / tileSize) + tileAdd) * tileSize
			);
		}


		static void Main ()
		{
			// Configuring console window
			Engine.Misc.ConsoleWindow.SetupConsoleWindow();

			// OpenGL platform
			let platform = Engine.Create<Platforms.OpenGL.PlatformLayer>();
			Engine.platform.windowResolution = int2(768, 768);

			// Input system
			Engine.Create<SimpleKeyboard>(platform.keyboardInterface);
			Engine.Create<SimpleMouse>(platform.mouseInterface);

			// Now it is time
			if (Engine.Initialize() case .Err)
			{
				Engine.Shutdown();
				return;
			}

			DefaultScene defaultScene = RootScene.Add<DefaultScene>();
			defaultScene.isEnabled = true;
			if (defaultScene.Initialize() case .Err)
			{
				Error("Unable to initialize scene.");
				Engine.Shutdown();
				return;
			}

			Mesh.Cluster cluster = scope .();
			for (int n = 0; n < 64; n++)
			{
				cluster.splats[n] = Mesh.Splat(Vector3.zero, 0F, Vector3.zero, 0F, 0F, 0F, 0F, 0F, Color(255, 0, 0, 255), 1F, 0F, 0F, 0F, 0F);
			}
			Engine.splatsBuffer.Insert(cluster);
			Console.WriteLine("Added debug cluster; Buffer contains {0} splats in it.", Engine.splatsBuffer.count);

			// ...
			DefaultScene.DefaultSceneComponent defComponent = defaultScene.Add<DefaultScene.DefaultSceneComponent>();
			if (defComponent.Initialize(defaultScene) case .Err)
			{
				Error("Unable to initialize scene component.");
				Engine.Shutdown();
				return;
			}

			// ...
			Program.surface = new Surface();

			int tileSize = 3;
			int2 initialResolution = int2(192);
			int2 screenBounds = CalculateTiledSize(initialResolution, tileSize, 0);
			int2 tiledSize = CalculateTiledSize(initialResolution, tileSize, 6);
			surface.Resize(screenBounds, int2(1));

			// ...
			Program.geometryBuffer = new GeometryBuffer();
			Program.geometryBuffer.Initialize(tiledSize.width / tileSize, tiledSize.height / tileSize, tileSize);
			Console.WriteLine("Surface(size: {0}x{1}, pixel: {2}x{3})", surface.screenSize.width, surface.screenSize.height, surface.pixelSize.width, surface.pixelSize.height);
			Console.WriteLine("GeometryBuffer(tiles: {0}x{1}; screenSize: {2}x{3})", geometryBuffer.countRows, geometryBuffer.countColumns, geometryBuffer.screenBounds.width, geometryBuffer.screenBounds.height);

			// ...
			SoftwareShader.gpuProcessor = new GPUProcessor(1);
			transformationStage = new TransformationStage();
			sortingStage = new SortingStage();
			sortingVisualizationStage = new SortingVisualizationStage();
			naiveSplattingStage = new NaiveSplattingStage();
			splattingStage = new SplattingStage();
			lightingStage = new LightingStage();
			blittingStage = new BlittingStage();
			
			// -----------------------------------------------
			// -----------------------------------------------
			// -----------------------------------------------

			RenderTexture renderTexture = new Platforms.OpenGL.RenderTexture();
			renderTexture.Initialize();
			renderTexture.EnsureSize(surface.screenSize.width, surface.screenSize.height);

			// FF FF FF FF FF FF FF FF
			// 

			// Perform cycles until we are asked to close application
			while (Engine.state.isPendingClosure == false)
			{
				//Engine.PerformCycle();

				if (Engine.platform.IsPendingClosure() == true || Engine.keyboard.IsPressed(.Escape))
				{
					Engine.state.isPendingClosure = true;
				}

				

				// ...
				Engine.platform.PollEvents();

				// ...
				Engine.keyboard.Update();
				Engine.mouse.Update();

				if (Engine.ShouldRender() == true)
				{
					float lastFrame = float((Engine.state.currentTime - Engine.state.lastRenderTime) / 1000);
					float a = float(transformationStageCounter.value / 1000.0);
					float b = float(sortingStageCounter.value / 1000.0);
					float c = float(splattingStageCounter.value / 1000.0);
					float d = float(blittingStageCounter.value / 1000.0);
					Engine.platform.SetTitle("{0}ms; transform: {1}ms, sorting: {2}ms, splatting: {3}ms, blitting: {4}ms; tiles: {5}; peeks: {6}", lastFrame, a, b, c, d, splattingStage.countTileIterations, splattingStage.countIterations);

					Engine.Update(true);
					
					// ...
					Engine.platform.ClearScreen(0.25F, 0.25F, 0.25F);

					{
						SoftwareCompute();
						surface.Render();
						renderTexture.texture.SetData(surface.output.CArray());
						renderTexture.Render();
					}

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
			
			DeleteAndNullify!(SoftwareShader.gpuProcessor);
			DisposeDeleteAndNullify!(renderTexture);

			DeleteAndNullify!(Program.transformationStage);
			DeleteAndNullify!(Program.sortingStage);
			DeleteAndNullify!(Program.sortingVisualizationStage);
			DeleteAndNullify!(Program.naiveSplattingStage);
			DeleteAndNullify!(Program.splattingStage);
			DeleteAndNullify!(Program.lightingStage);
			DeleteAndNullify!(Program.blittingStage);

			DeleteAndNullify!(Program.geometryBuffer);
			DeleteAndNullify!(Program.surface);

			// ...
			Engine.Shutdown();
		}

		static Performance.Counter transformationStageCounter = new Performance.Counter("TransformationStage") ~ delete _;
		static Performance.Counter sortingStageCounter = new Performance.Counter("SortingStage") ~ delete _;
		static Performance.Counter sortingVisualizationStageCounter = new Performance.Counter("SortingVisualizationStage") ~ delete _;
		static Performance.Counter splattingStageCounter = new Performance.Counter("SplattingStage") ~ delete _;
		static Performance.Counter blittingStageCounter = new Performance.Counter("BlittingStage") ~ delete _;
		static Random random = new Random() ~ delete _;

		static void SoftwareCompute ()
		{
			CameraComponent camera = RootScene.scenes[0].mainCamera;

			// Clean up (should be in blitting stage)
			for (int n = 0; n < Program.geometryBuffer.sortedContenders.Count; n++)
			{
				Program.geometryBuffer.sortedContenders[n] = Contender.emptyValue;
				Program.geometryBuffer.contenders[n] = Contender.emptyValue;
			}

			// Transformation stage
			using (transformationStageCounter.Start())
			{
				transformationStage.matrices = Engine.transformBuffer.matrices;
				transformationStage.splats = Engine.splatsBuffer.values;
				transformationStage.instructions = Engine.instructionSet.values;
				transformationStage.geometryBuffer = Program.geometryBuffer;
				transformationStage.surface = Program.surface;
				transformationStage.screenBounds = Program.geometryBuffer.screenBounds;
				transformationStage.clippingPlane = Vector2(camera.nearPlane, camera.farPlane);

				transformationStage.Dispatch(Engine.instructionSet.count, 1, 1);
			}

			if (Engine.keyboard.IsPressed(.J) == false && Engine.keyboard.IsRepeated(.J) == false)
			{
				// Sorting stage
				using (sortingStageCounter.Start())
				{
					sortingStage.geometryBuffer = Program.geometryBuffer;
					sortingStage.splats = Engine.splatsBuffer.values;
					sortingStage.instructions = Engine.instructionSet.values;
					sortingStage.screenBounds = Program.geometryBuffer.screenBounds;
					sortingStage.clippingPlane = Vector2(camera.nearPlane, camera.farPlane);
	
					sortingStage.Dispatch(Program.geometryBuffer.countRows, Program.geometryBuffer.countColumns, 1);
				}

				// Splatting stage
				using (splattingStageCounter.Start())
				{
					splattingStage.matrices = Engine.transformBuffer.matrices;
					splattingStage.splats = Engine.splatsBuffer.values;
					splattingStage.instructions = Engine.instructionSet.values;
					splattingStage.geometryBuffer = Program.geometryBuffer;
					splattingStage.surface = Program.surface;
					splattingStage.screenOffset = int2(9);
					splattingStage.screenBounds = Program.geometryBuffer.screenBounds;
					splattingStage.clippingPlane = Vector2(camera.nearPlane, camera.farPlane);

					splattingStage.Dispatch(Program.surface.screenSize.width, Program.surface.screenSize.height, 1);
				}
			}

			// Blitting stage
			using (blittingStageCounter.Start())
			{
				blittingStage.matrices = Engine.transformBuffer.matrices;
				blittingStage.splats = Engine.splatsBuffer.values;
				blittingStage.instructions = Engine.instructionSet.values;
				blittingStage.geometryBuffer = Program.geometryBuffer;
				blittingStage.surface = Program.surface;
				blittingStage.screenBounds = Program.surface.screenSize;
				blittingStage.blitOffset = int2(9);
				blittingStage.clippingPlane = Vector2(camera.nearPlane, camera.farPlane);

				blittingStage.Dispatch(Program.surface.screenSize.width, Program.surface.screenSize.height, 1);
			}
		}
	}


}