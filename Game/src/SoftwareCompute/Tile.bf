namespace Game
{
	using System;
	using Engine;


	[Union, CRepr]
	public struct Tile
	{
		public Contender[9] values;
	}


}