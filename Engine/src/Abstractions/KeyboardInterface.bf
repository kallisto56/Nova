namespace Engine
{
	using System;


	public abstract class KeyboardInterface
	{
		public abstract bool IsPressed (Keyboard.Code keyCode);
		public abstract bool IsReleased (Keyboard.Code keyCode);
		public abstract bool IsRepeated (Keyboard.Code keyCode);
	}


}