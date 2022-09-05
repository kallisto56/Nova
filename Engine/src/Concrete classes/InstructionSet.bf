namespace Engine
{
	using System;
	using System.IO;
	using System.Collections;
	using System.Threading;


	public class InstructionSet
	{
		public Instruction[] values;
		public int count;


		public this (int capacity)
		{
			if (capacity > 268435455)//16777215)
			{
				Error("Capacity of InstructionSet cannot exceed 268,435,455 elements, which is maximum value of uint28.");
				/*Error("Capacity of InstructionSet cannot exceed 16,777,215 elements, which is maximum value of uint24.");*/
			}

			this.values = new Instruction[capacity];
		}

		public ~this ()
		{
			delete this.values;
		}


		public void Insert (uint32 cameraIndex, uint32 meshIndex, uint32 clusterIndex)
		{
			this.values[this.count] = Instruction(cameraIndex, meshIndex, clusterIndex);
			this.count++;
		}


		public void Clear ()
		{
			this.count = 0;
		}


		[Union]
		public struct Instruction
		{
			public uint32[3] values;

			public uint32 cameraIndex => this.values[0];
			public uint32 meshIndex => this.values[1];
			public uint32 clusterIndex => this.values[2];

			public this (uint32 cameraIndex, uint32 meshIndex, uint32 clusterIndex)
			{
				this.values = .(cameraIndex, meshIndex, clusterIndex);
			}


			public override void ToString(String strBuffer)
			{
				strBuffer.AppendF("cameraIndex: {0}, meshIndex: {1}, clusterIndex: {2}", this.cameraIndex, this.meshIndex, this.clusterIndex);
			}
		}


	}


}