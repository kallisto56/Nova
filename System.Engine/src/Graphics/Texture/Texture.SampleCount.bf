namespace System.Engine;


extension Texture
{
	public enum SampleCount
	{
		/// <summary>
		/// 1 sample (no multi-sampling).
		/// </summary>
		count1,
		/// <summary>
		/// 2 Samples.
		/// </summary>
		count2,
		/// <summary>
		/// 4 Samples.
		/// </summary>
		count4,
		/// <summary>
		/// 8 Samples.
		/// </summary>
		count8,
		/// <summary>
		/// 16 Samples.
		/// </summary>
		count16,
		/// <summary>
		/// 32 Samples.
		/// </summary>
		count32,
	}
}