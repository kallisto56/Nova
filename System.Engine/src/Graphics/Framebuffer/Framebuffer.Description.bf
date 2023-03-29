namespace System.Engine;


using System;
using System.Diagnostics;


extension Framebuffer
{
	public struct Description
	{
		public uint32 width;
		public uint32 height;

		public Texture[] colorTargets;
		public Texture depthTarget;

		public RenderPass renderPass;
	}
}