namespace API.Glfw
{
	using System;
	
	
	[CRepr]
	public struct VideoMode
	{
		public int32 width;
		public int32 height;

		public int32 redBits;
		public int32 greenBits;
		public int32 blueBits;

		public int32 refreshRate;
	}


}