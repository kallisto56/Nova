namespace System.Engine;


using System;
using System.Diagnostics;


extension TextureView
{
	public struct Description
	{
		public Texture target { get; }
		public uint32 baseMipLevel { get; }
		public uint32 mipLevels { get; }
		public uint32 baseArrayLayer { get; }
		public uint32 arrayLayers { get; }


		public this (Texture target)
		{
		    this.target = target;
		    this.baseMipLevel = 0;
		    this.mipLevels = target.mipLevels;
		    this.baseArrayLayer = 0;
		    this.arrayLayers = target.arrayLayers;
		}
	}
}