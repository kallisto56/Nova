namespace test.Program;


using System;
using System.IO;
using System.Collections;
using System.Diagnostics;
using System.Engine;
using System.Math;


class Test_VoxelDepthTest
{
	// ...
	typealias IndexBufferFormat = uint32;

	// ...
	static Random random = new Random(56) ~ delete _;

	static uint32 countVoxelBlocks = 4*4*4;

	// ...
	static IndexBufferFormat[] indices;
	static Vector4[] vertices;
	static Voxel[] voxels;
	static FixedSizeList<Transform> transforms;
	static FixedSizeList<Instruction> instructionList;

	static CameraController cameraController;

	// ...
	static readonly String vertexShaderFilename = "./dist/shaders/Test_VoxelDepthTest/vertex.shader.spirv";
	static readonly String fragmentShaderFilename = "./dist/shaders/Test_VoxelDepthTest/fragment.shader.spirv";

	// ...
	static List<uint8> vertexShaderSourceCode;
	static List<uint8> fragmentShaderSourceCode;

	// ...
	static Buffer vertexBuffer;
	static Buffer indexBuffer;
	static Buffer volumeBuffer;
	static Buffer uniformBuffer;
	static Buffer instructionBuffer;

	static (ResourceSet set, ResourceLayout layout) uniform;
	static (ResourceSet set, ResourceLayout layout) instructions;
	static (ResourceSet set, ResourceLayout layout) volume;

	static Pipeline graphicsPipeline;
	static ShaderModule[] shaders;


	static Result<void, Error> OnInitialize (Engine e)
	{
		Self.cameraController = new CameraController();
		/*Self.cameraController.gameObject.transform.position = Vector3(-3F, -4F, 6F);*/
		/*Self.cameraController.gameObject.transform.rotation = Quaternion(0.306753F, -0.36703F, 0.129626F, 0.868558F);*/
		Self.cameraController.gameObject.transform.position = Vector3(2.212032F, 1.371125F, 1.65705F);
		Self.cameraController.gameObject.transform.rotation = Quaternion(0.229435F, -0.165792F, 0.039695F, 0.958281F);

		/*Self.cameraController.gameObject.transform.position = Vector3(-4, -4, 6);*/
		/*Self.cameraController.gameObject.transform.LookAt(Vector3(6, 6, 6), Self.cameraController.gameObject.transform.up);*/

		Self.transforms = new FixedSizeList<Transform>(countVoxelBlocks);
		/*Self.transforms.Add(new Transform(Vector3(), Quaternion.Identity, Vector3.one * 2));*/

		for (uint x = 0; x < 4; x++)
		{
			for (uint y = 0; y < 4; y++)
			{
				for (uint z = 0; z < 4; z++)
				{
					Self.transforms.Add(new Transform(Vector3(x, y, z) * 1.05F));
				}
			}
		}

		Self.CreateUniformBuffer(e).Resolve!();
		Self.CreateIndexBuffer(e).Resolve!();
		Self.CreateVertexBuffer(e).Resolve!();
		Self.CreateVolumeBuffer(e).Resolve!();
		Self.CreateInstructionBuffer(e).Resolve!();

		Self.CreateResourceLayouts(e).Resolve!();
		Self.CreateResourceSets(e).Resolve!();

		Self.CreatePipeline(e).Resolve!();

		return .Ok;
	}


	static Result<void, Error> CreateUniformBuffer (Engine e)
	{
		Self.uniformBuffer = e.graphicsContext.Create(Buffer.Description(sizeof(UniformBufferObject), .uniformBuffer)).Resolve!();
		return .Ok;
	}


	static Result<void, Error> CreateIndexBuffer (Engine e)
	{
		Self.indices = new IndexBufferFormat[] (
			0, 1, 2, 2, 3, 0, // front
			0, 3, 7, 7, 4, 0, // right
			2, 6, 7, 7, 3, 2, // bottom
			1, 5, 6, 6, 2, 1, // left
			4, 7, 6, 6, 5, 4, // back
			5, 1, 0, 0, 4, 5, // top
		);

		Self.indexBuffer = e.graphicsContext.Create(Buffer.Description.Index(Self.indices.Count, .uint32))
			.Resolve!();

		e.graphicsContext.UpdateBuffer(Self.indexBuffer, 0, Self.indexBuffer.sizeInBytes, Self.indices.CArray())
			.Resolve!();

		return .Ok;
	}


	static Result<void, Error> CreateVertexBuffer (Engine e)
	{
		Self.vertices = new Vector4[] (
			Vector4(+0.5F, +0.5F, +0.5F, +1.0F), // 0 front
			Vector4(-0.5F, +0.5F, +0.5F, +1.0F), // 1 front
			Vector4(-0.5F, -0.5F, +0.5F, +1.0F), // 2 front
			Vector4(+0.5F, -0.5F, +0.5F, +1.0F), // 3 front
			Vector4(+0.5F, +0.5F, -0.5F, +1.0F), // 4 back
			Vector4(-0.5F, +0.5F, -0.5F, +1.0F), // 5 back
			Vector4(-0.5F, -0.5F, -0.5F, +1.0F), // 6 back
			Vector4(+0.5F, -0.5F, -0.5F, +1.0F), // 7 back
		);

		uint64 sizeInBytes = uint64(sizeof(Vector4) * Self.vertices.Count);
		Buffer.Description description = Buffer.Description(sizeInBytes, .vertexBuffer);
		Self.vertexBuffer = e.graphicsContext.Create(description)
			.Resolve!();

		e.graphicsContext.UpdateBuffer(Self.vertexBuffer, 0, Self.vertexBuffer.sizeInBytes, Self.vertices.CArray())
			.Resolve!();

		return .Ok;
	}


	static Result<void, Error> CreateVolumeBuffer (Engine e)
	{
		// Create and fill voxel volume
		Self.voxels = new Voxel[512 * countVoxelBlocks];
		for (uint32 n = 0; n < countVoxelBlocks; n++)
		{
			MakeSphere(Self.voxels, n * 512, int3(8));
		}

		// ...
		uint64 sizeInBytes = uint64(sizeof(Voxel) * Self.voxels.Count);
		Buffer.Description description = Buffer.Description(sizeInBytes, .structuredBufferReadOnly);

		// Create and update
		Self.volumeBuffer = e.graphicsContext.Create(description).Resolve!();
		e.graphicsContext.UpdateBuffer(Self.volumeBuffer, 0, Self.volumeBuffer.sizeInBytes, Self.voxels.CArray())
			.Resolve!();

		// ...
		return .Ok;
	}


	static Result<void, Error> CreateResourceLayouts (Engine e)
	{
		// ...
		Self.uniform.layout = e.graphicsContext.Create(ResourceLayout.Description(
			ResourceLayout.ElementDescription("ubo", .UniformBuffer, .vertex)
		));

		// ...
		Self.instructions.layout = e.graphicsContext.Create(ResourceLayout.Description(
			ResourceLayout.ElementDescription("meta", .StructuredBufferReadOnly, .vertex | .fragment)
		));

		// ...
		Self.volume.layout = e.graphicsContext.Create(ResourceLayout.Description(
			ResourceLayout.ElementDescription("volume", .StructuredBufferReadOnly, .fragment)
		));

		return .Ok;
	}


	static Result<void, Error> CreateResourceSets (Engine e)
	{
		Self.uniform.set = e.graphicsContext.Create(
			ResourceSet.Description(Self.uniform.layout, Self.uniformBuffer)
		).Resolve!();

		Self.instructions.set = e.graphicsContext.Create(
			ResourceSet.Description(Self.instructions.layout, Self.instructionBuffer)
		).Resolve!();

		Self.volume.set = e.graphicsContext.Create(
			ResourceSet.Description(Self.volume.layout, Self.volumeBuffer)
		).Resolve!();

		return .Ok;
	}


	static Result<void, Error> CreatePipeline (Engine e)
	{
		// ...
		Self.vertexShaderSourceCode = new List<uint8>();
		Self.fragmentShaderSourceCode = new List<uint8>();

		// ...
		File.ReadAll(Self.vertexShaderFilename, vertexShaderSourceCode);
		File.ReadAll(Self.fragmentShaderFilename, fragmentShaderSourceCode);

		// ...
		Self.shaders = new ShaderModule[2];
		e.graphicsContext.CompileShaders(Self.shaders, 
			ShaderModule.Description(.vertex, vertexShaderSourceCode),
			ShaderModule.Description(.fragment, fragmentShaderSourceCode)
		).Resolve!();

		// ...
		Pipeline.GraphicsDescription pipelineDescription = Pipeline.GraphicsDescription();
		pipelineDescription.blendState = Pipeline.BlendStateDescription.singleAlphaBlend;
		pipelineDescription.depthStencilState = Pipeline.DepthStencilStateDescription()
		{
			DepthTestEnabled = true,
			DepthWriteEnabled = true,
			DepthComparison = .Less,
		};

		pipelineDescription.renderPass = e.graphicsContext.GetSwapchain().GetRenderPass();

		pipelineDescription.rasterizerState = Pipeline.RasterizerStateDescription(
		    cullMode: FaceCullMode.None,
		    fillMode: PolygonFillMode.Solid,
		    frontFace: FrontFace.Clockwise,
		    depthClipEnabled: false,
		    scissorTestEnabled: false
		);

		var vertexLayout = Pipeline.VertexLayoutDescription(
			Pipeline.VertexElementDescription("position", .position, .float4)
		);

		pipelineDescription.primitiveTopology = .triangleList;
		pipelineDescription.resourceLayouts = scope ResourceLayout[](Self.uniform.layout, Self.instructions.layout, Self.volume.layout);
		pipelineDescription.shaderSet = Pipeline.ShaderSetDescription(
		    vertexLayouts: scope Pipeline.VertexLayoutDescription[] (vertexLayout),
		    shaders: Self.shaders
		);


		pipelineDescription.outputs = e.graphicsContext.GetSwapchain().GetFramebuffer().outputDescription;

		Self.graphicsPipeline = e.graphicsContext.Create(pipelineDescription)
			.Resolve!();


		delete vertexLayout.Elements;

		return .Ok;
	}


	static Result<void, Error> CreateInstructionBuffer (Engine e)
	{
		Self.instructionList = new FixedSizeList<Instruction>(4096);
		uint64 sizeInBytes = uint64(sizeof(Instruction) * Self.instructionList.Capacity);
		Buffer.Description description = Buffer.Description(sizeInBytes, .structuredBufferReadOnly);
		Self.instructionBuffer = e.graphicsContext.Create(description);

		return .Ok;
	}


	static Result<void, Error> OnUpdate (Engine e)
	{
		Self.cameraController.Update(e);
		/*Self.cameraController.gameObject.UpdateTransformations();*/

		if (e.keyboard.IsPressed(.escape))
		{
			Tracy.WriteLine("WARNING: Not implemented yet...");
		}

		return .Ok;
	}


	static Result<void, Error> OnRender (Engine e)
	{
		GraphicsContext g = e.graphicsContext;
		Swapchain swapchain = g.GetSwapchain();
		Framebuffer framebuffer = swapchain.GetFramebuffer();

		// Before acquiring command buffer, reset already signaled fences on each command buffer
		CommandPool commandPool = g.GetCommandPool()..Reset();
		CommandBuffer cmd = commandPool.GetCommandBuffer();
		
		// ...
		UniformBufferObject ubo = UniformBufferObject.GetValue();
		g.UpdateBuffer(Self.uniformBuffer, 0, Self.uniformBuffer.sizeInBytes, &ubo);

		CameraComponent camera = CameraController.instance.camera;
		Matrix4x4 view = camera.GetView();
		Matrix4x4 projection = camera.GetProjection(e.window.width, e.window.height);
		Matrix4x4 viewProjection = projection * view.inverse;
		
		// ...
		Self.instructionList.Clear();
		for (uint32 index = 0; index < Self.transforms.Count; index++)
		{
			Transform transform = Self.transforms.array[index];
			/*transform.rotation = transform.rotation.Rotated(0.001F, Vector3(key.x, key.y, key.z)).Normalized;*/

			Matrix4x4 model = transform.ComputeWorldMatrix();
			Matrix4x4 inverseModel = model.inverse;
			Matrix4x4 modelViewProjection = viewProjection * model;

			Instruction instruction = Instruction(modelViewProjection, inverseModel);

			Self.instructionList.Add(instruction);
		}

		g.UpdateBuffer(Self.instructionBuffer, 0, Self.instructionList.sizeInBytes, Self.instructionList.CArray());

		// ...
		cmd.StartRecording().Resolve!();

		// ...
		cmd.SetFramebuffer(framebuffer).Resolve!();

		cmd.SetPipeline(Self.graphicsPipeline);

		cmd.SetVertexBuffer(0, Self.vertexBuffer);
		cmd.SetIndexBuffer(Self.indexBuffer, .uint32);

		cmd.SetResourceSet(0, Self.uniform.set);
		cmd.SetResourceSet(1, Self.instructions.set);
		cmd.SetResourceSet(2, Self.volume.set);

		cmd.DrawIndexed(
			indexCount: uint32(Self.indices.Count),
			instanceCount: uint32(Self.instructionList.Count),
			firstIndex: 0,
			vertexOffset: 0,
			firstInstance: 0
		);

		// ...
		cmd.StopRecording();
		commandPool.Submit();

		// Wait for device idle state
		g.WaitForIdle();

		// Once commands have been submitted, the rendered image can be presented to the application window.
		swapchain.SwapBuffers().Resolve!();

		return .Ok;
	}


	static void OnShutdown (Engine engine)
	{
		if (Self.voxels != null)
			delete Self.voxels;

		if (Self.cameraController != null)
			delete Self.cameraController;

		if (Self.transforms != null)
		{
			for (uint32 n = 0; n < Self.transforms.Count; n++)
			{
				delete Self.transforms.array[n];
			}

			delete Self.transforms;
		}

		if (Self.instructionBuffer != null)
		{
			Self.instructionBuffer.Dispose();
			delete Self.instructionBuffer;
		}

		if (Self.vertexShaderSourceCode != null)
			delete vertexShaderSourceCode;

		if (Self.fragmentShaderSourceCode != null)
			delete Self.fragmentShaderSourceCode;

		if (Self.instructionList != null)
			delete Self.instructionList;

		if (Self.instructions.layout != null)
		{
			Self.instructions.layout.Dispose();
			delete Self.instructions.layout;
		}

		if (Self.instructions.set != null)
		{
			Self.instructions.set.Dispose();
			delete Self.instructions.set;
		}

		if (Self.indices != null)
			delete Self.indices;

		if (Self.vertices != null)
			delete Self.vertices;

		if (Self.indexBuffer != null)
		{
			Self.indexBuffer.Dispose();
			delete Self.indexBuffer;
		}

		if (Self.vertexBuffer != null)
		{
			Self.vertexBuffer.Dispose();
			delete Self.vertexBuffer;
		}

		if (Self.uniformBuffer != null)
		{
			Self.uniformBuffer.Dispose();
			delete Self.uniformBuffer;
		}

		if (Self.volumeBuffer != null)
		{
			Self.volumeBuffer.Dispose();
			delete Self.volumeBuffer;
		}

		if (Self.uniform.set != null)
		{
			Self.uniform.set.Dispose();
			delete Self.uniform.set;
		}

		if (Self.uniform.layout != null)
		{
			Self.uniform.layout.Dispose();
			delete Self.uniform.layout;
		}

		if (Self.volume.set != null)
		{
			Self.volume.set.Dispose();
			delete Self.volume.set;
		}

		if (Self.volume.layout != null)
		{
			Self.volume.layout.Dispose();
			delete Self.volume.layout;
		}

		if (Self.shaders != null)
		{
			for (uint32 n = 0; n < Self.shaders.Count; n++)
			{
				ShaderModule shader = Self.shaders[n];
				if (shader != null)
				{
					shader.Dispose();
					delete shader;
				}
			}

			delete Self.shaders;
		}

		if (Self.graphicsPipeline != null)
		{
			Self.graphicsPipeline.Dispose();
			delete Self.graphicsPipeline;
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

	/*static void MakeSphere (Voxel[] volume, int offset, int3 size)
	{
		Vector3 color = 1.0f / (Vector3(size) - Vector3(1, 1, 1));

		for (int32 z = 0; z < size.z; ++z)
		{
			for (int32 y = 0; y < size.y; ++y)
			{
				for (int32 x = 0; x < size.x; ++x)
				{
					int3 idx = .(x, y, z);
					int key = (idx.z * (size.x * size.y) + idx.y * size.x + idx.x);
					Set(volume, offset, idx, size, Vector4(color * Vector3(idx), 0.5F));
				}
			}
		}
	}*/

	static void MakeSphere (Voxel[] volume, int offset, int3 size)
	{
		float radius = size.x / 2.0f - 0.5f;
		float sqrtRadius = radius * radius;
		Vector3 color = 1.0f / (Vector3(size) - Vector3(1, 1, 1));
		Vector3 center = Vector3(size) / 2.0f;

		for (int32 z = 0; z < size.z; ++z)
		{
			for (int32 y = 0; y < size.y; ++y)
			{
				for (int32 x = 0; x < size.x; ++x)
				{
					int3 idx = .(x, y, z);

					Vector3 delta = (Vector3(idx) + Vector3(0.5f, 0.5f, 0.5f)) - center;
					if ((Vector3.Dot(delta, delta) - 0.1f) <= sqrtRadius)
					{
						if (x > 2 && x < 5 && y > 2 && y < 5)
						{

						}
						else if (z > 2 && z < 5 && y > 2 && y < 5)
						{

						}
						else if (x > 2 && x < 5 && z > 2 && z < 5)
						{

						}
						else
						{
							int key = (idx.z * (size.x * size.y) + idx.y * size.x + idx.x);
							Set(volume, offset, idx, size, Vector4(color * Vector3(idx), float(key) / 512F));
						}
					}
					/*else if (x > 6 && y > 6 && z > 6)
					{
						Set(volume, offset, idx, size, Vector4(1, 0, 0, 1)); // Outside sphere
					}*/
					/*else if (y > 6)
					{
						Set(volume, offset, idx, size, Vector4(0, 1, 0, 1)); // Outside sphere
					}*/
					/*else if (z > 6)
					{
						Set(volume, offset, idx, size, Vector4(0, 0, 1, 1)); // Outside sphere
					}*/
					else
					{
						Set(volume, offset, idx, size, Vector4.zero); // Outside sphere
					}
				}
			}
		}
	}

	// Access the voxel at the given index
	public static void Set (Voxel[] colors, int offset, int3 index, int3 size, Vector4 value)
	{
		int key = (index.z * (size.x * size.y) + index.y * size.x + index.x) + offset;
		colors[key].position = value;
	}


	[CRepr, Packed, Ordered]
	struct UniformBufferObject
	{
		public Vector4 cameraPosition;


		static public UniformBufferObject GetValue ()
		{
			return UniformBufferObject()
			{
				cameraPosition = Vector4(cameraController.gameObject.transform.position, 1F),
			};
		}
	}


	[CRepr, Packed, Ordered]
	struct Instruction
	{
		public Matrix4x4 mvp;
		public Matrix4x4 inverse;


		public this (Matrix4x4 mvp, Matrix4x4 inverse)
		{
			this.mvp = mvp;
			this.inverse = inverse;
		}
	}


	[CRepr, Packed, Ordered]
	struct Voxel
	{
		public Vector4 position;


		public this (float x, float y, float z, float w = 1F)
		{
			this.position = Vector4(x, y, z, w);
		}

		public this (Vector4 position)
		{
			this.position = position;
		}
	}


}