namespace API.Glfw;


using System;
using System.Diagnostics;

using API.Vulkan;


public static class Glfw
{
	/*! @brief Client API function pointer type. */
	typealias glProcAddress = void*;

	/*! @brief Vulkan API function pointer type. */
	typealias vkProcAddress = void*;


	/*! @brief Sets the error callback. */
	public function void ErrorCallback (int errorCode, char8* description);

	/*! @brief The function pointer type for window position callbacks. */
	public function void WindowPositionCallback (WindowHandle* handle, int32 x, int32 y);

	/*! @brief The function pointer type for window size callbacks. */
	public function void WindowSizeCallback (WindowHandle* handle, int32 width, int32 height);

	/*! @brief The function pointer type for window close callbacks */
	public function void WindowCloseCallback (WindowHandle* handle);

	/*! @brief The function pointer type for window content refresh callbacks. */
	public function void WindowRefreshCallback (WindowHandle* handle);

	/*! @brief The function pointer type for window focus callbacks. */
	public function void WindowFocusCallback (WindowHandle* handle, Glfw.Boolean focused);

	/*! @brief The function pointer type for window iconify callbacks. */
	public function void WindowIconifyCallback (WindowHandle* handle, Glfw.Boolean iconified);

	/*! @brief The function pointer type for window maximize callbacks. */
	public function void WindowMaximizeCallback (WindowHandle* handle, Glfw.Boolean maximized);

	/*! @brief The function pointer type for framebuffer size callbacks. */
	public function void WindowFramebufferSizeCallback (WindowHandle* handle, int32 width, int32 height);

	/*! @brief The function pointer type for window content scale callbacks. */
	public function void WindowContentScaleCallback (WindowHandle* handle, int32 xScale, int32 yScale);

	/*! @brief The function pointer type for mouse button callbacks. */
	public function void MouseButtonCallback (WindowHandle* handle, MouseButton button, KeyAction action, int32 mods);

	/*! @brief The function pointer type for cursor position callbacks. */
	public function void CursorPositionCallback (WindowHandle* handle, double xpos, double ypos);

	/*! @brief The function pointer type for cursor enter/leave callbacks. */
	public function void CursorEnterCallback (WindowHandle* handle, Glfw.Boolean entered);

	/*! @brief The function pointer type for scroll callbacks. */
	public function void MouseScrollCallback (WindowHandle* handle, double xoffset, double yoffset);

	/*! @brief The function pointer type for keyboard key callbacks. */
	public function void KeyboardCallback (WindowHandle* handle, KeyCode keyCode, int32 scancode, KeyAction action, int32 mods);

	/*! @brief The function pointer type for Unicode character callbacks. */
	public function void UnicodeCharacterCallback (WindowHandle* handle, uint32 codepoint);

	/*! @brief The function pointer type for Unicode character with modifiers */
	public function void UnicodeCharacterCallbackWithMods (WindowHandle* handle, uint32 codepoint, uint32 mods);

	/*! @brief The function pointer type for path drop callbacks. */
	public function void PathDropCallback (WindowHandle* handle, int32 path_count, char8** paths);

	/*! @brief The function pointer type for monitor configuration callbacks. */
	public function void MonitorCallback (MonitorHandle* handle, int32 event);

	/*! @brief The function pointer type for joystick configuration callbacks. */
	public function void JoystickCallback (int joystickID, int32 event);

		
		
	[LinkName("glfwInit"), CallingConvention(.Cdecl)]
	/*! @brief Initializes the GLFW library. */
	public static extern Glfw.Boolean Initialize();

	[LinkName("glfwTerminate"), CallingConvention(.Cdecl)]
	/*! @brief Terminates the GLFW library. */
	public static extern void Terminate();

	[LinkName("glfwInitHint"), CallingConvention(.Cdecl)]
	/*! @brief Sets the specified init hint to the desired value. */
	public static extern void InitHint(InitializationHint hint, Glfw.Boolean value);

	[LinkName("glfwGetVersion"), CallingConvention(.Cdecl)]
	/*! @brief Retrieves the version of the GLFW library. */
	public static extern void GetVersion(int* major, int* minor, int* rev);

	[LinkName("glfwGetVersionString"), CallingConvention(.Cdecl)]
	/*! @brief Returns a string describing the compile-time configuration. */
	public static extern char8* GetVersionString();

	[LinkName("glfwGetError"), CallingConvention(.Cdecl)]
	/*! @brief Returns and clears the last error for the calling thread. */
	public static extern int GetError(char8** description);

	[LinkName("glfwSetErrorCallback"), CallingConvention(.Cdecl)]
	/*! @brief Sets the error callback. */
	public static extern ErrorCallback SetErrorCallback(ErrorCallback callback);

	[LinkName("glfwGetMonitors"), CallingConvention(.Cdecl)]
	/*! @brief Returns the currently connected monitors. */
	public static extern MonitorHandle** GetMonitors(int* count);

	[LinkName("glfwGetPrimaryMonitor"), CallingConvention(.Cdecl)]
	/*! @brief Returns the primary monitor. */
	public static extern MonitorHandle* GetPrimaryMonitor();

	[LinkName("glfwGetMonitorPos"), CallingConvention(.Cdecl)]
	/*! @brief Returns the position of the monitor's viewport on the virtual screen. */
	public static extern void GetMonitorPos(MonitorHandle* monitor, int* xpos, int* ypos);

	[LinkName("glfwGetMonitorWorkarea"), CallingConvention(.Cdecl)]
	/*! @brief Retrieves the work area of the monitor. */
	public static extern void GetMonitorWorkarea(MonitorHandle* monitor, int32* xpos, int32* ypos, int32* width, int32* height);

	[LinkName("glfwGetMonitorPhysicalSize"), CallingConvention(.Cdecl)]
	/*! @brief Returns the physical size of the monitor. */
	public static extern void GetMonitorPhysicalSize(MonitorHandle* monitor, int* widthMM, int* heightMM);

	[LinkName("glfwGetMonitorContentScale"), CallingConvention(.Cdecl)]
	/*! @brief Retrieves the content scale for the specified monitor. */
	public static extern void GetMonitorContentScale(MonitorHandle* monitor, float* xscale, float* yscale);

	[LinkName("glfwGetMonitorName"), CallingConvention(.Cdecl)]
	/*! @brief Returns the name of the specified monitor. */
	public static extern char8* GetMonitorName(MonitorHandle* monitor);

	[LinkName("glfwSetMonitorUserPointer"), CallingConvention(.Cdecl)]
	/*! @brief Sets the user pointer of the specified monitor. */
	public static extern void SetMonitorUserPointer(MonitorHandle* monitor, void* pointer);

	[LinkName("glfwGetMonitorUserPointer"), CallingConvention(.Cdecl)]
	/*! @brief Returns the user pointer of the specified monitor. */
	public static extern void* GetMonitorUserPointer(MonitorHandle* monitor);

	[LinkName("glfwSetMonitorCallback"), CallingConvention(.Cdecl)]
	/*! @brief Sets the monitor configuration callback. */
	public static extern MonitorCallback SetMonitorCallback(MonitorCallback callback);

	[LinkName("glfwGetVideoModes"), CallingConvention(.Cdecl)]
	/*! @brief Returns the available video modes for the specified monitor. */
	public static extern VideoMode* GetVideoModes(MonitorHandle* monitor, int* count);

	[LinkName("glfwGetVideoMode"), CallingConvention(.Cdecl)]
	/*! @brief Returns the current mode of the specified monitor. */
	public static extern VideoMode* GetVideoMode(MonitorHandle* monitor);

	[LinkName("glfwSetGamma"), CallingConvention(.Cdecl)]
	/*! @brief Generates a gamma ramp and sets it for the specified monitor. */
	public static extern void SetGamma(MonitorHandle* monitor, float gamma);

	[LinkName("glfwGetGammaRamp"), CallingConvention(.Cdecl)]
	/*! @brief Returns the current gamma ramp for the specified monitor. */
	public static extern GammaRamp* GetGammaRamp(MonitorHandle* monitor);

	[LinkName("glfwSetGammaRamp"), CallingConvention(.Cdecl)]
	/*! @brief Sets the current gamma ramp for the specified monitor. */
	public static extern void SetGammaRamp(MonitorHandle* monitor, GammaRamp* ramp);

	[LinkName("glfwDefaultWindowHints"), CallingConvention(.Cdecl)]
	/*! @brief Resets all window hints to their default values. */
	public static extern void DefaultWindowHints();

	[LinkName("glfwWindowHint"), CallingConvention(.Cdecl)]
	/*! @brief Sets the specified window hint to the desired value. */
	public static extern void WindowHint(WindowHint hint, WindowAttribute value);

	[LinkName("glfwWindowHintString"), CallingConvention(.Cdecl)]
	/*! @brief Sets the specified window hint to the desired value. */
	public static extern void WindowHintString(int hint, char8* value);

	[LinkName("glfwCreateWindow"), CallingConvention(.Cdecl)]
	/*! @brief Creates a window and its associated context. */
	public static extern WindowHandle* CreateWindow(int width, int height, char8* title, MonitorHandle* monitor, WindowHandle* share);

	[LinkName("glfwDestroyWindow"), CallingConvention(.Cdecl)]
	/*! @brief Destroys the specified window and its context. */
	public static extern void DestroyWindow(WindowHandle* window);

	[LinkName("glfwWindowShouldClose"), CallingConvention(.Cdecl)]
	/*! @brief Checks the close flag of the specified window. */
	public static extern Glfw.Boolean WindowShouldClose(WindowHandle* window);

	[LinkName("glfwSetWindowShouldClose"), CallingConvention(.Cdecl)]
	/*! @brief Sets the close flag of the specified window. */
	public static extern void SetWindowShouldClose(WindowHandle* window, int value);

	[LinkName("glfwSetWindowTitle"), CallingConvention(.Cdecl)]
	/*! @brief Sets the title of the specified window. */
	public static extern void SetWindowTitle(WindowHandle* window, char8* title);

	[LinkName("glfwSetWindowIcon"), CallingConvention(.Cdecl)]
	/*! @brief Sets the icon for the specified window. */
	public static extern void SetWindowIcon(WindowHandle* window, int count, NativeImage* images);

	[LinkName("glfwGetWindowPos"), CallingConvention(.Cdecl)]
	/*! @brief Retrieves the position of the content area of the specified window. */
	public static extern void GetWindowPos(WindowHandle* window, int* xpos, int* ypos);

	[LinkName("glfwSetWindowPos"), CallingConvention(.Cdecl)]
	/*! @brief Sets the position of the content area of the specified window. */
	public static extern void SetWindowPos(WindowHandle* window, int xpos, int ypos);

	[LinkName("glfwGetWindowSize"), CallingConvention(.Cdecl)]
	/*! @brief Retrieves the size of the content area of the specified window. */
	public static extern void GetWindowSize(WindowHandle* window, int32* width, int32* height);

	[LinkName("glfwSetWindowSizeLimits"), CallingConvention(.Cdecl)]
	/*! @brief Sets the size limits of the specified window. */
	public static extern void SetWindowSizeLimits(WindowHandle* window, int minwidth, int minheight, int maxwidth, int maxheight);

	[LinkName("glfwSetWindowAspectRatio"), CallingConvention(.Cdecl)]
	/*! @brief Sets the aspect ratio of the specified window. */
	public static extern void SetWindowAspectRatio(WindowHandle* window, int numer, int denom);

	[LinkName("glfwSetWindowSize"), CallingConvention(.Cdecl)]
	/*! @brief Sets the size of the content area of the specified window. */
	public static extern void SetWindowSize(WindowHandle* window, int width, int height);

	[LinkName("glfwGetFramebufferSize"), CallingConvention(.Cdecl)]
	/*! @brief Retrieves the size of the framebuffer of the specified window. */
	public static extern void GetFramebufferSize(WindowHandle* window, int32* width, int32* height);

	[LinkName("glfwGetWindowFrameSize"), CallingConvention(.Cdecl)]
	/*! @brief Retrieves the size of the frame of the window. */
	public static extern void GetWindowFrameSize(WindowHandle* window, int32* left, int32* top, int32* right, int32* bottom);

	[LinkName("glfwGetWindowContentScale"), CallingConvention(.Cdecl)]
	/*! @brief Retrieves the content scale for the specified window. */
	public static extern void GetWindowContentScale(WindowHandle* window, float* xscale, float* yscale);

	[LinkName("glfwGetWindowOpacity"), CallingConvention(.Cdecl)]
	/*! @brief Returns the opacity of the whole window. */
	public static extern float GetWindowOpacity(WindowHandle* window);

	[LinkName("glfwSetWindowOpacity"), CallingConvention(.Cdecl)]
	/*! @brief Sets the opacity of the whole window. */
	public static extern void SetWindowOpacity(WindowHandle* window, float opacity);

	[LinkName("glfwIconifyWindow"), CallingConvention(.Cdecl)]
	/*! @brief Iconifies the specified window. */
	public static extern void IconifyWindow(WindowHandle* window);

	[LinkName("glfwRestoreWindow"), CallingConvention(.Cdecl)]
	/*! @brief Restores the specified window. */
	public static extern void RestoreWindow(WindowHandle* window);

	[LinkName("glfwMaximizeWindow"), CallingConvention(.Cdecl)]
	/*! @brief Maximizes the specified window. */
	public static extern void MaximizeWindow(WindowHandle* window);

	[LinkName("glfwShowWindow"), CallingConvention(.Cdecl)]
	/*! @brief Makes the specified window visible. */
	public static extern void ShowWindow(WindowHandle* window);

	[LinkName("glfwHideWindow"), CallingConvention(.Cdecl)]
	/*! @brief Hides the specified window. */
	public static extern void HideWindow(WindowHandle* window);

	[LinkName("glfwFocusWindow"), CallingConvention(.Cdecl)]
	/*! @brief Brings the specified window to front and sets input focus. */
	public static extern void FocusWindow(WindowHandle* window);

	[LinkName("glfwRequestWindowAttention"), CallingConvention(.Cdecl)]
	/*! @brief Requests user attention to the specified window. */
	public static extern void RequestWindowAttention(WindowHandle* window);

	[LinkName("glfwGetWindowMonitor"), CallingConvention(.Cdecl)]
	/*! @brief Returns the monitor that the window uses for full screen mode. */
	public static extern MonitorHandle* GetWindowMonitor(WindowHandle* window);

	[LinkName("glfwSetWindowMonitor"), CallingConvention(.Cdecl)]
	/*! @brief Sets the mode, monitor, video mode and placement of a window. */
	public static extern void SetWindowMonitor(WindowHandle* window, MonitorHandle* monitor, int xpos, int ypos, int width, int height, int refreshRate);

	[LinkName("glfwGetWindowAttrib"), CallingConvention(.Cdecl)]
	/*! @brief Returns an attribute of the specified window. */
	public static extern int GetWindowAttrib(WindowHandle* window, int attrib);

	[LinkName("glfwSetWindowAttrib"), CallingConvention(.Cdecl)]
	/*! @brief Sets an attribute of the specified window. */
	public static extern void SetWindowAttrib(WindowHandle* window, WindowAttribute attrib, Glfw.Boolean value);

	[LinkName("glfwSetWindowUserPointer"), CallingConvention(.Cdecl)]
	/*! @brief Sets the user pointer of the specified window. */
	public static extern void SetWindowUserPointer(WindowHandle* window, void* pointer);

	[LinkName("glfwGetWindowUserPointer"), CallingConvention(.Cdecl)]
	/*! @brief Returns the user pointer of the specified window. */
	public static extern void* GetWindowUserPointer(WindowHandle* window);

	[LinkName("glfwSetWindowPosCallback"), CallingConvention(.Cdecl)]
	/*! @brief Sets the position callback for the specified window. */
	public static extern WindowPositionCallback SetWindowPosCallback(WindowHandle* window, WindowPositionCallback callback);

	[LinkName("glfwSetWindowSizeCallback"), CallingConvention(.Cdecl)]
	/*! @brief Sets the size callback for the specified window. */
	public static extern WindowSizeCallback SetWindowSizeCallback(WindowHandle* window, WindowSizeCallback callback);

	[LinkName("glfwSetWindowCloseCallback"), CallingConvention(.Cdecl)]
	/*! @brief Sets the close callback for the specified window. */
	public static extern WindowCloseCallback SetWindowCloseCallback(WindowHandle* window, WindowCloseCallback callback);

	[LinkName("glfwSetWindowRefreshCallback"), CallingConvention(.Cdecl)]
	/*! @brief Sets the refresh callback for the specified window. */
	public static extern WindowRefreshCallback SetWindowRefreshCallback(WindowHandle* window, WindowRefreshCallback callback);

	[LinkName("glfwSetWindowFocusCallback"), CallingConvention(.Cdecl)]
	/*! @brief Sets the focus callback for the specified window. */
	public static extern WindowFocusCallback SetWindowFocusCallback(WindowHandle* window, WindowFocusCallback callback);

	[LinkName("glfwSetWindowIconifyCallback"), CallingConvention(.Cdecl)]
	/*! @brief Sets the iconify callback for the specified window. */
	public static extern WindowIconifyCallback SetWindowIconifyCallback(WindowHandle* window, WindowIconifyCallback callback);

	[LinkName("glfwSetWindowMaximizeCallback"), CallingConvention(.Cdecl)]
	/*! @brief Sets the maximize callback for the specified window. */
	public static extern WindowMaximizeCallback SetWindowMaximizeCallback(WindowHandle* window, WindowMaximizeCallback callback);

	[LinkName("glfwSetFramebufferSizeCallback"), CallingConvention(.Cdecl)]
	/*! @brief Sets the framebuffer resize callback for the specified window. */
	public static extern WindowFramebufferSizeCallback SetFramebufferSizeCallback(WindowHandle* window, WindowFramebufferSizeCallback callback);

	[LinkName("glfwSetWindowContentScaleCallback"), CallingConvention(.Cdecl)]
	/*! @brief Sets the window content scale callback for the specified window. */
	public static extern WindowContentScaleCallback SetWindowContentScaleCallback(WindowHandle* window, WindowContentScaleCallback callback);

	[LinkName("glfwPollEvents"), CallingConvention(.Cdecl)]
	/*! @brief Processes all pending events. */
	public static extern void PollEvents();

	[LinkName("glfwWaitEvents"), CallingConvention(.Cdecl)]
	/*! @brief Waits until events are queued and processes them. */
	public static extern void WaitEvents();

	[LinkName("glfwWaitEventsTimeout"), CallingConvention(.Cdecl)]
	/*! @brief Waits with timeout until events are queued and processes them. */
	public static extern void WaitEventsTimeout(double timeout);

	[LinkName("glfwPostEmptyEvent"), CallingConvention(.Cdecl)]
	/*! @brief Posts an empty event to the event queue. */
	public static extern void PostEmptyEvent();

	[LinkName("glfwGetInputMode"), CallingConvention(.Cdecl)]
	/*! @brief Returns the value of an input option for the specified window. */
	public static extern InputMode GetInputMode (WindowHandle* window, InputMode mode);

	[LinkName("glfwSetInputMode"), CallingConvention(.Cdecl)]
	/*! @brief Sets an input option for the specified window. */
	public static extern void SetInputMode(WindowHandle* window, InputMode mode, CursorInputMode value);

	[LinkName("glfwRawMouseMotionSupported"), CallingConvention(.Cdecl)]
	/*! @brief Returns whether raw mouse motion is supported. */
	public static extern int RawMouseMotionSupported();

	[LinkName("glfwGetKeyName"), CallingConvention(.Cdecl)]
	/*! @brief Returns the layout-specific name of the specified printable key. */
	public static extern char8* GetKeyName(int key, int scancode);

	[LinkName("glfwGetKeyScancode"), CallingConvention(.Cdecl)]
	/*! @brief Returns the platform-specific scancode of the specified key. */
	public static extern int GetKeyScancode(int key);

	[LinkName("glfwGetKey"), CallingConvention(.Cdecl)]
	/*! @brief Returns the last reported state of a keyboard key for the specified */
	public static extern int GetKey(WindowHandle* window, int key);

	[LinkName("glfwGetMouseButton"), CallingConvention(.Cdecl)]
	/*! @brief Returns the last reported state of a mouse button for the specified */
	public static extern int GetMouseButton(WindowHandle* window, int button);

	[LinkName("glfwGetCursorPos"), CallingConvention(.Cdecl)]
	/*! @brief Retrieves the position of the cursor relative to the content area of */
	public static extern void GetCursorPos(WindowHandle* window, double* xpos, double* ypos);

	[LinkName("glfwSetCursorPos"), CallingConvention(.Cdecl)]
	/*! @brief Sets the position of the cursor, relative to the content area of the */
	public static extern void SetCursorPos(WindowHandle* window, double xpos, double ypos);

	[LinkName("glfwCreateCursor"), CallingConvention(.Cdecl)]
	/*! @brief Creates a custom cursor. */
	public static extern Cursor* CreateCursor(NativeImage* image, int xhot, int yhot);

	[LinkName("glfwCreateStandardCursor"), CallingConvention(.Cdecl)]
	/*! @brief Creates a cursor with a standard shape. */
	public static extern Cursor* CreateStandardCursor(int shape);

	[LinkName("glfwDestroyCursor"), CallingConvention(.Cdecl)]
	/*! @brief Destroys a cursor. */
	public static extern void DestroyCursor(Cursor* cursor);

	[LinkName("glfwSetCursor"), CallingConvention(.Cdecl)]
	/*! @brief Sets the cursor for the window. */
	public static extern void SetCursor(WindowHandle* window, Cursor* cursor);

	[LinkName("glfwSetKeyCallback"), CallingConvention(.Cdecl)]
	/*! @brief Sets the key callback. */
	public static extern KeyboardCallback SetKeyCallback(WindowHandle* window, KeyboardCallback callback);

	[LinkName("glfwSetCharCallback"), CallingConvention(.Cdecl)]
	/*! @brief Sets the Unicode character callback. */
	public static extern UnicodeCharacterCallback SetCharCallback(WindowHandle* window, UnicodeCharacterCallback callback);

	[LinkName("glfwSetCharModsCallback"), CallingConvention(.Cdecl)]
	/*! @brief Sets the Unicode character with modifiers callback. */
	public static extern UnicodeCharacterCallbackWithMods  SetCharModsCallback(WindowHandle* window, UnicodeCharacterCallbackWithMods  callback);

	[LinkName("glfwSetMouseButtonCallback"), CallingConvention(.Cdecl)]
	/*! @brief Sets the mouse button callback. */
	public static extern MouseButtonCallback SetMouseButtonCallback(WindowHandle* window, MouseButtonCallback callback);

	[LinkName("glfwSetCursorPosCallback"), CallingConvention(.Cdecl)]
	/*! @brief Sets the cursor position callback. */
	public static extern CursorPositionCallback SetCursorPosCallback(WindowHandle* window, CursorPositionCallback callback);

	[LinkName("glfwSetCursorEnterCallback"), CallingConvention(.Cdecl)]
	/*! @brief Sets the cursor enter/leave callback. */
	public static extern CursorEnterCallback SetCursorEnterCallback(WindowHandle* window, CursorEnterCallback callback);

	[LinkName("glfwSetScrollCallback"), CallingConvention(.Cdecl)]
	/*! @brief Sets the scroll callback. */
	public static extern MouseScrollCallback SetScrollCallback(WindowHandle* window, MouseScrollCallback callback);

	[LinkName("glfwSetDropCallback"), CallingConvention(.Cdecl)]
	/*! @brief Sets the path drop callback. */
	public static extern PathDropCallback SetDropCallback(WindowHandle* window, PathDropCallback callback);

	[LinkName("glfwJoystickPresent"), CallingConvention(.Cdecl)]
	/*! @brief Returns whether the specified joystick is present. */
	public static extern int JoystickPresent(int jid);

	[LinkName("glfwGetJoystickAxes"), CallingConvention(.Cdecl)]
	/*! @brief Returns the values of all axes of the specified joystick. */
	public static extern float* GetJoystickAxes(int jid, int* count);

	[LinkName("glfwGetJoystickButtons"), CallingConvention(.Cdecl)]
	/*! @brief Returns the state of all buttons of the specified joystick. */
	public static extern uint8* GetJoystickButtons(int jid, int* count);

	[LinkName("glfwGetJoystickHats"), CallingConvention(.Cdecl)]
	/*! @brief Returns the state of all hats of the specified joystick. */
	public static extern uint8* GetJoystickHats(int jid, int* count);

	[LinkName("glfwGetJoystickName"), CallingConvention(.Cdecl)]
	/*! @brief Returns the name of the specified joystick. */
	public static extern char8* GetJoystickName(int jid);

	[LinkName("glfwGetJoystickGUID"), CallingConvention(.Cdecl)]
	/*! @brief Returns the SDL compatible GUID of the specified joystick. */
	public static extern char8* GetJoystickGUID(int jid);

	[LinkName("glfwSetJoystickUserPointer"), CallingConvention(.Cdecl)]
	/*! @brief Sets the user pointer of the specified joystick. */
	public static extern void SetJoystickUserPointer(int jid, void* pointer);

	[LinkName("glfwGetJoystickUserPointer"), CallingConvention(.Cdecl)]
	/*! @brief Returns the user pointer of the specified joystick. */
	public static extern void* GetJoystickUserPointer(int jid);

	[LinkName("glfwJoystickIsGamepad"), CallingConvention(.Cdecl)]
	/*! @brief Returns whether the specified joystick has a gamepad mapping. */
	public static extern int JoystickIsGamepad(int jid);

	[LinkName("glfwSetJoystickCallback"), CallingConvention(.Cdecl)]
	/*! @brief Sets the joystick configuration callback. */
	public static extern JoystickCallback SetJoystickCallback(JoystickCallback callback);

	[LinkName("glfwUpdateGamepadMappings"), CallingConvention(.Cdecl)]
	/*! @brief Adds the specified SDL_GameControllerDB gamepad mappings. */
	public static extern int UpdateGamepadMappings(char8* string);

	[LinkName("glfwGetGamepadName"), CallingConvention(.Cdecl)]
	/*! @brief Returns the human-readable gamepad name for the specified joystick. */
	public static extern char8* GetGamepadName(int jid);

	[LinkName("glfwGetGamepadState"), CallingConvention(.Cdecl)]
	/*! @brief Retrieves the state of the specified joystick remapped as a gamepad. */
	public static extern int GetGamepadState(int jid, GamepadState* state);

	[LinkName("glfwSetClipboardString"), CallingConvention(.Cdecl)]
	/*! @brief Sets the clipboard to the specified string. */
	public static extern void SetClipboardString(WindowHandle* window, char8* string);

	[LinkName("glfwGetClipboardString"), CallingConvention(.Cdecl)]
	/*! @brief Returns the contents of the clipboard as a string. */
	public static extern char8* GetClipboardString(WindowHandle* window);

	[LinkName("glfwGetTime"), CallingConvention(.Cdecl)]
	/*! @brief Returns the GLFW time. */
	public static extern double GetTime();

	[LinkName("glfwSetTime"), CallingConvention(.Cdecl)]
	/*! @brief Sets the GLFW time. */
	public static extern void SetTime(double time);

	[LinkName("glfwGetTimerValue"), CallingConvention(.Cdecl)]
	/*! @brief Returns the current value of the raw timer. */
	public static extern uint64 GetTimerValue();

	[LinkName("glfwGetTimerFrequency"), CallingConvention(.Cdecl)]
	/*! @brief Returns the frequency, in Hz, of the raw timer. */
	public static extern uint64 GetTimerFrequency();

	[LinkName("glfwMakeContextCurrent"), CallingConvention(.Cdecl)]
	/*! @brief Makes the context of the specified window current for the calling */
	public static extern void MakeContextCurrent(WindowHandle* window);

	[LinkName("glfwGetCurrentContext"), CallingConvention(.Cdecl)]
	/*! @brief Returns the window whose context is current on the calling thread. */
	public static extern WindowHandle* GetCurrentContext();

	[LinkName("glfwSwapBuffers"), CallingConvention(.Cdecl)]
	/*! @brief Swaps the front and back buffers of the specified window. */
	public static extern void SwapBuffers(WindowHandle* window);

	[LinkName("glfwSwapInterval"), CallingConvention(.Cdecl)]
	/*! @brief Sets the swap interval for the current context. */
	public static extern void SwapInterval(int interval);

	[LinkName("glfwExtensionSupported"), CallingConvention(.Cdecl)]
	/*! @brief Returns whether the specified extension is available. */
	public static extern int ExtensionSupported(char8* extensionName);

	[LinkName("glfwGetProcAddress"), CallingConvention(.Cdecl)]
	/*! @brief Returns the address of the specified function for the current */
	public static extern glProcAddress GetProcAddress(char8* procname);

	[LinkName("glfwVulkanSupported"), CallingConvention(.Cdecl)]
	/*! @brief Returns whether the Vulkan loader and an ICD have been found. */
	public static extern int VulkanSupported();

	[LinkName("glfwGetRequiredInstanceExtensions"), CallingConvention(.Cdecl)]
	/*! @brief Returns the Vulkan instance extensions required by GLFW. */
	public static extern char8** GetRequiredInstanceExtensions(uint32* count);

	[LinkName("glfwGetInstanceProcAddress"), CallingConvention(.Cdecl)]
	/*! @brief Returns the address of the specified Vulkan instance function. */
	public static extern vkProcAddress GetInstanceProcAddress(VkInstance instance, char8* procname);

	[LinkName("glfwGetPhysicalDevicePresentationSupport"), CallingConvention(.Cdecl)]
	/*! @brief Returns whether the specified queue family can present images. */
	public static extern int GetPhysicalDevicePresentationSupport(VkInstance instance, VkPhysicalDevice device, uint32 queuefamily);

	[LinkName("glfwCreateWindowSurface"), CallingConvention(.Cdecl)]
	/*! @brief Creates a Vulkan surface for the specified window. */
	public static extern VkResult CreateWindowSurface(VkInstance instance, WindowHandle* window, VkAllocationCallbacks* allocator, VkSurfaceKHR* surface);

	// https://www.glfw.org/docs/latest/glfw3native_8h.html

	[LinkName("glfwGetWin32Adapter"), CallingConvention(.Cdecl)]
	/*! @brief Returns the adapter device name of the specified monitor. */
	static public extern char8* GetWin32Adapter (MonitorHandle* monitor);
	 
	[LinkName("glfwGetWin32Monitor"), CallingConvention(.Cdecl)]
	/*! @brief Returns the display device name of the specified monitor. */
	static public extern char8* GetWin32Monitor (MonitorHandle* monitor);
	 
	[LinkName("glfwGetWin32Window"), CallingConvention(.Cdecl)]
	/*! @brief Returns the HWND of the specified window. */
	static public extern Windows.HWnd GetWin32Window (WindowHandle* param);
	 
	[LinkName("glfwGetWGLContext"), CallingConvention(.Cdecl)]
	/*! @brief Returns the HGLRC of the specified window. */
	static public extern HGLRC GetWGLContext (WindowHandle* window);
	 
	[LinkName("glfwGetCocoaMonitor"), CallingConvention(.Cdecl)]
	/*! @brief Returns the CGDirectDisplayID of the specified monitor. */
	static public extern CGDirectDisplayID GetCocoaMonitor (MonitorHandle *monitor);
	 
	[LinkName("glfwGetCocoaWindow"), CallingConvention(.Cdecl)]
	/*! @brief Returns the NSWindow of the specified window. */
	static public extern NSWindow GetCocoaWindow (WindowHandle* window);
	 
	[LinkName("glfwGetNSGLContext"), CallingConvention(.Cdecl)]
	/*! @brief Returns the NSOpenGLContext of the specified window. */
	static public extern NSOpenGLContext GetNSGLContext (WindowHandle* window);
	 
	[LinkName("glfwGetX11Display"), CallingConvention(.Cdecl)]
	/*! @brief Returns the Display used by GLFW. */
	static public extern Display* GetX11Display ();
	 
	[LinkName("glfwGetX11Adapter"), CallingConvention(.Cdecl)]
	/*! @brief Returns the RRCrtc of the specified monitor. */
	static public extern RRCrtc GetX11Adapter (MonitorHandle* monitor);
	 
	[LinkName("glfwGetX11Monitor"), CallingConvention(.Cdecl)]
	/*! @brief Returns the RROutput of the specified monitor. */
	static public extern RROutput GetX11Monitor (MonitorHandle* monitor);
	 
	[LinkName("glfwGetX11Window"), CallingConvention(.Cdecl)]
	/*! @brief Returns the Window of the specified window. */
	static public extern X11Window GetX11Window (WindowHandle *window);
	 
	[LinkName("glfwSetX11SelectionString"), CallingConvention(.Cdecl)]
	/*! @brief Sets the current primary selection to the specified string. */
	static public extern void SetX11SelectionString (char8* string);
	 
	[LinkName("glfwGetX11SelectionString"), CallingConvention(.Cdecl)]
	/*! @brief Returns the contents of the current primary selection as a string. */
	static public extern char8* GetX11SelectionString ();
	 
	[LinkName("glfwGetGLXContext"), CallingConvention(.Cdecl)]
	/*! @brief Returns the GLXContext of the specified window. */
	static public extern GLXContext GetGLXContext (WindowHandle* window);
	 
	[LinkName("glfwGetGLXWindow"), CallingConvention(.Cdecl)]
	/*! @brief Returns the GLXWindow of the specified window. */
	static public extern GLXWindow GetGLXWindow (WindowHandle* window);
	 
	[LinkName("glfwGetWaylandDisplay"), CallingConvention(.Cdecl)]
	/*! @brief Returns the struct wl_display* used by GLFW. */
	static public extern wl_display* GetWaylandDisplay ();
	 
	[LinkName("glfwGetWaylandMonitor"), CallingConvention(.Cdecl)]
	/*! @brief Returns the struct wl_output* of the specified monitor. */
	static public extern wl_output* GetWaylandMonitor (MonitorHandle* monitor);
	 
	[LinkName("glfwGetWaylandWindow"), CallingConvention(.Cdecl)]
	/*! @brief Returns the main struct wl_surface* of the specified window. */
	static public extern wl_surface* GetWaylandWindow (WindowHandle*window);
	 	
	[LinkName("glfwGetEGLDisplay"), CallingConvention(.Cdecl)]
	/*! @brief Returns the EGLDisplay used by GLFW. */
	static public extern EGLDisplay GetEGLDisplay ();
	 
	[LinkName("glfwGetEGLContext"), CallingConvention(.Cdecl)]
	/*! @brief Returns the EGLContext of the specified window. */
	static public extern EGLContext GetEGLContext (WindowHandle* window);
	 
	[LinkName("glfwGetEGLSurface"), CallingConvention(.Cdecl)]
	/*! @brief Returns the EGLSurface of the specified window. */
	static public extern EGLSurface GetEGLSurface (WindowHandle* window);
	 
	[LinkName("glfwGetOSMesaColorBuffer"), CallingConvention(.Cdecl)]
	/*! @brief Retrieves the color buffer associated with the specified window. */
	static public extern int GetOSMesaColorBuffer (WindowHandle* window, int *width, int *height, int *format, void **buffer);
	 
	[LinkName("glfwGetOSMesaDepthBuffer"), CallingConvention(.Cdecl)]
	/*! @brief Retrieves the depth buffer associated with the specified window. */
	static public extern int GetOSMesaDepthBuffer (WindowHandle* window, int *width, int *height, int *bytesPerValue, void **buffer);
	 
	[LinkName("glfwGetOSMesaContext"), CallingConvention(.Cdecl)]
	/*! @brief Returns the OSMesaContext of the specified window. */
	static public extern OSMesaContext GetOSMesaContext (WindowHandle* window);
}