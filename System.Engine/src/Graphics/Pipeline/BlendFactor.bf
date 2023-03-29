namespace System.Engine;

extension Pipeline
{
	public enum BlendFactor : uint8
	{
	    /// <summary>
	    /// Each component is multiplied by 1.
	    /// </summary>
	    zero,
	    /// <summary>
	    /// Each component is multiplied by 0.
	    /// </summary>
	    one,
	    /// <summary>
	    /// Each component is multiplied by the source alpha component.
	    /// </summary>
	    sourceAlpha,
	    /// <summary>
	    /// Each component is multiplied by (1 - source alpha).
	    /// </summary>
	    inverseSourceAlpha,
	    /// <summary>
	    /// Each component is multiplied by the destination alpha component.
	    /// </summary>
	    destinationAlpha,
	    /// <summary>
	    /// Each component is multiplied by (1 - destination alpha).
	    /// </summary>
	    inverseDestinationAlpha,
	    /// <summary>
	    /// Each component is multiplied by the matching component of the source color.
	    /// </summary>
	    sourceColor,
	    /// <summary>
	    /// Each component is multiplied by (1 - the matching component of the source color).
	    /// </summary>
	    inverseSourceColor,
	    /// <summary>
	    /// Each component is multiplied by the matching component of the destination color.
	    /// </summary>
	    destinationColor,
	    /// <summary>
	    /// Each component is multiplied by (1 - the matching component of the destination color).
	    /// </summary>
	    inverseDestinationColor,
	    /// <summary>
	    /// Each component is multiplied by the matching component in constant factor specified in <see cref="BlendStateDescription.BlendFactor"/>.
	    /// </summary>
	    blendFactor,
	    /// <summary>
	    /// Each component is multiplied by (1 - the matching component in constant factor specified in <see cref="BlendStateDescription.BlendFactor"/>).
	    /// </summary>
	    inverseBlendFactor,
	}
}