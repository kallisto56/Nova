namespace Engine
{
	using System;


	[Ordered, Packed, CRepr]
	public struct Color : IHashable
	{
		public static readonly Color CornflowerBlue = 0x6495edff;
		//public static readonly Color CornflowerBlue = 0xed9564ff;
		static public readonly Color White = 0xFFFFFFFF;
		static public readonly Color Black = 0x000000FF;
		static public readonly Color Transparent = 0x00000000;
		static public readonly Color Red = 0xFF0000FF;
		static public readonly Color Green = 0x00FF00FF;
		static public readonly Color Blue = 0x0000FFFF;
		static public readonly Color Cyan = 0x00FFFFFF;
		static public readonly Color Magenta = 0xFF00FFFF;
		static public readonly Color Yellow = 0xFFFF00FF;
		static public readonly Color DarkGray = 0x3F3F3FFF;
		static public readonly Color Gray = 0x7F7F7FFF;
		static public readonly Color LightGray = 0xBFBFBFFF;
		static public readonly Color Brown = 0xA52A2AFF;

		public uint8 r;
		public uint8 g;
		public uint8 b;
		public uint8 a;

		public this(int from) : this((uint)from)
		{
		}

		public Vector3 ToVector3()
		{
			return Vector3(r * 255F, g * 255F, b * 255);
		}

		public this(uint from)
		{
			r = (uint8)((from >> 24) & 0xFF);
			g = (uint8)((from >> 16) & 0xFF);
			b = (uint8)((from >> 8) & 0xFF);
			a = (uint8)(from & 0xFF);
		}

		public this(Color color, float alpha = 1)
		{
			r = color.r;
			g = color.g;
			b = color.b;
			a = (.)(alpha * 255);
		}

		public this(Vector3 color, float alpha = 1)
		{
			r = uint8(color.x * 255);
			g = uint8(color.y * 255);
			b = uint8(color.z * 255);
			a = (.)(alpha * 255);
		}

		public this(Color color, uint8 alpha = 255)
		{
			r = color.r;
			g = color.g;
			b = color.b;
			a = alpha;
		}

		public this(uint8 red, uint8 green, uint8 blue, uint8 alpha = 255)
		{
			r = red;
			g = green;
			b = blue;
			a = alpha;
		}

		public this(float red, float green, float blue, float alpha = 1f)
		{
			r = (uint8)(red * 255);
			g = (uint8)(green * 255);
			b = (uint8)(blue * 255);
			a = (uint8)(alpha * 255);
		}

		public this()
		{
			r = g = b = a = 0;
		}

		public float rf
		{
			[Inline]
			get
			{
				return r / 255f;
			}

			[Inline]
			set mut
			{
				r = (uint8)(value * 255);
			}
		}

		public float gf
		{
			[Inline]
			get
			{
				return g / 255f;
			}

			[Inline]
			set mut
			{
				g = (uint8)(value * 255);
			}
		}

		public float bf
		{
			[Inline]
			get
			{
				return b / 255f;
			}

			[Inline]
			set mut
			{
				b = (uint8)(value * 255);
			}
		}

		public float af
		{
			[Inline]
			get
			{
				return a / 255f;
			}

			[Inline]
			set mut
			{
				a = (uint8)(value * 255);
			}
		}

		public override void ToString(String strBuffer)
		{
			strBuffer.Append("RGBA [#");
			strBuffer.AppendF("{0:X2}", r);
			strBuffer.AppendF("{0:X2}", g);
			strBuffer.AppendF("{0:X2}", b);
			strBuffer.AppendF("{0:X2}", a);
			strBuffer.Append("]");

			/*strBuffer.Set("Color [ ");
			((uint)R).ToString(strBuffer);
			strBuffer.Append(", ");
			((uint)G).ToString(strBuffer);
			strBuffer.Append(", ");
			((uint)B).ToString(strBuffer);
			strBuffer.Append(", ");
			((uint)A).ToString(strBuffer);
			strBuffer.Append(" ]");*/
		}

		public uint32 ABGR => (((uint32)a) << 24) | (((uint32)b) << 16) | (((uint32)b) << 8) | ((uint32)r);

		static public Color Lerp(Color a, Color b, float t)
		{
			return Color(
				Math.Lerp(a.rf, b.rf, t),
				Math.Lerp(a.gf, b.gf, t),
				Math.Lerp(a.bf, b.bf, t),
				Math.Lerp(a.af, b.af, t)
				);
		}

		static public implicit operator Color(uint32 from)
		{
			return Color(
				(uint8)((from >> 24) & 0xFF),
				(uint8)((from >> 16) & 0xFF),
				(uint8)((from >> 8) & 0xFF),
				(uint8)(from & 0xFF)
				);
		}

		static public implicit operator uint32(Color from)
		{
			return (((uint32)from.r) << 24) | (((uint32)from.g) << 16) | (((uint32)from.b) << 8) | ((uint32)from.a);
		}

		static public implicit operator Vector4(Color from) => .(from.rf, from.gf, from.bf, from.af);
		static public implicit operator Color(Vector4 from) => .(from.x, from.y, from.z, from.w);

		static public Color operator/(Color a, Color b)
		{
			return Lerp(a, b, 0.5f);
		}

		static public Color operator*(Color color, float b)
		{
			return .((uint8)(color.r * b), (uint8)(color.g * b), (uint8)(color.b * b), (uint8)(color.a * b));
		}

		static public Color operator+(Color color, Color b)
		{
			return .((uint8)(color.r + color.r), (uint8)(color.g + color.g), (uint8)(color.b + color.b), (uint8)(color.a + color.a));
		}

		static public Color operator-(Color color, Color b)
		{
			return .((uint8)(color.r - color.r), (uint8)(color.g - color.g), (uint8)(color.b - color.b), (uint8)(color.a - color.a));
		}

		/*static public Color operator*(Color color, float b)
		{
			return .((uint8)(color.R * b), (uint8)(color.G * b), (uint8)(color.B * b), color.A);
		}

		static public Color operator*(Color dest, Color src)
		{
			if (src.A != 0)
			{
				if (dest.A == 0)
				{
					return ToPremultiplied(src.R, src.G, src.B, src.A);
				}
				else
				{
					var sa = MUL_UN8(src.A, 255);
					var ra = dest.A + sa - MUL_UN8(dest.A, sa);

					return .((uint8)(dest.R + ((int)src.R - dest.R) * sa / ra),
						(uint8)(dest.G + ((int)src.G - dest.G) * sa / ra),
						(uint8)(dest.B + ((int)src.B - dest.B) * sa / ra),
						(uint8)ra);
				}
			}
			return .Transparent;
		}

		[Inline]
		private static int MUL_UN8(int a, int b)
		{
			var t = (a * b) + 0x80;
			return (((t >> 8) + t) >> 8);
		}*/

		public int GetHashCode()
		{
			return (uint32)this;
		}

		public void Premultiply() mut
		{
			r = (uint8)((int)r * a / 255);
			g = (uint8)((int)g * a / 255);
			b = (uint8)((int)b * a / 255);
		}

		public Color Premultiplied
		{
			get
			{
				return .((uint8)((int)r * a / 255),
					(uint8)((int)g * a / 255),
					(uint8)((int)b * a / 255), a);
			}
		}

		public Color ToAlpha(uint8 alpha)
		{
			return .(this, alpha);
		}

		public Color ToAlpha(float alpha)
		{
			return .(this, alpha);
		}


		public static Color ToPremultiplied(uint8 R, uint8 G, uint8 B, uint8 A)
		{
			return .((uint8)((int)R * A / 255),
				(uint8)((int)G * A / 255),
				(uint8)((int)B * A / 255),
				A);
		}


		public static Color HSVToColor(float h, float s, float v)
		{
			if (h == 0 && s == 0)
				return Color(v, v, v);

			float c = s * v;
			float x = c * (1 - Math.Abs(h % 2 - 1));
			float m = v - c;

			if (h < 1) return Color(c + m, x + m, m);
			else if (h < 2) return Color(x + m, c + m, m);
			else if (h < 3) return Color(m, c + m, x + m);
			else if (h < 4) return Color(m, x + m, c + m);
			else if (h < 5) return Color(x + m, m, c + m);
			else return Color(c + m, m, x + m);
		}
	}
}
