namespace System.Engine;


using System;
using System.Diagnostics;


extension Buffer
{
	public struct Description
	{
		public uint64 sizeInBytes;
		public Usage usage;
		public uint64 structureStrideInBytes;
		public bool isRawBuffer;


		public this (uint sizeInBytes, Usage usage, uint structureStrideInBytes = 0, bool isRawBuffer = false)
		{
			this.sizeInBytes = sizeInBytes;
			this.usage = usage;
			this.structureStrideInBytes = structureStrideInBytes;
			this.isRawBuffer = isRawBuffer;
		}


		static public Description Index (int count, IndexFormat format)
		{
			uint64 sizeInBytes = format == .uint16
				? sizeof(uint16) * uint64(count)
				: sizeof(uint32) * uint64(count)
				;

			return Description(sizeInBytes, .indexBuffer, 0, false);
		}


		static public Description Vertex<T> (int count) where T : struct
		{
			uint64 stride = uint64(sizeof(T));
			uint64 sizeInBytes = stride * uint64(count);

			return Description(sizeInBytes, .vertexBuffer, stride, false);
		}
	}
}