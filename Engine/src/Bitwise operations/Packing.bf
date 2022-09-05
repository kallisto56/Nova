namespace Engine
{
	using System;
	


	static
	{
		[Union]
		struct UnsignedNormalized4x8
		{
			public uint8[4] unpacked;
			public uint32 packed;
		}


		[Union]
		struct SignedNormalized4x8
		{
			public int8[4] unpacked;
			public uint32 packed;
		}

		[Union]
		struct unsigned2x32
		{
			public uint32[2] unpacked;
			public uint64 packed;
		}

		public static uint2 unpack2x32 (uint64 value)
		{
			unsigned2x32 union = .();
			union.packed = value;

			return uint2(union.unpacked[0], union.unpacked[1]);
		}

		public static uint64 pack2x32 (uint32 x, uint32 y)
		{
			unsigned2x32 union = .();
			union.unpacked[0] = x;
			union.unpacked[1] = y;

			return union.packed;
		}



		/*public static uint32 packUnorm4x8(Color color)
		{
			UnsignedNormalized4x8 union = UnsignedNormalized4x8();

			union.unpacked[0] = color.r;
			union.unpacked[1] = color.g;
			union.unpacked[2] = color.b;
			union.unpacked[3] = color.a;

			return union.packed;
		}*/



		public static uint32 packUnorm4x8(Vector4 value)
		{
			Vector4 clamped = Vector4.Clamp(value, Vector4.Zero, Vector4.Ones) * 255F;
			Vector4 rounded = Vector4.Round(clamped);

			UnsignedNormalized4x8 union = UnsignedNormalized4x8();

			union.unpacked[0] = uint8(rounded.x);
			union.unpacked[1] = uint8(rounded.y);
			union.unpacked[2] = uint8(rounded.z);
			union.unpacked[3] = uint8(rounded.w);

			return union.packed;
		}

		public static Vector4 unpackUnorm4x8(uint32 value)
		{
			UnsignedNormalized4x8 union = UnsignedNormalized4x8();
			union.packed = value;

			return Vector4(union.unpacked[0], union.unpacked[1], union.unpacked[2], union.unpacked[3]) * 0.0039215686274509803921568627451f;
		}

		/*public static Color unpackUnorm4x8Color(uint32 value)
		{
			UnsignedNormalized4x8 union = UnsignedNormalized4x8();
			union.packed = value;

			Vector4 color = Vector4(union.unpacked[0], union.unpacked[1], union.unpacked[2], union.unpacked[3]) * 0.0039215686274509803921568627451f;
			return Color(color.x, color.y, color.z, color.w);
		}*/


		public static uint32 packSnorm4x8(Vector4 value)
		{
			Vector4 clamped = Vector4.Clamp(value, Vector4(-1F, -1F, -1F, -1F), Vector4.Ones) * 127.0F;
			Vector4 rounded = Vector4.Round(clamped);

			SignedNormalized4x8 union = SignedNormalized4x8();
			union.unpacked[0] = int8(rounded.x);
			union.unpacked[1] = int8(rounded.y);
			union.unpacked[2] = int8(rounded.z);
			union.unpacked[3] = int8(rounded.w);

			return union.packed;
		}

		public static Vector4 unpackSnorm4x8(uint32 value)
		{
			SignedNormalized4x8 union = SignedNormalized4x8();
			union.packed = value;

			Vector4 unpacked = Vector4(union.unpacked[0], union.unpacked[1], union.unpacked[2], union.unpacked[3]) * 0.0078740157480315F;
			return Vector4.Clamp(unpacked, Vector4(-1F, -1F, -1F, -1F), Vector4.Ones);
		}
	}
}