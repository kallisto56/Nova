namespace System.Engine;


extension ResourceLayout
{
	public struct ElementDescription
	{
		/// <summary>
		/// The name of the element.
		/// </summary>
		public String Name;
		/// <summary>
		/// The kind of resource.
		/// </summary>
		public ResourceKind Kind;
		/// <summary>
		/// The <see cref="ShaderStages"/> in which this element is used.
		/// </summary>
		public ShaderModule.Stages Stages;
		/// <summary>
		/// Miscellaneous resource options for this element.
		/// </summary>
		public ElementOptions Options;

		/// <summary>
		/// Constructs a new ResourceLayoutElementDescription.
		/// </summary>
		/// <param name="name">The name of the element.</param>
		/// <param name="kind">The kind of resource.</param>
		/// <param name="stages">The <see cref="ShaderStages"/> in which this element is used.</param>
		public this (String name, ResourceKind kind, ShaderModule.Stages stages)
		{
		    Name = name;
		    Kind = kind;
		    Stages = stages;
		    Options = .None;
		}
	}
}