namespace System.Engine;

extension Pipeline
{
	public struct StencilBehaviorDescription
	{
		/// <summary>
		/// The operation performed on samples that fail the stencil test.
		/// </summary>
		public StencilOperation Fail;
		/// <summary>
		/// The operation performed on samples that pass the stencil test.
		/// </summary>
		public StencilOperation Pass;
		/// <summary>
		/// The operation performed on samples that pass the stencil test but fail the depth test.
		/// </summary>
		public StencilOperation DepthFail;
		/// <summary>
		/// The comparison operator used in the stencil test.
		/// </summary>
		public ComparisonKind Comparison;

		/// <summary>
		/// Constructs a new StencilBehaviorDescription.
		/// </summary>
		/// <param name="fail">The operation performed on samples that fail the stencil test.</param>
		/// <param name="pass">The operation performed on samples that pass the stencil test.</param>
		/// <param name="depthFail">The operation performed on samples that pass the stencil test but fail the depth test.</param>
		/// <param name="comparison">The comparison operator used in the stencil test.</param>
		public this (
		    StencilOperation fail,
		    StencilOperation pass,
		    StencilOperation depthFail,
		    ComparisonKind comparison)
		{
		    Fail = fail;
		    Pass = pass;
		    DepthFail = depthFail;
		    Comparison = comparison;
		}
	}
}