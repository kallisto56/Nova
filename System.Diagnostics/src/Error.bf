namespace System.Diagnostics;


using System;
using System.Collections;


public class Error
{
	public Error underlyingError;
	public String message;
	public String filePath;
	public String methodName;
	public uint32 lineNumber;


	public this (Error underlyingError, String filePath = Compiler.CallerFilePath, String methodName = Compiler.CallerMemberName, int lineNumber = Compiler.CallerLineNum)
	{
		this.message = new String();
		this.underlyingError = underlyingError;
		this.filePath = filePath;
		this.methodName = methodName;
		this.lineNumber = uint32(lineNumber);

		Self.collections.Add(this);
	}


	public this (String message, String filePath = Compiler.CallerFilePath, String methodName = Compiler.CallerMemberName, int lineNumber = Compiler.CallerLineNum)
	{
		this.message = new String(message);
		this.filePath = filePath;
		this.methodName = methodName;
		this.lineNumber = uint32(lineNumber);

		Self.collections.Add(this);
	}


	public this (char8* message, String filePath = Compiler.CallerFilePath, String methodName = Compiler.CallerMemberName, int lineNumber = Compiler.CallerLineNum)
	{
		this.message = new String(message);
		this.filePath = filePath;
		this.methodName = methodName;
		this.lineNumber = uint32(lineNumber);

		Self.collections.Add(this);
	}


	public ~this ()
	{
		delete this.message;
		this.message = null;

		if (this.underlyingError != null)
			delete this.underlyingError;
	}


	public override void ToString (String strBuffer)
	{
		strBuffer.AppendF("ERROR: \"{0}\" Occured in method called '{1}' at line {2} in {3}", this.message, this.methodName , this.lineNumber, this.filePath);
	}


	static public Error NotImplemented (String filePath = Compiler.CallerFilePath, String methodName = Compiler.CallerMemberName, int lineNumber = Compiler.CallerLineNum)
	{
		return new Error("Not implemented.", filePath, methodName, lineNumber);
	}


	static public Error NotFound (String filePath = Compiler.CallerFilePath, String methodName = Compiler.CallerMemberName, int lineNumber = Compiler.CallerLineNum)
	{
		return new Error("Object not found.", filePath, methodName, lineNumber);
	}


	static public Error ShouldNotBeNull (String methodName, String variableName)
	{
		return new Error("Value of the '{0}' should not be null.", methodName, variableName);
	}


	public static Error UnexpectedType<T> (Type baseType, Type derivedType, T object) where T : class
	{
		String message = scope String();
		String baseTypeName = scope String();
		String derivedTypeName = scope String();

		baseType.GetFullName(baseTypeName);
		derivedType.GetFullName(derivedTypeName);

		message.AppendF("", baseTypeName, derivedTypeName);

		String address = scope String();
		if (object != null)
			address.Append((uint)(void*)object);
		else
			address.Append("{null}");

		Error e = new Error("");
		e.message.AppendF("Object with address {0} must be derived from typeof({1}) in order to cast it to typeof({2})", address, baseTypeName, derivedTypeName);
		return e;
	}


}


extension Error
{
	static public List<Error> collections;


	static this ()
	{
		Self.collections = new List<Error>();
	}


	static ~this ()
	{
		for (uint32 n = 0; n < Self.collections.Count; n++)
			delete Self.collections[n];

		delete Self.collections;
	}

	
}