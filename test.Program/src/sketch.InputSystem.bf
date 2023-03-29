namespace Something;


class InputLayout
{
	State<Keyboard.Code>[] keyboard;
	State<Mouse.Code>[] mouse;
	State<Gamepad.Code>[] gamepad;
}

class Keyboard
{
	public bool IsKeyPressed (Code keyCode) { return true; }
	public enum Code;
}

class Gamepad
{
	public bool IsButtonPressed (Code code) { return true; }
	public enum Code;
}

class Mouse
{
	public bool IsButtonPressed (Code code) { return true; }
	public enum Code;
}

public struct State<T>
{
	public T code;
	public bool isPressed;
	public uint32 lastChange;
}