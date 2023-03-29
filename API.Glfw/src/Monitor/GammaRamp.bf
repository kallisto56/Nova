namespace API.Glfw
{
	using System;
	
	
	[CRepr]
	public struct GammaRamp
	{
		public uint16* red;
		public uint16* green;
		public uint16* blue;

		public uint32 size;
	}


}