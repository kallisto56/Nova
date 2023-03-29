namespace System.Engine.Windowing.Glfw;


using System;
using System.Collections;
using System.Diagnostics;
using System.Math;

using API.Glfw;


public class GlfwMouse : IMouse, IDisposable
{
	public GlfwWindow window;

	public int32 x { get; protected set; }
	public int32 y { get; protected set; }

	public float scrollOffsetX { get; protected set; }
	public float scrollOffsetY { get; protected set; }

	public IMouse.InputMode mode { get; protected set; } = .normal;

	bool[12] state = bool[12]();
	IMouse.Once[12] onceState = IMouse.Once[12]();
	int[12] timeSinceChange = int[12]();


	public this (GlfwWindow window)
	{
		this.window = window;

		for (uint32 n = 0; n < this.onceState.Count; n++)
		{
			this.onceState[n] = IMouse.Once(this, n);
		}
	}


	public ~this ()
	{

	}


	public void Dispose ()
	{

	}


	public void OnButton (MouseButton mouseButton, KeyAction action, int32 mods)
	{
		bool isPressed = action == .GLFW_PRESS || action == .GLFW_REPEAT;
		int code = int(mouseButton);

		if (this.state[code] != isPressed)
		{
			this.timeSinceChange[code] = DateTime.Now.Ticks;
		}

		this.state[code] = isPressed;
	}


	public void OnPosition (int32 x, int32 y)
	{
		this.x = x;
		this.y = y;
	}


	public void OnScroll (float xoffset, float yoffset)
	{
		this.scrollOffsetX = xoffset;
		this.scrollOffsetY = yoffset;
	}


	public bool IsPressed (int index)
	{
		return this.state[index];
	}


	public bool IsPressedOnce (int index)
	{
		return this.onceState[index].IsPressed();
	}


	public IMouse.InputMode GetInputMode ()
	{
		return this.mode;
	}


	public void SetInputMode (IMouse.InputMode mode)
	{
		if (mode == .normal)
		{
			Glfw.SetInputMode(this.window.handle, .Cursor, CursorInputMode.Normal);
			this.mode = .normal;
		}
		else if (mode == .hidden)
		{
			Glfw.SetInputMode(this.window.handle, .Cursor, CursorInputMode.Hidded);
			this.mode = .hidden;
		}
		else if (mode == .disabled)
		{
			Glfw.SetInputMode(this.window.handle, .Cursor, CursorInputMode.Disabled);
			this.mode = .disabled;
		}
	}


}