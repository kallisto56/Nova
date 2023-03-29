namespace System.Engine;


using API.Vulkan;


extension GraphicsContext
{
	public struct Description
	{
		public DeviceOptions deviceOptions;

		public String applicationName = "Game";
		public uint32 vulkanVersion = VulkanNative.VK_API_VERSION_1_3;

		public uint32 applicationVersion = 0;

		public String engineName = "Nova";
		public uint32 engineVersion = 0;

		public Window window;

		public Texture.Format? depthFormat;

		public struct DeviceOptions
		{
			public bool isDebuggerEnabled;
		}
	}
}