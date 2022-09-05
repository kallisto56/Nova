namespace Platforms.OpenGL
{
	using System;
	using Engine;
	using GLFW;


	public class MouseInterface : Engine.MouseInterface
	{
		public Platforms.OpenGL.PlatformLayer platform;

		public int[8] keys;
		public int2 scrollPosition;
		public int2 scrollDelta;

		public override bool IsPressed(Mouse.Button button)
		{
			return Glfw.GetMouseButton(this.platform.windowHandle, (.)button) == .Press;
		}

		public override bool IsReleased(Mouse.Button button)
		{
			return Glfw.GetMouseButton(this.platform.windowHandle, (.)button) == .Release;
		}

		public override bool IsRepeated(Mouse.Button button)
		{
			return Glfw.GetMouseButton(this.platform.windowHandle, (.)button) == .Repeat;
		}

		public override int2 GetPosition()
		{
			double x = 0;
			double y = 0;

			Glfw.GetCursorPos(this.platform.windowHandle, ref x, ref y);

			return int2(x, y);
		}

		public override int2 GetScrollPosition()
		{
			return this.scrollPosition;
		}

		public override int2 GetScrollDelta()
		{
			return this.scrollDelta;
		}

		public override void SetScrollPosition(int2 value)
		{
			this.scrollPosition = value;
			this.scrollDelta = int2.Zero;
		}

		public void ButtonCallback(GlfwWindow* windowHandle, GlfwInput.MouseButton button, GlfwInput.Action action, int mods)
		{
			
		}

		public void PositionCallback(GlfwWindow* windowHandle, double x, double y)
		{

		}

		public void ScrollCallback(GlfwWindow* windowHandle, double x, double y)
		{

		}
	}


}