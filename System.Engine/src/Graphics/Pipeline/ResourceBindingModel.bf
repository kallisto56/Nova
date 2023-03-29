namespace System.Engine;

public enum ResourceBindingModel : uint8
{
    /// <summary>
    /// The default binding model.
    /// </summary>
    Default = 0,
    /// <summary>
    /// An improved binding model which enables greater shader reuse and authoring flexibility.
    /// </summary>
    Improved = 1,
}