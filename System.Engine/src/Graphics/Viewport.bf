namespace System.Engine;


using System;
using System.Diagnostics;


public struct Viewport
{
	public float x;
	public float y;
	public float width;
	public float height;
	public float minDepth;
	public float maxDepth;


	public this (float x, float y, float width, float height, float minDepth = 0F, float maxDepth = 1F)
	{
		this.x = x;
		this.y = y;

		this.width = width;
		this.height = height;

		this.minDepth = minDepth;
		this.maxDepth = maxDepth;
	}
}