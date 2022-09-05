namespace Engine
{
	using System;
	using System.IO;
	using System.Collections;
	using System.Threading;


    public static class BitPacking
    {
		public static uint32 Pack_ABCDEFGG (
			uint8 x0, uint8 y0, uint8 z0,
			uint8 x1, uint8 y1, uint8 z1,
			uint8 w
		)
		{
			return
				(uint32(ClampUint4(x0)) << 28) |
				(uint32(ClampUint4(y0)) << 24) |
				(uint32(ClampUint4(z0)) << 20) |
				(uint32(ClampUint4(x1)) << 16) |
				(uint32(ClampUint4(y1)) << 12) |
				(uint32(ClampUint4(z1)) << 8) |
				(uint32(w) << 0)
			;
		}

		public static uint32 Pack_AABBCCDD (
			uint8 a, uint8 b, uint8 c, uint8 d
		)
		{
			return
				(uint32(a) << 24) |
				(uint32(b) << 16) |
				(uint32(c) << 8) |
				(uint32(d) << 0)
			;
		}

		[Inline]
		static uint8 ClampUint4 (uint8 input)
		{
			return Math.Clamp(input, 0, 15);
		}
    }


}