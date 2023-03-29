namespace System.Math;


[Union]
public struct int3 : IHashable
{
	public int32[3] values;


	public int32 x
	{
	    [Inline]get { return values[0]; }
	    [Inline]set mut { values[0] = value; }
	}


	public int32 y
	{
	    [Inline]get { return values[1]; }
	    [Inline]set mut { values[1] = value; }
	}


	public int32 z
	{
	    [Inline]get { return values[2]; }
	    [Inline]set mut { values[2] = value; }
	}


	public this (int32 value)
	{
		this.values = int32[3] (value, value, value);
	}


	public this (float value)
	{
		let i = int32(value);
		this.values = int32[3] (i, i, i);
	}


	public this (int32 x, int32 y, int32 z)
	{
		this.values = int32[3] (x, y, z);
	}


	public int GetHashCode ()
	{
		return ((((this.values[0].GetHashCode()) * 397) ^ this.values[1].GetHashCode()) * 397) ^ this.values[2].GetHashCode();
	}


	public static explicit operator int2(int3 v) =>  int2(v.values[0], v.values[1]);
	public static explicit operator uint2(int3 v) =>  uint2(uint(v.values[0]), uint(v.values[1]));

	public static explicit operator Vector2(int3 v) =>  Vector2(v.values[0], v.values[1]);
	public static implicit operator Vector3(int3 v) =>  Vector3(v.values[0], v.values[1], v.values[2]);
	public static explicit operator Vector4(int3 v) =>  Vector4(v.values[0], v.values[1], v.values[2], 0f);
	
	public static int3 operator + (int3 lhs, int3 rhs) => int3(lhs.x + rhs.x, lhs.y + rhs.y, lhs.z + rhs.z);
	public static int3 operator + (int3 lhs, int32 rhs) => int3(lhs.x + rhs, lhs.y + rhs, lhs.z + rhs);
	public static int3 operator + (int32 lhs, int3 rhs) => int3(lhs + rhs.x, lhs + rhs.y, lhs + rhs.z);

	public static int3 operator - (int3 lhs, int3 rhs) => int3(lhs.x - rhs.x, lhs.y - rhs.y, lhs.z - rhs.z);
	public static int3 operator - (int3 lhs, int32 rhs) => int3(lhs.x - rhs, lhs.y - rhs, lhs.z - rhs);
	public static int3 operator - (int32 lhs, int3 rhs) => int3(lhs - rhs.x, lhs - rhs.y, lhs - rhs.z);

	public static int3 operator * (int3 lhs, int3 rhs) => int3(lhs.x * rhs.x, lhs.y * rhs.y, lhs.z * rhs.z);
	public static int3 operator * (int3 lhs, int32 rhs) => int3(lhs.x * rhs, lhs.y * rhs, lhs.z * rhs);
	public static int3 operator * (int32 lhs, int3 rhs) => int3(lhs * rhs.x, lhs * rhs.y, lhs * rhs.z);

	public static int3 operator / (int3 lhs, int3 rhs) => int3(lhs.x / rhs.x, lhs.y / rhs.y, lhs.z / rhs.z);
	public static int3 operator / (int3 lhs, int32 rhs) => int3(lhs.x / rhs, lhs.y / rhs, lhs.z / rhs);
	public static int3 operator / (int32 lhs, int3 rhs) => int3(lhs / rhs.x, lhs / rhs.y, lhs / rhs.z);

	public static int3 operator - (int3 v) => int3(-v.x, -v.y, -v.z);
	public static int3 operator ~ (int3 v) => int3(~v.x, ~v.y, ~v.z);

	public static int3 operator ^ (int3 lhs, int3 rhs) => int3(lhs.x ^ rhs.x, lhs.y ^ rhs.y, lhs.z ^ rhs.z);
	public static int3 operator ^ (int3 lhs, int32 rhs) => int3(lhs.x ^ rhs, lhs.y ^ rhs, lhs.z ^ rhs);
	public static int3 operator ^ (int32 lhs, int3 rhs) => int3(lhs ^ rhs.x, lhs ^ rhs.y, lhs ^ rhs.z);

	public static int3 operator | (int3 lhs, int3 rhs) => int3(lhs.x | rhs.x, lhs.y | rhs.y, lhs.z | rhs.z);
	public static int3 operator | (int3 lhs, int32 rhs) => int3(lhs.x | rhs, lhs.y | rhs, lhs.z | rhs);
	public static int3 operator | (int32 lhs, int3 rhs) => int3(lhs | rhs.x, lhs | rhs.y, lhs | rhs.z);

	public static int3 operator & (int3 lhs, int3 rhs) => int3(lhs.x & rhs.x, lhs.y & rhs.y, lhs.z & rhs.z);
	public static int3 operator & (int3 lhs, int32 rhs) => int3(lhs.x & rhs, lhs.y & rhs, lhs.z & rhs);
	public static int3 operator & (int32 lhs, int3 rhs) => int3(lhs & rhs.x, lhs & rhs.y, lhs & rhs.z);

	public static int3 operator << (int3 lhs, int32 rhs) => int3(lhs.x << rhs, lhs.y << rhs, lhs.z << rhs);
	public static int3 operator >> (int3 lhs, int32 rhs) => int3(lhs.x >> rhs, lhs.y >> rhs, lhs.z >> rhs);

	public static bool operator == (int3 lhs, int3 rhs) => ((lhs.x == rhs.x && lhs.y == rhs.y) && lhs.z == rhs.z);
	public static bool operator != (int3 lhs, int3 rhs) => !((lhs.x == rhs.x && lhs.y == rhs.y) && lhs.z == rhs.z);

}