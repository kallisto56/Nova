namespace Platforms.OpenGL
{
	using System;
	using Engine;
	using OpenGL;


	public class ShaderStorageBuffer : Engine.ShaderStorageBuffer
	{

		public override Result<void> Initialize(void* data, StorageUsage usage, DataType type, int countElements)
		{
			let sizeofElement = GetSizeOfElement(type);
			this.capacity = countElements * sizeofElement;

			LogLine("ShaderStorageBuffer.Initialize(data: {0}, usage: {1}, type: {2}, countElements: {3}; kbytes: {4});", data, usage, type, countElements, float(this.capacity) / 1024F);

			Gl.GenBuffers(1, &this.identifier);
			Gl.BindBuffer(GL_SHADER_STORAGE_BUFFER, this.identifier);
			Gl.BufferData(GL_SHADER_STORAGE_BUFFER, this.capacity, data == null ? null : data, DetermineUsage(usage));

			return GlDebug.HasErrors();
		}

		public override Result<void> SetData(void* data, int offset, int length)
		{
			/*LogLine("ShaderStorageBuffer.SetData(data: {0}, offset: {1}, length: {2});", data, offset, length);
			LogLine("Capacity: {0}, offset: {1}, length: {2}, offset+length: {3};",  this.capacity, offset, length, offset + length);*/

			Gl.BindBuffer(GL_SHADER_STORAGE_BUFFER, this.identifier);
			Gl.BufferSubData(GL_SHADER_STORAGE_BUFFER, offset, length, data);
			Gl.BindBuffer(GL_SHADER_STORAGE_BUFFER, 0);
			return GlDebug.HasErrors();
		}

		public static int GetSizeOfElement (DataType type)
		{
			switch (type)
			{
			case .matrix4x4: return sizeof(float) * 16;
			case .uint32: return sizeof(uint32);
			case .uint64: return sizeof(uint64);
			case .vector4: return sizeof(float) * 4;
			}
		}

		public static uint DetermineUsage (StorageUsage usage)
		{
			switch (usage)
			{
			case .GL_STREAM_DRAW: return GL_STREAM_DRAW;
			case .GL_STREAM_READ: return GL_STREAM_READ;
			case .GL_STREAM_COPY: return GL_STREAM_COPY;
			case .GL_STATIC_DRAW: return GL_STATIC_DRAW;
			case .GL_STATIC_READ: return GL_STATIC_READ;
			case .GL_STATIC_COPY: return GL_STATIC_COPY;
			case .GL_DYNAMIC_DRAW: return GL_DYNAMIC_DRAW;
			case .GL_DYNAMIC_READ: return GL_DYNAMIC_READ;
			case .GL_DYNAMIC_COPY: return GL_DYNAMIC_COPY;
			}
		}

		public ~this ()
		{
			if (this.identifier != 0)
			{
				Warning("ShaderStorageBuffer was not disposed.");
				Console.Read();
			}
		}

		public override void Dispose()
		{
			if (this.identifier != 0)
			{
				Gl.DeleteBuffers(1, &this.identifier);
				this.identifier = 0;
			}
		}
	}
}