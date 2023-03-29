namespace System.Engine;


extension Pipeline
{
	public struct DepthStencilStateDescription
	{
		/// <summary>
		/// Controls whether depth testing is enabled.
		/// </summary>
		public bool DepthTestEnabled;
		/// <summary>
		/// Controls whether new depth values are written to the depth buffer.
		/// </summary>
		public bool DepthWriteEnabled;
		/// <summary>
		/// The <see cref="ComparisonKind"/> used when considering new depth values.
		/// </summary>
		public ComparisonKind DepthComparison;

		/// <summary>
		/// Controls whether the stencil test is enabled.
		/// </summary>
		public bool StencilTestEnabled;
		/// <summary>
		/// Controls how stencil tests are handled for pixels whose surface faces towards the camera.
		/// </summary>
		public StencilBehaviorDescription StencilFront;
		/// <summary>
		/// Controls how stencil tests are handled for pixels whose surface faces away from the camera.
		/// </summary>
		public StencilBehaviorDescription StencilBack;
		/// <summary>
		/// Controls the portion of the stencil buffer used for reading.
		/// </summary>
		public uint8 StencilReadMask;
		/// <summary>
		/// Controls the portion of the stencil buffer used for writing.
		/// </summary>
		public uint8 StencilWriteMask;
		/// <summary>
		/// The reference value to use when doing a stencil test.
		/// </summary>
		public uint32 StencilReference;
	}
}