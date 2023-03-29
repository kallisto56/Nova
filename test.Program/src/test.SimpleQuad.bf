namespace test.Program;


using System;
using System.Collections;
using System.Diagnostics;
using System.Engine;
using System.Math;


class Test_SimpleQuad
{
    static Buffer vertexBuffer;
    static Buffer indexBuffer;
    static ShaderModule[] shaders;
    static Pipeline pipeline;

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
		    VertexPositionColor[] vertices = scope VertexPositionColor[]
		    (
		        VertexPositionColor(Vector2(-0.75F, +0.75F), .red),
		        VertexPositionColor(Vector2(+0.75F, +0.75F), .green),
		        VertexPositionColor(Vector2(-0.75F, -0.75F), .blue),
		        VertexPositionColor(Vector2(+0.75F, -0.75F), .white)
		    );

		    Self.vertexBuffer = context.Create(.Vertex<VertexPositionColor>(vertices.Count))
				.Resolve!();

		    e.graphicsContext.UpdateBuffer(Self.vertexBuffer, offsetInBytes: 0, Self.vertexBuffer.sizeInBytes, vertices.CArray())
				.Resolve!();
		}

		// Indices
		{
		    uint16[] indices = scope uint16[] (0, 1, 2, 3);

		    Self.indexBuffer = context.Create(.Index(indices.Count, .uint16))
				.Resolve!();

			e.graphicsContext.UpdateBuffer(Self.indexBuffer, offsetInBytes: 0, Self.indexBuffer.sizeInBytes, indices.CArray())
				.Resolve!();
		}

		List<uint8> vertexShaderSourceCode = scope List<uint8>();
		List<uint8> fragmentShaderSourceCode = scope List<uint8>();
		System.IO.File.ReadAll("./dist/shaders/Test_SimpleQuad/vertex.shader.spirv", vertexShaderSourceCode);
		System.IO.File.ReadAll("./dist/shaders/Test_SimpleQuad/fragment.shader.spirv", fragmentShaderSourceCode);

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
			primitiveTopology = .triangleStrip,
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

		pipelineDescription.resourceLayouts = Self.resourceLayouts = new ResourceLayout[0]();
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


	static Result<void, Error> OnRender (Engine engine)
	{
		GraphicsContext g = engine.graphicsContext;
		Swapchain swapchain = g.GetSwapchain();
		Framebuffer framebuffer = swapchain.GetFramebuffer();

		// Before acquiring command buffer, reset already signaled fences on each command buffer
		CommandPool commandPool = g.GetCommandPool();
		commandPool.Reset();
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

		// Dynamic states (scissors and viewport)
		cmd.SetScissors(index: 0, 0, 0, (.)engine.window.width, (.)engine.window.height);
		cmd.SetViewport(index: 0, Viewport(0, 0, engine.window.width, engine.window.height));

		// Issue a Draw command for a single instance with 4 indices.
		cmd.DrawIndexed(indexCount: 4, instanceCount: 1, firstIndex: 0, vertexOffset: 0, firstInstance: 0);

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
			for (uint32 n = 0; n < Self.resourceLayouts.Count; n++)
				delete Self.resourceLayouts[n]..Dispose();

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
	
	
	    public this (Vector2 position, Color<float> color)
	    {
	        this.Position = Vector4(position.x, position.y, 0.0F, 1.0F);
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


}