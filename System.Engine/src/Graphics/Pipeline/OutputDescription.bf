namespace System.Engine;


extension Pipeline
{
	public struct OutputDescription
	{
		public OutputAttachmentDescription? depthAttachment;
		public OutputAttachmentDescription[] colorAttachments;
		public Texture.SampleCount sampleCount;


		public this ()
		{
			this.depthAttachment = null;
			this.colorAttachments = null;
			this.sampleCount = .count1;
		}


		public this (OutputAttachmentDescription? depthAttachment, params OutputAttachmentDescription[] colorAttachments)
		{
		    this.depthAttachment = depthAttachment;
		    this.colorAttachments = colorAttachments ?? null;
		    sampleCount = .count1;
		}


	}
}