namespace Game
{
	using System;
	using System.Collections;
	using Engine;
	using Engine.Misc;
	using Platforms;
	using OpenGL;


	public class TEST_Sorting
	{
		static void Main ()
		{
			Engine.Misc.ConsoleWindow.SetupConsoleWindow();

			/*Vector2 clipping = Vector2(0.1F, 100F);
			for (int n = 0; n < 100; n++)
			{
				float radius = SoftwareShader.CalculateRadius(uint32(n), clipping);
				Console.WriteLine("DEPTH: {0, 10}; RADIUS: {1, 10}", uint32(n), radius);
			}

			Console.WriteLine("...");
			Console.Read();*/

			// Configuring console window
			Engine.Misc.ConsoleWindow.SetupConsoleWindow();

			// ...
			GeometryBuffer geometryBuffer = new GeometryBuffer();
			/*geometryBuffer.Initialize(192/3, 192/3);*/

			// ...
			SortingStage sortingStage = new SortingStage();
			sortingStage.geometryBuffer = geometryBuffer;
			sortingStage.screenBounds = int2(192, 192);
			sortingStage.clippingPlane = Vector2(0.1F, 1000F);

			/*geometryBuffer.contenders[geometryBuffer.GetKey(0, 0, 0)] = Contender(777, 14, 62);
			geometryBuffer.contenders[geometryBuffer.GetKey(0, 0, 1)] = Contender(uint32.MaxValue, 0, 0);
			geometryBuffer.contenders[geometryBuffer.GetKey(0, 0, 2)] = Contender(32786, 32, 1);
			geometryBuffer.contenders[geometryBuffer.GetKey(0, 0, 3)] = Contender(22786, 32, 2);
			geometryBuffer.contenders[geometryBuffer.GetKey(0, 0, 4)] = Contender(12786, 32, 3);
			geometryBuffer.contenders[geometryBuffer.GetKey(0, 0, 5)] = Contender(uint32.MaxValue, 0, 0);
			geometryBuffer.contenders[geometryBuffer.GetKey(0, 0, 6)] = Contender(42786, 32, 4);
			geometryBuffer.contenders[geometryBuffer.GetKey(0, 0, 7)] = Contender(52786, 32, 5);
			geometryBuffer.contenders[geometryBuffer.GetKey(0, 0, 8)] = Contender(50786, 32, 6);*/

			sortingStage.Main(int3(0, 0, 0));

			for (int z = 0; z < 9; z++)
			{
				Contender contender = geometryBuffer.sortedContenders[geometryBuffer.GetKey(0, 0, z)];
				Console.WriteLine("{0}", contender.depth);
			}

			DeleteAndNullify!(SoftwareShader.gpuProcessor);
			DeleteAndNullify!(geometryBuffer);
			DeleteAndNullify!(sortingStage);

			// ...
			Engine.Shutdown();

			Console.WriteLine("...");
			Console.Read();
		}
	}


}