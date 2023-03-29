namespace API.Vulkan
{
	extension VkClearColorValue
	{
	    public this(float r, float g, float b, float a = 1.0f) : this()
	    {
	        this.float32[0] = r;
	        this.float32[1] = g;
	        this.float32[2] = b;
	        this.float32[3] = a;
	    }

	    public this(int32 r, int32 g, int32 b, int32 a = 255) : this()
	    {
	        this.int32[0] = r;
	        this.int32[1] = g;
	        this.int32[2] = b;
	        this.int32[3] = a;
	    }

	    public this(uint32 r, uint32 g, uint32 b, uint32 a = 255) : this()
	    {
	        this.uint32[0] = r;
	        this.uint32[1] = g;
	        this.uint32[2] = b;
	        this.uint32[3] = a;
	    }
	}
}