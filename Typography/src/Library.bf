namespace Typography
{
	using System;


	static
	{
		[LinkName("stbtt_BakeFontBitmap"), CallingConvention(.Cdecl)]
		public static extern void BakeFontToBitmap (uint8* data, int offset, float pixel_height, uint8 *pixels, int pw, int ph, int first_char, int num_chars, BakedCharacter *chardata);
	}


}