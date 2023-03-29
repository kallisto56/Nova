namespace test.Program;


using System;
using System.Collections;
using System.Diagnostics;
using System.Engine;
using System.Math;


class Test_QuadDepth
{
	static uint32 countIndices;
    static Buffer vertexBuffer;
    static Buffer indexBuffer;
    static ShaderModule[] shaders;
    static Pipeline pipeline;

	static ResourceSet uniformSet;
	static ResourceLayout uniformLayout;
	static Buffer uniformBuffer;

	static ResourceLayout[] resourceLayouts;
	static Pipeline.VertexLayoutDescription[] vertexLayout;


	static Result<void, Error> OnInitialize (Engine e)
	{
		/*ResourceFactory factory = e.graphicsContext.GetResourceFactory();*/
		GraphicsContext context = e.graphicsContext;
		Swapchain swapchain = e.graphicsContext.GetSwapchain();
		RenderPass renderPass = swapchain.GetRenderPass();
		Framebuffer framebuffer = swapchain.GetFramebuffer();

		// Vertices
		{
			float FRNT = -5F;
			float BACK = -25F;
		    VertexPositionColor[] vertices = scope VertexPositionColor[]
		    (
				VertexPositionColor(Vector3(+032F, +128F, FRNT), Color<float>(0F, 0F, 1F, 0.5F)), // 0
				VertexPositionColor(Vector3(+128F, +128F, FRNT), Color<float>(0F, 1F, 0F, 0.5F)), // 1
				VertexPositionColor(Vector3(+032F, +032F, FRNT), Color<float>(1F, 0F, 0F, 0.5F)), // 2
				VertexPositionColor(Vector3(+128F, +032F, FRNT), Color<float>(0F, 0F, 0F, 0.5F)), // 3

				VertexPositionColor(Vector3(+048F, +512F, BACK), Color<float>(1F, 0F, 0F, 0.5F)), // 4
				VertexPositionColor(Vector3(+512F, +512F, BACK), Color<float>(0F, 1F, 0F, 0.5F)), // 5
				VertexPositionColor(Vector3(+048F, +048F, BACK), Color<float>(0F, 0F, 1F, 0.5F)), // 6
				VertexPositionColor(Vector3(+512F, +048F, BACK), Color<float>(1F, 1F, 1F, 0.5F)), // 7
		    );

		    Self.vertexBuffer = context.Create(.Vertex<VertexPositionColor>(vertices.Count))
				.Resolve!();

		    e.graphicsContext.UpdateBuffer(Self.vertexBuffer, offsetInBytes: 0, Self.vertexBuffer.sizeInBytes, vertices.CArray())
				.Resolve!();
		}

		// Indices
		{
		    uint16[] indices = scope uint16[] (
				0, 1, 2,
				1, 2, 3,
				4, 5, 6,
				5, 6, 7,
			);

			Self.countIndices = uint32(indices.Count);

		    Self.indexBuffer = context.Create(.Index(indices.Count, .uint16))
				.Resolve!();

			e.graphicsContext.UpdateBuffer(Self.indexBuffer, offsetInBytes: 0, Self.indexBuffer.sizeInBytes, indices.CArray())
				.Resolve!();
		}

		// Uniform buffer
		{
			uint64 sizeInBytes = sizeof(UniformBufferObject);
			Self.uniformBuffer = context.Create(Buffer.Description(sizeInBytes, .uniformBuffer))
				.Resolve!();

			UniformBufferObject ubo = UniformBufferObject.GetValue(e.window);
			e.graphicsContext.UpdateBuffer(Self.uniformBuffer, offsetInBytes: 0, Self.uniformBuffer.sizeInBytes, &ubo)
				.Resolve!();
			
			Self.uniformLayout = context.Create(ResourceLayout.Description(
				ResourceLayout.ElementDescription("ubo", .UniformBuffer, .vertex)
			)).Resolve!();

			Self.uniformSet = context.Create(ResourceSet.Description(
				Self.uniformLayout, Self.uniformBuffer
			)).Resolve!();
		}

		List<uint8> vertexShaderSourceCode = scope List<uint8>();
		List<uint8> fragmentShaderSourceCode = scope List<uint8>();
		System.IO.File.ReadAll("./dist/shaders/Test_QuadDepth/vertex.shader.spirv", vertexShaderSourceCode);
		System.IO.File.ReadAll("./dist/shaders/Test_QuadDepth/fragment.shader.spirv", fragmentShaderSourceCode);

		ShaderModule.Description vertexShaderDesc = ShaderModule.Description(.vertex, vertexShaderSourceCode);
		ShaderModule.Description fragmentShaderDesc = ShaderModule.Description(.fragment, fragmentShaderSourceCode);

		Self.shaders = new ShaderModule[2];
		context.CompileShaders(Self.shaders, vertexShaderDesc, fragmentShaderDesc).Resolve!();

		// Create pipeline
		Pipeline.GraphicsDescription pipelineDescription = Pipeline.GraphicsDescription()
		{
			renderPass = renderPass,
			outputs = framebuffer.outputDescription,
			blendState = .singleOverrideBlend,
			primitiveTopology = .triangleList,
		};

		pipelineDescription.depthStencilState = Pipeline.DepthStencilStateDescription()
	    {
			DepthTestEnabled = true,
			DepthWriteEnabled = true,
			DepthComparison = .LessEqual
		};

		pipelineDescription.rasterizerState = Pipeline.RasterizerStateDescription(
		    cullMode: .None,
		    fillMode: .Solid,
		    frontFace: .Clockwise,
		    depthClipEnabled: true,
		    scissorTestEnabled: false
		);

		pipelineDescription.resourceLayouts = Self.resourceLayouts = new ResourceLayout[](Self.uniformLayout);
		pipelineDescription.shaderSet = Pipeline.ShaderSetDescription(
		    vertexLayouts: Self.vertexLayout = new Pipeline.VertexLayoutDescription[] (VertexPositionColor.GetLayout()),
		    shaders: Self.shaders
		);

		Self.pipeline = context.Create(pipelineDescription)
			.Resolve!();
		
		return .Ok;
	}


	static Result<void, Error> OnUpdate (Engine engine)
	{
		return .Ok;
	}

	static float FRNT = -5F;
	static float BACK = -3F;

	static Result<void, Error> UpdateBuffers (Engine e)
	{
		e.currentTime++;

		Self.FRNT = Math.Abs(Math.Cos(e.currentTime * 0.05F) * 10);
		Self.BACK = 5F;

		float FRNT = Self.FRNT - 4;
		float BACK = 3;//Self.BACK;

		FRNT = Math.Min(FRNT, 5F);
		FRNT = Math.Max(FRNT, 0F);

		/*Tracy.WriteLine("FRNT: {0,10}; BACK: {1, 10}", FRNT, BACK);*/

		uint16[] indices = scope uint16[] (
			1, 0, 3, // large bottom-right triangle
			2, 3, 0, // large top-left triangle
			7, 4, 6, // small top-left triangle
			5, 4, 7, // small bottom-right triangle
		);

		if (e.keyboard.IsPressed(.kS) == true)
		{
			FRNT = 5;
			BACK = 0;
		}
		else
		{
			FRNT = 0;
			BACK = 5;
		}

		if (e.keyboard.IsPressedOnce(.kW) == true)
		{
			if (e.mouse.mode == .normal)
			{
				e.mouse.SetInputMode(.hidden);
			}
			else
			{
				e.mouse.SetInputMode(.normal);
			}
		}

		Self.countIndices = uint32(indices.Count);
		e.graphicsContext.UpdateBuffer(Self.indexBuffer, offsetInBytes: 0, Self.indexBuffer.sizeInBytes, indices.CArray())
			.Resolve!();

	    VertexPositionColor[] vertices = scope VertexPositionColor[]
	    (
			VertexPositionColor(Vector3(+064F, +256F, BACK), Color<float>(0F, 0F, 0F, 1.0F)), // 4
			VertexPositionColor(Vector3(+256F, +256F, BACK), Color<float>(0F, 1F, 0F, 1.0F)), // 5
			VertexPositionColor(Vector3(+064F, +064F, BACK), Color<float>(0F, 0F, 1F, 1.0F)), // 6
			VertexPositionColor(Vector3(+256F, +064F, BACK), Color<float>(0F, 1F, 1F, 1.0F)), // 7

			VertexPositionColor(Vector3(+032F, +128F, FRNT), Color<float>(0F, 0F, 1F, 1.0F)), // 0
			VertexPositionColor(Vector3(+128F, +128F, FRNT), Color<float>(0F, 1F, 0F, 1.0F)), // 1
			VertexPositionColor(Vector3(+032F, +032F, FRNT), Color<float>(1F, 0F, 0F, 1.0F)), // 2
			VertexPositionColor(Vector3(+128F, +032F, FRNT), Color<float>(0F, 1F, 0F, 1.0F)), // 3
	    );

	    e.graphicsContext.UpdateBuffer(Self.vertexBuffer, offsetInBytes: 0, Self.vertexBuffer.sizeInBytes, vertices.CArray())
			.Resolve!();

		UniformBufferObject ubo = UniformBufferObject.GetValue(e.window);
		e.graphicsContext.UpdateBuffer(Self.uniformBuffer, offsetInBytes: 0, Self.uniformBuffer.sizeInBytes, &ubo)
			.Resolve!();

		return .Ok;
	}


	static Result<void, Error> OnRender (Engine engine)
	{
		GraphicsContext g = engine.graphicsContext;
		Swapchain swapchain = g.GetSwapchain();
		Framebuffer framebuffer = swapchain.GetFramebuffer();

		Self.UpdateBuffers(engine).Resolve!();

		// Before acquiring command buffer, reset already signaled fences on each command buffer
		CommandPool commandPool = g.GetCommandPool()..Reset();
		CommandBuffer cmd = commandPool.GetCommandBuffer();

		// StartRecording() must be called before commands can be issued.
		cmd.StartRecording().Resolve!();

		// We want to render directly to the output window.
		cmd.SetFramebuffer(framebuffer);
		/*cmd.ClearColorTarget(index: 0, Color<float>(0.55F, 0.25F, 0.25F, 1.0F));*/

		// Set all relevant state to draw our quad.
		cmd.SetPipeline(pipeline);
		cmd.SetVertexBuffer(index: 0, vertexBuffer);
		cmd.SetIndexBuffer(indexBuffer, .uint16);

		// ResourceSet
		cmd.SetResourceSet(0, Self.uniformSet).Resolve!();

		// Dynamic states (scissors and viewport)
		cmd.SetScissors(index: 0, 0, 0, (.)engine.window.width, (.)engine.window.height);
		cmd.SetViewport(index: 0, Viewport(0, 0, engine.window.width, engine.window.height));

		// Issue a Draw command for a single instance with 4 indices.
		cmd.DrawIndexed(indexCount: Self.countIndices, instanceCount: 1, firstIndex: 0, vertexOffset: 0, firstInstance: 0);

		// StopRecording() must be called before commands can be submitted for execution.
		cmd..StopRecording()..Submit();
		commandPool.Submit();

		// Wait for device idle state
		g.WaitForIdle();

		// Once commands have been submitted, the rendered image can be presented to the application window.
		swapchain.SwapBuffers().Resolve!();

		return .Ok;
	}


	static void OnShutdown (Engine engine)
	{
		if (Self.vertexBuffer != null)
			delete Self.vertexBuffer..Dispose();

		if (Self.indexBuffer != null)
			delete Self.indexBuffer..Dispose();

		if (Self.uniformBuffer != null)
			delete Self.uniformBuffer..Dispose();

		if (Self.uniformSet != null)
			delete Self.uniformSet..Dispose();

		if (Self.uniformLayout != null)
			delete Self.uniformLayout..Dispose();

		if (Self.shaders != null)
		{
			for (uint32 n = 0; n < Self.shaders.Count; n++)
				delete Self.shaders[n]..Dispose();

			delete Self.shaders;
		}

		if (Self.pipeline != null)
			delete Self.pipeline..Dispose();

		if (Self.resourceLayouts != null)
		{
			delete Self.resourceLayouts;
		}

		if (Self.vertexLayout != null)
		{
			for (uint32 n = 0; n < Self.vertexLayout.Count; n++)
				delete Self.vertexLayout[n].Elements;

			delete Self.vertexLayout;
		}
	}


	static void Main ()
	{
		Engine engine = new Engine();
		Engine.Description createInfo = Engine.Description()
		{
			onInitialize 	= new => Self.OnInitialize,
			onUpdate 		= new => Self.OnUpdate,
			onRender 		= new => Self.OnRender,
			onShutdown 		= new => Self.OnShutdown,
			backend			= new GraphicsContext.Backend[] (.Vulkan, .Direct3D11, .OpenGL),
			window			= Window.Description()
			{
				title = "Title of the window",
				width = 640,
				height = 768,
			},
			graphicsDevice	= GraphicsContext.Description()
			{
				depthFormat = .D24_UNorm_S8_UInt,

				deviceOptions = .()
				{
					isDebuggerEnabled = true,
				}
			},
		};

		if (engine.Run(createInfo) case .Err(let e))
			Tracy.Report(e, isCritical: true);

		delete engine..Dispose();
	}


	[Ordered, Packed, CRepr]
	public struct VertexPositionColor
	{
	    public Vector4 Position;
	    public Vector4 Color;
	
	
	    public this (Vector3 position, Color<float> color)
	    {
	        this.Position = Vector4(position.x, position.y, position.z, 1.0F);
			this.Color = Vector4(color.r, color.g, color.b, color.a);
	    }


		public static Pipeline.VertexLayoutDescription GetLayout()
		{
			return Pipeline.VertexLayoutDescription(
			    Pipeline.VertexElementDescription("Position", .position, .float4),
			    Pipeline.VertexElementDescription("Color", .color, .float4)
			);
		}
	}


	[Ordered, Packed, CRepr]
	struct UniformBufferObject
	{
		public Matrix4x4 matrix;


		static public UniformBufferObject GetValue (Window window)
		{
			return UniformBufferObject()
			{
				matrix = CreateOrthographic(window.width, window.height, 0.0F, 5.0F),
			};
		}


		static public Matrix4x4 CreateOrthographic (float width, float height, float near, float far)
		{
			// bottom-left corner is zero-zero
			return Matrix4x4(
				2.0F / width, 0.0F, 0.0F, 0.0F,
				0.0F, 2.0F / height, 0.0F, 0.0F,
				0.0F, 0.0F, -1.0F / (near - far), 0.0F,
				-1.0F, -1.0F, near / (near - far), 1.0F
			);

			/*// bottom-left corner is zero-zero
			return Matrix4x4(
				2.0F / width, 0.0F, 0.0F, 0.0F,
				0.0F, 2.0F / height, 0.0F, 0.0F,
				0.0F, 0.0F, 1.0F / (near - far), 0.0F,
				-1.0F, -1.0F, near / (near - far), 1.0F
			);*/

			/*// top-left corner is zero-zero
			return Matrix4x4(
				2.0F / width, 0.0F, 0.0F, 0.0F,
				0.0F, -2.0F / height, 0.0F, 0.0F,
				0.0F, 0.0F, 1.0F / (near - far), 0.0F,
				-1.0F, 1.0F, near / (near - far), 1.0F
			);*/
		}
	}


}