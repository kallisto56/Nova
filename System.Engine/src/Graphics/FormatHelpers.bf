namespace System.Engine;

static public class FormatHelpers
{
	public static uint32 GetSizeInBytes(VertexElementFormat format)
	{
		if (
		    format == .byte2_Norm ||
		    format == .byte2 ||
		    format == .sByte2_Norm ||
		    format == .sByte2
		)
		{
		    return 2;
		}

		if (
		    format == .float1 ||
		    format == .UInt1 ||
		    format == .Int1 ||
		    format == .byte4_Norm ||
		    format == .byte4 ||
		    format == .sByte4_Norm ||
		    format == .sByte4 ||
		    format == .uShort2_Norm ||
		    format == .uShort2 ||
		    format == .Short2_Norm ||
		    format == .Short2
		)
		{
		    return 4;
		}

		if (format == .float2 ||
		    format == .UInt2 ||
		    format == .Int2 ||
		    format == .UShort4_Norm ||
		    format == .UShort4 ||
		    format == .Short4_Norm ||
		    format == .Short4
		)
		{
		    return 8;
		}

		if (
		    format == .float3 ||
		    format == .UInt3 ||
		    format == .Int3
		)
		{
		    return 12;
		}

		if (
		    format == .float4 ||
		    format == .UInt4 ||
		    format == .Int4
		)
		{
		    return 16;
		}

		Runtime.FatalError("");
	}
}