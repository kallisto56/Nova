namespace System.Engine;


using System;
using System.Diagnostics;



static
{
	static void Test ()
	{
		FAttachment depth = new FAttachment();
		FAttachment color = new FAttachment();

		FRenderGraph g = new FRenderGraph();

		g.AddRenderPass(depth, color);
		g.AddRenderPass(color);
	}
}


public class FRenderGraph
{
	public FRenderPass AddRenderPass (params FAttachment[] attachments)
	{
		return null;
	}
}


public class FRenderPass
{
	public FSubPass[] subpasses;
}


public class FSubPass
{
	public FAttachment[] attachments;
}

public class FAttachment
{
	public Texture texture;

	public RenderPass.LoadOp loadOp;
	public RenderPass.StoreOp storeOp;

}