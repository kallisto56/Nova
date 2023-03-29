namespace API.Glfw
{
	using System;


	public enum Boolean : int32
	{
		GLFW_TRUE = 0x00000001,
		GLFW_FALSE = 0x00000000,
	}


	public extension Boolean
	{
		public static implicit operator bool (Glfw.Boolean value)
		{
			return value == .GLFW_TRUE ? true : false;
		}
	}


}