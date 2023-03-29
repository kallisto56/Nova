namespace System.Engine;


extension ResourceLayout
{
	public struct Description
	{
		public ElementDescription[] elements;


		public this (params ElementDescription[] elements)
		{
		    this.elements = elements;
		}


	}
}