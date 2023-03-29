namespace API.Glfw
{
	using System;


	public enum KeyAction : int32
	{
		/* @brief The key or mouse button was released. */
		GLFW_RELEASE = 0x00000000,

		/* @brief The key or mouse button was pressed. */
		GLFW_PRESS = 0x00000001,

		/*! @brief The key was held down until it repeated. */
		GLFW_REPEAT = 0x00000002
	}


}