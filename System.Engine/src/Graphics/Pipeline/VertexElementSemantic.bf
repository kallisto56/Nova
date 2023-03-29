namespace System.Engine;

/// <summary>
/// The type of a vertex element, describing how the element is interpreted.
/// </summary>
public enum VertexElementSemantic : uint8
{
    /// <summary>
    /// A position.
    /// </summary>
    position,
    /// <summary>
    /// A normal direction.
    /// </summary>
    normal,
    /// <summary>
    /// A texture coordinate.
    /// </summary>
    textureCoordinate,
    /// <summary>
    /// A color.
    /// </summary>
    color,
}