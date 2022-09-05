namespace Platforms.OpenGL
{
	using System;
	using Engine;
	using GLFW;


	public class KeyboardInterface : Engine.KeyboardInterface
	{
		public Platforms.OpenGL.PlatformLayer platform;
		public Keyboard.Action[] state = new Keyboard.Action[1024] ~ delete _;


		public override bool IsPressed(Keyboard.Code keyCode)
		{
			return this.state[int(keyCode)] == .isPressed;
		}


		public override bool IsReleased(Keyboard.Code keyCode)
		{
			return this.state[int(keyCode)] == .isReleased;
		}


		public override bool IsRepeated(Keyboard.Code keyCode)
		{
			return this.state[int(keyCode)] == .isRepeated;
		}


		public void Callback (GlfwWindow* windowHandle, GlfwInput.Key keyCode, int scanCode, GlfwInput.Action action, int mods)
		{
			int index = int(keyCode);

			// TODO: If-statement is here because we do not support media keys at this moment.
			// NOTE: Media keys are not supported by GLFW either, they always hav 256 scancode and GlfwInput.Key.Unknown...
			if (index >= 0 && index < this.state.Count)
			{
				this.state[index] = (.)action;
			}
		}
	}


}