namespace Platforms.OpenGL
{
	using System;
	using Engine;

	using OpenGL;


	public class ComputeShader : Engine.ComputeShader
	{
		public override Result<void> Initialize(String filename)
		{
			if (this.identifier != 0)
			{
				Error("Attempt to initialize ComputeShader twice.");
				return .Err;
			}

			this.identifier = Gl.CreateProgram();

			OpenGL.ShaderStage shaderStage = scope .();
			shaderStage.InitializeFromFile(filename, .compute);

			Gl.AttachShader(this.identifier, shaderStage.identifier);
			Gl.LinkProgram(this.identifier);

			int32 linkStatus = 0;
			Gl.GetProgramiv(this.identifier, GL_LINK_STATUS, &linkStatus);

			if (linkStatus != 1)
			{
				int32 infoLogLength = 0;
				Gl.GetProgramiv(this.identifier, GL_INFO_LOG_LENGTH, &infoLogLength);

				// Retrieving message
				String infoLog = scope String(infoLogLength);
				Gl.GetProgramInfoLog(this.identifier, infoLogLength, null, infoLog.CStr());

				Console.WriteLine(infoLog);
				Error(scope $"Shader linking failed. Identifier: {this.identifier}");
			}

			shaderStage.Dispose();
			return GlDebug.HasErrors();
		}

		public ~this ()
		{
			if (this.identifier != 0)
			{
				Warning("ComputeShader was not disposed.");
				Console.Read();
			}
		}

		public override void Dispose()
		{
			if (this.identifier != 0)
			{
				Gl.DeleteProgram(this.identifier);
				this.identifier = 0;
			}
		}

		public override Result<void> Dispatch(int x, int y = 1, int z = 1)
		{
			if (z != 1) ThrowUnimplemented();
			Gl.UseProgram(this.identifier);

			var lsize = scope int32[3] (0,0,0);
			Gl.GetProgramiv(this.identifier, GL_COMPUTE_WORK_GROUP_SIZE, lsize.CArray());

			let numGroupsX = (uint)(x + lsize[0]-1) / (uint)lsize[0];
			let numGroupsY = (uint)(y + lsize[1]-1) / (uint)lsize[1];
			let numGroupsZ = 1;

			/*Console.WriteLine("ComputeShader.Dispatch({0}, {1}, {2})", numGroupsX, numGroupsY, numGroupsZ);*/
			Gl.DispatchCompute(numGroupsX, numGroupsY, numGroupsZ);

			Gl.MemoryBarrier(GL_SHADER_IMAGE_ACCESS_BARRIER_BIT);
			Gl.MemoryBarrier(GL_SHADER_STORAGE_BARRIER_BIT);

			return GlDebug.HasErrors();
		}
		public override Result<void> SetData(String name, Engine.Texture2D texture)
		{
			Gl.UseProgram(this.identifier);
			Gl.BindImageTexture(0, texture.identifier, 0, GL_FALSE, 0, GL_WRITE_ONLY, GL_RGBA32F);
			return GlDebug.HasErrors();
		}

		public override Result<void> SetData(String name, int x, int y)
		{
			Gl.UseProgram(this.identifier);
			let location = Gl.GetUniformLocation(this.identifier, name.CStr());
			if (location == -1)
			{
				Error("ComputeShader.SetData: Target with specified name ({0}) not found.", name);
				return .Err;
			}

			Gl.Uniform2i(location, x, y);
			return GlDebug.HasErrors();
		}

		public override Result<void> SetData(String name, ref Matrix4x4 matrix)
		{
			Gl.UseProgram(this.identifier);
			let location = Gl.GetUniformLocation(this.identifier, name.CStr());
			Gl.UniformMatrix4fv(location, 1, GL_FALSE, &matrix.values);
			return GlDebug.HasErrors();
		}

		public override Result<void> SetData(uint location, Engine.ShaderStorageBuffer buffer)
		{
			Gl.BindBufferBase(GL_SHADER_STORAGE_BUFFER, location, buffer.identifier);
			return GlDebug.HasErrors();
		}

		public override Result<void> SetData(String name, float x, float y)
		{
			Gl.UseProgram(this.identifier);
			let location = Gl.GetUniformLocation(this.identifier, name.CStr());
			if (location == -1)
			{
				Error("ComputeShader.SetData: Target with specified name ({0}) not found.", name);
				return .Err;
			}

			Gl.Uniform2f(location, x, y);
			return GlDebug.HasErrors();
		}
	}


}