namespace System.Engine;


extension ResourceSet
{
	public struct Description
	{
		public ResourceLayout layout;
		public IBindableResource[] boundResources;


		public this (ResourceLayout layout, params IBindableResource[] boundResources)
		{
		    this.layout = layout;
		    this.boundResources = boundResources;
		}


	}
}