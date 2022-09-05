namespace Platforms.OpenGL
{
	using System;
	using System.IO;
	using System.Collections;
	using System.Threading;

	using OpenGL;
	using Engine;


    public class RenderTexture : Engine.RenderTexture
    {
		public Engine.ShaderProgram shaderProgram;
		public Engine.VertexArrayObject vertexArrayObject;


		public override Result<void> Initialize()
		{
			this.texture = Engine.platform.CreateTexture();
			this.vertexArrayObject = Engine.platform.CreateVAO();
			this.shaderProgram = Engine.platform.CreateShaderProgram();
			Engine.ShaderStage vertexStage = Engine.platform.CreateShaderStage();
			Engine.ShaderStage fragmentStage = Engine.platform.CreateShaderStage();

			// TODO: Render texture scale might not be correct.
			vertexStage.InitializeFromString(
				"""
				#version 430

				const vec4 vertices[4] = {
				    { -1, -1, 0, 1 },
				    { +1, -1, 0, 1 },
				    { +1, +1, 0, 1 },
				    { -1, +1, 0, 1 }
				};

				const vec2 texCoords[4] = {
				    { 0, 0 }, { 1, 0 }, { 1, 1 }, { 0, 1 }
				};

				out vec2 texPos;

				void main()
				{
				    // render a fullscreen quad, procedurally (the only input is the vertex ID)
				    gl_Position = vertices[gl_VertexID];
				    texPos = texCoords[gl_VertexID];
				}
				""",
				.vertex
			);


			fragmentStage.InitializeFromString(
				"""
				#version 430

				in vec2 texPos;
				out vec4 fragColor;

				uniform sampler2D sampler;

				void main()
				{
				    fragColor = texture(sampler, texPos);
				    if (fragColor.x == 0.0 && fragColor.y == 0.0 && fragColor.z == 0.0)
				    {
				    	fragColor.a = 0.0;
				    }
				}
				""",
				.fragment
			);

			this.vertexArrayObject.Initialize();
			this.shaderProgram.Initialize();
			this.shaderProgram.Attach(vertexStage);
			this.shaderProgram.Attach(fragmentStage);
			if (this.shaderProgram.Compile() case .Err)
			{
				return .Err;
			}
			
			DisposeDelete!(vertexStage);
			DisposeDelete!(fragmentStage);

			return GlDebug.HasErrors();
		}

		public ~this ()
		{
			if (this.vertexArrayObject != null)
			{
				Warning("RenderTexture.VertexArrayObject was not disposed");
			}
			if (this.shaderProgram != null)
			{
				Warning("RenderTexture.ShaderProgram was not disposed");
			}
			if (this.texture != null)
			{
				Warning("RenderTexture.Texture2D was not disposed");
			}
		}

		public override void Dispose()
		{
			DisposeDeleteAndNullify!(this.vertexArrayObject);
			DisposeDeleteAndNullify!(this.texture);
			DisposeDeleteAndNullify!(this.shaderProgram);
		}

		public override void EnsureSize(int width, int height)
		{
			if (this.texture == null)
			{
				this.texture.Initialize(int2(width, height), null, 4);
				return;
			}

			if (this.texture.size.width == width && this.texture.size.height == height)
			{
				return;
			}

			this.texture.Dispose();
			delete this.texture;
			this.texture = Engine.platform.CreateTexture();
			this.texture.filtering = .nearest;
			if (this.texture.Initialize(int2(width, height), null, 4) case .Err)
			{
				Console.WriteLine("ERROR HAPPENED HERE");
				Console.Read();
			}
		}

		public override void Render()
		{
			Gl.UseProgram(this.shaderProgram.identifier);
			Gl.Uniform1i(Gl.GetUniformLocation(this.shaderProgram.identifier, GL_UNIFORM_SAMPLER), 0);
			Gl.ActiveTexture(GL_TEXTURE0);
			Gl.BindTexture(GL_TEXTURE_2D, this.texture.identifier);

			/*Vector2 res = Vector2(192, 192);
			float time = float(GLFW.Glfw.GetTime());
			Gl.Uniform2fv(Gl.GetUniformLocation(this.shaderProgram.identifier, "u_resolution".CStr()), 1, &res.values);
			Gl.Uniform1f(Gl.GetUniformLocation(this.shaderProgram.identifier, "u_time".CStr()), time);*/

			Gl.BindVertexArray(this.vertexArrayObject.identifier);
			Gl.DrawArrays(GL_TRIANGLE_FAN, 0, 4);

			GlDebug.Assert();
		}
    }


}