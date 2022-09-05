namespace Game
{
	using System;
	using Engine;


    public class DefaultScene : Scene
	{
		public class DefaultSceneComponent : Engine.SceneComponent
		{
			public override Result<void> Initialize(Scene scene)
			{
				// Load all meshes here
				// Create and setup camera

				scene.Create<MeshComponentSystem>();
				scene.Create<TransformComponentSystem>();

				GameObject player = scene.Create<GameObject>();
				CameraController cameraController = scene.Create<CameraController>();
				cameraController.camera = player.Create<CameraComponent>();
				scene.mainCamera = cameraController.camera;

				// Transform(Vector3(-1.01766F, 0.165305F, -1.026007F), Quaternion(0.050552F, 0.349891F, -0.018912F, 0.935234F), Vector3(1F, 1F, 1F));
				/*cameraController.camera.gameObject.transform.position = Vector3(-1.01766F, 0.165305F, -1.026007F);
				cameraController.camera.gameObject.transform.rotation = Quaternion(0.050552F, 0.349891F, -0.018912F, 0.935234F);*/
				/*cameraController.camera.gameObject.transform.position = Vector3(0.466182F, 0.91312F, 0.253193F);
				cameraController.camera.gameObject.transform.rotation = Quaternion(-0.08834F, 0.564252F, 0.060892F, 0.818601F);*/
				/*cameraController.camera.gameObject.transform.position = Vector3(0.281907F, 0.431518F, 0.664545F);
				cameraController.camera.gameObject.transform.rotation = Quaternion(-0.08834F, 0.564252F, 0.060892F, 0.818601F);*/
				/*cameraController.camera.gameObject.transform.position = Vector3(3.020607F, 1.116365F, 2.285097F);
				cameraController.camera.gameObject.transform.rotation = Quaternion(-0.08834F, 0.564252F, 0.060892F, 0.818601F);*/

				// INSIDE
				/*cameraController.camera.gameObject.transform.position = Vector3(0.66965F, 2.961207F, 1.839884F);
				cameraController.camera.gameObject.transform.rotation = Quaternion(0.021941F, 0.960383F, 0.266311F, -0.079125F);*/

				// (-0.5023, -0.495779, -0.49358 | Quaternion(-0.066674, -0.929125, 0.207283, -0.298858) | 1, 1, 1)
				/*cameraController.camera.gameObject.transform.position = Vector3(-0.5023F, -0.495779F, -0.49358F);
				cameraController.camera.gameObject.transform.rotation = Quaternion(-0.066674F, -0.929125F, 0.207283F, -0.298858F);*/

				/*cameraController.camera.gameObject.transform.position = Vector3(0.241019F, 0.647769F, 0.330286F);
				cameraController.camera.gameObject.transform.rotation = Quaternion(-0.083451F, 0.446464F, 0.041866F, 0.889917F);*/
				cameraController.camera.gameObject.transform.position = Vector3(0.633989F, 2.965732F, 1.889727F);
				cameraController.camera.gameObject.transform.rotation = Quaternion(-0.001832F, -0.985443F, -0.169665F, 0.01064F);

				// Loading mesh
				Mesh bunnyMesh = RootScene.Add<Mesh>();
				BitmapMesh.Load(bunnyMesh, "./assets/bunny/bunny-256x256-vertices.png", "./assets/bunny/bunny-256x256-normals.png", "./assets/bunny/bunny-256x256-colors.png", "./assets/bunny/bunny-256x256-props.png");

				Random random = new .();
				// ...
				for (int n = 0; n < 1; n++)
				{
					GameObject gameObject = scene.Create<GameObject>();
					MeshComponent meshComponent = scene.Add<MeshComponent>(gameObject);
					meshComponent.mesh = bunnyMesh;
					gameObject.transform.position = Vector3(0F, 0F, float(n) * 2F);
					gameObject.transform.scale = Vector3.one * 2F;
				}

				Engine.splatsBuffer.Insert(bunnyMesh);
				delete random;

				return .Ok;
			}

			public override void Update(Scene scene)
			{
				
			}

			public override void Shutdown(Scene scene)
			{
				LogLine("DefaultSceneComponent.Shutdown");
			}
		}
	}


}