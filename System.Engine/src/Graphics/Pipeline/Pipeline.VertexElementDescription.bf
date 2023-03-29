namespace System.Engine;


extension Pipeline
{
	public struct VertexElementDescription
	{
		/// <summary>
		/// The name of the element.
		/// </summary>
		public String Name;
		/// <summary>
		/// The semantic type of the element.
		/// </summary>
		public VertexElementSemantic Semantic;
		/// <summary>
		/// The format of the element.
		/// </summary>
		public VertexElementFormat Format;

		/// <summary>
		/// Constructs a new VertexElementDescription describing a per-vertex element.
		/// </summary>
		/// <param name="name">The name of the element.</param>
		/// <param name="semantic">The semantic type of the element.</param>
		/// <param name="format">The format of the element.</param>
		public this (String name, VertexElementSemantic semantic, VertexElementFormat format)
		    : this(name, format, semantic)
		{
		}

		/// <summary>
		/// Constructs a new VertexElementDescription.
		/// </summary>
		/// <param name="name">The name of the element.</param>
		/// <param name="semantic">The semantic type of the element.</param>
		/// <param name="format">The format of the element.</param>
		public this (
		    String name,
		    VertexElementFormat format,
		    VertexElementSemantic semantic)
		{
		    Name = name;
		    Format = format;
		    Semantic = semantic;
		}
	}
}