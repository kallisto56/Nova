namespace Game
{
	using System;
	using System.IO;
	using System.Collections;
	using System.Threading;

	using Engine;


    public class SortingVisualizationStage : SoftwareShader
    {
		public GeometryBuffer geometryBuffer;
		public int2 screenBounds;
		public Vector2 clippingPlane;

		public InstructionSet.Instruction[] instructions;
		public Mesh.Splat[] splats;
		public Surface surface;


		public override void Main(int3 gl_GlobalInvocationID)
		{
			// Find index for the first contender in depth buffer
			int id_tile = this.geometryBuffer.GetKey(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y, 0);

			// Copy contenders from depth buffer to sorting buffer
			for (int z = 0; z < this.geometryBuffer.tileLength; z++)
			{
				int x = z % this.geometryBuffer.tileSize;
				int y = z / this.geometryBuffer.tileSize;

				int2 coords = int2(
					gl_GlobalInvocationID.x * geometryBuffer.tileSize + x,
					gl_GlobalInvocationID.y * geometryBuffer.tileSize + y
				);

				int id_sorted = id_tile + z;
				
				Contender contender = this.geometryBuffer.sortedContenders[id_sorted];
				if (contender.depth == Contender.maxDepth)
				{
					return;
				}

				/*InstructionSet.Instruction i = this.instructions[contender.instruction];
				Mesh.Splat splat = this.splats[i.clusterIndex + contender.splat];
				float splatRadius = splat.values[Mesh.Splat.PROP0].x;*/
				float radius = this.geometryBuffer.contedersRadiuses[id_sorted];
				Color color = Color(uint8((radius / 16) * 255), 0, 0, 255);

				this.surface.SetPixel(coords, color);
			}
		}
    }


}