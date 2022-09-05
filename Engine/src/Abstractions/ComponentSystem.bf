namespace Engine
{
	using System;
	using System.Collections;


	public abstract class ComponentSystem
	{
		public bool isEnabled;
		public Scene scene;


		public abstract Result<void> Initialize ();
		public abstract void Update ();
		public abstract void Shutdown ();
	}


}