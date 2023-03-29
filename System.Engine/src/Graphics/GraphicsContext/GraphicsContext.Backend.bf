namespace System.Engine;


using System;
using System.Diagnostics;


extension GraphicsContext
{
	public enum Backend
	{
		OpenGL,
		OpenGLES,
		Direct3D11,
		Vulkan,
		Metal,
	}
}