namespace System.Engine.Windowing.Glfw;


using System;
using System.Collections;
using System.Diagnostics;
using System.Math;

using API.Glfw;


public class GlfwKeyboard : IKeyboard, IDisposable
{
	public GlfwWindow window;
	
	bool[1024] state = bool[1024]();
	IKeyboard.Once[1024] onceState = IKeyboard.Once[1024]();
	int[1024] timeSinceChange = int[1024]();


	public this (GlfwWindow window)
	{
		this.window = window;

		
	}


	public ~this ()
	{

	}


	public void Dispose ()
	{

	}


	public bool IsPressed (System.Engine.KeyCode keyCode)
	{
		return this.state[int(keyCode)];
	}


	public bool IsPressedOnce(System.Engine.KeyCode keyCode)
	{
		// TODO: How can we initialize them?
		if (this.onceState[int(keyCode)] == default)
		{
			Tracy.WriteLine("Creating Keyboard.Once for KeyCode: {0}", keyCode);
			this.onceState[int(keyCode)] = IKeyboard.Once(this, keyCode);
		}

		return this.onceState[int(keyCode)].IsPressed();
	}


	public int TimeSincePressed (System.Engine.KeyCode keyCode)
	{
		if (this.state[int(keyCode)] == true)
		{
			int t = DateTime.Now.Ticks;
			return (t - this.timeSinceChange[int(keyCode)]) / TimeSpan.TicksPerMillisecond;
		}
		else
		{
			return 0;
		}
	}


	public int TimeSinceReleased (System.Engine.KeyCode keyCode)
	{
		if (this.state[int(keyCode)] == false)
		{
			int t = DateTime.Now.Ticks;
			return (t - this.timeSinceChange[int(keyCode)]) / TimeSpan.TicksPerMillisecond;
		}
		else
		{
			return 0;
		}
	}


	public void OnKeyboard (API.Glfw.KeyCode keyCode, int32 scanCode, KeyAction action, int32 mods)
	{
		bool isPressed = action == .GLFW_PRESS || action == .GLFW_REPEAT;
		int code = int(Convert(keyCode)); // TODO: Glfw.KeyCode should be converted to System.Engine.KeyCode

		if (code < 0 || code >= this.state.Count)
		{
			Tracy.WriteLine(scope $"Keyboard.Callback(handle: {this.window.handle}, keyCode: {keyCode}, scanCode: {scanCode}, action: {action}, mods: {mods})");
			return;
		}

		if (this.state[code] != isPressed)
		{
			this.timeSinceChange[code] = DateTime.Now.Ticks;
		}

		this.state[code] = isPressed;
	}


	static System.Engine.KeyCode Convert (API.Glfw.KeyCode input)
	{
		switch (input)
		{
			/*case .SPACE: return .space;
			case .APOSTROPHE: return .apostrophe;
			case .COMMA: return .comma;
			case .MINUS: return .minus;
			case .PERIOD: return .period;
			case .SLASH: return .slash;
			case .NUM0: return .num0;
			case .NUM1: return .num1;
			case .NUM2: return .num2;
			case .NUM3: return .num3;
			case .NUM4: return .num4;
			case .NUM5: return .num5;
			case .NUM6: return .num6;
			case .NUM7: return .num7;
			case .NUM8: return .num8;
			case .NUM9: return .num9;
			case .SEMICOLON: return .SEMICOLON;
			case .EQUAL: return .EQUAL;*/
			case .A: return .kA;
			case .B: return .kB;
			case .C: return .kC;
			case .D: return .kD;
			case .E: return .kE;
			case .F: return .kF;
			case .G: return .kG;
			case .H: return .kH;
			case .I: return .kI;
			case .J: return .kJ;
			case .K: return .kK;
			case .L: return .kL;
			case .M: return .kM;
			case .N: return .kN;
			case .O: return .kO;
			case .P: return .kP;
			case .Q: return .kQ;
			case .R: return .kR;
			case .S: return .kS;
			case .T: return .kT;
			case .U: return .kU;
			case .V: return .kV;
			case .W: return .kW;
			case .X: return .kX;
			case .Y: return .kY;
			case .Z: return .kZ;

			/*case .LEFT_BRACKET: return .LEFT_BRACKET;
			case .BACKSLASH: return .BACKSLASH;
			case .RIGHT_BRACKET: return .RIGHT_BRACKET;
			case .GRAVE_ACCENT: return .GRAVE_ACCENT;
			case .WORLD1: return .WORLD1;
			case .WORLD2: return .WORLD2;
			case .ESCAPE: return .ESCAPE;
			case .ENTER: return .ENTER;
			case .TAB: return .TAB;
			case .BACKSPACE: return .BACKSPACE;
			case .INSERT: return .INSERT;
			case .DELETE: return .DELETE;
			case .RIGHT: return .RIGHT;
			case .LEFT: return .LEFT;
			case .DOWN: return .DOWN;
			case .UP: return .UP;
			case .PAGE_UP: return .PAGE_UP;
			case .PAGE_DOWN: return .PAGE_DOWN;
			case .HOME: return .HOME;
			case .END: return .END;
			case .CAPS_LOCK: return .CAPS_LOCK;
			case .SCROLL_LOCK: return .SCROLL_LOCK;
			case .NUM_LOCK: return .NUM_LOCK;
			case .PRINT_SCREEN: return .PRINT_SCREEN;
			case .PAUSE: return .PAUSE;
			case .F1: return .F1;
			case .F2: return .F2;
			case .F3: return .F3;
			case .F4: return .F4;
			case .F5: return .F5;
			case .F6: return .F6;
			case .F7: return .F7;
			case .F8: return .F8;
			case .F9: return .F9;
			case .F10: return .F10;
			case .F11: return .F11;
			case .F12: return .F12;
			case .F13: return .F13;
			case .F14: return .F14;
			case .F15: return .F15;
			case .F16: return .F16;
			case .F17: return .F17;
			case .F18: return .F18;
			case .F19: return .F19;
			case .F20: return .F20;
			case .F21: return .F21;
			case .F22: return .F22;
			case .F23: return .F23;
			case .F24: return .F24;
			case .F25: return .F25;
			case .KP0: return .KP0;
			case .KP1: return .KP1;
			case .KP2: return .KP2;
			case .KP3: return .KP3;
			case .KP4: return .KP4;
			case .KP5: return .KP5;
			case .KP6: return .KP6;
			case .KP7: return .KP7;
			case .KP8: return .KP8;
			case .KP9: return .KP9;
			case .KP_DECIMAL: return .KP_DECIMAL;
			case .KP_DIVIDE: return .KP_DIVIDE;
			case .KP_MULTIPLY: return .KP_MULTIPLY;
			case .KP_SUBTRACT: return .KP_SUBTRACT;
			case .KP_ADD: return .KP_ADD;
			case .KP_ENTER: return .KP_ENTER;
			case .KP_EQUAL: return .KP_EQUAL;
			case .LEFT_SHIFT: return .LEFT_SHIFT;
			case .LEFT_CONTROL: return .LEFT_CONTROL;
			case .LEFT_ALT: return .LEFT_ALT;
			case .LEFT_SUPER: return .LEFT_SUPER;
			case .RIGHT_SHIFT: return .RIGHT_SHIFT;
			case .RIGHT_CONTROL: return .RIGHT_CONTROL;
			case .RIGHT_ALT: return .RIGHT_ALT;
			case .RIGHT_SUPER: return .RIGHT_SUPER;
			case .MENU: return .MENU;*/

			default: return .cpDelete;
		}
	}


}