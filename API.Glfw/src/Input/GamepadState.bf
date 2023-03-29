namespace API.Glfw
{
	using System;


	public struct GamepadState
	{
		/*! @brief The states of each [gamepad button](@ref gamepad_buttons), `GLFW_PRESS` or `GLFW_RELEASE`. */
		public KeyAction[15] buttons;

		/*! @brief The states of each [gamepad axis](@ref gamepad_axes), in the range -1.0 to 1.0 inclusive. */
		public float[6] axes;
	}


}