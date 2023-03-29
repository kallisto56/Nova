namespace System.Engine;


extension Texture
{
	public struct Description
	{
		/// <summary>
		/// The total width, in texels.
		/// </summary>
		public uint32 width;

		/// <summary>
		/// The total height, in texels.
		/// </summary>
		public uint32 height;

		/// <summary>
		/// The total depth, in texels.
		/// </summary>
		public uint32 depth;

		/// <summary>
		/// The number of mipmap levels.
		/// </summary>
		public uint32 mipLevels;

		/// <summary>
		/// The number of array layers.
		/// </summary>
		public uint32 arrayLayers;

		/// <summary>
		/// The format of individual texture elements.
		/// </summary>
		public Texture.Format format;

		/// <summary>
		/// Controls how the Texture is permitted to be used. If the Texture will be sampled from a shader, then
		/// <see cref="TextureUsage.Sampled"/> must be included. If the Texture will be used as a depth target in a
		/// <see cref="Framebuffer"/>, then <see cref="TextureUsage.DepthStencil"/> must be included. If the Texture will be used
		/// as a color target in a <see cref="Framebuffer"/>, then <see cref="TextureUsage.RenderTarget"/> must be included.
		/// If the Texture will be used as a 2D cubemap, then <see cref="TextureUsage.Cubemap"/> must be included.
		/// </summary>
		public Texture.Usage usage;

		/// <summary>
		/// The type of Texture to create.
		/// </summary>
		public Texture.Type type;

		/// <summary>
		/// The number of samples. If equal to <see cref="TextureSampleCount.Count1"/>, this instance does not describe a
		/// multisample <see cref="Texture"/>.
		/// </summary>
		public Texture.SampleCount sampleCount;
	}
}