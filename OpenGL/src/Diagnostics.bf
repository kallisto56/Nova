namespace OpenGL
{
	using System;



	public static class GlDebug
	{



		public static bool Assert (/*String callerFileName, String callerMemberName, int callerLineNum*/)
		{
			var response = Gl.GetError();

			switch (response)
			{
			// No error has been recorded. The value of this symbolic constant
			// is guaranteed to be 0.
			case GL_NO_ERROR:
				return false;

			// An unacceptable value is specified for an enumerated argument.
			// The offending command is ignored and has no other side effect
			// than to set the error flag.
			case GL_INVALID_ENUM:
				Console.WriteLine("GL_ERROR: GL_INVALID_ENUM");
				Console.Read();
				return true;

			// A numeric argument is out of range. The offending command is
			// ignored and has no other side effect than to set the error flag.
			case GL_INVALID_VALUE:
				Console.WriteLine("GL_ERROR: GL_INVALID_VALUE");
				Console.Read();
				return true;

			// The specified operation is not allowed in the current state.
			// The offending command is ignored and has no other side effect
			// than to set the error flag.
			case GL_INVALID_OPERATION:
				Console.WriteLine("GL_ERROR: GL_INVALID_OPERATION");
				Console.Read();
				return true;

			// This command would cause a stack overflow. The offending command
			// is ignored and has no other side effect than to set the error flag.
			case GL_STACK_OVERFLOW:
				Console.WriteLine("GL_ERROR: GL_STACK_OVERFLOW");
				Console.Read();
				return true;

			// This command would cause a stack underflow. The offending command
			// is ignored and has no other side effect than to set the error flag.
			case GL_STACK_UNDERFLOW:
				Console.WriteLine("GL_ERROR: GL_STACK_UNDERFLOW");
				Console.Read();
				return true;

			// There is not enough memory left to execute the command.
			// The state of the GL is undefined, except for the state of the
			// error flags, after this error is recorded.
			case GL_OUT_OF_MEMORY:
				Console.WriteLine("GL_ERROR: GL_OUT_OF_MEMORY");
				Console.Read();
				return true;

			// ...
			default:
				Console.WriteLine("GL_ERROR: Unknown Error Enum");
				Console.Read();
				return true;	
			}
		}


		public static Result<void> HasErrors (/*String callerFileName, String callerMemberName, int callerLineNum*/)
		{
			var response = Gl.GetError();

			switch (response)
			{
			// No error has been recorded. The value of this symbolic constant
			// is guaranteed to be 0.
			case GL_NO_ERROR:
				return .Ok;

			// An unacceptable value is specified for an enumerated argument.
			// The offending command is ignored and has no other side effect
			// than to set the error flag.
			case GL_INVALID_ENUM:
				Console.WriteLine("GL_ERROR: GL_INVALID_ENUM");
				return .Err;

			// A numeric argument is out of range. The offending command is
			// ignored and has no other side effect than to set the error flag.
			case GL_INVALID_VALUE:
				Console.WriteLine("GL_ERROR: GL_INVALID_VALUE");
				return .Err;

			// The specified operation is not allowed in the current state.
			// The offending command is ignored and has no other side effect
			// than to set the error flag.
			case GL_INVALID_OPERATION:
				Console.WriteLine("GL_ERROR: GL_INVALID_OPERATION");
				return .Err;

			// This command would cause a stack overflow. The offending command
			// is ignored and has no other side effect than to set the error flag.
			case GL_STACK_OVERFLOW:
				Console.WriteLine("GL_ERROR: GL_STACK_OVERFLOW");
				return .Err;

			// This command would cause a stack underflow. The offending command
			// is ignored and has no other side effect than to set the error flag.
			case GL_STACK_UNDERFLOW:
				Console.WriteLine("GL_ERROR: GL_STACK_UNDERFLOW");
				return .Err;

			// There is not enough memory left to execute the command.
			// The state of the GL is undefined, except for the state of the
			// error flags, after this error is recorded.
			case GL_OUT_OF_MEMORY:
				Console.WriteLine("GL_ERROR: GL_OUT_OF_MEMORY");
				return .Err;

			// ...
			default:
				Console.WriteLine("GL_ERROR: Unknown Error Enum");
				return .Err;
			}
		}



	}



}