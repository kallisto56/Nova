/*namespace System.Math;


using System;
using System.Diagnostics;

	
[Union]
public struct uint4 : IHashable
{
	public uint32[4] values;


	public this (uint32 x, uint32 y, uint32 z, uint32 w)
	{
		values = uint32[4](x, y, z, w);
	}


	public uint32 this[int index]
	{
		[Inline]get
		{
			Debug.Assert(index >= 0 && index < 4, "index out of range");
			unchecked { return values[index]; }
		}
		[Inline]set mut
		{
			Debug.Assert(index >= 0 && index < 4, "index out of range");
			unchecked { values[index] = value; }
		}
	}


	public uint32 x
	{
		[Inline]get { return this.values[0]; }
		[Inline]set mut { this.values[0] = value; }
	}


	public uint32 y
	{
		[Inline]get { return this.values[1]; }
		[Inline]set mut { this.values[1] = value; }
	}


	public uint32 z
	{
		[Inline]get { return this.values[2]; }
		[Inline]set mut { this.values[2] = value; }
	}


	public uint32 w
	{
		[Inline]get { return this.values[3]; }
		[Inline]set mut { this.values[3] = value; }
	}


	public static bool operator == (uint4 lhs, uint4 rhs)
	{
		return (
			lhs.values[0] == rhs.values[0] &&
			lhs.values[1] == rhs.values[1] &&
			lhs.values[2] == rhs.values[2] &&
			lhs.values[3] == rhs.values[3]
		);
	}

	
	public static bool operator != (uint4 lhs, uint4 rhs)
	{
		return !(
			lhs.values[0] == rhs.values[0] &&
			lhs.values[1] == rhs.values[1] &&
			lhs.values[2] == rhs.values[2] &&
			lhs.values[3] == rhs.values[3]
		);
	}


	public int GetHashCode()
	{
		return
			this.values[0].GetHashCode() ^
			this.values[1].GetHashCode() ^
			this.values[2].GetHashCode() ^
			this.values[3].GetHashCode()
			;
	}


}*/