namespace Game
{
	using System;
	using Engine;


    public class Surface
	{
		public int numChannels = 4;

		public int2 screenSize;
		public int2 pixelSize;

		public Pixel[] pixels;
		public uint8[] output;

		public bool hasChanged = true;


		public this ()
		{
			
		}


		public ~this ()
		{
			if (this.pixels != null) delete this.pixels;
			if (this.output != null) delete this.output;
		}


		public void SetPixel (int2 position, Color color)
		{
			this.hasChanged = true;
			
			int x = position.x;
			int y = position.y;
			int key = ((y * this.screenSize.width) + x);
			key = (this.pixels.Count - 1) - key;

			if (key < 0 || key >= this.pixels.Count)
			{
				Warning("Attempt to write outside of bounds. Pixel coords: {0};", position);
				return;
			}
			this.pixels[key] = Pixel(int2(x, y), color);
		}


		public Pixel GetPixel (int2 position)
		{
			int x = position.x;
			int y = position.y;
			int key = ((y * this.screenSize.width) + x);
			/*key = (this.pixels.Count - 1) - key;*/
			return this.pixels[key];
		}


		public void SetSize (int2 size, int2 pixelSize)
		{
			this.Resize(size, pixelSize);
		}


		public void Resize (int2 size, int2 pixelSize)
		{

			if (this.screenSize == size && this.pixelSize == pixelSize)
			{
				return;
			}

			this.screenSize = size;
			this.pixelSize = pixelSize;

			if (this.pixels != null) delete this.pixels;
			if (this.output != null) delete this.output;

			int imageLength = (size.x * size.y) * this.numChannels;

			this.output = new uint8[imageLength];
			this.pixels = new Pixel[this.screenSize.x * this.screenSize.y];
		}


		public void Render ()
		{
			int index = 0;
			for (int n = 0; n < this.pixels.Count; n++)
			{
				Pixel pixel = this.pixels[n];

				this.output[index + 0] = pixel.color.r;
				this.output[index + 1] = pixel.color.g;
				this.output[index + 2] = pixel.color.b;
				this.output[index + 3] = pixel.color.a;

				index += 4;
			}

			this.hasChanged = false;
		}


		public void Clear ()
		{
			Color color = Color(0,0,0,0);

			for (int n = 0; n < this.pixels.Count; n++)
			{
				this.pixels[n].color = color;
			}
		}


	}


}