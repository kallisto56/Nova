namespace System.Engine;


public interface IKeyboard
{
	public bool IsPressed (KeyCode keyCode);
	public bool IsPressedOnce (KeyCode keyCode);


	public struct Once
	{
		public IKeyboard input;
		public KeyCode keyCode;
		public bool wasPressed = false;


		public this (IKeyboard input, KeyCode keyCode)
		{
			this.input = input;
			this.keyCode = keyCode;
		}


		public bool IsPressed () mut
		{
			if (this.input.IsPressed(this.keyCode) == true && this.wasPressed == false)
			{
				this.wasPressed = true;
				return true;
			}
			else if (this.input.IsPressed(this.keyCode) == false)
			{
				this.wasPressed = false;
				return false;
			}

			return false;
		}


	}
}