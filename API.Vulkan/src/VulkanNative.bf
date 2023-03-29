namespace API.Vulkan;


using System;
using System.Collections;
using System.Diagnostics;


	public static class VulkanNative
	{
		public static uint32 VK_API_VERSION_VARIANT(uint32 version) => ((uint32)(version) >> 29);
		public static uint32 VK_API_VERSION_MAJOR(uint32 version) => (((uint32)(version) >> 22) & 0x7FU);
		public static uint32 VK_API_VERSION_MINOR(uint32 version) => (((uint32)(version) >> 12) & 0x3FFU);
		public static uint32 VK_API_VERSION_PATCH(uint32 version) => ((uint32)(version) & 0xFFFU);

		public static uint32 VK_MAKE_API_VERSION(uint32 variant, uint32 major, uint32 minor, uint32 patch) => ((((uint32)(variant)) << 29) | (((uint32)(major)) << 22) | (((uint32)(minor)) << 12) | ((uint32)(patch)));

		public static uint32 VK_API_VERSION_1_0 => VK_MAKE_API_VERSION(0, 1, 0, 0);
		public static uint32 VK_API_VERSION_1_1 => VK_MAKE_API_VERSION(0, 1, 1, 0);
		public static uint32 VK_API_VERSION_1_2 => VK_MAKE_API_VERSION(0, 1, 2, 0);
		public static uint32 VK_API_VERSION_1_3 => VK_MAKE_API_VERSION(0, 1, 3, 0);

		private const CallingConventionAttribute.Kind CallConv = .Stdcall;

		private static NativeLibrary mNativeLib;

		private static bool mInitialized = false;

		private static List<StringView> mLoadedFunctions = new .() ~ delete _;

		public static readonly Span<StringView> LoadedFunctions { get => mLoadedFunctions; }

		private static List<StringView> mPreInstanceFunctions = new .()
			{
				"vkCreateInstance",
				"vkEnumerateInstanceExtensionProperties",
				"vkEnumerateInstanceLayerProperties",
				"vkGetInstanceProcAddr"
			} ~ delete _;

		private static List<StringView> mInstanceFunctions = new .()
			{
				"vkGetPhysicalDeviceSurfaceFormatsKHR",
				"vkGetPhysicalDeviceSurfaceSupportKHR",
				"vkGetPhysicalDeviceSurfaceCapabilitiesKHR",
				"vkGetPhysicalDeviceSurfacePresentModesKHR",
				"vkDestroySurfaceKHR",
				"vkGetDeviceProcAddr",
				"vkDestroyInstance",
				"vkDestroyDevice",
				"vkGetPhysicalDeviceMemoryProperties",
				"vkGetDeviceGroupPeerMemoryFeatures",
				"vkCreateDevice",
				"vkGetDeviceQueue",
				"vkEnumeratePhysicalDeviceGroups",
				"vkGetPhysicalDeviceProperties",
				"vkGetPhysicalDeviceProperties2",
				"vkGetPhysicalDeviceFeatures",
				"vkGetPhysicalDeviceFeatures2",
				"vkGetPhysicalDeviceQueueFamilyProperties",
				"vkEnumerateDeviceExtensionProperties",
				"vkCreateDebugReportCallbackEXT",
#if BF_PLATFORM_WINDOWS
				"vkCreateWin32SurfaceKHR",
#endif
			} ~ delete _;

		static this()
		{
		}

		static ~this()
		{
			// TODO: Post an issue to GitHub
			if (mNativeLib != null)
			{
				mNativeLib.Dispose();
				delete mNativeLib;
			}
		}

		public static Result<void, Error> Initialize(String libraryName = null)
		{
			if (!mInitialized)
			{
				LoadNativeLibrary(libraryName, out mNativeLib);

				mInitialized = true;
			}

			return .Ok;
		}

		public static void SetLoadFunctionErrorCallBack(LoanFunctionErrorCallBack callback)
		{
			mNativeLib.LoanFunctionErrorCallBack = callback;
		}

		public static Result<void, Error> LoadPreInstanceFunctions(List<String> additionalFunctions = null)
		{
			if (additionalFunctions != null)
			{
				for (var func in additionalFunctions)
				{
					if (func != null && !mPreInstanceFunctions.Contains(func))
					{
						mPreInstanceFunctions.Add(func);
					}
				}
			}

			LoadFunctions(mPreInstanceFunctions);

			mLoadedFunctions.AddRange(mPreInstanceFunctions);

			return .Ok;
		}

		public static Result<void, Error> LoadInstanceFunctions(VkInstance instance, List<String> additionalFunctions = null)
		{
			if (additionalFunctions != null)
			{
				for (var func in additionalFunctions)
				{
					if (func != null && !mInstanceFunctions.Contains(func))
					{
						mInstanceFunctions.Add(func);
					}
				}
			}

			SetInstance(instance);

			LoadFunctions(mInstanceFunctions);

			mLoadedFunctions.AddRange(mInstanceFunctions);

			return .Ok;
		}

		public static Result<void, Error> LoadPostInstanceFunctions(VkInstance? instance = null)
		{
			LoadAllFuncions(instance, mLoadedFunctions);
			return .Ok;
		}

		private static void LoadNativeLibrary(String libraryName, out NativeLibrary handle)
		{
			NativeLibrary.Load(libraryName ?? GetVulkanName(), out handle);
		}

		private static String GetVulkanName()
		{
#if BF_PLATFORM_WINDOWS 
			return "vulkan-1.dll";
			#elif BF_PLATFORM_LINUX  
			return "libvulkan.so.1";
			#elif BF_PLATFORM_MACOS  
			return "libvulkan.dylib";
#else
			Runtime.FatalError("Unsupported platform.");
#endif
		}
	}