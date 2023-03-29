namespace System.Engine;


extension Pipeline
{
	public struct GraphicsDescription
	{
		public RenderPass renderPass;
		public BlendStateDescription blendState;
		public DepthStencilStateDescription depthStencilState;
		public RasterizerStateDescription rasterizerState;
		public PrimitiveTopology primitiveTopology;
		public ShaderSetDescription shaderSet;
		public ResourceLayout[] resourceLayouts;
		public OutputDescription outputs;
		public ResourceBindingModel? resourceBindingModel;
	}
}