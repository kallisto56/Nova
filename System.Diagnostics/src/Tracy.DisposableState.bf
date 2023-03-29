namespace System.Diagnostics;


extension Tracy
{
	class DisposableState : IDisposable
	{
		ConsoleColor foreground, background;
	
	
		public DisposableState SetColors (ConsoleColor f, ConsoleColor b)
		{
			background = Console.BackgroundColor;
			foreground = Console.ForegroundColor;
	
			Console.ForegroundColor = f;
			Console.BackgroundColor = b;
	
			return this;
		}
	
	
		public void Dispose ()
		{
			Console.ForegroundColor = foreground;
			Console.BackgroundColor = background;
		}
	
	
	}
}