namespace System.Engine;


extension Fence
{
	public struct Description
	{
		public bool isSignaled;


		public this (bool isSignaled = true)
		{
			this.isSignaled = isSignaled;
		}


	}
}