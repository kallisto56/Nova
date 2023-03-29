namespace System.Diagnostics;


using System;
using System.Collections;


static public class Tracy
{
	static DisposableState console = new . () ~ delete _;
	static String fatalErrorMessage = new String() ~ delete _;


	static public void Trace (String methodName = Compiler.CallerMemberName)
	{
		#if DEBUG
		Debug.WriteLine(methodName);
		using (Tracy.console.SetColors(.Gray, .Black))
			Console.WriteLine(methodName);
		#endif
	}


	static public void Write (String message)
	{
		#if DEBUG
		Debug.Write(message);
		using (Tracy.console.SetColors(.Gray, .Black))
		{
			Console.Write(message);
		}
		#endif
	}


	static public void Write (StringView format, params Object[] args)
	{
		#if DEBUG
		String message = new System.String();
		message.AppendF(format, params args);

		Debug.Write(message);
		using (Tracy.console.SetColors(.Gray, .Black))
		{
			Console.Write(message);
		}

		delete message;
		#endif
	}


	static public void Write (Object object)
	{
		#if DEBUG
		String message = new String(256);
		if (object == null)
		{
			message.Append("null");
		}
		else
		{
			object.ToString(message);
		}

		Debug.Write(message);
		using (Tracy.console.SetColors(.Gray, .Black))
		{
			Console.Write(message);
		}

		delete message;
		#endif
	}


	static public (ConsoleColor foreground, ConsoleColor background) DetermineColor (String message)
	{
		ConsoleColor background = .Black;
		ConsoleColor foreground = .Gray;

		if ((message.Length >= 6) && message.Substring(0, 6) == "ERROR:")
		{
			foreground = .Red;
		}

		if ((message.Length >= 8) && message.Substring(0, 8) == "WARNING:")
		{
			foreground = .Yellow;
		}

		return (foreground, background);
	}


	static public void WriteLine (String message)
	{
		#if DEBUG
		Debug.WriteLine(message);
		var colors = DetermineColor(message);
		using (Tracy.console.SetColors(colors.foreground, colors.background))
		{
			Console.WriteLine(message);
		}
		#endif
	}


	static public void Dump (IFormattable object)
	{
		#if DEBUG
		String buffer = scope String();
		object.ToString(buffer, null, null);
		Debug.WriteLine(buffer);
		var colors = DetermineColor(buffer);
		using (Tracy.console.SetColors(colors.foreground, colors.background))
		{
			Console.WriteLine(buffer);
		}
		#endif
	}


	static public void WriteLine (StringView format, params Object[] args)
	{
		#if DEBUG
		String message = new String();
		message.AppendF(format, params args);

		Debug.WriteLine(message);
		var colors = DetermineColor(message);
		using (Tracy.console.SetColors(colors.foreground, colors.background))
		{
			Console.WriteLine(message);
		}
		delete message;
		#endif
	}


	static public void WriteLine (Object object)
	{
		#if DEBUG
		String message = new String(256);
		if (object == null)
		{
			message.Append("null");
		}
		else
		{
			object.ToString(message);
		}

		Debug.WriteLine(message);
		var colors = DetermineColor(message);
		using (Tracy.console.SetColors(colors.foreground, colors.background))
		{
			Console.WriteLine(message);
		}
		delete message;
		#endif
	}


	static public void Report (Error e, bool isCritical = true)
	{
		#if DEBUG

		if (e == null)
		{
			using (Tracy.console.SetColors(.Red, .Black))
				Console.Write(" ERROR: ");

			using (Tracy.console.SetColors(.White, .Black))
				Console.WriteLine("NULL");

			return;
		}

		Debug.WriteLine("{0}", e);

		using (Tracy.console.SetColors(.Red, .Black))
			Console.Write(" ERROR: ");

		using (Tracy.console.SetColors(.White, .Black))
			Console.WriteLine(e.message);

		using (Tracy.console.SetColors(.Gray, .Black))
		{
			Console.WriteLine("METHOD: {0}", e.methodName);
			Console.WriteLine("  LINE: {0}", e.lineNumber);
			Console.WriteLine("  FILE: {0}\n", e.filePath);
		}
		
		if (isCritical == true)
			Debug.Break();

		#endif
	}


}