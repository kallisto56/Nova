namespace Engine
{
	using System;
	
	[Union]
	public struct uint4 : IHashable
	{
		public uint32[4] values;
		
		public this(uint32 x, uint32 y, uint32 z, uint32 w)
		{
			values = .(x,y,z,w);
		}
		
		public uint32 x
		{
			[Inline]get { return values[0]; }
			[Inline]set mut { values[0] = value; }
		}
		
		public uint32 y
		{
			[Inline]get { return values[1]; }
			[Inline]set mut { values[1] = value; }
		}
		
		public uint32 z
		{
			[Inline]get { return values[2]; }
			[Inline]set mut { values[2] = value; }
		}
		
		public uint32 w
		{
			[Inline]get { return values[3]; }
			[Inline]set mut { values[3] = value; }
		}
		
		public void ToString(String stringBuffer)
		{
			 stringBuffer.AppendF("uint4({0}, {1}, {2}, {3});", this.values[0], this.values[1], this.values[2], this.values[3]);
		}
		
		public static bool operator==(uint4 lhs, uint4 rhs)
		{
			return (lhs.x == rhs.x && lhs.y == rhs.y && lhs.z == rhs.z && lhs.w == rhs.w);
		}
		
		public static bool operator!=(uint4 lhs, uint4 rhs)
		{
			return !(lhs.x == rhs.x && lhs.y == rhs.y && lhs.z == rhs.z && lhs.w == rhs.w);
		}
		public int GetHashCode()
		{
			return this.values[0].GetHashCode() ^ this.values[1].GetHashCode() ^ this.values[2].GetHashCode() ^ this.values[3].GetHashCode();
		}
	}
}
