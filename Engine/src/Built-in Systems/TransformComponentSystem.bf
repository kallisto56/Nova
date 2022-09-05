namespace Engine
{
	using System;
	using System.IO;
	using System.Collections;
	using System.Threading;


    public class TransformComponentSystem : ComponentSystem
    {
		public override Result<void> Initialize()
		{
			return default;
		}

		public override void Update()
		{
			if (this.scene.gameObjects == null || this.scene.gameObjects.Count == 0)
			{
				return;
			}

			for (int n = 0; n < this.scene.gameObjects.Count; n++)
			{
				this.scene.gameObjects[n].UpdateTransformations();
			}
		}

		public override void Shutdown()
		{

		}
	}


}