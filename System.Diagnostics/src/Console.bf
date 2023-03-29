namespace System;


extension Console
{
	public static void MaximizeConsoleWindow ()
	{
		Windows.HWnd console = GetConsoleWindow();

		int SW_SHOWMAXIMIZED = 3;
		ShowWindow(console, SW_SHOWMAXIMIZED);
	}

	[Import("Kernel32.Lib"), CLink, CallingConvention(.Stdcall)]
	public static extern Windows.HWnd GetConsoleWindow ();

	[Import("User32.Lib"), CLink, CallingConvention(.Stdcall)]
	public static extern int MoveWindow (Windows.HWnd hWnd, int X, int Y, int nWidth, int nHeight, int bRepaint);

	[Import("User32.Lib"), CLink, CallingConvention(.Stdcall)]
	public static extern int ShowWindow(Windows.HWnd hWnd, int nCmdShow);
}