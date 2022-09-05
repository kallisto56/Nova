namespace Engine
{
	using System;
	using System.IO;
	using System.Collections;
	using System.Threading;


    [Union, CRepr]
	public struct Vector4p
	{
		public uint32 values;

		public uint8 x
		{
			get { return uint8((this.values & 0xFF000000) >> 24); }
			set mut { this.values = (this.values & 0x00FFFFFF) | (uint32(value & 0x000000FF) << 24); }
		}

		public uint8 y
		{
			get { return uint8((this.values & 0x00FF0000) >> 16); }
			set mut { this.values = (this.values & 0xFF00FFFF) | (uint32(value) << 16); }
		}

		public uint8 z
		{
			get { return uint8((this.values & 0x0000FF00) >> 8); }
			set mut { this.values = (this.values & 0xFFFF00FF) | (uint32(value) << 8); }
		}

		public uint8 w
		{
			get { return uint8(this.values & 0x000000FF); }
			set mut { this.values = (this.values & 0xFFFFFF00) | value; }
		}


		public this (uint8 x, uint8 y, uint8 z, uint8 w)
		{
			this.values =
				(uint32(x) << 24) |
				(uint32(y) << 16) |
				(uint32(z) << 8) |
				(uint32(w));
		}


		public override void ToString(String strBuffer)
		{
			strBuffer.AppendF("Vector4p({0}, {1}, {2}, {3})|{4:X8};", this.x, this.y, this.z, this.w, this.values);
		}


	}


}