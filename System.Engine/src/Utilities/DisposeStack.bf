namespace System.Engine;


using System;
using System.Diagnostics;
using System.Collections;


public class DisposeStack<T> : IDisposable
{
	public T[] collection;
	public uint32 index = 0;


	public this (uint32 capacity)
	{
		this.collection = new T[capacity];
	}


	public ~this ()
	{
		delete this.collection;
	}


	public DisposeStack<T> Push (T value)
	{
		this.index += 1;
		this.collection[this.index] = value;

		return this;
	}


	public void Pop ()
	{
		this.index -= 1;
	}


	public T GetCurrent ()
	{
		return this.collection[this.index];
	}


	public void Dispose ()
	{
		this.Pop();
	}
}