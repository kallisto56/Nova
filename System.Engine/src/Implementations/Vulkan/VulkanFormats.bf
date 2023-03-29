namespace System.Engine.Implementations.Vulkan;


using System;
using System.Threading;
using System.Diagnostics;
using System.Collections;

using API.Vulkan;
using static API.Vulkan.VulkanNative;


static public class VulkanFormats
{
	static public VkViewport Convert (Viewport viewport)
	{
		return VkViewport ()
		{
			x = viewport.x,
			y = viewport.y,
			width = viewport.width,
			height = viewport.height,
			minDepth = viewport.minDepth,
			maxDepth = viewport.maxDepth,
		};
	}

	static public VkColorComponentFlags Convert (ColorWriteMask mask)
	{
		VkColorComponentFlags flags = VkColorComponentFlags.None;

		if ((mask & .Red) == ColorWriteMask.Red) flags |= .VK_COLOR_COMPONENT_R_BIT;
		if ((mask & .Green) == ColorWriteMask.Green) flags |= .VK_COLOR_COMPONENT_G_BIT;
		if ((mask & .Blue) == ColorWriteMask.Blue) flags |= .VK_COLOR_COMPONENT_A_BIT;
		if ((mask & .Alpha) == ColorWriteMask.Alpha) flags |= .VK_COLOR_COMPONENT_A_BIT;

		return flags;
	}

	static public VkBlendOp Convert (Pipeline.BlendFunction func)
	{
		switch (func)
		{
			case .Add: return .VK_BLEND_OP_ADD;
			case .Subtract: return .VK_BLEND_OP_SUBTRACT;
			case .ReverseSubtract: return .VK_BLEND_OP_REVERSE_SUBTRACT;
			case .Minimum: return .VK_BLEND_OP_MIN;
			case .Maximum: return .VK_BLEND_OP_MAX;
		}
	}

	static public VkBlendFactor Convert (Pipeline.BlendFactor factor)
	{
	    switch (factor)
	    {
	        case .zero: return .VK_BLEND_FACTOR_ZERO;
	        case .one: return .VK_BLEND_FACTOR_ONE;

	        case .sourceAlpha: return .VK_BLEND_FACTOR_SRC_ALPHA;
	        case .inverseSourceAlpha: return .VK_BLEND_FACTOR_ONE_MINUS_SRC_ALPHA;

	        case .destinationAlpha: return .VK_BLEND_FACTOR_DST_ALPHA;
	        case .inverseDestinationAlpha: return .VK_BLEND_FACTOR_ONE_MINUS_DST_ALPHA;

	        case .sourceColor: return .VK_BLEND_FACTOR_SRC_COLOR;
	        case .inverseSourceColor: return .VK_BLEND_FACTOR_ONE_MINUS_SRC_COLOR;

	        case .destinationColor: return .VK_BLEND_FACTOR_DST_COLOR;
	        case .inverseDestinationColor: return .VK_BLEND_FACTOR_ONE_MINUS_DST_COLOR;

	        case .blendFactor: return .VK_BLEND_FACTOR_CONSTANT_COLOR;
	        case .inverseBlendFactor: return .VK_BLEND_FACTOR_ONE_MINUS_CONSTANT_COLOR;
	    }
	}

	static public VkDescriptorType Convert (ResourceLayout.ResourceKind kind, ResourceLayout.ElementOptions options)
	{
		bool dynamicBinding = (options & .DynamicBinding) != 0;

		switch (kind)
		{
		    case .UniformBuffer:
		        return (dynamicBinding == true)
					? .VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER_DYNAMIC
					: .VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER;

		    case .StructuredBufferReadWrite, .StructuredBufferReadOnly:
		        return (dynamicBinding == true)
					? .VK_DESCRIPTOR_TYPE_STORAGE_BUFFER_DYNAMIC
					: .VK_DESCRIPTOR_TYPE_STORAGE_BUFFER;

		    case .TextureReadOnly:
		        return .VK_DESCRIPTOR_TYPE_SAMPLED_IMAGE;

		    case .TextureReadWrite:
		        return .VK_DESCRIPTOR_TYPE_STORAGE_IMAGE;

		    case .Sampler:
		        return .VK_DESCRIPTOR_TYPE_SAMPLER;
		}
	}


	static public VkFormat Convert (VertexElementFormat format)
	{
		switch (format)
		{
			case .float1: return .VK_FORMAT_R32_SFLOAT;
			case .float2: return .VK_FORMAT_R32G32_SFLOAT;
			case .float3: return .VK_FORMAT_R32G32B32_SFLOAT;
			case .float4: return .VK_FORMAT_R32G32B32A32_SFLOAT;
			case .byte2_Norm: return .VK_FORMAT_R8G8_UNORM;
			case .byte2: return .VK_FORMAT_R8G8_UINT;
			case .byte4_Norm: return .VK_FORMAT_R8G8B8A8_UNORM;
			case .byte4: return .VK_FORMAT_R8G8B8A8_UINT;
			case .sByte2_Norm: return .VK_FORMAT_R8G8_SNORM;
			case .sByte2: return .VK_FORMAT_R8G8_SINT;
			case .sByte4_Norm: return .VK_FORMAT_R8G8B8A8_SNORM;
			case .sByte4: return .VK_FORMAT_R8G8B8A8_SINT;
			case .uShort2_Norm: return .VK_FORMAT_R16G16_UNORM;
			case .uShort2: return .VK_FORMAT_R16G16_UINT;
			case .UShort4_Norm: return .VK_FORMAT_R16G16B16A16_UNORM;
			case .UShort4: return .VK_FORMAT_R16G16B16A16_UINT;
			case .Short2_Norm: return .VK_FORMAT_R16G16_SNORM;
			case .Short2: return .VK_FORMAT_R16G16_SINT;
			case .Short4_Norm: return .VK_FORMAT_R16G16B16A16_SNORM;
			case .Short4: return .VK_FORMAT_R16G16B16A16_SINT;
			case .UInt1: return .VK_FORMAT_R32_UINT;
			case .UInt2: return .VK_FORMAT_R32G32_UINT;
			case .UInt3: return .VK_FORMAT_R32G32B32_UINT;
			case .UInt4: return .VK_FORMAT_R32G32B32A32_UINT;
			case .Int1: return .VK_FORMAT_R32_SINT;
			case .Int2: return .VK_FORMAT_R32G32_SINT;
			case .Int3: return .VK_FORMAT_R32G32B32_SINT;
			case .Int4: return .VK_FORMAT_R32G32B32A32_SINT;
			case .Half1: return .VK_FORMAT_R16_SFLOAT;
			case .Half2: return .VK_FORMAT_R16G16_SFLOAT;
			case .Half4: return .VK_FORMAT_R16G16B16A16_SFLOAT;
			default: Runtime.NotImplemented();
		}
	}

	static public VkStencilOp Convert (Pipeline.StencilOperation op)
	{
		switch (op)
		{
			case .Keep: return .VK_STENCIL_OP_KEEP;
			case .Zero: return .VK_STENCIL_OP_ZERO;
			case .Replace: return .VK_STENCIL_OP_REPLACE;
			case .IncrementAndClamp: return .VK_STENCIL_OP_INCREMENT_AND_CLAMP;
			case .DecrementAndClamp: return .VK_STENCIL_OP_DECREMENT_AND_CLAMP;
			case .Invert: return .VK_STENCIL_OP_INVERT;
			case .IncrementAndWrap: return .VK_STENCIL_OP_INCREMENT_AND_WRAP;
			case .DecrementAndWrap: return .VK_STENCIL_OP_DECREMENT_AND_WRAP;

			default: Runtime.NotImplemented();
		}
	}

	static public VkCompareOp Convert (Pipeline.ComparisonKind comparisonKind)
	{
		switch (comparisonKind)
		{
		    case .Never: return .VK_COMPARE_OP_NEVER;
		    case .Less: return .VK_COMPARE_OP_LESS;
		    case .Equal: return .VK_COMPARE_OP_EQUAL;
		    case .LessEqual: return .VK_COMPARE_OP_LESS_OR_EQUAL;
		    case .Greater: return .VK_COMPARE_OP_GREATER;
		    case .NotEqual: return .VK_COMPARE_OP_NOT_EQUAL;
		    case .GreaterEqual: return .VK_COMPARE_OP_GREATER_OR_EQUAL;
		    case .Always: return .VK_COMPARE_OP_ALWAYS;

			default: Runtime.NotImplemented();
		}
	}

	static public VkPolygonMode Convert (PolygonFillMode fillMode)
	{
		switch (fillMode)
		{
			case .Solid: return .VK_POLYGON_MODE_FILL;
			case .Wireframe: return .VK_POLYGON_MODE_LINE;
		}
	}

	static public VkCullModeFlags Convert (FaceCullMode cullMode)
	{
		switch (cullMode)
		{
			case .None: return .VK_CULL_MODE_NONE;
			case .Front: return .VK_CULL_MODE_FRONT_BIT;
			case .Back: return .VK_CULL_MODE_BACK_BIT;
		}
	}

	static public VkFrontFace Convert (FrontFace frontFace)
	{
		switch (frontFace)
		{
			case .Clockwise: return .VK_FRONT_FACE_CLOCKWISE;
			case .CounterClockwise: return .VK_FRONT_FACE_COUNTER_CLOCKWISE;
		}
	}


	static public VkPrimitiveTopology Convert (Pipeline.PrimitiveTopology topology)
	{
		switch (topology)
		{
			case .lineList: return .VK_PRIMITIVE_TOPOLOGY_LINE_LIST;
			case .lineStrip: return .VK_PRIMITIVE_TOPOLOGY_LINE_STRIP;
			case .pointList: return .VK_PRIMITIVE_TOPOLOGY_POINT_LIST;
			case .triangleList: return .VK_PRIMITIVE_TOPOLOGY_TRIANGLE_LIST;
			case .triangleStrip: return .VK_PRIMITIVE_TOPOLOGY_TRIANGLE_STRIP;
		}
	}

	public static VkShaderStageFlags Convert (ShaderModule.Stages stage)
	{
		VkShaderStageFlags value = .None;

		if ((stage & .vertex) == .vertex)
		    value |= .VK_SHADER_STAGE_VERTEX_BIT;

		if ((stage & .geometry) == .geometry)
		    value |= .VK_SHADER_STAGE_GEOMETRY_BIT;

		if ((stage & .tessellationControl) == .tessellationControl)
		    value |= .VK_SHADER_STAGE_TESSELLATION_CONTROL_BIT;

		if ((stage & .tessellationEvaluation) == .tessellationEvaluation)
		{
			Tracy.WriteLine("((stage & .tessellationEvaluation) == .tessellationEvaluation) == {0}", ((stage & .tessellationEvaluation) == .tessellationEvaluation));
		    value |= .VK_SHADER_STAGE_TESSELLATION_EVALUATION_BIT;
		}

		if ((stage & .fragment) == .fragment)
		    value |= .VK_SHADER_STAGE_FRAGMENT_BIT;

		if ((stage & .compute) == .compute)
		    value |= .VK_SHADER_STAGE_COMPUTE_BIT;

		return value;
	}

	public static VkBufferUsageFlags Convert (Buffer.Usage usage, VkBufferUsageFlags vkUsage = default)
	{
		var vkUsage;

		if ((usage & .vertexBuffer) == .vertexBuffer)
			vkUsage |= .VK_BUFFER_USAGE_VERTEX_BUFFER_BIT;

		if ((usage & .indexBuffer) == .indexBuffer)
			vkUsage |= .VK_BUFFER_USAGE_INDEX_BUFFER_BIT;

		if ((usage & .uniformBuffer) == .uniformBuffer)
			vkUsage |= .VK_BUFFER_USAGE_UNIFORM_BUFFER_BIT;

		if ((usage & .structuredBufferReadWrite) == .structuredBufferReadWrite || (usage & .structuredBufferReadOnly) == .structuredBufferReadOnly)
			vkUsage |= .VK_BUFFER_USAGE_STORAGE_BUFFER_BIT;

		if ((usage & .indirectBuffer) == .indirectBuffer)
			vkUsage |= .VK_BUFFER_USAGE_INDIRECT_BUFFER_BIT;

		return vkUsage;
	}


	public static VkIndexType Convert (Buffer.IndexFormat indexFormat)
	{
		return indexFormat == .uint16
			? .VK_INDEX_TYPE_UINT16
			: .VK_INDEX_TYPE_UINT32
			;
	}


	public static VkImageUsageFlags Convert (Texture.Usage usage)
	{
		VkImageUsageFlags e = .VK_IMAGE_USAGE_TRANSFER_DST_BIT | .VK_IMAGE_USAGE_TRANSFER_SRC_BIT;

		if ((usage & .sampled) == .sampled)
		    e |= .VK_IMAGE_USAGE_SAMPLED_BIT;

		if ((usage & .depthStencil) == .depthStencil)
		    e |= .VK_IMAGE_USAGE_DEPTH_STENCIL_ATTACHMENT_BIT;

		if ((usage & .renderTarget) == .renderTarget)
		    e |= .VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT;

		if ((usage & .storage) == .storage)
		    e |= .VK_IMAGE_USAGE_STORAGE_BIT;

		return e;
	}


	public static VkImageType Convert (Texture.Type type)
	{
		switch (type)
		{
			case .Texture1D: return .VK_IMAGE_TYPE_1D;
			case .Texture2D: return .VK_IMAGE_TYPE_2D;
		    case .Texture3D: return .VK_IMAGE_TYPE_3D;
		}
	}


	public static VkSampleCountFlags Convert (Texture.SampleCount sampleCount)
	{
		switch (sampleCount)
		{
		    case .count1: return .VK_SAMPLE_COUNT_1_BIT;
		    case .count2: return .VK_SAMPLE_COUNT_2_BIT;
		    case .count4: return .VK_SAMPLE_COUNT_4_BIT;
		    case .count8: return .VK_SAMPLE_COUNT_8_BIT;
		    case .count16: return .VK_SAMPLE_COUNT_16_BIT;
		    case .count32: return .VK_SAMPLE_COUNT_32_BIT;
		}
	}

	public static Texture.Format Convert (VkFormat format, bool toDepthFormat = false)
	{
		switch (format)
		{
			case .VK_FORMAT_R8_UNORM: return .R8_UNorm;
			case .VK_FORMAT_R8_SNORM: return .R8_SNorm;
			case .VK_FORMAT_R8_UINT: return .R8_UInt;
			case .VK_FORMAT_R8_SINT: return .R8_SInt;

			case .VK_FORMAT_R16_UNORM: return .R16_UNorm;
			case .VK_FORMAT_R16_SNORM: return .R16_SNorm;
			case .VK_FORMAT_R16_UINT: return .R16_UInt;
			case .VK_FORMAT_R16_SINT: return .R16_SInt;
			case .VK_FORMAT_R16_SFLOAT: return .R16_Float;

			case .VK_FORMAT_R32_UINT: return .R32_UInt;
			case .VK_FORMAT_R32_SINT: return .R32_SInt;
			case .VK_FORMAT_R32_SFLOAT, .VK_FORMAT_D32_SFLOAT: return .R32_Float;

			case .VK_FORMAT_R8G8_UNORM: return .R8_G8_UNorm;
			case .VK_FORMAT_R8G8_SNORM: return .R8_G8_SNorm;
			case .VK_FORMAT_R8G8_UINT: return .R8_G8_UInt;
			case .VK_FORMAT_R8G8_SINT: return .R8_G8_SInt;

			case .VK_FORMAT_R16G16_UNORM: return .R16_G16_UNorm;
			case .VK_FORMAT_R16G16_SNORM: return .R16_G16_SNorm;
			case .VK_FORMAT_R16G16_UINT: return .R16_G16_UInt;
			case .VK_FORMAT_R16G16_SINT: return .R16_G16_SInt;
			case .VK_FORMAT_R16G16_SFLOAT: return .R16_G16_Float;

			case .VK_FORMAT_R32G32_UINT: return .R32_G32_UInt;
			case .VK_FORMAT_R32G32_SINT: return .R32_G32_SInt;
			case .VK_FORMAT_R32G32_SFLOAT: return .R32_G32_Float;

			case .VK_FORMAT_R8G8B8A8_UNORM: return .R8_G8_B8_A8_UNorm;
			case .VK_FORMAT_R8G8B8A8_SRGB: return .R8_G8_B8_A8_UNorm_SRgb;
			case .VK_FORMAT_B8G8R8A8_UNORM: return .B8_G8_R8_A8_UNorm;
			case .VK_FORMAT_B8G8R8A8_SRGB: return .B8_G8_R8_A8_UNorm_SRgb;
			case .VK_FORMAT_R8G8B8A8_SNORM: return .R8_G8_B8_A8_SNorm;
			case .VK_FORMAT_R8G8B8A8_UINT: return .R8_G8_B8_A8_UInt;
			case .VK_FORMAT_R8G8B8A8_SINT: return .R8_G8_B8_A8_SInt;

			case .VK_FORMAT_R16G16B16A16_UNORM: return .R16_G16_B16_A16_UNorm;
			case .VK_FORMAT_R16G16B16A16_SNORM: return .R16_G16_B16_A16_SNorm;
			case .VK_FORMAT_R16G16B16A16_UINT: return .R16_G16_B16_A16_UInt;
			case .VK_FORMAT_R16G16B16A16_SINT: return .R16_G16_B16_A16_SInt;
			case .VK_FORMAT_R16G16B16A16_SFLOAT: return .R16_G16_B16_A16_Float;

			case .VK_FORMAT_R32G32B32A32_UINT: return .R32_G32_B32_A32_UInt;
			case .VK_FORMAT_R32G32B32A32_SINT: return .R32_G32_B32_A32_SInt;
			case .VK_FORMAT_R32G32B32A32_SFLOAT: return .R32_G32_B32_A32_Float;

			case .VK_FORMAT_BC1_RGB_UNORM_BLOCK: return .BC1_Rgb_UNorm;
			case .VK_FORMAT_BC1_RGB_SRGB_BLOCK: return .BC1_Rgb_UNorm_SRgb;
			case .VK_FORMAT_BC1_RGBA_UNORM_BLOCK: return .BC1_Rgba_UNorm;
			case .VK_FORMAT_BC1_RGBA_SRGB_BLOCK: return .BC1_Rgba_UNorm_SRgb;
			case .VK_FORMAT_BC2_UNORM_BLOCK: return .BC2_UNorm;
			case .VK_FORMAT_BC2_SRGB_BLOCK: return .BC2_UNorm_SRgb;
			case .VK_FORMAT_BC3_UNORM_BLOCK: return .BC3_UNorm;
			case .VK_FORMAT_BC3_SRGB_BLOCK: return .BC3_UNorm_SRgb;
			case .VK_FORMAT_BC4_UNORM_BLOCK: return .BC4_UNorm;
			case .VK_FORMAT_BC4_SNORM_BLOCK: return .BC4_SNorm;
			case .VK_FORMAT_BC5_UNORM_BLOCK: return .BC5_UNorm;
			case .VK_FORMAT_BC5_SNORM_BLOCK: return .BC5_SNorm;
			case .VK_FORMAT_BC7_UNORM_BLOCK: return .BC7_UNorm;
			case .VK_FORMAT_BC7_SRGB_BLOCK: return .BC7_UNorm_SRgb;

			case .VK_FORMAT_A2B10G10R10_UNORM_PACK32: return .R10_G10_B10_A2_UNorm;
			case .VK_FORMAT_A2B10G10R10_UINT_PACK32: return .R10_G10_B10_A2_UInt;
			case .VK_FORMAT_B10G11R11_UFLOAT_PACK32: return .R11_G11_B10_Float;

			default: Runtime.FatalError("Unsupported format");
		}
	}

	public static VkFormat Convert (Texture.Format format, bool toDepthFormat = false)
	{
		switch (format)
		{
			case Texture.Format.R8_UNorm:
				return VkFormat.VK_FORMAT_R8_UNORM;
			case Texture.Format.R8_SNorm:
				return VkFormat.VK_FORMAT_R8_SNORM;
			case Texture.Format.R8_UInt:
				return VkFormat.VK_FORMAT_R8_UINT;
			case Texture.Format.R8_SInt:
				return VkFormat.VK_FORMAT_R8_SINT;

			case Texture.Format.R16_UNorm:
				return toDepthFormat ? VkFormat.VK_FORMAT_D16_UNORM : VkFormat.VK_FORMAT_R16_UNORM;
			case Texture.Format.R16_SNorm:
				return VkFormat.VK_FORMAT_R16_SNORM;
			case Texture.Format.R16_UInt:
				return VkFormat.VK_FORMAT_R16_UINT;
			case Texture.Format.R16_SInt:
				return VkFormat.VK_FORMAT_R16_SINT;
			case Texture.Format.R16_Float:
				return VkFormat.VK_FORMAT_R16_SFLOAT;

			case Texture.Format.R32_UInt:
				return VkFormat.VK_FORMAT_R32_UINT;
			case Texture.Format.R32_SInt:
				return VkFormat.VK_FORMAT_R32_SINT;
			case Texture.Format.R32_Float:
				return (toDepthFormat == true) ? VkFormat.VK_FORMAT_D32_SFLOAT : VkFormat.VK_FORMAT_R32_SFLOAT;

			case Texture.Format.R8_G8_UNorm:
				return VkFormat.VK_FORMAT_R8G8_UNORM;
			case Texture.Format.R8_G8_SNorm:
				return VkFormat.VK_FORMAT_R8G8_SNORM;
			case Texture.Format.R8_G8_UInt:
				return VkFormat.VK_FORMAT_R8G8_UINT;
			case Texture.Format.R8_G8_SInt:
				return VkFormat.VK_FORMAT_R8G8_SINT;

			case Texture.Format.R16_G16_UNorm:
				return VkFormat.VK_FORMAT_R16G16_UNORM;
			case Texture.Format.R16_G16_SNorm:
				return VkFormat.VK_FORMAT_R16G16_SNORM;
			case Texture.Format.R16_G16_UInt:
				return VkFormat.VK_FORMAT_R16G16_UINT;
			case Texture.Format.R16_G16_SInt:
				return VkFormat.VK_FORMAT_R16G16_SINT;
			case Texture.Format.R16_G16_Float:
				return VkFormat.VK_FORMAT_R16G16B16A16_SFLOAT;

			case Texture.Format.R32_G32_UInt:
				return VkFormat.VK_FORMAT_R32G32_UINT;
			case Texture.Format.R32_G32_SInt:
				return VkFormat.VK_FORMAT_R32G32_SINT;
			case Texture.Format.R32_G32_Float:
				return VkFormat.VK_FORMAT_R32G32B32A32_SFLOAT;

			case Texture.Format.R8_G8_B8_A8_UNorm:
				return VkFormat.VK_FORMAT_R8G8B8A8_UNORM;
			case Texture.Format.R8_G8_B8_A8_UNorm_SRgb:
				return VkFormat.VK_FORMAT_R8G8B8A8_SRGB;
			case Texture.Format.B8_G8_R8_A8_UNorm:
				return VkFormat.VK_FORMAT_B8G8R8A8_UNORM;
			case Texture.Format.B8_G8_R8_A8_UNorm_SRgb:
				return VkFormat.VK_FORMAT_B8G8R8A8_SRGB;
			case Texture.Format.R8_G8_B8_A8_SNorm:
				return VkFormat.VK_FORMAT_R8G8B8A8_SNORM;
			case Texture.Format.R8_G8_B8_A8_UInt:
				return VkFormat.VK_FORMAT_R8G8B8A8_UINT;
			case Texture.Format.R8_G8_B8_A8_SInt:
				return VkFormat.VK_FORMAT_R8G8B8A8_SINT;

			case Texture.Format.R16_G16_B16_A16_UNorm:
				return VkFormat.VK_FORMAT_R16G16B16A16_UNORM;
			case Texture.Format.R16_G16_B16_A16_SNorm:
				return VkFormat.VK_FORMAT_R16G16B16A16_SNORM;
			case Texture.Format.R16_G16_B16_A16_UInt:
				return VkFormat.VK_FORMAT_R16G16B16A16_UINT;
			case Texture.Format.R16_G16_B16_A16_SInt:
				return VkFormat.VK_FORMAT_R16G16B16A16_SINT;
			case Texture.Format.R16_G16_B16_A16_Float:
				return VkFormat.VK_FORMAT_R16G16B16A16_SFLOAT;

			case Texture.Format.R32_G32_B32_A32_UInt:
				return VkFormat.VK_FORMAT_R32G32B32A32_UINT;
			case Texture.Format.R32_G32_B32_A32_SInt:
				return VkFormat.VK_FORMAT_R32G32B32A32_SINT;
			case Texture.Format.R32_G32_B32_A32_Float:
				return VkFormat.VK_FORMAT_R32G32B32A32_SFLOAT;

			case Texture.Format.BC1_Rgb_UNorm:
				return VkFormat.VK_FORMAT_BC1_RGB_UNORM_BLOCK;
			case Texture.Format.BC1_Rgb_UNorm_SRgb:
				return VkFormat.VK_FORMAT_BC1_RGB_SRGB_BLOCK;
			case Texture.Format.BC1_Rgba_UNorm:
				return VkFormat.VK_FORMAT_BC1_RGBA_UNORM_BLOCK;
			case Texture.Format.BC1_Rgba_UNorm_SRgb:
				return VkFormat.VK_FORMAT_BC1_RGBA_SRGB_BLOCK;
			case Texture.Format.BC2_UNorm:
				return VkFormat.VK_FORMAT_BC2_UNORM_BLOCK;
			case Texture.Format.BC2_UNorm_SRgb:
				return VkFormat.VK_FORMAT_BC2_SRGB_BLOCK;
			case Texture.Format.BC3_UNorm:
				return VkFormat.VK_FORMAT_BC3_UNORM_BLOCK;
			case Texture.Format.BC3_UNorm_SRgb:
				return VkFormat.VK_FORMAT_BC3_SRGB_BLOCK;
			case Texture.Format.BC4_UNorm:
				return VkFormat.VK_FORMAT_BC4_UNORM_BLOCK;
			case Texture.Format.BC4_SNorm:
				return VkFormat.VK_FORMAT_BC4_SNORM_BLOCK;
			case Texture.Format.BC5_UNorm:
				return VkFormat.VK_FORMAT_BC5_UNORM_BLOCK;
			case Texture.Format.BC5_SNorm:
				return VkFormat.VK_FORMAT_BC5_SNORM_BLOCK;
			case Texture.Format.BC7_UNorm:
				return VkFormat.VK_FORMAT_BC7_UNORM_BLOCK;
			case Texture.Format.BC7_UNorm_SRgb:
				return VkFormat.VK_FORMAT_BC7_SRGB_BLOCK;

			case Texture.Format.ETC2_R8_G8_B8_UNorm:
				return VkFormat.VK_FORMAT_ETC2_R8G8B8_UNORM_BLOCK;
			case Texture.Format.ETC2_R8_G8_B8_A1_UNorm:
				return VkFormat.VK_FORMAT_ETC2_R8G8B8A1_UNORM_BLOCK;
			case Texture.Format.ETC2_R8_G8_B8_A8_UNorm:
				return VkFormat.VK_FORMAT_ETC2_R8G8B8A8_UNORM_BLOCK;

			case Texture.Format.D32_Float_S8_UInt:
				return VkFormat.VK_FORMAT_D32_SFLOAT_S8_UINT;
			case Texture.Format.D24_UNorm_S8_UInt:
				return VkFormat.VK_FORMAT_D24_UNORM_S8_UINT;

			case Texture.Format.R10_G10_B10_A2_UNorm:
				return VkFormat.VK_FORMAT_A2B10G10R10_UNORM_PACK32;
			case Texture.Format.R10_G10_B10_A2_UInt:
				return VkFormat.VK_FORMAT_A2B10G10R10_UINT_PACK32;
			case Texture.Format.R11_G11_B10_Float:
				return VkFormat.VK_FORMAT_B10G11R11_UFLOAT_PACK32;
		}
	}
}