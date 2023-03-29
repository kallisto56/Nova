namespace System.Math;


using System;
using System.Diagnostics;


[Union]
public struct uint2 : IHashable
{
	public uint[2] values;


	public this (uint x, uint y)
	{
		values = uint[2](x, y);
	}


	public this (uint v)
	{
		values = uint[2](v, v);
	}


	public this (uint2 v)
	{
		values = uint[2](v.x, v.y);
	}


	public uint this[int index]
	{
		[Inline]get
		{
			Debug.Assert(index >= 0 && index < 2, "index out of range");
			unchecked { return values[index]; }
		}
		[Inline]set mut
		{
			Debug.Assert(index >= 0 && index < 2, "index out of range");
			unchecked { values[index] = value; }
		}
	}

	
	public uint x
	{
		[Inline]get { return values[0]; }
		[Inline]set mut { values[0] = value; }
	}


	public uint y
	{
		[Inline]get { return values[1]; }
		[Inline]set mut { values[1] = value; }
	}


	public uint width
	{
		[Inline]get { return values[0]; }
		[Inline]set mut { values[0] = value; }
	}


	public uint height
	{
		[Inline]get { return values[1]; }
		[Inline]set mut { values[1] = value; }
	}

	
	public int GetHashCode()
	{
		return ((x.GetHashCode()) * 397) ^ y.GetHashCode();
	}


	public static implicit operator Vector2(uint2 v) => Vector2(v.values[0], v.values[1]);
	public static explicit operator int2(uint2 v) => int2(int32(v.values[0]), int32(v.values[1]));
	public static explicit operator int3(uint2 v) => int3(int32(v.values[0]), int32(v.values[1]), 0);
	public static explicit operator Vector3(uint2 v) => Vector3(v.values[0], v.values[1], 0f);
	public static explicit operator Vector4(uint2 v) => Vector4(v.values[0], v.values[1], 0f, 0f);

	public static uint2 operator + (uint2 lhs, uint2 rhs) => uint2(lhs.values[0] + rhs.values[0], lhs.values[1] + rhs.values[1]);
	public static uint2 operator + (uint2 lhs, uint rhs) => uint2(lhs.values[0] + rhs, lhs.values[1] + rhs);
	public static uint2 operator + (uint lhs, uint2 rhs) => uint2(lhs + rhs.values[0], lhs + rhs.values[1]);

	public static uint2 operator - (uint2 lhs, uint2 rhs) => uint2(lhs.values[0] - rhs.values[0], lhs.values[1] - rhs.values[1]);
	public static uint2 operator - (uint2 lhs, uint rhs) => uint2(lhs.values[0] - rhs, lhs.values[1] - rhs);
	public static uint2 operator - (uint lhs, uint2 rhs) => uint2(lhs - rhs.values[0], lhs - rhs.values[1]);

	public static uint2 operator * (uint2 lhs, uint2 rhs) => uint2(lhs.values[0] * rhs.values[0], lhs.values[1] * rhs.values[1]);
	public static uint2 operator * (uint2 lhs, uint rhs) => uint2(lhs.values[0] * rhs, lhs.values[1] * rhs);
	public static uint2 operator * (uint lhs, uint2 rhs) => uint2(lhs * rhs.values[0], lhs * rhs.values[1]);

	public static uint2 operator / (uint2 lhs, uint2 rhs) => uint2(lhs.values[0] / rhs.values[0], lhs.values[1] / rhs.values[1]);
	public static uint2 operator / (uint2 lhs, uint rhs) => uint2(lhs.values[0] / rhs, lhs.values[1] / rhs);
	public static uint2 operator / (uint lhs, uint2 rhs) => uint2(lhs / rhs.values[0], lhs / rhs.values[1]);
	public static uint2 operator ~ (uint2 v) => uint2(~v.values[0], ~v.values[1]);

	public static uint2 operator ^ (uint2 lhs, uint2 rhs) => uint2(lhs.values[0] ^ rhs.values[0], lhs.values[1] ^ rhs.values[1]);
	public static uint2 operator ^ (uint2 lhs, uint rhs) => uint2(lhs.values[0] ^ rhs, lhs.values[1] ^ rhs);
	public static uint2 operator ^ (uint lhs, uint2 rhs) => uint2(lhs ^ rhs.values[0], lhs ^ rhs.values[1]);

	public static uint2 operator | (uint2 lhs, uint2 rhs) => uint2(lhs.values[0] | rhs.values[0], lhs.values[1] | rhs.values[1]);
	public static uint2 operator | (uint2 lhs, uint rhs) => uint2(lhs.values[0] | rhs, lhs.values[1] | rhs);
	public static uint2 operator | (uint lhs, uint2 rhs) => uint2(lhs | rhs.values[0], lhs | rhs.values[1]);

	public static uint2 operator & (uint2 lhs, uint2 rhs) => uint2(lhs.values[0] & rhs.values[0], lhs.values[1] & rhs.values[1]);
	public static uint2 operator & (uint2 lhs, uint rhs) => uint2(lhs.values[0] & rhs, lhs.values[1] & rhs);
	public static uint2 operator & (uint lhs, uint2 rhs) => uint2(lhs & rhs.values[0], lhs & rhs.values[1]);

	public static bool operator == (uint2 lhs, uint2 rhs) => (lhs.values[0] == rhs.values[0] && lhs.values[1] == rhs.values[1]);
	public static bool operator != (uint2 lhs, uint2 rhs) => !(lhs.values[0] == rhs.values[0] && lhs.values[1] == rhs.values[1]);

	public static uint2 operator << (uint2 lhs, int rhs) => uint2(lhs.values[0] << rhs, lhs.values[1] << rhs);
	public static uint2 operator >> (uint2 lhs, int rhs) => uint2(lhs.values[0] >> rhs, lhs.values[1] >> rhs);


}