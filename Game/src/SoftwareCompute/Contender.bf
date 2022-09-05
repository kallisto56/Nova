namespace Game
{
	using System;
	using Engine;


	[Union, CRepr]
	public struct Contender
	{
		/*public static readonly uint64 empty = 0xFFFFFFFF00000000;*/
		public static readonly Contender emptyValue = Contender(268435455, 0, 0);
		public static readonly uint32 maxDepth = 0x0FFFFFFF;
		public static readonly uint64 empty = 0xFFFFFFF000000000;
		public uint64 values;

		public uint32 depth
		{
			get { return uint32((this.values & 0xFFFFFFF000000000) >> 36); }
			set mut { this.values = this.values | (uint64(value) << 36); }
		}

		public uint32 instruction
		{
			get { return uint32((this.values & 0x0000000FFFFFFF00) >> 8); }
			set mut
			{
				AssertWarning(instruction > 268435455, "instruction's value is greater or equals to 268435455 (0x0FFFFFFF).");
				this.values = this.values | (uint64(value & 0x0FFFFFFF) << 8);
			}
		}

		public uint8 splat
		{
			get { return uint8(this.values & 0x00000000000000FF); }
			set mut { this.values = this.values | uint64(value); }
		}


		public this (uint64 value)
		{
			this.values = value;
		}

		public this (uint32 depth, uint32 instruction, uint8 splat)
		{
			/*AssertWarning(depth > 16777215, "Depth's value is greater or equals to 16777215 (0x00FFFFFF).");*/
			AssertWarning(instruction > 268435455, "Instruction's value is greater or equals to 268435455 (0x0FFFFFFF).");
			this.values =
				(uint64(depth) << 36) |
				(uint64(instruction & 0x0FFFFFFF) << 8) |
				(uint64(splat & 0x000000FF))
				;
		}
	}


}