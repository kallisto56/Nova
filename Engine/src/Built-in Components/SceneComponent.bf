namespace Engine
{
	using System;
	using System.Collections;


	public abstract class SceneComponent : Component
	{
		public abstract Result<void> Initialize (Scene scene);
		public abstract void Update (Scene scene);
		public abstract void Shutdown (Scene scene);
	}


}