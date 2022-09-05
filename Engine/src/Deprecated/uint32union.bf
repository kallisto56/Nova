/*namespace Engine
{
	using System;
	using System.IO;
	using System.Collections;
	using System.Threading;


	[Union, CRepr]
	public struct uint32union
	{
		public uint32 value;


		public this (uint32 value)
		{
			this.value = value;
		}


		public Vector3 position
		{
			get { return Vector3(this.GetQQ(), this.GetWW(), this.GetEE()); }
			set mut { this.SetQQ(value.x); this.SetWW(value.y); this.SetEE(value.z); }
		}

		public Vector3 normal
		{
			get { return Vector3(this.GetQQ(), this.GetWW(), this.GetEE()); }
			set mut { this.SetQQ(value.x); this.SetWW(value.y); this.SetEE(value.z); }
		}

		public Color color
		{
			get { return Color(this.GetQQi(), this.GetWWi(), this.GetEEi(), 255); }
			set mut { this.SetWWi(value.r); this.SetWWi(value.g); this.SetEEi(value.b); }
		}

		public float positionStrength
		{
			get { return this.GetQQ(); }
			set mut { this.SetQQ(value); }
		}

		public float normalStrength
		{
			get { return this.GetRR(); }
			set mut { this.SetRR(value); }
		}

		public float colorStrength
		{
			get { return this.GetRR(); }
			set mut { this.SetRR(value); }
		}

		public float splatRadius
		{
			get { return this.GetQQ(); }
			set mut { this.SetQQ(value); }
		}

		public float animationSpeed
		{
			get { return this.GetEE(); }
			set mut { this.SetEE(value); }
		}

		public float animationOffset
		{
			get { return this.GetRR(); }
			set mut { this.SetRR(value); }
		}

		public float roughness
		{
			get { return this.GetQQ(); }
			set mut { this.SetQQ(value); }
		}

		public float metalness
		{
			get { return this.GetWW(); }
			set mut { this.SetWW(value); }
		}

		public float intensity
		{
			get { return this.GetEE(); }
			set mut { this.SetEE(value); }
		}

		public float ambientOcclusion
		{
			get { return this.GetRR(); }
			set mut { this.SetRR(value); }
		}



		public void SetQQ (float input) mut
		{
			this.value = (this.value & 0x00FFFFFF) | ((uint32(input * 255F)) << 24);
		}

		public float GetQQ ()
		{
			return float(((this.value & 0xFF000000) >> 24)) / 255F;
		}


		public float GetWW ()
		{
			return float(((this.value & 0x00FF0000) >> 16)) / 255F;
		}

		public float GetEE ()
		{
			return float(((this.value & 0x0000FF00) >> 8)) / 255F;
		}

		public float GetRR ()
		{
			return float((this.value & 0x000000FF)) / 255F;
		}

		public uint8 GetQQi ()
		{
			return uint8((this.value & 0xFF000000) >> 24);
		}

		public uint8 GetWWi ()
		{
			return uint8((this.value & 0x00FF0000) >> 16);
		}

		public uint8 GetEEi ()
		{
			return uint8((this.value & 0x0000FF00) >> 8);
		}

		public uint8 GetRRi ()
		{
			return uint8(this.value & 0x000000FF);
		}

		public void SetWW (float input) mut
		{
			this.value = (this.value & 0xFF00FFFF) | ((uint32(input*255F) & 0x000000FF) << 16);
		}

		public void SetEE (float input) mut
		{
			this.value = (this.value & 0xFFFF00FF) | ((uint32(input*255F) & 0x000000FF) << 8);
		}

		public void SetRR (float input) mut
		{
			this.value = (this.value & 0xFFFFFF00) | ((uint32(input*255F) & 0x000000FF));
		}

		public void SetQQi (uint8 input) mut
		{
			this.value = (this.value & 0x00FFFFFF) | ((uint32(input) & 0x000000FF) << 24);
		}

		public void SetWWi (uint8 input) mut
		{
			this.value = (this.value & 0xFF00FFFF) | ((uint32(input) & 0x000000FF) << 16);
		}

		public void SetEEi (uint8 input) mut
		{
			this.value = (this.value & 0xFFFF00FF) | ((uint32(input) & 0x000000FF) << 8);
		}

		public void SetRRi (uint8 input) mut
		{
			this.value = (this.value & 0xFFFFFF00) | ((input & 0x000000FF));
		}


		public override void ToString(String strBuffer)
		{
			strBuffer.AppendF("{0:X8}", this.value);
		}
	}


}*/