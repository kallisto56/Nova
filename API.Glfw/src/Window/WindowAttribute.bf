namespace API.Glfw
{
	using System;
	

	[AllowDuplicates]
	public enum WindowAttribute : int32
	{
		// TODO: Find a place for this
		GLFW_NO_API = 0x0,

		// TODO: Find a place for this
		GLFW_FALSE = 0x00000000,

		// TODO: Find a place for this
		GLFW_TRUE = 0x00000001,

		// Window related
		/*! @brief Input focus window hint and attribute */
		GLFW_FOCUSED = 0x00020001,

		/*! @brief Window iconification window attribute */
		GLFW_ICONIFIED = 0x00020002,

		/*! @brief Window maximization window hint and attribute */
		GLFW_MAXIMIZED = 0x00020008,

		/*! @brief Mouse cursor hover window attribute. */
		GLFW_HOVERED = 0x0002000B,

		/*! @brief Window visibility window hint and attribute */
		GLFW_VISIBLE = 0x00020004,

		/*! @brief Window resize-ability window hint and attribute */
		GLFW_RESIZABLE = 0x00020003,

		/*! @brief Window decoration window hint and attribute */
		GLFW_DECORATED = 0x00020005,

		/*! @brief Window auto-iconification window hint and attribute */
		GLFW_AUTO_ICONIFY = 0x00020006,

		/*! @brief Window decoration window hint and attribute */
		GLFW_FLOATING = 0x00020007,

		/*! @brief Window framebuffer transparency hint and attribute */
		GLFW_TRANSPARENT_FRAMEBUFFER = 0x0002000A,

		/*! @brief Input focus on calling show window hint and attribute */
		GLFW_FOCUS_ON_SHOW = 0x0002000C,

		/*! @brief Cursor centering window hint */
		GLFW_CENTER_CURSOR = 0x00020009,

		// Context related

		/*! @brief Context client API hint and attribute. */
		GLFW_CLIENT_API = 0x00022001,

		/*! @brief Context creation API hint and attribute. */
		GLFW_CONTEXT_CREATION_API = 0x0002200B,

		/*! @brief Context client API major version hint and attribute. */
		GLFW_CONTEXT_VERSION_MAJOR = 0x00022002,

		/*! @brief Context client API minor version hint and attribute. */
		GLFW_CONTEXT_VERSION_MINOR = 0x00022003,

		/*! @brief Context client API revision number hint and attribute. */
		GLFW_CONTEXT_REVISION = 0x00022004,

		/*! @brief OpenGL forward-compatibility hint and attribute. */
		GLFW_OPENGL_FORWARD_COMPAT = 0x00022006,

		/*! @brief Debug mode context hint and attribute. */
		GLFW_OPENGL_DEBUG_CONTEXT = 0x00022007,

		/*! @brief OpenGL profile hint and attribute. */
		GLFW_OPENGL_PROFILE = 0x00022008,

		/*! @brief Context flush-on-release hint and attribute. */
		GLFW_CONTEXT_RELEASE_BEHAVIOR = 0x00022009,

		/*! @brief Context error suppression hint and attribute. */
		GLFW_CONTEXT_NO_ERROR = 0x0002200A,

		/*! @brief Context robustness hint and attribute. */
		GLFW_CONTEXT_ROBUSTNESS = 0x00022005,
	}


}