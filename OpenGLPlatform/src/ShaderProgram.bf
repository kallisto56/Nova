namespace Platforms.OpenGL
{
	using System;
	using Engine;

	using OpenGL;


	public class ShaderProgram : Engine.ShaderProgram
	{
		public override Result<void> Initialize()
		{
			if (this.identifier != 0)
			{
				Error("Attempt to initialize shader stage twice.");
			}

			this.identifier = Gl.CreateProgram();
			return GlDebug.HasErrors();
		}

		public override Result<void> Attach(Engine.ShaderStage shaderStage)
		{
			Gl.AttachShader(this.identifier, shaderStage.identifier);
			return GlDebug.HasErrors();
		}

		public override Result<void> Compile()
		{
			if (this.identifier == 0)
			{
				Error("ShaderProgram: Identifier of the shader equals zero, which means that it was not initialized.");
			}

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

				Console.WriteLine("\n{0}", infoLog);
				//Runtime.FatalError(scope $"Shader linking failed. Shader name: '{this.name}'; Identifier: {this.identifier}");
				Error(scope $"Shader linking failed. Identifier: {this.identifier}");
				return .Err;
			}

			return GlDebug.HasErrors();
		}

		public override void Bind()
		{
			Gl.UseProgram(this.identifier);
		}

		public override void Unbind()
		{
			Gl.UseProgram(0);
		}

		public ~this ()
		{
			if (this.identifier != 0)
			{
				Warning("ShaderProgram was not disposed.");
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
	}
}