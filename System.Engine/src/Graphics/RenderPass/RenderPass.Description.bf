namespace System.Engine;


extension RenderPass
{
	public struct Description
	{
		public Texture[] colorAttachments;
		public Texture depthAttachment;
	}
}