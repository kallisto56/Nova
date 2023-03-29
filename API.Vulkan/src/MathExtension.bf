namespace System
{
	using System;
	using System.IO;
	using System.Collections;
	using System.Threading;

	using API.Vulkan;


    extension Math
    {
		public static VkExtent2D Clamp (VkExtent2D value, VkExtent2D min, VkExtent2D max)
		{
			uint32 x = Math.Clamp(value.width, min.width, max.width);
			uint32 y = Math.Clamp(value.height, min.height, max.height);

			return VkExtent2D(x, y);
		}
    }


}