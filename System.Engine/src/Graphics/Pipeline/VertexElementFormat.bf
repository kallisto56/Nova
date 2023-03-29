namespace System.Engine;



/// <summary>
/// The format of an individual vertex element.
/// </summary>
public enum VertexElementFormat : uint8
{
    /// <summary>
	/// One 32-bit floating point value.
	/// </summary>
	float1,
	/// <summary>
	/// Two 32-bit floating point values.
	/// </summary>
	float2,
	/// <summary>
	/// Three 32-bit floating point values.
	/// </summary>
	float3,
	/// <summary>
	/// Four 32-bit floating point values.
	/// </summary>
	float4,
	/// <summary>
	/// Two 8-bit unsigned normalized integers.
	/// </summary>
	byte2_Norm,
	/// <summary>
	/// Two 8-bit unisgned integers.
	/// </summary>
	byte2,
	/// <summary>
	/// Four 8-bit unsigned normalized integers.
	/// </summary>
	byte4_Norm,
	/// <summary>
	/// Four 8-bit unsigned integers.
	/// </summary>
	byte4,
	/// <summary>
	/// Two 8-bit signed normalized integers.
	/// </summary>
	sByte2_Norm,
	/// <summary>
	/// Two 8-bit signed integers.
	/// </summary>
	sByte2,
	/// <summary>
	/// Four 8-bit signed normalized integers.
	/// </summary>
	sByte4_Norm,
	/// <summary>
	/// Four 8-bit signed integers.
	/// </summary>
	sByte4,
	/// <summary>
	/// Two 16-bit unsigned normalized integers.
	/// </summary>
	uShort2_Norm,
	/// <summary>
	/// Two 16-bit unsigned integers.
	/// </summary>
	uShort2,
	/// <summary>
	/// Four 16-bit unsigned normalized integers.
	/// </summary>
	UShort4_Norm,
	/// <summary>
	/// Four 16-bit unsigned integers.
	/// </summary>
	UShort4,
	/// <summary>
	/// Two 16-bit signed normalized integers.
	/// </summary>
	Short2_Norm,
	/// <summary>
	/// Two 16-bit signed integers.
	/// </summary>
	Short2,
	/// <summary>
	/// Four 16-bit signed normalized integers.
	/// </summary>
	Short4_Norm,
	/// <summary>
	/// Four 16-bit signed integers.
	/// </summary>
	Short4,
	/// <summary>
	/// One 32-bit unsigned integer.
	/// </summary>
	UInt1,
	/// <summary>
	/// Two 32-bit unsigned integers.
	/// </summary>
	UInt2,
	/// <summary>
	/// Three 32-bit unsigned integers.
	/// </summary>
	UInt3,
	/// <summary>
	/// Four 32-bit unsigned integers.
	/// </summary>
	UInt4,
	/// <summary>
	/// One 32-bit signed integer.
	/// </summary>
	Int1,
	/// <summary>
	/// Two 32-bit signed integers.
	/// </summary>
	Int2,
	/// <summary>
	/// Three 32-bit signed integers.
	/// </summary>
	Int3,
	/// <summary>
	/// Four 32-bit signed integers.
	/// </summary>
	Int4,
	/// <summary>
	/// One 16-bit floating point value.
	/// </summary>
	Half1,
	/// <summary>
	/// Two 16-bit floating point values.
	/// </summary>
	Half2,
	/// <summary>
	/// Four 16-bit floating point values.
	/// </summary>
	Half4,
}