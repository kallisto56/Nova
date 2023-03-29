namespace System.Engine.Windowing.Glfw;


using System;
using System.Collections;
using System.Diagnostics;
using System.Math;

using API.Glfw;


public class GlfwGamepad : IGamepad, IDisposable
{
	public GlfwWindow window;


	public this (GlfwWindow window)
	{
		this.window = window;
	}


	public ~this ()
	{

	}


	public void Dispose ()
	{

	}


}