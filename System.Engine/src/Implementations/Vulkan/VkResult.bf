namespace API.Vulkan;


using System;
using System.Diagnostics;


extension VkResult
{
	// TODO: Talk to Beefy about this issue: build fails if this mixin has compiler variables as parameters
	public mixin Resolve ()//String filePath = Compiler.CallerFilePath, String methodName = Compiler.CallerMemberName, int lineNumber = Compiler.CallerLineNum)
	{
		if (VkResult.IsError(this))
		{
			Error e = new Error("");//"", filePath, methodName, lineNumber);
			e.message.AppendF("VulkanAPI call to {} responded with VkResult.{} that is considered to be an error;", e.methodName, this);
#if DEBUG
			Tracy.Report(e);
			Debug.Break();
#endif
			return .Err(e);
		}

		this
	}


	static public bool IsError (VkResult result)
	{
		// https://www.khronos.org/registry/vulkan/specs/1.2-extensions/man/html/VkResult.html
		if (result == .VK_ERROR_OUT_OF_HOST_MEMORY) return true;
		if (result == .VK_ERROR_OUT_OF_DEVICE_MEMORY) return true;
		if (result == .VK_ERROR_INITIALIZATION_FAILED) return true;
		if (result == .VK_ERROR_DEVICE_LOST) return true;
		if (result == .VK_ERROR_MEMORY_MAP_FAILED) return true;
		if (result == .VK_ERROR_LAYER_NOT_PRESENT) return true;
		if (result == .VK_ERROR_EXTENSION_NOT_PRESENT) return true;
		if (result == .VK_ERROR_FEATURE_NOT_PRESENT) return true;
		if (result == .VK_ERROR_INCOMPATIBLE_DRIVER) return true;
		if (result == .VK_ERROR_TOO_MANY_OBJECTS) return true;
		if (result == .VK_ERROR_FORMAT_NOT_SUPPORTED) return true;
		if (result == .VK_ERROR_FRAGMENTED_POOL) return true;
		if (result == .VK_ERROR_SURFACE_LOST_KHR) return true;
		if (result == .VK_ERROR_NATIVE_WINDOW_IN_USE_KHR) return true;
		if (result == .VK_ERROR_OUT_OF_DATE_KHR) return true;
		if (result == .VK_ERROR_INCOMPATIBLE_DISPLAY_KHR) return true;
		if (result == .VK_ERROR_INVALID_SHADER_NV) return true;
		if (result == .VK_ERROR_OUT_OF_POOL_MEMORY) return true;
		if (result == .VK_ERROR_INVALID_EXTERNAL_HANDLE) return true;
		if (result == .VK_ERROR_FRAGMENTATION) return true;
		if (result == .VK_ERROR_INVALID_OPAQUE_CAPTURE_ADDRESS) return true;
		if (result == .VK_ERROR_FULL_SCREEN_EXCLUSIVE_MODE_LOST_EXT) return true;
		if (result == .VK_ERROR_UNKNOWN) return true;

		return false;
	}
}