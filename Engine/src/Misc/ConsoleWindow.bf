namespace Engine.Misc
{
	using System;
	


	public static class ConsoleWindow
	{
		public static int2 ConsoleSize = int2(1280, 720);


		public static void SetupConsoleWindow (bool maximize = true)
		{
			let screen = int2(1440, 900);
			let x = screen.x / 2 - ConsoleSize.x / 2;
			let y = screen.y / 2 - ConsoleSize.y / 2;
			let console = GetConsoleWindow();

			if (maximize == true)
			{
				int SW_SHOWMAXIMIZED = 3;
				ShowWindow(console, SW_SHOWMAXIMIZED);
			}
			else
			{
				MoveWindow(console, -screen.x+x, y, ConsoleSize.x, ConsoleSize.y, 1);
			}
		}





		[Import("Kernel32.Lib"), CLink, CallingConvention(.Stdcall)]
		public static extern System.Windows.HWnd GetConsoleWindow ();

		[Import("User32.Lib"), CLink, CallingConvention(.Stdcall)]
		public static extern int MoveWindow (System.Windows.HWnd hWnd, int X, int Y, int nWidth, int nHeight, int bRepaint);

		[Import("User32.Lib"), CLink, CallingConvention(.Stdcall)]
		public static extern int ShowWindow(System.Windows.HWnd hWnd, int nCmdShow);
	}


}