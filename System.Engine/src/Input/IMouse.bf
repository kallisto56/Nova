namespace System.Engine;


public interface IMouse
{
	public int32 x { get; }
	public int32 y { get; }

	public float scrollOffsetX { get; }
	public float scrollOffsetY { get; }

	public bool IsPressed (int index);
	public bool IsPressedOnce (int index);

	public InputMode mode { get; }

	public void SetInputMode (InputMode mode);
	public InputMode GetInputMode ();

	public enum InputMode
	{
		normal,
		hidden,
		disabled,
	}

	public struct Once
	{
		public IMouse input;
		public int button;
		public bool wasPressed = false;
		public bool wasReleased = false;


		public this (IMouse input, int button)
		{
			this.input = input;
			this.button = button;
		}


		public bool IsPressed () mut
		{
			if (this.input.IsPressed(this.button) == true && this.wasPressed == false)
			{
				this.wasPressed = true;
				return true;
			}
			else if (this.input.IsPressed(this.button) == false)
			{
				if (this.wasPressed == true)
					this.wasReleased = true;

				this.wasPressed = false;
				
				return false;
			}

			return false;
		}


		public bool IsReleased () mut
		{
			return this.wasReleased;
		}


	}
}