namespace Game
{
	using System;
	using Engine;


    public struct Pixel
	{
		public int2 position;
		public Color color;


		public this (int2 position, Color color)
		{
			this.position = position;
			this.color = color;
		}


	}


}