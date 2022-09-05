namespace Engine
{
	using System;
	using System.Collections;


	public static class RootScene
	{
		public static List<Scene> scenes = new List<Scene>();
		public static List<Mesh> meshes = new List<Mesh>();


		public static void Shutdown ()
		{
			DeleteContainerAndItems!(RootScene.scenes);
			DeleteContainerAndItems!(RootScene.meshes);
		}


		public static T Add<T> () where T : Scene
		{
			T scene = new T();
			RootScene.scenes.Add(scene);
			return scene;
		}


		public static T Add<T> () where T : Mesh
		{
			T mesh = new T();
			RootScene.meshes.Add(mesh);
			return mesh;
		}


		public static void EnableScenes (params Scene[] scenes)
		{
			for (int n = 0; n < scenes.Count; n++)
			{
				scenes[n].isEnabled = true;
			}
		}


		public static void DisableScenes (params Scene[] scenes)
		{
			for (int n = 0; n < scenes.Count; n++)
			{
				scenes[n].isEnabled = false;
			}
		}
	}


}