namespace System.Engine;


extension Buffer
{
	public enum Usage : uint8
	{
		/// <summary>
		/// Indicates that a <see cref="DeviceBuffer"/> can be used as the source of vertex data for drawing commands.
		/// This flag enables the use of a Buffer in the <see cref="CommandList.SetVertexBuffer(uint, DeviceBuffer)"/> method.
		/// </summary>
		vertexBuffer = 1 << 0,
		/// <summary>
		/// Indicates that a <see cref="DeviceBuffer"/> can be used as the source of index data for drawing commands.
		/// This flag enables the use of a Buffer in the <see cref="CommandList.SetIndexBuffer(DeviceBuffer, IndexFormat)" /> method.
		/// </summary>
		indexBuffer = 1 << 1,
		/// <summary>
		/// Indicates that a <see cref="DeviceBuffer"/> can be used as a uniform Buffer.
		/// This flag enables the use of a Buffer in a <see cref="ResourceSet"/> as a uniform Buffer.
		/// </summary>
		uniformBuffer = 1 << 2,
		/// <summary>
		/// Indicates that a <see cref="DeviceBuffer"/> can be used as a read-only structured Buffer.
		/// This flag enables the use of a Buffer in a <see cref="ResourceSet"/> as a read-only structured Buffer.
		/// This flag can only be combined with <see cref="Dynamic"/>.
		/// </summary>
		structuredBufferReadOnly = 1 << 3,
		/// <summary>
		/// Indicates that a <see cref="DeviceBuffer"/> can be used as a read-write structured Buffer.
		/// This flag enables the use of a Buffer in a <see cref="ResourceSet"/> as a read-write structured Buffer.
		/// This flag cannot be combined with any other flag.
		/// </summary>
		structuredBufferReadWrite = 1 << 4,
		/// <summary>
		/// Indicates that a <see cref="DeviceBuffer"/> can be used as the source of indirect drawing information.
		/// This flag enables the use of a Buffer in the *Indirect methods of <see cref="CommandList"/>.
		/// This flag cannot be combined with <see cref="Dynamic"/>.
		/// </summary>
		indirectBuffer = 1 << 5,
		/// <summary>
		/// Indicates that a <see cref="DeviceBuffer"/> will be updated with new data very frequently. Dynamic Buffers can be
		/// mapped with <see cref="MapMode.Write"/>. This flag cannot be combined with <see cref="StructuredBufferReadWrite"/>
		/// or <see cref="IndirectBuffer"/>.
		/// </summary>
		dynamic = 1 << 6,
		/// <summary>
		/// Indicates that a <see cref="DeviceBuffer"/> will be used as a staging Buffer. Staging Buffers can be used to transfer data
		/// to-and-from the CPU using <see cref="GraphicsDevice.Map(MappableResource, MapMode)"/>. Staging Buffers can use all
		/// <see cref="MapMode"/> values.
		/// This flag cannot be combined with any other flag.
		/// </summary>
		staging = 1 << 7,
	}
}