namespace API.Vulkan;


using System;
using System.Diagnostics;
using System.Collections;

using static API.Vulkan.VulkanNative;


public class VkExtensions
{
	List<String> collection;
	char8*[] output;

	public int Count => this.collection.Count;


	public char8* this[int idx]
	{
		get { return this.collection[idx]; }
	}


	public this ()
	{
		this.collection = new List<String>();
	}


	public ~this ()
	{
		DeleteContainerAndItems!(this.collection);
		DeleteAndNullify!(this.output);
	}


	public void DeleteRawCollection ()
	{
		DeleteAndNullify!(this.output);
	}


	public void Add (char8* name)
	{
		String extensionName = new String(name);
		if (this.collection.Contains(extensionName) == false)
		{
			this.collection.Add(extensionName);
		}
		else
		{
			delete extensionName;
		}
	}


	public void Add (params char8*[] names)
	{
		for (uint32 n = 0; n < names.Count; n++)
		{
			String name = new String();
			name.Append(names[n]);

			if (this.collection.Contains(name) == false)
				this.collection.Add(name);
			else
				delete name;
		}
	}


	public bool Contains (String name)
	{
		return this.collection.Contains(name);
	}


	public char8** CArray()
	{
		if (this.collection.Count == 0)
		{
			return null;
		}

		if (this.output == null)
		{
			this.output = new char8*[this.collection.Count];
			for (int n = 0; n < this.collection.Count; n++)
			{
				Debug.WriteLine("ext: '{}'", this.collection[n]);
				this.output[n] = this.collection[n].CStr();
			}
		}

		return this.output.CArray();
	}


	public static bool ContainsRequired (VkExtensions available, VkExtensions required)
	{
		for (int n = 0; n < required.collection.Count; n++)
		{
			if (available.Contains(required.collection[n]) == false)
			{
				return false;
			}
		}

		return true;
	}


	public static Result<void, Error> GetAvailableExtensions (VkExtensions target)
	{
		uint32 count = 0;

		// Get count of available extensions
		if (vkEnumerateInstanceExtensionProperties(null, &count, null) != .VK_SUCCESS)
		{
			return .Err(new Error("TODO: vkEnumerateInstanceExtensionProperties failed"));
		}

		// Get available extensions
		VkExtensionProperties[] array = new VkExtensionProperties[int(count)](?);
		if (vkEnumerateInstanceExtensionProperties(null, &count, array.Ptr) != .VK_SUCCESS)
		{
			delete array;
			return .Err(new Error("TODO: vkEnumerateInstanceExtensionProperties failed"));
		}

		// Generate list of extensions that will be comfortable to use in our system
		for (int n = 0; n < array.Count; n++)
		{
			target.Add(&array[n].extensionName);
		}

		delete array;
		return .Ok;
	}



	public static Result<void, Error> GetAvailableValidationLayers (VkExtensions target)
	{
		uint32 count = 0;

		// Get count of available extensions
		if (vkEnumerateInstanceLayerProperties(&count, null) != .VK_SUCCESS)
		{
			return .Err(new Error("TODO: vkEnumerateInstanceLayerProperties failed"));
		}

		// Get available extensions
		VkLayerProperties* array = new VkLayerProperties[(int)count]*;
		if (vkEnumerateInstanceLayerProperties(&count, array) != .VK_SUCCESS)
		{
			delete array;
			return .Err(new Error("TODO: vkEnumerateInstanceLayerProperties failed"));
		}

		// ...
		for (int n = 0; n < count; n++)
		{
			target.Add(&array[n].layerName);
		}

		delete array;
		return .Ok;
	}
}