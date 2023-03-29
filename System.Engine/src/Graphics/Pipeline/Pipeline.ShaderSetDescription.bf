namespace System.Engine;


extension Pipeline
{
	public struct ShaderSetDescription
	{
		public VertexLayoutDescription[] vertexLayouts;
		public ShaderModule[] shaders;

		public this (VertexLayoutDescription[] vertexLayouts, ShaderModule[] shaders)
		{
		    this.vertexLayouts = vertexLayouts;
		    this.shaders = shaders;
		}
	}
}