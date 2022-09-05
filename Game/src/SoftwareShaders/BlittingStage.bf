namespace Game
{
	using System;
	using Engine;


	public class BlittingStage : SoftwareShader
	{
		public InstructionSet.Instruction[] instructions;

		public Matrix4x4[] matrices;
		public Mesh.Splat[] splats;

		public GeometryBuffer geometryBuffer;
		public Surface surface;
		public int2 screenBounds;
		public int2 blitOffset;

		public Vector2 clippingPlane;


		public override void Main (int3 gl_GlobalInvocationID)
		{
			// Retrieving index of contender (pixel) from the geometry buffer using gl_GlobalInvocation with offset
			int key = this.geometryBuffer.GetKey(gl_GlobalInvocationID.x + this.blitOffset.x, gl_GlobalInvocationID.y + this.blitOffset.y);
			Contender contender = geometryBuffer.contenders[key];

			if (contender.depth == Contender.maxDepth)
			{
				this.surface.SetPixel(gl_GlobalInvocationID.xy, Color(25, 25, 25, 255));
			}
			else
			{
				InstructionSet.Instruction i = instructions[contender.instruction];
				int id_splat = i.clusterIndex + contender.splat;
				Mesh.Splat splat = this.splats[id_splat];
				Vector4p color4p = splat.values[Mesh.Splat.COLOR];
				Color color = Color(color4p.x, color4p.y, color4p.z, 255);

				this.surface.SetPixel(gl_GlobalInvocationID.xy, color);
			}

			this.geometryBuffer.contenders[key] = Contender.emptyValue;
			/*this.geometryBuffer.winners[key] = Contender.emptyValue;*/
		}
	}


}