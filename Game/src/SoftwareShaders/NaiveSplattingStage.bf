namespace Game
{
	using System;
	using Engine;


	public class NaiveSplattingStage : SoftwareShader
	{
		public InstructionSet.Instruction[] instructions;

		public Mesh.Splat[] splats;

		public GeometryBuffer geometryBuffer;
		public Surface surface;
		public int2 screenOffset;
		public int2 screenBounds;


		public override void Main (int3 gl_GlobalInvocationID)
		{
			int id_target = this.geometryBuffer.GetKey(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y);
			Contender lhs = this.geometryBuffer.contenders[id_target];
			float lhs_radius = this.geometryBuffer.contedersRadiuses[id_target];

			int left = Math.Max(0, gl_GlobalInvocationID.x - 16);
			int right = Math.Min(gl_GlobalInvocationID.x  + 16, this.surface.screenSize.width);
			int top = Math.Max(0, gl_GlobalInvocationID.y - 16);
			int bottom = Math.Min(gl_GlobalInvocationID.y + 16, this.surface.screenSize.height);

			for (int x = left; x < right; x++)
			{
				for (int y = top; y < bottom; y++)
				{
					int id_rhs = this.geometryBuffer.GetKey(x, y);
					Contender rhs = this.geometryBuffer.contenders[id_rhs];

					if (lhs.depth > rhs.depth)
					{
						float rhs_radius = this.geometryBuffer.contedersRadiuses[id_rhs];
						float length = (gl_GlobalInvocationID.xy - int2(x, y)).Length;

						if (rhs_radius >= length)
						{
							lhs = rhs;
							lhs_radius = rhs_radius;
						}
					}
				}
			}

			this.geometryBuffer.sortedContenders[id_target] = lhs;
		}
	}


}