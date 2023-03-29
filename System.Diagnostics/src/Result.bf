namespace System;


using System.Diagnostics;


extension Result<T, TErr> where TErr : Error
{


	public mixin Resolve ()
	{
		if (this case .Err(Error e))
		{
			String fileName = Compiler.CallerFilePath;
			String memberName = Compiler.CallerMemberName;
			int lineNumber = Compiler.CallerLineNum;
			return .Err(new Error(e, fileName, memberName, lineNumber));
		}

		this.Value
	}


	public mixin Assert ()
	{
		if (this case .Err(Error underlyingError))
		{
			String fileName = Compiler.CallerFilePath;
			String memberName = Compiler.CallerMemberName;
			int lineNumber = Compiler.CallerLineNum;

			Error error = new Error(underlyingError, fileName, memberName, lineNumber);
			Tracy.Report(error);
		}
	}

	
}