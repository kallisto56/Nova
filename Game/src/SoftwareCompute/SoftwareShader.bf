namespace Game
{
	using System;
	using System.Collections;
	using System.Threading;

	using Engine;


	public abstract class SoftwareShader
	{
		public static GPUProcessor gpuProcessor;
		public static Monitor atomicMonitor = new Monitor () ~ delete _;

		public abstract void Main (int3 gl_GlobalInvocationID);


		public void Dispatch (int x, int y, int z)
		{
			SoftwareShader.gpuProcessor.Dispatch(this, int3(x, y, z));
		}


		[Inline]
		public static float abs (float value)
		{
			return Math.Abs(value);
		}


		[Inline]
		public static int32 abs (int32 value)
		{
			return Math.Abs(value);
		}


		[Inline]
		public static float CalculateRadius (uint32 depth, Vector2 clippingPlane, float minimum = 0.5F, float maximum = 8F, int offset = 0)
		{
			/*return 8F;*/
			float alpha = 1F - (float(depth/*+ offset*/) / (clippingPlane.y - clippingPlane.x));
			return Math.Max(Math.Min(maximum * alpha, maximum), minimum);
		}

		[Inline]
		public static uint32 EncodeDepth (float depth, Vector2 clippingPlane)
		{
			return uint32(Math.Abs(depth) * (clippingPlane.y - clippingPlane.x));
		}


		public static int2 NormalizeScreenCoords (Vector2 screenCoords, int2 screenBounds)
		{
			Vector2 result = (screenCoords.xy * 0.5F + 0.5F) * screenBounds;
			result.x *= screenBounds.x / screenBounds.y;
			return int2(result.x, result.y);
		}


		public static void atomicMin (ref Contender[] array, int index, Contender rhs)
		{
			if (index < 0 || index >= array.Count) return;
			using (atomicMonitor.Enter())
			{
				if (rhs.values < array[index].values)
				{
					array[index] = rhs;
				}
			}
		}



		// de-interleave a 32-bit word using the Shift-Or algorithm
		/*public static uint lt_undilate_2(uint x)
		{
			uint y = x;
			y = (y | (y >> 1u )) & 0x33333333;
			y = (y | (y >> 2u )) & 0x0F0F0F0F;
			y = (y | (y >> 4u )) & 0x00FF00FF;
			y = (y | (y >> 8u )) & 0x0000FFFF;

			return (y & 0x0000FFFF);
		}


		// Retrieve column major position and level from a 32-bit word
		public static void lt_decode_2_15 (uint key, out uint level, out uint2 p)
		{
			level = key & 0xF;
			p = uint2(
				lt_undilate_2((key >> 4u) & 0x05555555),
				lt_undilate_2((key >> 5u) & 0x05555555)
			);
		}*/


	}


}