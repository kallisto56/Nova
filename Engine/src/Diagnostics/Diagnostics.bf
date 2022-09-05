namespace Engine
{
	using System;
	using System.Diagnostics;
	using System.IO;
	using System.Collections;

	using OpenGL;



	public static
	{
		public static DisposableState console = new . () ~ delete _;
		public class DisposableState : IDisposable
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

		[Inline]
		public static void Log (StringView format, params Object[] args)
		{
			using (console.SetColors(.Gray, .Black))
			{
				Console.Write(format, params args);
			}
		}

		[Inline]
		public static void Log (StringView message)
		{
			using (console.SetColors(.Gray, .Black))
			{
				Console.Write(message);
			}
		}

		[Inline]
		public static void LogLine (StringView format, params Object[] args)
		{
			using (console.SetColors(.Gray, .Black))
			{
				Console.WriteLine(format, params args);
			}
		}

		[Inline]
		public static void LogLine (StringView message)
		{
			using (console.SetColors(.Gray, .Black))
			{
				Console.WriteLine(message);
			}
		}


		[Inline]
		public static void Warning (StringView format, params Object[] args)
		{
			using (console.SetColors(.Black, .Yellow))
			{
				Console.WriteLine(format, params args);
			}
		}

		[Inline]
		public static void Warning (StringView message)
		{
			using (console.SetColors(.Black, .Yellow))
			{
				Console.WriteLine(message);
			}
		}

		[Inline]
		public static void AssertWarning (bool condition, StringView message)
		{
			if (condition == false) return;
			using (console.SetColors(.Black, .Yellow))
			{
				Console.WriteLine(message);
			}
		}


		[Inline]
		public static void Error (StringView format, params Object[] args)
		{
			using (console.SetColors(.Black, .Red))
			{
				Console.WriteLine(format, params args);
				Debug.Break();
			}
		}

		[Inline]
		public static void Error (StringView message)
		{
			using (console.SetColors(.Black, .Red))
			{
				Console.WriteLine(message);
				Debug.Break();
			}
		}


		[Inline]
		public static int Terminate (StringView format, params Object[] args)
		{
			using (console.SetColors(.Black, .Red))
			{
				Console.WriteLine(format, params args);
				Debug.Break();
				return -1;
			}
		}

		[Inline]
		public static int Terminate (StringView message)
		{
			using (console.SetColors(.Black, .Red))
			{
				Console.WriteLine(message);
				Debug.Break();
				return -1;
			}
		}


		public static void LogCreatingInstance (Type instance, Type baseType = null)
		{
			String instanceName = scope String();
			String baseName = scope String();

			instance.GetFullName(instanceName);
			baseType.GetFullName(baseName);

			if (instanceName != baseName)
			{
				LogLine("Creating instance of {0} : {1}", instanceName, baseName);
			}
			else
			{
				LogLine("Creating instance of {0}", instanceName);
			}
		}


	}
}