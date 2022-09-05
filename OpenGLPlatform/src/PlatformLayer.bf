namespace Platforms.OpenGL
{
	using System;
	using Engine;
	using GLFW;
	using OpenGL;


	public class PlatformLayer : Engine.PlatformLayer
	{
		public GlfwWindow* windowHandle;
		public int2 version = int2(4, 5);
		public Glfw.OpenGlProfile profile = .CoreProfile;

		public Platforms.OpenGL.MouseInterface mouseInterface = new .() ~ delete _;
		public Platforms.OpenGL.KeyboardInterface keyboardInterface = new .() ~ delete _;


		public ~this ()
		{
			delete this.title;
		}	


		public override Result<void> Initialize()
		{
			// ...
			this.keyboardInterface.platform = this;
			this.mouseInterface.platform = this;

			// ...
			if (String.IsNullOrEmpty(this.title))
			{
				this.title = new String();
			}
			else if (this.title.IsDynAlloc == false)
			{
				this.title = new String(this.title);
			}

			// ...
			Glfw.Init();

			Glfw.WindowHint(.ContextVersionMajor, this.version.x);
			Glfw.WindowHint(.ContextVersionMinor, this.version.y);
			Glfw.WindowHint(.OpenGlProfile, this.profile);
			Glfw.WindowHint(.Samples, 4);

			this.windowHandle = Glfw.CreateWindow(this.windowResolution.x, this.windowResolution.y, this.title, null, null);
			
			if (this.windowHandle == null)
			{
				Terminate("Unable to create GlfwWindow; Glfw.CreateWindow returned NULL;");
				return .Err;
			}

			// ...
			Glfw.MakeContextCurrent(this.windowHandle);

			// ...
			Glfw.SetFramebufferSizeCallback(this.windowHandle, new => this.FramebufferSizeCallback);

			// ...
			Glfw.SetKeyCallback(this.windowHandle, new => this.keyboardInterface.Callback);
			Glfw.SetMouseButtonCallback(this.windowHandle, new => this.mouseInterface.ButtonCallback);
			Glfw.SetCursorPosCallback(this.windowHandle, new => this.mouseInterface.PositionCallback);
			Glfw.SetScrollCallback(this.windowHandle, new => this.mouseInterface.ScrollCallback);
			
			// ...
			if (Gl.Initialize(=> Glfw.GetProcAddress) == false)
			{
				Terminate("OpenGL initialization failed; Gl.Init returned FALSE;", true);
				return .Err;
			}

			Gl.Viewport(0, 0, this.windowResolution.width, this.windowResolution.height);

			// ...
			CenterWindow();

			return GlDebug.HasErrors();
		}


		public override Result<void> Shutdown()
		{
			if (this.windowHandle != null)
			{
				Glfw.DestroyWindow(this.windowHandle);
			}

			Glfw.Terminate();

			return .Ok;
		}


		void FramebufferSizeCallback(GlfwWindow* window, int width, int height)
		{
			this.windowResolution = int2(width, height);
			Gl.Viewport(0, 0, width, height);
		}




		void CenterWindow ()
		{
			GlfwMonitor* monitor = Glfw.GetPrimaryMonitor();

			int mx = 0;
			int my = 0;
			int mw = 0;
			int mh = 0;

			int left = 0;
			int top = 0;
			int right = 0;
			int bottom = 0;

			int width = 0;
			int height = 0;

			Glfw.GetWindowSize(this.windowHandle, ref width, ref height);
			Glfw.GetWindowSize(this.windowHandle, ref left, ref top, ref right, ref bottom);
			Glfw.GetMonitorWorkarea(monitor, ref mx, ref my, ref mw, ref mh);


			width = width + (left + right);
			height = height + (top + bottom);

			/*Console.WriteLine("left: {0}; top: {1}; right: {2}; bottom: {3}", left, top, right, bottom);
			Console.WriteLine("width: {0}; height: {1}", width, height);*/

			int x = ((mw / 2) - (width / 2)) + left;
			int y = ((mh / 2) - (height / 2)) + top;

			Glfw.SetWindowPos(this.windowHandle, x, y);
		}

		public override void ClearScreen(float r, float g, float b)
		{
			Gl.BindFramebuffer(GL_FRAMEBUFFER, 0);
			Gl.ClearColor(r, g, b, 1F);
			Gl.Clear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
		}

		public override void SwapBuffers()
		{
			Gl.Flush();
			Glfw.SwapBuffers(this.windowHandle);
		}

		public override bool IsPendingClosure()
		{
			return Glfw.WindowShouldClose(this.windowHandle);
		}

		public override void PollEvents()
		{
			Glfw.PollEvents();

		}


		public override Engine.Texture2D CreateTexture()
		{
			return new OpenGL.Texture2D();
		}

		public override Engine.ShaderStage CreateShaderStage()
		{
			return new OpenGL.ShaderStage();
		}

		public override Engine.ShaderProgram CreateShaderProgram()
		{
			return new OpenGL.ShaderProgram();
		}
		public override Engine.VertexArrayObject CreateVAO()
		{
			return new OpenGL.VertexArrayObject();
		}
		public override Engine.ComputeShader CreateComputeShader()
		{
			return new OpenGL.ComputeShader();
		}
		public override Engine.ShaderStorageBuffer CreateShaderStorageBuffer()
		{
			return new OpenGL.ShaderStorageBuffer();
		}

		public override void SetTitle(StringView string)
		{
			this.title.Clear();
			this.title.Append(string);
			Glfw.SetWindowTitle(this.windowHandle, this.title);
		}

		public override void SetTitle(StringView string, params Object[] args)
		{
			this.title.Clear();
			this.title.AppendF(string, params args);
			Glfw.SetWindowTitle(this.windowHandle, this.title);
		}

		public override Mouse.InputMode GetMouseInputMode()
		{
			var mode = (GlfwInput.CursorInputMode)Glfw.GetInputMode(this.windowHandle, .Cursor);
			switch (mode)
			{
				case .Normal: return .normal;
				case .Hidded: return .hidded;
				case .Disabled: return .disabled;
			}
		}

		public override void SetMouseInputMode(Mouse.InputMode inputMode)
		{
			GlfwInput.CursorInputMode glfwInputMode;

			switch (inputMode)
			{
				case .normal: glfwInputMode = .Normal; break;
				case .hidded: glfwInputMode = .Hidded; break;
				case .disabled: glfwInputMode = .Disabled; break;
			}

			Glfw.SetInputMode(this.windowHandle, .Cursor, glfwInputMode);
		}

		public override Engine.RenderTexture CreateRenderTexture()
		{
			return new Platforms.OpenGL.RenderTexture();
		}
	}


}