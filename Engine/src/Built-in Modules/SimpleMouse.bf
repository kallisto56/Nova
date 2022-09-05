namespace Engine
{
	using System;


	public class SimpleMouse : Mouse
	{


		public override bool IsPressed(Mouse.Button button)
		{
			return this.mouseInterface.IsPressed(button);
		}


		public override bool IsReleased(Mouse.Button button)
		{
			return this.mouseInterface.IsReleased(button);
		}


		public override bool IsRepeated(Mouse.Button button)
		{
			return this.mouseInterface.IsRepeated(button);
		}


		public override void Update ()
		{
			this.position = this.mouseInterface.GetPosition();
		}
	}


}