namespace System.Engine;

public enum FaceCullMode : uint8
{
    /// <summary>
    /// The back face.
    /// </summary>
    Back,
    /// <summary>
    /// The front face.
    /// </summary>
    Front,
    /// <summary>
    /// No face culling.
    /// </summary>
    None,
}