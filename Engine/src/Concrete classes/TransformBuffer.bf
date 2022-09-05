namespace Engine
{
	using System;
	using System.IO;
	using System.Collections;
	using System.Threading;


	public class TransformBuffer
	{
		public Matrix4x4[] matrices;
		public Instruction[] instructions;
		public int matrixCounter;
		public int instructionCounter;


		public this (int matricesCapacity, int instructionsCapacity)
		{
			this.matrices = new Matrix4x4[matricesCapacity];
			this.instructions = new Instruction[instructionsCapacity];
		}

		public ~this ()
		{
			delete this.matrices;
			delete this.instructions;
		}


		public void Insert (Transform transform)
		{
			this.instructions[this.instructionCounter] = Instruction(transform);
			this.instructionCounter++;
		}


		public uint32 Insert (Matrix4x4 matrix)
		{
			this.matrices[this.matrixCounter] = matrix;
			this.matrixCounter++;

			return uint32(this.matrixCounter - 1);
		}


		public void Clear ()
		{
			this.instructionCounter = 0;
			this.matrixCounter = 0;
		}


		[Union]
		public struct Instruction
		{
			public float[10] values;


			public this (Transform transform)
			{
				this.values = .(
					transform.position.x, transform.position.x, transform.position.x,
					transform.rotation.x, transform.rotation.y, transform.rotation.z, transform.rotation.w,
					transform.scale.x, transform.scale.y, transform.scale.z
				);
			}
		}


	}


}