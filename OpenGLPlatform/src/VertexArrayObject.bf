namespace Platforms.OpenGL
{
	using System;
	using Engine;
	using OpenGL;


	public class VertexArrayObject : Engine.VertexArrayObject
	{
		public override Result<void> Initialize()
		{
			if (this.identifier != 0)
			{
				Error("Attempt to initialize Vertex Array Object twice");
				return .Err;
			}

			Gl.GenVertexArrays(1, &this.identifier);

			return GlDebug.HasErrors();
		}

		public ~this ()
		{
			if (this.identifier != 0)
			{
				Warning("VertexArrayObject was not disposed.");
				Console.Read();
			}
		}

		public override void Dispose()
		{
			if (this.identifier != 0)
			{
				Gl.DeleteVertexArrays(1, &this.identifier);
				this.identifier = 0;
			}
		}
	}


}