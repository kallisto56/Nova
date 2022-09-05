namespace Engine
{
	using System;


	public static class Union64
	{
		[Inline]
		public static void Decode (uint64 input, out uint32 depth, out uint32 index)
		{
			depth = uint32((input & 0xFFFFFFFFFF000000L) >> 32);
			index = uint32(input & 0xFFFFFFFFL);
		}

		[Inline]
		public static uint64 Encode (uint32 depth, uint32 index)
		{
			return uint64(depth) << 32 | uint64(index);
		}

		[Inline]
		public static void Decode (uint64 input, out uint32 depth, out uint32 instruction, out uint8 splat)
		{
			depth = uint32((input & 0xFFFFFFFFFF000000L) >> 32);
			instruction = uint32((input & 0x00000000ffffff00L) >> 8);
			splat = uint8(input & 0x00000000000000ffL);
		}

		[Inline]
		public static uint64 Encode (uint32 depth, uint32 instruction, uint8 splat)
		{
			return uint64(depth) << 32 | instruction << 8 | splat;
		}
	}


}