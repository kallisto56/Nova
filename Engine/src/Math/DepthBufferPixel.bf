/*namespace Engine
{
	using System;
	using System.IO;
	using System.Collections;
	using System.Threading;


	[Union, CRepr]
	public struct DepthBufferPixel
	{
		public static DepthBufferPixel blank = DepthBufferPixel(0xFFFFFFFF00000000);
		public uint64 values;

		public uint32 depth
		{
			get { return uint32((this.values & 0xFFFFFFFF00000000) >> 32); }
			set mut { this.values = this.values | (uint64(value) << 32); }
		}

		public uint32 instruction
		{
			get { return uint32((this.values & 0x00000000FFFFFF00) >> 8); }
			set mut
			{
				AssertWarning(instruction > 16777215, "instruction's value is greater or equals to 16777215 (0x00FFFFFF).");
				this.values = this.values | (uint64(value & 0x00FFFFFF) << 8);
			}
		}

		public uint8 splat
		{
			get { return uint8(this.values & 0x00000000000000FF); }
			set mut { this.values = this.values | uint64(value); }
		}


		public this (uint32 depth, uint32 instruction, uint8 splat)
		{
			AssertWarning(instruction > 16777215, "Instruction's value is greater or equals to 16777215 (0x00FFFFFF).");
			this.values =
				(uint64(depth) << 32) |
				(uint64(instruction & 0x00FFFFFF) << 8) |
				(uint64(splat & 0x000000FF))
				;
		}


		public this (uint64 value)
		{
			this.values = value;
		}


		/*[Commutable]
		public static bool operator == (DepthBufferPixel lhs, uint64 rhs)
		{
			return lhs.values == rhs;
		}*/


		public static bool operator == (DepthBufferPixel lhs, DepthBufferPixel rhs)
		{
			return lhs.values == rhs.values;
		}


		/*public static implicit operator uint64 (DepthBufferPixel lhs)
		{
			return lhs.values;
		}*/


		/*public static implicit operator uint64 (DepthBufferPixel lhs)
		{
			return lhs.values;
		}*/


		public override void ToString(String strBuffer)
		{
			strBuffer.AppendF("({0}, {1}, {2})|{3:X16};", this.depth, this.instruction, this.splat, this.values);
		}
	}


}*/