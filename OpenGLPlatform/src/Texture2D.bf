namespace Platforms.OpenGL
{
	using System;
	using Engine;
	using GLFW;
	using OpenGL;


	public class Texture2D : Engine.Texture2D
	{

		public override Result<void> Initialize (int2 size, void* arrayPointer, int countChannels, InputFormat inputFormat, InternalFormat internalFormat)
		{
			LogLine("Texture2D.Initialize(size: {0}, data: {1}, countChannels: {2}, inputFormat: {3}, internalFormat: {4});", size, arrayPointer, countChannels, inputFormat, internalFormat);
			if (this.identifier != 0)
			{
				Error("Attempt to initialize Texture2D twice.");
				return .Err;
			}

			if (size.width <= 0 || size.height <= 0)
			{
				Error("Attemp to initialize texture with zero or negative size");
			}

			this.size = size;
			this.countChannels = countChannels;
			this.inputFormat = inputFormat;
			this.internalFormat = internalFormat;

			Gl.GenTextures(1, &this.identifier);
			Gl.BindTexture(GL_TEXTURE_2D, this.identifier);

			switch (this.filtering)
			{
			case .nearest:
				Gl.TexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
				Gl.TexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST_MIPMAP_NEAREST);
				break;

			case .linear:
				Gl.TexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
				Gl.TexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR_MIPMAP_LINEAR);
				break;
			}

			// ...
			int mipmapLevel = 0;
			int _internalFormat;
			uint dataFormat;
			uint dataType;

			switch (this.internalFormat)
			{
			case .rgb8: _internalFormat = GL_RGB8; break;
			case .rgb32: _internalFormat = GL_RGB32I; break;
			case .rgba32: _internalFormat = GL_RGBA32I; break;
			case .rgba32f: _internalFormat = GL_RGBA32F; break;
			case .rgba8: _internalFormat = GL_RGBA8; break;
			}

			if (countChannels == 1)
			{
				dataFormat = GL_R;
			}
			else if (countChannels == 2)
			{
				dataFormat = GL_RG;
			}
			else if (countChannels == 3)
			{
				dataFormat = GL_RGB;
			}
			else if (countChannels == 4)
			{
				dataFormat = GL_RGBA;
			}
			else
			{
				ThrowUnimplemented();
			}

			switch (this.inputFormat)
			{
			case .float: dataType = GL_FLOAT; break;
			case .unsignedByte: dataType = GL_UNSIGNED_BYTE; break;
			case .unsignedInteger: dataType = GL_UNSIGNED_INT; break;
			}


			//GlTexImage2D(uint target, int level, int internalformat, int width, int height, int border, uint format, uint type, void* pixels);
			Gl.TexImage2D(GL_TEXTURE_2D, mipmapLevel, _internalFormat, this.size.width, this.size.height, 0, dataFormat, dataType, arrayPointer == null ? null : arrayPointer);
			/*Gl.TexImage2D(GL_TEXTURE_2D, 0, GL_RGBA32F, this.size.width, this.size.height, 0, GL_RGBA, GL_UNSIGNED_BYTE, arrayPointer);*/
			Gl.GenerateMipmap(GL_TEXTURE_2D);

			Gl.BindTexture(GL_TEXTURE_2D, 0);

			return GlDebug.HasErrors();
		}

		public override Result<void> SetData (void* arrayPointer)
		{
			/*Gl.DeleteTextures(1, &this.identifier);
			this.identifier = 0;
			return this.Initialize(this.size, arrayPointer, 4, .unsignedByte, .rgba32f);*/

			Gl.BindTexture(GL_TEXTURE_2D, this.identifier);
			GlDebug.HasErrors();
			
			uint dataType;
			switch (this.inputFormat)
			{
			case .float: dataType = GL_FLOAT; break;
			case .unsignedByte: dataType = GL_UNSIGNED_BYTE; break;
			case .unsignedInteger: dataType = GL_UNSIGNED_INT; break;
			}

			/*Gl.TextureSubImage2D(GL_TEXTURE_2D, 0, 0, 0, this.size.width, this.size.height, GL_RGBA32F, GL_UNSIGNED_BYTE, arrayPointer);*/
			Gl.TexSubImage2D(GL_TEXTURE_2D, 0, 0, 0, this.size.width, this.size.height, GL_RGBA, GL_UNSIGNED_BYTE, arrayPointer);
			GlDebug.HasErrors();
			Gl.BindTexture(GL_TEXTURE_2D, 0);

			return GlDebug.HasErrors();
		}

		public override Result<void> SetData (Image image)
		{
			return this.SetData(image.data.CArray());
		}

		public ~this ()
		{
			if (this.identifier != 0)
			{
				Warning("Texture2D was not disposed.");
				Console.Read();
			}
		}

		public override void Dispose()
		{
			if (this.identifier != 0)
			{
				Gl.DeleteTextures(1, &this.identifier);
				this.identifier = 0;
			}
		}
	}
}