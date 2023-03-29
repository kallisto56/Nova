namespace System.Engine;


extension Pipeline
{
	public struct RasterizerStateDescription
	{
		/// <summary>
		/// Controls which face will be culled.
		/// </summary>
		public FaceCullMode CullMode;
		/// <summary>
		/// Controls how the rasterizer fills polygons.
		/// </summary>
		public PolygonFillMode FillMode;
		/// <summary>
		/// Controls the winding order used to determine the front face of primitives.
		/// </summary>
		public FrontFace FrontFace;
		/// <summary>
		/// Controls whether depth clipping is enabled.
		/// </summary>
		public bool DepthClipEnabled;
		/// <summary>
		/// Controls whether the scissor test is enabled.
		/// </summary>
		public bool ScissorTestEnabled;

		/// <summary>
		/// Constructs a new RasterizerStateDescription.
		/// </summary>
		/// <param name="cullMode">Controls which face will be culled.</param>
		/// <param name="fillMode">Controls how the rasterizer fills polygons.</param>
		/// <param name="frontFace">Controls the winding order used to determine the front face of primitives.</param>
		/// <param name="depthClipEnabled">Controls whether depth clipping is enabled.</param>
		/// <param name="scissorTestEnabled">Controls whether the scissor test is enabled.</param>
		public this (
		    FaceCullMode cullMode,
		    PolygonFillMode fillMode,
		    FrontFace frontFace,
		    bool depthClipEnabled,
		    bool scissorTestEnabled)
		{
		    CullMode = cullMode;
		    FillMode = fillMode;
		    FrontFace = frontFace;
		    DepthClipEnabled = depthClipEnabled;
		    ScissorTestEnabled = scissorTestEnabled;
		}

		/// <summary>
		/// Describes the default rasterizer state, with clockwise backface culling, solid polygon filling, and both depth
		/// clipping and scissor tests enabled.
		/// Settings:
		///     CullMode = FaceCullMode.Back
		///     FillMode = PolygonFillMode.Solid
		///     FrontFace = FrontFace.Clockwise
		///     DepthClipEnabled = true
		///     ScissorTestEnabled = false
		/// </summary>
		public static readonly RasterizerStateDescription Default = RasterizerStateDescription
		{
		    CullMode = FaceCullMode.Back,
		    FillMode = PolygonFillMode.Solid,
		    FrontFace = .Clockwise,
		    DepthClipEnabled = true,
		    ScissorTestEnabled = false,
		};

		/// <summary>
		/// Describes a rasterizer state with no culling, solid polygon filling, and both depth
		/// clipping and scissor tests enabled.
		/// Settings:
		///     CullMode = FaceCullMode.None
		///     FillMode = PolygonFillMode.Solid
		///     FrontFace = FrontFace.Clockwise
		///     DepthClipEnabled = true
		///     ScissorTestEnabled = false
		/// </summary>
		public static readonly RasterizerStateDescription CullNone = RasterizerStateDescription
		{
		    CullMode = FaceCullMode.None,
		    FillMode = PolygonFillMode.Solid,
		    FrontFace = .Clockwise,
		    DepthClipEnabled = true,
		    ScissorTestEnabled = false,
		};
	}
}