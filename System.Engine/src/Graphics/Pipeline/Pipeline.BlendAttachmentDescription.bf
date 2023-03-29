namespace System.Engine;


extension Pipeline
{
	public struct BlendAttachmentDescription
	{
		/// <summary>
		/// Controls whether blending is enabled for the color attachment.
		/// </summary>
		public bool BlendEnabled;
		/// <summary>
		/// Controls which components of the color will be written to the framebuffer.
		/// If <c>null</c>, the mask will be set to <see cref="Veldrid.ColorWriteMask.All"/>.
		/// </summary>
		public ColorWriteMask? ColorWriteMask;
		/// <summary>
		/// Controls the source color's influence on the blend result.
		/// </summary>
		public BlendFactor SourceColorFactor;
		/// <summary>
		/// Controls the destination color's influence on the blend result.
		/// </summary>
		public BlendFactor DestinationColorFactor;
		/// <summary>
		/// Controls the function used to combine the source and destination color factors.
		/// </summary>
		public BlendFunction ColorFunction;
		/// <summary>
		/// Controls the source alpha's influence on the blend result.
		/// </summary>
		public BlendFactor SourceAlphaFactor;
		/// <summary>
		/// Controls the destination alpha's influence on the blend result.
		/// </summary>
		public BlendFactor DestinationAlphaFactor;
		/// <summary>
		/// Controls the function used to combine the source and destination alpha factors.
		/// </summary>
		public BlendFunction AlphaFunction;

		/// <summary>
		/// Constructs a new <see cref="BlendAttachmentDescription"/>.
		/// </summary>
		/// <param name="blendEnabled">Controls whether blending is enabled for the color attachment.</param>
		/// <param name="sourceColorFactor">Controls the source color's influence on the blend result.</param>
		/// <param name="destinationColorFactor">Controls the destination color's influence on the blend result.</param>
		/// <param name="colorFunction">Controls the function used to combine the source and destination color factors.</param>
		/// <param name="sourceAlphaFactor">Controls the source alpha's influence on the blend result.</param>
		/// <param name="destinationAlphaFactor">Controls the destination alpha's influence on the blend result.</param>
		/// <param name="alphaFunction">Controls the function used to combine the source and destination alpha factors.</param>
		public this(
		    bool blendEnabled,
		    BlendFactor sourceColorFactor,
		    BlendFactor destinationColorFactor,
		    BlendFunction colorFunction,
		    BlendFactor sourceAlphaFactor,
		    BlendFactor destinationAlphaFactor,
		    BlendFunction alphaFunction)
		{
		    BlendEnabled = blendEnabled;
		    SourceColorFactor = sourceColorFactor;
		    DestinationColorFactor = destinationColorFactor;
		    ColorFunction = colorFunction;
		    SourceAlphaFactor = sourceAlphaFactor;
		    DestinationAlphaFactor = destinationAlphaFactor;
		    AlphaFunction = alphaFunction;
		    ColorWriteMask = null;
		}

		/// <summary>
		/// Constructs a new <see cref="BlendAttachmentDescription"/>.
		/// </summary>
		/// <param name="blendEnabled">Controls whether blending is enabled for the color attachment.</param>
		/// <param name="colorWriteMask">Controls which components of the color will be written to the framebuffer.</param>
		/// <param name="sourceColorFactor">Controls the source color's influence on the blend result.</param>
		/// <param name="destinationColorFactor">Controls the destination color's influence on the blend result.</param>
		/// <param name="colorFunction">Controls the function used to combine the source and destination color factors.</param>
		/// <param name="sourceAlphaFactor">Controls the source alpha's influence on the blend result.</param>
		/// <param name="destinationAlphaFactor">Controls the destination alpha's influence on the blend result.</param>
		/// <param name="alphaFunction">Controls the function used to combine the source and destination alpha factors.</param>
		public this(
		    bool blendEnabled,
		    ColorWriteMask colorWriteMask,
		    BlendFactor sourceColorFactor,
		    BlendFactor destinationColorFactor,
		    BlendFunction colorFunction,
		    BlendFactor sourceAlphaFactor,
		    BlendFactor destinationAlphaFactor,
		    BlendFunction alphaFunction)
		{
		    BlendEnabled = blendEnabled;
		    ColorWriteMask = colorWriteMask;
		    SourceColorFactor = sourceColorFactor;
		    DestinationColorFactor = destinationColorFactor;
		    ColorFunction = colorFunction;
		    SourceAlphaFactor = sourceAlphaFactor;
		    DestinationAlphaFactor = destinationAlphaFactor;
		    AlphaFunction = alphaFunction;
		}

		/// <summary>
		/// Describes a blend attachment state in which the source completely overrides the destination.
		/// Settings:
		///     BlendEnabled = true
		///     SourceColorFactor = BlendFactor.One
		///     DestinationColorFactor = BlendFactor.Zero
		///     ColorFunction = BlendFunction.Add
		///     SourceAlphaFactor = BlendFactor.One
		///     DestinationAlphaFactor = BlendFactor.Zero
		///     AlphaFunction = BlendFunction.Add
		/// </summary>
		public static readonly BlendAttachmentDescription OverrideBlend = BlendAttachmentDescription
		{
		    BlendEnabled = true,
		    SourceColorFactor = BlendFactor.one,
		    DestinationColorFactor = BlendFactor.zero,
		    ColorFunction = BlendFunction.Add,
		    SourceAlphaFactor = BlendFactor.one,
		    DestinationAlphaFactor = BlendFactor.zero,
		    AlphaFunction = BlendFunction.Add,
		};

		/// <summary>
		/// Describes a blend attachment state in which the source and destination are blended in an inverse relationship.
		/// Settings:
		///     BlendEnabled = true
		///     SourceColorFactor = BlendFactor.SourceAlpha
		///     DestinationColorFactor = BlendFactor.InverseSourceAlpha
		///     ColorFunction = BlendFunction.Add
		///     SourceAlphaFactor = BlendFactor.SourceAlpha
		///     DestinationAlphaFactor = BlendFactor.InverseSourceAlpha
		///     AlphaFunction = BlendFunction.Add
		/// </summary>
		public static readonly BlendAttachmentDescription AlphaBlend = BlendAttachmentDescription
		{
		    BlendEnabled = true,
		    SourceColorFactor = BlendFactor.sourceAlpha,
		    DestinationColorFactor = BlendFactor.inverseSourceAlpha,
		    ColorFunction = BlendFunction.Add,
		    SourceAlphaFactor = BlendFactor.sourceAlpha,
		    DestinationAlphaFactor = BlendFactor.inverseSourceColor,
		    AlphaFunction = BlendFunction.Add,
		};

		/// <summary>
		/// Describes a blend attachment state in which the source is added to the destination based on its alpha channel.
		/// Settings:
		///     BlendEnabled = true
		///     SourceColorFactor = BlendFactor.SourceAlpha
		///     DestinationColorFactor = BlendFactor.One
		///     ColorFunction = BlendFunction.Add
		///     SourceAlphaFactor = BlendFactor.SourceAlpha
		///     DestinationAlphaFactor = BlendFactor.One
		///     AlphaFunction = BlendFunction.Add
		/// </summary>
		public static readonly BlendAttachmentDescription AdditiveBlend = BlendAttachmentDescription
		{
		    BlendEnabled = true,
		    SourceColorFactor = BlendFactor.sourceAlpha,
		    DestinationColorFactor = BlendFactor.one,
		    ColorFunction = BlendFunction.Add,
		    SourceAlphaFactor = BlendFactor.sourceAlpha,
		    DestinationAlphaFactor = BlendFactor.one,
		    AlphaFunction = BlendFunction.Add,
		};

		/// <summary>
		/// Describes a blend attachment state in which blending is disabled.
		/// Settings:
		///     BlendEnabled = false
		///     SourceColorFactor = BlendFactor.One
		///     DestinationColorFactor = BlendFactor.Zero
		///     ColorFunction = BlendFunction.Add
		///     SourceAlphaFactor = BlendFactor.One
		///     DestinationAlphaFactor = BlendFactor.Zero
		///     AlphaFunction = BlendFunction.Add
		/// </summary>
		public static readonly BlendAttachmentDescription Disabled = BlendAttachmentDescription
		{
		    BlendEnabled = false,
		    SourceColorFactor = BlendFactor.one,
		    DestinationColorFactor = BlendFactor.zero,
		    ColorFunction = BlendFunction.Add,
		    SourceAlphaFactor = BlendFactor.one,
		    DestinationAlphaFactor = BlendFactor.zero,
		    AlphaFunction = BlendFunction.Add,
		};
	}
}