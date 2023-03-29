namespace System.Engine;


using System;
using System.Math;
using System.Diagnostics;


abstract public class CommandBuffer : IDeviceResource, IDisposable
{
	abstract public String name { get; protected set; }

	abstract public Result<void, Error> Initialize ();
	abstract public void Dispose ();

	abstract public Result<void, Error> StartRecording ();
	abstract public Result<void, Error> StopRecording ();
	abstract public Result<void, Error> Submit ();

	abstract public Result<void, Error> CopyTexture (Texture source, Texture destination, uint32 sx, uint32 sy, uint32 sw, uint32 sh, uint32 dx, uint32 dy, uint32 dw, uint32 dh);
	abstract public Result<void, Error> UpdateBuffer (Buffer buffer, uint32 offset, uint32 size, void* data);

	abstract public Result<void, Error> Dispatch (uint32 groupCountX, uint32 groupCountY, uint32 groupCountZ);
	abstract public Result<void, Error> DispatchIndirect (Buffer indirectBuffer, uint32 offset);

	abstract public Result<void, Error> DrawIndexed (uint32 indexCount, uint32 instanceCount, uint32 firstIndex, int32 vertexOffset, uint32 firstInstance);
	abstract public Result<void, Error> DrawIndexedIndirect (Buffer indirectBuffer, uint32 offset, uint32 drawCount, uint32 stride);
	abstract public Result<void, Error> DrawIndirect (Buffer indirectBuffer, uint32 offset, uint32 drawCount, uint32 stride);

	abstract public Result<void, Error> SetScissors (uint32 index, int32 x, int32 y, int32 width, int32 height);
	abstract public Result<void, Error> SetViewport (uint32 index, Viewport viewport);
	abstract public Result<void, Error> ClearDepthStencilTarget (float depth, uint8 stencil);
	abstract public Result<void, Error> ClearColorTarget (uint32 index, Color<float> color);
	abstract public Result<void, Error> SetFramebuffer (Framebuffer framebuffer);

	abstract public Result<void, Error> SetIndexBuffer (Buffer buffer, Buffer.IndexFormat format);
	abstract public Result<void, Error> SetVertexBuffer (uint32 index, Buffer buffer);
	abstract public Result<void, Error> SetPipeline (Pipeline pipeline);
	abstract public Result<void, Error> SetResourceSet (uint32 slot, ResourceSet set);
}