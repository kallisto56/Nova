namespace System.Engine.Implementations.Vulkan;


using System;
using System.Diagnostics;
using System.Collections;

using API.Vulkan;
using static API.Vulkan.VulkanNative;


public class VulkanDebugger : GraphicsDeviceDebugger
{
	typealias Severity = VkDebugUtilsMessageSeverityFlagsEXT;
	typealias TypeFlags = VkDebugUtilsMessageTypeFlagsEXT;
	typealias CallbackData = VkDebugUtilsMessengerCallbackDataEXT;
	typealias DelegateDeclaration = function VkBool32(Severity messageSeverity, TypeFlags messageType, CallbackData* pCallbackData, void* pUserData);

	static DelegateDeclaration pfnUserCallback = => OnMessage;
	delegate VkBool32 LocalCallbackDelegate(Severity messageSeverity, TypeFlags messageType, CallbackData* pCallbackData, void* pUserData);
	LocalCallbackDelegate localCallback;
	
	VkDebugUtilsMessengerEXT handle;
	VulkanGraphicsContext context;
	OnError onErrorCallback;


	public this (VulkanGraphicsContext context)
	{
		this.context = context;
	}


	public ~this ()
	{
		if (this.onErrorCallback != null)
			delete this.onErrorCallback;

		delete this.localCallback;
	}

	typealias vkCreateDebugUtilsMessengerEXTDelegate = function VkResult(VkInstance instance, VkDebugUtilsMessengerCreateInfoEXT* pCreateInfo, VkAllocationCallbacks* pAllocator, VkDebugUtilsMessengerEXT* pMessenger);
	private static vkCreateDebugUtilsMessengerEXTDelegate vkCreateDebugUtilsMessengerEXT_ptr;

	override public Result<void, Error> Initialize (Self.Description description)
	{
		this.onErrorCallback = description.onErrorCallback;
		this.localCallback = new => this.OnLocalMessage;

		var fptr = VulkanNative.vkGetInstanceProcAddr(this.context.instance, "vkCreateDebugUtilsMessengerEXT");
		if (fptr != null)
		{
			vkCreateDebugUtilsMessengerEXT_ptr = (vkCreateDebugUtilsMessengerEXTDelegate)fptr;

			VkDebugUtilsMessengerCreateInfoEXT createInfo;
			this.PopulateDebugMessengerCreateInfo(out createInfo);
			vkCreateDebugUtilsMessengerEXT_ptr(this.context.instance, &createInfo, this.context.allocationCallbacks, &this.handle)
				.Resolve!();
		}
		else
		{
			return .Err(new Error("vkCreateDebugUtilsMessengerEXT is not available"));
		}

		return .Ok;
	}


	override public void Dispose ()
	{
		var fptr = vkGetInstanceProcAddr(this.context.instance, "vkDestroyDebugUtilsMessengerEXT".CStr());
		if (fptr == null)
		{
			Tracy.WriteLine("vkGetInstanceProcAddr(instance, \"vkDestroyDebugUtilsMessengerEXT\") returned NULL");
			return;
		}

		vkDestroyDebugUtilsMessengerEXT(this.context.instance, this.handle, this.context.allocationCallbacks);
	}


	public void PopulateDebugMessengerCreateInfo (out VkDebugUtilsMessengerCreateInfoEXT createInfo)
	{
		createInfo = VkDebugUtilsMessengerCreateInfoEXT()
		{
			messageSeverity =
				.VK_DEBUG_UTILS_MESSAGE_SEVERITY_VERBOSE_BIT_EXT |
				.VK_DEBUG_UTILS_MESSAGE_SEVERITY_WARNING_BIT_EXT |
				.VK_DEBUG_UTILS_MESSAGE_SEVERITY_ERROR_BIT_EXT,

			messageType =
				.VK_DEBUG_UTILS_MESSAGE_TYPE_GENERAL_BIT_EXT |
				.VK_DEBUG_UTILS_MESSAGE_TYPE_PERFORMANCE_BIT_EXT |
				.VK_DEBUG_UTILS_MESSAGE_TYPE_VALIDATION_BIT_EXT,

			pfnUserCallback = Self.pfnUserCallback,
			pUserData = null,//&this.localCallback,
		};
	}


	VkBool32 OnLocalMessage (Severity severity, TypeFlags type, CallbackData* data, void* userData)
	{
		// TODO: Remember that VkDebugUtilsMessengerCallbackDataEXT contains data about resources specified in the issue

		String message = scope String(data.pMessage);
		message.Replace(" | ", " | \n");
		message.Replace(". ", ".\n");

		if (severity == .VK_DEBUG_UTILS_MESSAGE_SEVERITY_ERROR_BIT_EXT)
		{
			Tracy.WriteLine("ERROR: {0}", message);
			onErrorCallback?.Invoke(new Error(message));
		}
		else if (severity == .VK_DEBUG_UTILS_MESSAGE_SEVERITY_WARNING_BIT_EXT)
		{
			Tracy.WriteLine("WARNING: {0}", message);
		}
		else if (severity == .VK_DEBUG_UTILS_MESSAGE_SEVERITY_INFO_BIT_EXT)
		{
			Tracy.WriteLine(message);
		}

		return false;
	}


	[CallingConvention(.Stdcall)]
	static VkBool32 OnMessage (Severity messageSeverity, TypeFlags messageType, CallbackData* pCallbackData, void* pUserData)
	{
		String message = scope String(pCallbackData.pMessage);
		if (messageSeverity == .VK_DEBUG_UTILS_MESSAGE_SEVERITY_ERROR_BIT_EXT)
		{
			Tracy.Report(new Error(message), true);
		}
		else if (messageSeverity == .VK_DEBUG_UTILS_MESSAGE_SEVERITY_WARNING_BIT_EXT)
		{
			Tracy.WriteLine("WARNING: {0}", message);
		}
		else if (messageSeverity == .VK_DEBUG_UTILS_MESSAGE_SEVERITY_INFO_BIT_EXT)
		{
			Tracy.WriteLine(message);
		}

		/*LocalCallbackDelegate localCallback = *(LocalCallbackDelegate*)pUserData;
		return localCallback(messageSeverity, messageType, pCallbackData, pUserData);*/
		return false;
	}


}