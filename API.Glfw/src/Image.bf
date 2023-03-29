namespace API.Glfw
{
	using System;
	
	
	[CRepr]
	public struct NativeImage
	{
		public int32 width;
		public int32 height;

		public char8* pixels;
	}


}