namespace Engine
{
	using System;
	using System.IO;
	using System.Collections;
	using System.Threading;


    public class MeshComponentSystem : ComponentSystem
    {
		public override Result<void> Initialize()
		{
			return default;
		}

		public override void Update()
		{
			if (this.scene.meshComponents == null || this.scene.meshComponents.Count == 0)
			{
				return;
			}

			Engine.transformBuffer.Clear();
			Engine.instructionSet.Clear();

			// Get main camera
			CameraComponent camera = this.scene.mainCamera;
			camera.gameObject.UpdateTransformations(true);
			Matrix4x4 cameraMatrix = (camera.GetProjection() * camera.GetView().inverse);
			uint32 cameraMatrixID = Engine.transformBuffer.Insert(cameraMatrix);

			for (int n = 0; n < this.scene.meshComponents.Count; n++)
			{
				MeshComponent component = this.scene.meshComponents[n];
				Matrix4x4 meshMatrix = component.gameObject.transform.ComputeWorldMatrix();
				uint32 meshMatrixID = Engine.transformBuffer.Insert(meshMatrix);

				for (int i = 0; i < component.mesh.clusters.Count; i++)
				{
					Mesh.Cluster cluster = component.mesh.clusters[i];
					Engine.instructionSet.Insert(cameraMatrixID, meshMatrixID, uint32(cluster.indexInBuffer));
				}
					
			}
		}

		public override void Shutdown()
		{

		}
	}


}