namespace System.Engine;


extension Pipeline
{
	// TODO: VertexLayoutDescription.Elements is a huge problem, currently requires manual `delete`
	public struct VertexLayoutDescription
	{
		/// <summary>
		/// The number of bytes in between successive elements in the <see cref="DeviceBuffer"/>.
		/// </summary>
		public uint32 Stride;
		/// <summary>
		/// An array of <see cref="VertexElementDescription"/> objects, each describing a single element of vertex data.
		/// </summary>
		public VertexElementDescription[] Elements;
		/// <summary>
		/// A value controlling how often data for instances is advanced for this layout. For per-vertex elements, this value
		/// should be 0.
		/// For example, an InstanceStepRate of 3 indicates that 3 instances will be drawn with the same value for this layout. The
		/// next 3 instances will be drawn with the next value, and so on.
		/// </summary>
		public uint32 InstanceStepRate;

		/// <summary>
		/// Constructs a new VertexLayoutDescription.
		/// </summary>
		/// <param name="stride">The number of bytes in between successive elements in the <see cref="DeviceBuffer"/>.</param>
		/// <param name="elements">An array of <see cref="VertexElementDescription"/> objects, each describing a single element
		/// of vertex data.</param>
		public this (uint32 stride, params VertexElementDescription[] elements)
		{
		    Stride = stride;
		    Elements = elements;
		    InstanceStepRate = 0;
		}

		/// <summary>
		/// Constructs a new VertexLayoutDescription.
		/// </summary>
		/// <param name="stride">The number of bytes in between successive elements in the <see cref="DeviceBuffer"/>.</param>
		/// <param name="elements">An array of <see cref="VertexElementDescription"/> objects, each describing a single element
		/// of vertex data.</param>
		/// <param name="instanceStepRate">A value controlling how often data for instances is advanced for this element. For
		/// per-vertex elements, this value should be 0.
		/// For example, an InstanceStepRate of 3 indicates that 3 instances will be drawn with the same value for this element.
		/// The next 3 instances will be drawn with the next value for this element, and so on.</param>
		public this (uint32 stride, uint32 instanceStepRate, params VertexElementDescription[] elements)
		{
		    Stride = stride;
		    Elements = elements;
		    InstanceStepRate = instanceStepRate;
		}

		/// <summary>
		/// Constructs a new VertexLayoutDescription. The stride is assumed to be the sum of the size of all elements.
		/// </summary>
		/// <param name="elements">An array of <see cref="VertexElementDescription"/> objects, each describing a single element
		/// of vertex data.</param>
		public this (params VertexElementDescription[] elements)
		{
			this.Elements = new Pipeline.VertexElementDescription[elements.Count];
			for (uint32 n = 0; n < elements.Count; n++)
				this.Elements[n] = elements[n];

		    uint32 computedStride = 0;
		    for (int i = 0; i < elements.Count; i++)
		    {
		        computedStride += FormatHelpers.GetSizeInBytes(elements[i].Format);
		    }

		    Stride = computedStride;
		    InstanceStepRate = 0;
		}
	}
}