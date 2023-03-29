namespace System.Collections;


using System;
using System.Diagnostics;


public class FixedSizeList<T>
{
	public T[] array;
	public int Count { get; private set; }
	public int Capacity => this.array.Count;
	public uint64 sizeInBytes
	{
		get { return uint64(sizeof(T) * this.Count); }
	}


	public this (uint capacity)
	{
		this.array = new T[capacity];
	}


	public ~this ()
	{
		delete this.array;
	}


	public void Add (T value)
	{
		this.Count++;

		Debug.Assert(this.Count - 1 < this.array.Count);
		/*Debug.Assert(this.Count > this.array.Count);*/
			

		this.array[this.Count - 1] = value;
	}


	public void Clear ()
	{
		this.Count = 0;
	}

	public ref T this[int idx]
	{
		[Checked, Inline]
		get
		{
			return ref this.array[idx];
		}
	}


	[Inline]
	public T* CArray()
	{
		return this.array.CArray();
	}
}