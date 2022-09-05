namespace Engine
{
	using System;


	static
	{
		public static mixin DisposeDeleteAndNullify (var instance)
		{
			instance.Dispose();
			delete instance;
			instance = null;
		}

		public static mixin DisposeDelete (IDisposable instance)
		{
			instance.Dispose();
			delete instance;
		}
	}
}