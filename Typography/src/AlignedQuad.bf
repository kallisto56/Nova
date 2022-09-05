namespace Typography
{
	using System;


	[CRepr]
	public struct AlignedQuad
	{
		// top-left
		public float x0;
		public float y0;
		public float s0;
		public float t0;

		// bottom-right
		public float x1;
		public float y1;
		public float s1;
		public float t1;
	}


}