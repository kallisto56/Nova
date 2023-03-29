namespace System.Math;


using System;
using System.Diagnostics;


[Union]
public struct int2 : IHashable
{
	public int32[2] values;


	public this (int32 value)
	{
		this.values = int32[2] (value, value);
	}


	public this (int32 x, int32 y)
	{
		this.values = int32[2] (x, y);
	}


	public int GetHashCode()
	{
		return (this.values[0].GetHashCode() * 397) ^ this.values[1].GetHashCode();
	}


	public int32 x
	{
		[Inline] get { return this.values[0]; }
		[Inline] set mut { this.values[0] = value; }
	}


	public int32 y
	{
		[Inline] get { return this.values[1]; }
		[Inline] set mut { this.values[1] = value; }
	}


	public int32 u
	{
		[Inline] get { return this.values[0]; }
		[Inline] set mut { this.values[0] = value; }
	}


	public int32 v
	{
		[Inline] get { return this.values[1]; }
		[Inline] set mut { this.values[1] = value; }
	}


	public int32 width
	{
		[Inline] get { return this.values[0]; }
		[Inline] set mut { this.values[0] = value; }
	}


	public int32 height
	{
		[Inline] get { return this.values[1]; }
		[Inline] set mut { this.values[1] = value; }
	}


	public static implicit operator Vector2 (int2 target)
	{
		return Vector2(
			float(target.values[0]),
			float(target.values[1])
		);
	}


	public static bool operator == (int2 lhs, int2 rhs)
	{
		return 
			lhs.values[0] == rhs.values[0] &&
			lhs.values[1] == rhs.values[1]
			;
	}


	public static bool operator != (int2 lhs, int2 rhs)
	{
		return 
			lhs.values[0] != rhs.values[0] ||
			lhs.values[1] != rhs.values[1]
			;
	}


	public static int2 operator + (int2 lhs, int2 rhs)
	{
		return int2(
			lhs.values[0] + rhs.values[0],
			lhs.values[1] + rhs.values[1]
		);
	}


	public static int2 operator - (int2 lhs, int2 rhs)
	{
		return int2(
			lhs.values[0] - rhs.values[0],
			lhs.values[1] - rhs.values[1]
		);
	}


	public static int2 operator / (int2 lhs, int2 rhs)
	{
		return int2(
			lhs.values[0] / rhs.values[0],
			lhs.values[1] / rhs.values[1]
		);
	}


	public static int2 operator * (int2 lhs, int2 rhs)
	{
		return int2(
			lhs.values[0] * rhs.values[0],
			lhs.values[1] * rhs.values[1]
		);
	}


}