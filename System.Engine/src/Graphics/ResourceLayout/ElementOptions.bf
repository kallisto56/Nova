namespace System.Engine;


extension ResourceLayout
{
	public enum ElementOptions : uint8
	{
		/// <summary>
		/// No special options.
		/// </summary>
		None,
		/// <summary>
		/// Can be applied to a buffer type resource (<see cref="ResourceKind.StructuredBufferReadOnly"/>,
		/// <see cref="ResourceKind.StructuredBufferReadWrite"/>, or <see cref="ResourceKind.UniformBuffer"/>), allowing it to be
		/// bound with a dynamic offset using <see cref="CommandList.SetGraphicsResourceSet(uint, ResourceSet, uint[])"/>.
		/// Offsets specified this way must be a multiple of <see cref="GraphicsDevice.UniformBufferMinOffsetAlignment"/> or
		/// <see cref="GraphicsDevice.StructuredBufferMinOffsetAlignment"/>.
		/// </summary>
		DynamicBinding = 1 << 0,
	}
}