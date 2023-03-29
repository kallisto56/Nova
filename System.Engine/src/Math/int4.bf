namespace System.Math
{
	using System;
	
	[Union]
	public struct int4 : IHashable
	{
		public int[4] values;
		
		public this(int x, int y, int z, int w)
		{
			values = .(x,y,z,w);
		}
		
		public int x
		{
			[Inline]get { return values[0]; }
			[Inline]set mut { values[0] = value; }
		}
		
		public int y
		{
			[Inline]get { return values[1]; }
			[Inline]set mut { values[1] = value; }
		}
		
		public int z
		{
			[Inline]get { return values[2]; }
			[Inline]set mut { values[2] = value; }
		}
		
		public int w
		{
			[Inline]get { return values[3]; }
			[Inline]set mut { values[3] = value; }
		}
		
		public void ToString(String stringBuffer)
		{
			 stringBuffer.AppendF("uint4({0}, {1}, {2}, {3});", this.values[0], this.values[1], this.values[2], this.values[3]);
		}
		
		public static bool operator==(int4 lhs, int4 rhs)
		{
			return (lhs.x == rhs.x && lhs.y == rhs.y && lhs.z == rhs.z && lhs.w == rhs.w);
		}
		
		public static bool operator!=(int4 lhs, int4 rhs)
		{
			return !(lhs.x == rhs.x && lhs.y == rhs.y && lhs.z == rhs.z && lhs.w == rhs.w);
		}
		public int GetHashCode()
		{
			return this.values[0].GetHashCode() ^ this.values[1].GetHashCode() ^ this.values[2].GetHashCode() ^ this.values[3].GetHashCode();
		}
	}
}
