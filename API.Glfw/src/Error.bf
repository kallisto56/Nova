namespace API.Glfw
{
	using System;


	public enum GlfwError : int32
	{
		/*! @brief No error has occurred. */
		GLFW_NO_ERROR = 0x00000000,

		/*! @brief GLFW has not been initialized. */
		GLFW_NOT_INITIALIZED = 0x00010001,

		/*! @brief No context is current for this thread. */
		GLFW_NO_CURRENT_CONTEXT = 0x00010002,

		/*! @brief One of the arguments to the function was an invalid enum value. */
		GLFW_INVALID_ENUM = 0x00010003,

		/*! @brief One of the arguments to the function was an invalid value. */
		GLFW_INVALID_VALUE = 0x00010004,

		/*! @brief A memory allocation failed. */
		GLFW_OUT_OF_MEMORY = 0x00010005,

		/*! @brief GLFW could not find support for the requested API on the system. */
		GLFW_API_UNAVAILABLE = 0x00010006,

		/*! @brief The requested OpenGL or OpenGL ES version is not available. */
		GLFW_VERSION_UNAVAILABLE = 0x00010007,

		/*! @brief A platform-specific error occurred that does not match any of the more specific categories. */
		GLFW_PLATFORM_ERROR = 0x00010008,

		/*! @brief The requested format is not supported or available. */
		GLFW_FORMAT_UNAVAILABLE = 0x00010009,

		/*! @brief The specified window does not have an OpenGL or OpenGL ES context. */
		GLFW_NO_WINDOW_CONTEXT = 0x0001000A,
	}


}
