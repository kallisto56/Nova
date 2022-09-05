namespace Platforms.OpenGL
{
	using System;
	using System.IO;
	using Engine;

	using OpenGL;


	public class ShaderStage : Engine.ShaderStage
	{
		public override Result<void> InitializeFromFile (String filename, ShaderType type)
		{
			if (this.identifier != 0)
			{
				Error("Attempt to initialize shader stage twice.");
			}

			this.filename = new String(filename);

			if (File.Exists(filename) == false)
			{
				Runtime.FatalError(scope $"Unable to load shader at '{filename}'. File does not exists.");
			}

			var sourceCode = scope String();
			File.ReadAllText(filename, sourceCode);
			return this.InitializeFromString(sourceCode, type);
		}


		public override Result<void> InitializeFromString (String sourceCode, ShaderType type)
		{
			this.identifier = Gl.CreateShader(DetermineType(type));
			this.type = type;
			int32 length = (int32)sourceCode.Length;
			char8* data = sourceCode.CStr();
			Gl.ShaderSource(this.identifier, 1, &data, &length);
			Gl.CompileShader(this.identifier);

			int32 result = 0;
			Gl.GetShaderiv(this.identifier, GL_COMPILE_STATUS, &result);

			if (result != 1)
			{
				int32 infoLogLength = 0;
				Gl.GetShaderiv(this.identifier, GL_INFO_LOG_LENGTH, &infoLogLength);

				var infoLog = scope char8[infoLogLength];
				Gl.GetShaderInfoLog(this.identifier, infoLogLength, null, infoLog.CArray());
				var infoLogString = scope String(infoLog, 0, infoLogLength);

				Console.WriteLine(infoLogString);
				Error("Shader compilation failed. Identifier: {0}; infoLogLength: {1}; infoLog: {2}", this.identifier, infoLogLength, infoLogString);
				Runtime.FatalError(scope $"Shader compilation failed.");
			}

			return GlDebug.HasErrors();
		}


		static uint DetermineType (ShaderType type)
		{
			switch (type)
			{
			case .vertex: return GL_VERTEX_SHADER;
			case .fragment: return GL_FRAGMENT_SHADER;
			case .compute: return GL_COMPUTE_SHADER;
			}
		}


		public ~this ()
		{
			if (this.identifier != 0)
			{
				Warning("ShaderStage was not disposed.");
				Console.Read();
			}

		}


		public override void Dispose()
		{
			if (this.identifier != 0)
			{
				Gl.DeleteShader(this.identifier);
				this.identifier = 0;
			}

			if (this.filename != null && this.filename.IsDynAlloc == false)
			{
				DeleteAndNullify!(this.filename);
			}
		}
	}
}