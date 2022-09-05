namespace Engine
{
	using System;


	public abstract class Mouse
	{
		public int2 delta;
		public int2 position;
		public MouseInterface mouseInterface;

		public virtual void SetInterface (MouseInterface mouseInterface)
		{
			this.mouseInterface = mouseInterface;
		}

		public abstract bool IsPressed (Button key);
		public abstract bool IsReleased (Button key);
		public abstract bool IsRepeated (Button key);
		public abstract void Update ();

		[AllowDuplicates]
		public enum Button
		{
			Button1,
			Button2,
			Button3,
			Button4,
			Button5,
			Button6,
			Button7,
			Button8,

			ButtonLast = Button8,
			ButtonLeft = Button1,
			ButtonRight = Button2,
			ButtonMiddle = Button3
		}

		public enum InputMode
		{
			normal,// = 0x00034001,
			hidded,// = 0x00034002,
			disabled,// = 0x00034003,
		}
	}


}