namespace System.Math;


using System;
using System.Diagnostics;


[Union]
public struct Vector4 : IHashable
{
	public float[4] values;


	public this ()
	{
		values = .(0F, 0F, 0F, 0F);
	}
	

	public this (float x, float y, float z, float w)
	{
		values = .(x,y,z,w);
	}
	

	public this (float v)
	{
		values = .(v,v,v,v);
	}
	

	public this (Vector2 v)
	{
		values = .(v.x,v.y,0f,0f);
	}
	

	public this (Vector2 v, float z)
	{
		values = .(v.x,v.y,z,0f);
	}
	

	public this (Vector2 v, float z, float w)
	{
		values = .(v.x,v.y,z,w);
	}
	

	public this (Vector3 v)
	{
		values = .(v.x,v.y,v.z,0f);
	}
	

	public this (Vector3 v, float w)
	{
		values = .(v.x,v.y,v.z,w);
	}
	

	public this (Vector4 v)
	{
		values = .(v.x,v.y,v.z,v.w);
	}
	

	public this (float[] v)
	{
		let c = v.Count;
		values = .((c < 0) ? 0f : v[0],(c < 1) ? 0f : v[1],(c < 2) ? 0f : v[2],(c < 3) ? 0f : v[3]);
	}
	

	public this (float[] v, int startIndex)
	{
		let c = v.Count;
		values = .((c + startIndex < 0) ? 0f : v[0 + startIndex],(c + startIndex < 1) ? 0f : v[1 + startIndex],(c + startIndex < 2) ? 0f : v[2 + startIndex],(c + startIndex < 3) ? 0f : v[3 + startIndex]);
	}


	public float this[int index]
	{
		[Inline]get
		{
			System.Diagnostics.Debug.Assert(index >=0 && index < 4, "index out of range");
			unchecked { return values[index]; }
		}
		[Inline]set mut
		{
			System.Diagnostics.Debug.Assert(index >=0 && index < 4, "index out of range");
			unchecked { values[index] = value;}
		}
	}

	public float x
	{
		[Inline]get { return values[0]; }
		[Inline]set mut { values[0] = value; }
	}

	public float y
	{
		[Inline]get { return values[1]; }
		[Inline]set mut { values[1] = value; }
	}

	public float z
	{
		[Inline]get { return values[2]; }
		[Inline]set mut { values[2] = value; }
	}

	public float w
	{
		[Inline]get { return values[3]; }
		[Inline]set mut { values[3] = value; }
	}

	public float length
	{
		get { return System.Math.Sqrt((x*x + y*y) + (z*z + w*w)); }
	}

	public float lengthSqr
	{
		get { return (this.x * this.x + this.y * this.y) + (this.z * this.z + this.w * this.w); }
	}

	public Vector4 normalized
	{
		get { return this / this.length; }
	}

	public Vector3 xyz
	{
		[Inline]get { return Vector3(this.values[0], this.values[1], this.values[2]); }
	}





	readonly static public Vector4 zero = Vector4(0f, 0f, 0f, 0f);
	readonly static public Vector4 one = Vector4(1f, 1f, 1f, 1f);
	readonly static public Vector4 unitX = Vector4(1f, 0f, 0f, 0f);
	readonly static public Vector4 negativeUnitX = Vector4(-1f, 0f, 0f, 0f);
	readonly static public Vector4 unitY = Vector4(0f, 1f, 0f, 0f);
	readonly static public Vector4 negativeUnitY = Vector4(0f, -1f, 0f, 0f);
	readonly static public Vector4 unitZ = Vector4(0f, 0f, 1f, 0f);
	readonly static public Vector4 negativeUnitZ = Vector4(0f, 0f, -1f, 0f);
	readonly static public Vector4 unitW = Vector4(0f, 0f, 0f, 1f);
	readonly static public Vector4 negativeUnitW = Vector4(0f, 0f, 0f, -1f);
	readonly static public Vector4 maxValue = Vector4(float.MaxValue, float.MaxValue, float.MaxValue, float.MaxValue);
	readonly static public Vector4 minValue = Vector4(float.MinValue, float.MinValue, float.MinValue, float.MinValue);
	readonly static public Vector4 epsilon = Vector4(float.Epsilon, float.Epsilon, float.Epsilon, float.Epsilon);
	readonly static public Vector4 negativeInfinity = Vector4(float.NegativeInfinity, float.NegativeInfinity, float.NegativeInfinity, float.NegativeInfinity);
	readonly static public Vector4 positiveInfinity = Vector4(float.PositiveInfinity, float.PositiveInfinity, float.PositiveInfinity, float.PositiveInfinity);

	static public explicit operator Vector2(Vector4 v) => Vector2((float)v.x, (float)v.y);
	static public explicit operator Vector3(Vector4 v) => Vector3((float)v.x, (float)v.y, (float)v.z);
	static public bool operator==(Vector4 lhs, Vector4 rhs) => ((lhs.x == rhs.x && lhs.y == rhs.y) && (lhs.z == rhs.z && lhs.w == rhs.w));
	static public bool operator!=(Vector4 lhs, Vector4 rhs) => !((lhs.x == rhs.x && lhs.y == rhs.y) && (lhs.z == rhs.z && lhs.w == rhs.w));
	static public Vector4 operator+(Vector4 lhs, Vector4 rhs) => Vector4(lhs.x + rhs.x, lhs.y + rhs.y, lhs.z + rhs.z, lhs.w + rhs.w);
	static public Vector4 operator+(Vector4 lhs, float rhs) => Vector4(lhs.x + rhs, lhs.y + rhs, lhs.z + rhs, lhs.w + rhs);
	static public Vector4 operator+(float lhs, Vector4 rhs) => Vector4(lhs + rhs.x, lhs + rhs.y, lhs + rhs.z, lhs + rhs.w);
	static public Vector4 operator-(Vector4 lhs, Vector4 rhs) => Vector4(lhs.x - rhs.x, lhs.y - rhs.y, lhs.z - rhs.z, lhs.w - rhs.w);
	static public Vector4 operator-(Vector4 lhs, float rhs) => Vector4(lhs.x - rhs, lhs.y - rhs, lhs.z - rhs, lhs.w - rhs);
	static public Vector4 operator-(float lhs, Vector4 rhs) => Vector4(lhs - rhs.x, lhs - rhs.y, lhs - rhs.z, lhs - rhs.w);
	static public Vector4 operator*(Vector4 lhs, Vector4 rhs) => Vector4(lhs.x * rhs.x, lhs.y * rhs.y, lhs.z * rhs.z, lhs.w * rhs.w);
	static public Vector4 operator*(Vector4 lhs, float rhs) => Vector4(lhs.x * rhs, lhs.y * rhs, lhs.z * rhs, lhs.w * rhs);
	static public Vector4 operator*(float lhs, Vector4 rhs) => Vector4(lhs * rhs.x, lhs * rhs.y, lhs * rhs.z, lhs * rhs.w);
	static public Vector4 operator/(Vector4 lhs, Vector4 rhs) => Vector4(lhs.x / rhs.x, lhs.y / rhs.y, lhs.z / rhs.z, lhs.w / rhs.w);
	static public Vector4 operator/(Vector4 lhs, float rhs) => Vector4(lhs.x / rhs, lhs.y / rhs, lhs.z / rhs, lhs.w / rhs);
	static public Vector4 operator/(float lhs, Vector4 rhs) => Vector4(lhs / rhs.x, lhs / rhs.y, lhs / rhs.z, lhs / rhs.w);
	static public Vector4 operator-(Vector4 v) => Vector4(-v.x, -v.y, -v.z, -v.w);
	static public Vector4 operator%(Vector4 lhs, Vector4 rhs) => Vector4(lhs.x % rhs.x, lhs.y % rhs.y, lhs.z % rhs.z, lhs.w % rhs.w);
	static public Vector4 operator%(Vector4 lhs, float rhs) => Vector4(lhs.x % rhs, lhs.y % rhs, lhs.z % rhs, lhs.w % rhs);
	static public Vector4 operator%(float lhs, Vector4 rhs) => Vector4(lhs % rhs.x, lhs % rhs.y, lhs % rhs.z, lhs % rhs.w);

	static public Vector4 LessThanEqual (Vector4 lhs, Vector4 rhs)
	{
		return Vector4(
			lhs.x <= rhs.x ? 1F : 0F,
			lhs.y <= rhs.y ? 1F : 0F,
			lhs.z <= rhs.z ? 1F : 0F,
			lhs.w <= rhs.w ? 1F : 0F
		);
	}

	override public void ToString (String stringBuffer)
	{
		stringBuffer.AppendF("Vector4({0}F, {1}F, {2}F, {3}F)", values[0], values[1], values[2], values[3]);
	}

	public int GetHashCode ()
	{
		unchecked
		{
			return ((((((x.GetHashCode()) * 397) ^ y.GetHashCode()) * 397) ^ z.GetHashCode()) * 397) ^ w.GetHashCode();
		}
	}


}