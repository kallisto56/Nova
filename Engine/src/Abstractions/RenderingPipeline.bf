/*namespace Engine
{
	using System;
	using System.IO;
	using System.Collections;
	using System.Threading;


    public class RenderingPipeline
    {
		public ShaderStorageBuffer depthBuffer;
		public ShaderStorageBuffer instructionsBuffer;
		public ShaderStorageBuffer clusterCentersBuffer;
		public ShaderStorageBuffer matrixBuffer;
		public ShaderStorageBuffer splatBuffer;
		/*public ShaderStorageBuffer sortingBuffer;*/

		public RenderTexture renderTexture;
		public ComputeShader skyboxKernel;
		public ComputeShader transformationKernel;
		public ComputeShader sortingKernel;
		public ComputeShader splattingKernel;
		public ComputeShader blitKernel;


		public virtual Result<void> Initialize ()
		{
			this.instructionsBuffer = Engine.platform.CreateShaderStorageBuffer();
			this.instructionsBuffer.Initialize(null, .GL_STATIC_DRAW, .uint32, Engine.coordinateBuffer.instructions.Count);

			this.clusterCentersBuffer = Engine.platform.CreateShaderStorageBuffer();
			this.clusterCentersBuffer.Initialize(null, .GL_STATIC_DRAW, .vector4, 10240);

			this.matrixBuffer = Engine.platform.CreateShaderStorageBuffer();
			this.matrixBuffer.Initialize(null, .GL_STATIC_DRAW, .matrix4x4, Engine.coordinateBuffer.matrices.Count);

			this.splatBuffer = Engine.platform.CreateShaderStorageBuffer();
			this.splatBuffer.Initialize(null, .GL_STATIC_DRAW, .uint32, Engine.coordinateBuffer.splats.Count);

			this.depthBuffer = Engine.platform.CreateShaderStorageBuffer();
			int depthBufferLength = Engine.platform.windowResolution.width * Engine.platform.windowResolution.height;
			this.depthBuffer.Initialize(null, .GL_STATIC_DRAW, .uint64, depthBufferLength);

			//this.sortingBuffer = Engine.platform.CreateShaderStorageBuffer();
			//this.sortingBuffer.Initialize(null, .GL_STATIC_DRAW, .uint64, depthBufferLength);

			this.renderTexture = Engine.platform.CreateRenderTexture();
			this.renderTexture.Initialize();

			this.skyboxKernel = Engine.platform.CreateComputeShader();
			this.skyboxKernel.Initialize("./assets/computeShaders/skybox.kernel.glsl");

			this.transformationKernel = Engine.platform.CreateComputeShader();
			this.transformationKernel.Initialize("./assets/computeShaders/transformation.kernel.glsl");

			this.sortingKernel = Engine.platform.CreateComputeShader();
			this.sortingKernel.Initialize("./assets/computeShaders/sorting.kernel.glsl");

			this.splattingKernel = Engine.platform.CreateComputeShader();
			this.splattingKernel.Initialize("./assets/computeShaders/splatting.kernel.glsl");

			this.blitKernel = Engine.platform.CreateComputeShader();
			this.blitKernel.Initialize("./assets/computeShaders/blit.kernel.glsl");
			
			return OpenGL.GlDebug.HasErrors();
		}


		public virtual void Compute ()
		{
			this.renderTexture.EnsureSize(Engine.platform.windowResolution.width, Engine.platform.windowResolution.height);

			/*CameraComponent camera = scene*/

			int2 imageBounds = Engine.platform.windowResolution;

			CameraComponent camera = RootScene.scenes[0].mainCamera;
			/*Matrix4x4 cameraToWorldMatrix = camera.GetCameraToWorld();
			Matrix4x4 cameraInverseProjection = camera.GetProjection().inverse;

			// SKYBOX KERNEL
			{
				this.skyboxKernel.SetData("imageBounds", imageBounds.width, imageBounds.height);
				this.skyboxKernel.SetData("image", this.renderTexture.texture);
				this.skyboxKernel.SetData("cameraToWorldMatrix", ref cameraToWorldMatrix);
				this.skyboxKernel.SetData("cameraInverseProjection", ref cameraInverseProjection);
				this.skyboxKernel.Dispatch(imageBounds.width, imageBounds.height);
			}*/

			// TRANSFORMATION KERNEL
			if (Engine.coordinateBuffer.countInstructions == 0)
			{
				Console.WriteLine("EMPTY");
			}
			{
				/*for (int n = 0; n < Engine.coordinateBuffer.countInstructions; n++)
				{
					CoordinateBuffer.Instruction instruction = Engine.coordinateBuffer.instructions[n];
					Console.WriteLine("camera-matrix: {0}, mesh-matrix: {1}, cluster-center: {2}, first-splat: {3}", instruction.values[0], instruction.values[1], instruction.values[2], instruction.values[3]);
				}
				Console.Read();*/
				this.matrixBuffer.SetData(Engine.coordinateBuffer.matrices.CArray(), 0, 64);//Engine.coordinateBuffer.countMatrices * 16);
				this.clusterCentersBuffer.SetData(Engine.coordinateBuffer.clusters.CArray(), 0, 64);//Engine.coordinateBuffer.countClusters * 4);
				this.instructionsBuffer.SetData(Engine.coordinateBuffer.instructions.CArray(), 0, Engine.coordinateBuffer.countInstructions * 4);
				this.splatBuffer.SetData(Engine.coordinateBuffer.splats.CArray(), 0, Engine.coordinateBuffer.countSplats * 4);

				// (projection * view.Inverse) * model;
				Transform transform = RootScene.scenes[0].gameObjects[1].transform;
				Matrix4x4 model = Matrix4x4.Translate(transform.position) * Matrix4x4(transform.rotation) * Matrix4x4.Scale(transform.scale);
				Matrix4x4 modelViewProjection = (camera.GetProjection() * camera.GetView().inverse) * model;
				/*Matrix4x4 modelViewProjection = (camera.GetProjection() * camera.GetView().inverse) * Matrix4x4.Identity;*/

				this.transformationKernel.SetData("modelViewProjection", ref modelViewProjection);
				this.transformationKernel.SetData("imageBounds", imageBounds.width, imageBounds.height);
				this.transformationKernel.SetData("image", this.renderTexture.texture);
				this.transformationKernel.SetData("clippingPlane", camera.nearPlane, camera.farPlane);

				this.transformationKernel.SetData(5, this.matrixBuffer);
				this.transformationKernel.SetData(6, this.clusterCentersBuffer);
				this.transformationKernel.SetData(7, this.splatBuffer);
				this.transformationKernel.SetData(8, this.depthBuffer);
				this.transformationKernel.SetData(9, this.instructionsBuffer);
				this.transformationKernel.Dispatch(Engine.coordinateBuffer.countInstructions);
			}

			// SORTING KERNEL
			{
				//this.blitKernel.Dispatch(imageBounds.width / 3, imageBounds.height / 3);
			}

			// SPLATTING KERNEL
			{
				//this.blitKernel.Dispatch(imageBounds.width, imageBounds.height);
			}

			// BLIT KERNEL
			{
				this.blitKernel.SetData("imageBounds", imageBounds.width, imageBounds.height);
				this.blitKernel.SetData("image", this.renderTexture.texture);
				this.blitKernel.SetData("clippingPlane", camera.nearPlane, camera.farPlane);

				this.blitKernel.SetData(5, this.matrixBuffer);
				this.blitKernel.SetData(6, this.clusterCentersBuffer);
				this.blitKernel.SetData(7, this.splatBuffer);
				this.blitKernel.SetData(8, this.depthBuffer);
				this.blitKernel.SetData(9, this.instructionsBuffer);

				this.blitKernel.Dispatch(imageBounds.width, imageBounds.height);
			}
		}


		public virtual void Render ()
		{
			this.renderTexture.Render();
		}


		public void Shutdown ()
		{
			DisposeDelete!(this.depthBuffer);
			/*DisposeDelete!(this.sortingBuffer);*/
			DisposeDelete!(this.instructionsBuffer);
			DisposeDelete!(this.clusterCentersBuffer);
			DisposeDelete!(this.matrixBuffer);
			DisposeDelete!(this.splatBuffer);

			DisposeDelete!(this.renderTexture);

			DisposeDelete!(this.skyboxKernel);
			DisposeDelete!(this.transformationKernel);
			DisposeDelete!(this.sortingKernel);
			DisposeDelete!(this.splattingKernel);
			DisposeDelete!(this.blitKernel);
		}
    }


}*/