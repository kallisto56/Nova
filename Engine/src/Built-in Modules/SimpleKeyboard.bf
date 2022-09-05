namespace Engine
{
	using System;


	public class SimpleKeyboard : Keyboard
	{


		public override bool IsPressed (Code keyCode)
		{
			return this.keyboardInterface.IsPressed(keyCode);
		}


		public override bool IsReleased (Code keyCode)
		{
			return this.keyboardInterface.IsReleased(keyCode);
		}


		public override bool IsRepeated (Code keyCode)
		{
			return this.keyboardInterface.IsRepeated(keyCode);
		}

		public override void Update()
		{

		}
	}


}