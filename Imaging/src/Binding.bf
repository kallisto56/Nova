namespace Imaging
{
	using System;



	static
	{
		[LinkName("stbi_load"), CallingConvention(.Cdecl)]
		public static extern uint8* LoadImageFromFile(char8* filename, int* width, int* height, int* channels, Format format);

		//STBIDEF stbi_uc *stbi_load_from_memory   (stbi_uc           const *buffer, int len   , int *x, int *y, int *channels_in_file, int desired_channels);
		[LinkName("stbi_load_from_memory"), CallingConvention(.Cdecl)]
		public static extern uint8* LoadImageFromMemory(char8* buffer, int len, int* x, int* y, int* channels_in_file, Format desired_channels);

		[LinkName("stbi_image_free"), CallingConvention(.Cdecl)]
		public static extern void FreeImage (void* pointer);

		public enum Format : int
		{
		    defaultFormat = 0, // only used for desired_channels

		    grey = 1,
		    greyAlpha = 2,
		    rgb = 3,
		    rgba = 4
		};
	}
}