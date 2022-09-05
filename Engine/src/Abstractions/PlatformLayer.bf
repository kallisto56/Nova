namespace Engine
{
	using System;


	public abstract class PlatformLayer
	{
		public int2 windowResolution = int2(1280, 768);
		public String title;

		public abstract Result<void> Initialize ();
		public abstract Result<void> Shutdown ();

		public abstract bool IsPendingClosure ();

		public abstract void PollEvents ();
		public abstract void ClearScreen (float r, float g, float b);
		public abstract void SwapBuffers ();

		public abstract void SetTitle (StringView string);
		public abstract void SetTitle (StringView string, params Object[] args);

		public abstract Mouse.InputMode GetMouseInputMode ();
		public abstract void SetMouseInputMode (Mouse.InputMode inputMode);

		public abstract Texture2D CreateTexture();
		public abstract ShaderStage CreateShaderStage();
		public abstract ShaderProgram CreateShaderProgram();
		public abstract VertexArrayObject CreateVAO();
		public abstract RenderTexture CreateRenderTexture ();
		public abstract ComputeShader CreateComputeShader ();
		public abstract ShaderStorageBuffer CreateShaderStorageBuffer ();
	}


}