namespace System.Engine;


extension Pipeline
{
	public struct OutputAttachmentDescription
	{
		public Texture.Format format;


		public this (Texture.Format format)
		{
			this.format = format;
		}
	}
}