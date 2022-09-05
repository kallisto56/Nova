namespace Engine
{
	using System;
	using System.Collections;
	using System.IO;
	



	public class Image
	{
		public uint8[] data = null;
		public int2 size;
		public ImageFormat format;


		/*public struct Range
		{
			public Image image;

			public int x;
			public int y;
			public int width;
			public int height;

			public this (Image image, int x, int y, int width, int height)
			{
				this.image = image;
				this.x = x;
				this.y = y;
				this.width = width;
				this.height = height;
			}

			public Color GetPixel (int x, int y)
			{
				if (this.x + x > this.width || this.y + y > this.height)
				{
					Error("Out of bounds");
				}
				return this.image.GetPixel(this.x + x, this.y + y);
			}

			public Vector3 GetPixelAsVector3 (int x, int y)
			{
				if (this.x + x > this.width || this.y + y > this.height)
				{
					Error("Out of bounds");
				}
				return this.image.GetPixelAsVector3(this.x + x, this.y + y);
			}
		}*/


		public enum ImageFormat
		{
			G = 1, // grey
			GA = 2, // grey, alpha
			RGB = 3, // red, green, blue
			RGBA = 4 // red, green, blue, alpha
		}



		public static Result<void> LoadFromFile (Image image, String filename, int desiredChannels = 0)
		{
			LogLine("Image.LoadFromFile(image: {0}, filename: '{1}', desiredChannels: {2})", image, filename, desiredChannels);
			if (File.Exists(filename) == false)
			{
				return .Err("Unable to load image, because file does not exists.");
			}

			int width = 0;
			int height = 0;
			int numChannels = desiredChannels;

			// Loading image with STB_IMAGE
			void* data = Imaging.LoadImageFromFile(filename.CStr(), &width, &height, &numChannels, .defaultFormat);
			if (data == null)
			{
				return .Err("Unable to load image. Format of image is either not supported or file is corrupted.");
			}

			// Creating uint8 array and copying data from C-side to Beef
			image.data = new uint8[width * height * numChannels];
			System.Internal.MemCpy(image.data.CArray(), data, image.data.Count);
			Imaging.FreeImage(data);

			image.size = int2(width, height);
			image.format = (ImageFormat)numChannels;

			return .Ok;
		}


		public static Result<void> Create (Image image, int2 size, ImageFormat format)
		{
			image.size = size;
			image.format = format;
			image.data = new uint8[size.x * size.y * int(format)];

			Random random = scope Random();
			for (int x = 0; x < image.size.width; x++)
			{
				for (int y = 0; y < image.size.height; y++)
				{
					uint8 r = uint8(Math.Lerp(0F, 255F, Math.InverseLerp(0, image.size.width, x)));
					uint8 g = uint8(Math.Lerp(0F, 255F, Math.InverseLerp(0, image.size.height, y)));
					uint8 b = uint8(Math.Lerp(0F, 255F, Math.InverseLerp(0, image.data.Count, y * image.size.width + x)));
					uint8 a = 255;

					r = uint8(random.Next(0, 255));
					g = uint8(random.Next(0, 255));
					b = uint8(random.Next(0, 255));

					image.SetPixel(int2(x, y), Color(r, g, b, a));
				}
			}
			
			return .Ok;
		}


		public Color GetPixel (int x, int y)
		{
			int key = y * this.size.width + x;

			if (key < 0 || key >= this.data.Count)
			{
				Error("Index out of range. Index: {0}, data length: {1}", key, this.data.Count);
			}

			uint8 r = this.data[key * 3 + 0];
			uint8 g = this.data[key * 3 + 1];
			uint8 b = this.data[key * 3 + 2];

			return Color(r, g, b);
		}


		public Vector3 GetPixelAsVector3 (int x, int y, bool isSigned = false)
		{
			int key = y * this.size.width + x;

			if (key < 0 || key >= this.data.Count)
			{
				Error("Index out of range. Index: {0}, data length: {1}", key, this.data.Count);
			}

			if (isSigned == true)
			{
				float r = (float(this.data[key * 3 + 0]) - 127F) / 255F;
				float g = (float(this.data[key * 3 + 1]) - 127F) / 255F;
				float b = (float(this.data[key * 3 + 2]) - 127F) / 255F;

				return Vector3(r, g, b);
			}
			else
			{
				float r = float(this.data[key * 3 + 0]);
				float g = float(this.data[key * 3 + 1]);
				float b = float(this.data[key * 3 + 2]);

				return Vector3(r, g, b);
			}
		}


		public Color GetPixel (int2 uv)
		{
			int key = uv.y * this.size.width + uv.x;

			return Color(
				this.data[key * 3 + 0],
				this.data[key * 3 + 1],
				this.data[key * 3 + 2]
			);
		}


		public void SetPixel (int2 uv, Color color)
		{
			int key = (uv.y * this.size.width + uv.x);
			/*Console.WriteLine("key: {0}, uv: {1}, color: {2}", key, uv, color);*/

			if (key < 0 || key >= this.data.Count)
			{
				Error("Index out of bounds");
			}

			int countChannels = int(format);

			this.data[key * countChannels + 0] = color.r;
			if (countChannels == 1) return;

			this.data[key * countChannels + 1] = color.g;
			if (countChannels == 2) return;

			this.data[key * countChannels + 2] = color.b;
			if (countChannels == 3) return;

			this.data[key * countChannels + 3] = color.a;
		}



		public ~this ()
		{
			if (this.data != null)
			{
				delete this.data;
				this.data = null;
			}
		}


	}


}