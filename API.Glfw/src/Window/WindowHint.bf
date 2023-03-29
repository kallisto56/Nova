namespace API.Glfw
{
	using System;
	
	
	public enum WindowHint : int32
	{
		// Window related

		/* @brief Window resize-ability window hint and attribute */
		GLFW_RESIZABLE = 0x00020003,

		/* @brief Window visibility window hint and attribute */
		GLFW_VISIBLE = 0x00020004,

		/* @brief Window decoration window hint and attribute */
		GLFW_DECORATED = 0x00020005,

		/* @brief Input focus window hint and attribute */
		GLFW_FOCUSED = 0x00020001,

		/* @brief Window auto-iconification window hint and attribute */
		GLFW_AUTO_ICONIFY = 0x00020006,

		/* @brief Window decoration window hint and attribute */
		GLFW_FLOATING = 0x00020007,
		
		/* @brief Window maximization window hint and attribute */
		GLFW_MAXIMIZED = 0x00020008,

		/* @brief Cursor centering window hint */
		GLFW_CENTER_CURSOR = 0x00020009,

		/* @brief Window framebuffer transparency hint and attribute */
		GLFW_TRANSPARENT_FRAMEBUFFER = 0x0002000A,

		/* @brief Input focus on calling show window hint and attribute */
		GLFW_FOCUS_ON_SHOW = 0x0002000C,
		
		/* @brief Window content area scaling window */
		GLFW_SCALE_TO_MONITOR = 0x0002200C,

		// Framebuffer related
		
		/* @brief Framebuffer bit depth hint. */
		GLFW_RED_BITS = 0x00021001,
		
		/* @brief Framebuffer bit depth hint. */
		GLFW_GREEN_BITS = 0x00021002,
		
		/* @brief Framebuffer bit depth hint. */
		GLFW_BLUE_BITS = 0x00021003,
		
		/* @brief Framebuffer bit depth hint. */
		GLFW_ALPHA_BITS = 0x00021004,
		
		/* @brief Framebuffer bit depth hint. */
		GLFW_DEPTH_BITS = 0x00021005,
		
		/* @brief Framebuffer bit depth hint. */
		GLFW_STENCIL_BITS = 0x00021006,
		
		/* @brief Framebuffer bit depth hint. */
		GLFW_ACCUM_RED_BITS = 0x00021007,
		
		/* @brief Framebuffer bit depth hint. */
		GLFW_ACCUM_GREEN_BITS = 0x00021008,
		
		/* @brief Framebuffer bit depth hint. */
		GLFW_ACCUM_BLUE_BITS = 0x00021009,
		
		/* @brief Framebuffer bit depth hint. */
		GLFW_ACCUM_ALPHA_BITS = 0x0002100A,
		
		/* @brief Framebuffer auxiliary buffer hint. */
		GLFW_AUX_BUFFERS = 0x0002100B,
		
		/* @brief OpenGL stereoscopic rendering hint. */
		GLFW_STEREO = 0x0002100C,
		
		/* @brief Framebuffer MSAA samples hint. */
		GLFW_SAMPLES = 0x0002100D,
		
		/* @brief Framebuffer sRGB hint. */
		GLFW_SRGB_CAPABLE = 0x0002100E,

		/* @brief Framebuffer double buffering hint. */
		GLFW_DOUBLEBUFFER = 0x00021010,

		// Monitor related

		/* @brief Monitor refresh rate hint. */
		GLFW_REFRESH_RATE = 0x0002100F,

		// Context related
		
		/* @brief Context client API hint and attribute. */
		GLFW_CLIENT_API = 0x00022001,

		/* @brief Context creation API hint and attribute. */
		GLFW_CONTEXT_CREATION_API = 0x0002200B,

		/* @brief Context client API major version hint and attribute. */
		GLFW_CONTEXT_VERSION_MAJOR = 0x00022002,

		/* @brief Context client API minor version hint and attribute. */
		GLFW_CONTEXT_VERSION_MINOR = 0x00022003,
		
		/* @brief Context client API revision number hint and attribute. */
		GLFW_CONTEXT_REVISION = 0x00022004,

		/* @brief OpenGL forward-compatibility hint and attribute. */
		GLFW_OPENGL_FORWARD_COMPAT = 0x00022006,

		/* @brief Debug mode context hint and attribute. */
		GLFW_OPENGL_DEBUG_CONTEXT = 0x00022007,

		/* @brief OpenGL profile hint and attribute. */
		GLFW_OPENGL_PROFILE = 0x00022008,

		/* @brief Context robustness hint and attribute. */
		GLFW_CONTEXT_ROBUSTNESS = 0x00022005,

		/* @brief Context flush-on-release hint and attribute. */
		GLFW_CONTEXT_RELEASE_BEHAVIOR = 0x00022009,

		/* @brief Context error suppression hint and attribute. */
		GLFW_CONTEXT_NO_ERROR = 0x0002200A,

		// MacOS specific

		/* @brief macOS specific */
		GLFW_COCOA_RETINA_FRAMEBUFFER = 0x00023001,
		
		/* @brief macOS specific */
		GLFW_COCOA_FRAME_NAME = 0x00023002,

		/* @brief macOS specific */
		GLFW_COCOA_GRAPHICS_SWITCHING = 0x00023003,

		// X11 specific

		/* @brief X11 specific */
		GLFW_X11_CLASS_NAME = 0x00024001,
		/* @brief X11 specific */
		GLFW_X11_INSTANCE_NAME = 0x00024002,
	}


}