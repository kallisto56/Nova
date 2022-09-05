namespace Engine
{
	using System;


	public abstract class MouseInterface
	{
		public abstract bool IsPressed (Mouse.Button button);
		public abstract bool IsReleased (Mouse.Button button);
		public abstract bool IsRepeated (Mouse.Button button);

		public abstract int2 GetPosition ();

		public abstract int2 GetScrollPosition ();
		public abstract int2 GetScrollDelta ();

		public abstract void SetScrollPosition (int2 value);
	}

	


}