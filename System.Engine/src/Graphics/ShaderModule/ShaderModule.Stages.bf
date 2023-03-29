namespace System.Engine;


extension ShaderModule
{
	public enum Stages : uint8
	{
		/// <summary>
		/// No stages.
		/// </summary>
		none = 0,
		/// <summary>
		/// The vertex shader stage.
		/// </summary>
		vertex = 1 << 0,
		/// <summary>
		/// The geometry shader stage.
		/// </summary>
		geometry = 1 << 1,
		/// <summary>
		/// The tessellation control (or hull) shader stage.
		/// </summary>
		tessellationControl = 1 << 2,
		/// <summary>
		/// The tessellation evaluation (or domain) shader stage.
		/// </summary>
		tessellationEvaluation = 1 << 3,
		/// <summary>
		/// The fragment (or pixel) shader stage.
		/// </summary>
		fragment = 1 << 4,
		/// <summary>
		/// The compute shader stage.
		/// </summary>
		compute = 1 << 5,
	}
}