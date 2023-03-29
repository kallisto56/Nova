namespace API.Glfw
{
	using System;

	
	/** @brief Initialization hints are set before Init and affect how the library behaves until termination. */
	public enum InitializationHint : int32
	{
		/** @brief Joystick hat buttons init hint. Specifies whether to also expose joystick hats as buttons, for compatibility with earlier versions of GLFW that did not have glfwGetJoystickHats. Possible values are true and false. */
		GLFW_JOYSTICK_HAT_BUTTONS = 0x00050001,
	
		/** @brief macOS specific init hint. Specifies whether to set the current directory to the application to the Contents/Resources subdirectory of the application's bundle, if present. */
		GLFW_COCOA_CHDIR_RESOURCES = 0x00051001,
	
		/** @brief macOS specific init hint. Specifies whether to create a basic menu bar, either from a nib or manually, when the first window is created, which is when AppKit is initialized. */
		GLFW_COCOA_MENUBAR = 0x00051002,
	}


}