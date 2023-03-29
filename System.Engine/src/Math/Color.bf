namespace System.Math;


using System.Diagnostics;


[CRepr, Ordered, Packed, Union]
public struct Color<T>
{
	public T[4] values;


	public T r
	{
		get { return this.values[0]; }
		set mut { this.values[0] = value; }
	}


	public T g
	{
		get { return this.values[1]; }
		set mut { this.values[1] = value; }
	}


	public T b
	{
		get { return this.values[2]; }
		set mut { this.values[2] = value; }
	}


	public T a
	{
		get { return this.values[3]; }
		set mut { this.values[3] = value; }
	}


	public this (T r, T g, T b, T a)
	{
		this.values[0] = r;
		this.values[1] = g;
		this.values[2] = b;
		this.values[3] = a;
	}
}


extension Color<T> where T : Float
{
	static readonly public Color<T> red => Color<T>((T)1F, (T)0F, (T)0F, (T)1F);
	static readonly public Color<T> green => Color<T>((T)0F, (T)1F, (T)0F, (T)1F);
	static readonly public Color<T> blue => Color<T>((T)0F, (T)0F, (T)1F, (T)1F);
	static readonly public Color<T> white => Color<T>((T)1F, (T)1F, (T)1F, (T)1F);
}


extension Color<T> where T : UInt8
{
	static readonly public Color<T> red => Color<T>((T)255, (T)0, (T)0, (T)255);
	static readonly public Color<T> green => Color<T>((T)0, (T)255, (T)0, (T)255);
	static readonly public Color<T> blue => Color<T>((T)0, (T)0, (T)255, (T)255);
	static readonly public Color<T> white => Color<T>((T)255, (T)255, (T)255, (T)255);
}