namespace Game
{
	using System;
	using Engine;


	public class SplattingStage : SoftwareShader
	{
		public InstructionSet.Instruction[] instructions;

		public Matrix4x4[] matrices;
		public Mesh.Splat[] splats;

		public GeometryBuffer geometryBuffer;
		public Surface surface;
		public int2 screenOffset;
		public int2 screenBounds;

		public Vector2 clippingPlane;
		public int countTileIterations = 0;
		public int countIterations = 0;


		public override void Main (int3 gl_GlobalInvocationID)
		{
			int2 id = gl_GlobalInvocationID.xy + this.screenOffset;
			int id_contender = id.y * screenBounds.width + id.x;
			Contender current = this.geometryBuffer.contenders[id_contender];

			int c = 4;
			int left = (id.x / this.geometryBuffer.tileSize) - c;
			int top = (id.y / this.geometryBuffer.tileSize) - c;
			int right = (id.x / this.geometryBuffer.tileSize) + c+1;
			int bottom = (id.y / this.geometryBuffer.tileSize) + c+1;

			left = Math.Max(0, left);
			top = Math.Max(0, top);
			right = Math.Min(this.geometryBuffer.countRows, right);
			bottom = Math.Min(this.geometryBuffer.countColumns, bottom);

			int countTiles = 0;
			for (int x = left; x < right; x++)
			{
				for (int y = top; y < bottom; y++)
				{
					current = IterateOverTileContenders(x, y, id.xy, ref current);
					countTiles++;
				}
			}

			this.countTileIterations = Math.Max(this.countTileIterations, countTiles);

			geometryBuffer.contenders[id_contender] = current;
		}



		Contender IterateOverTileContenders (int tileX, int tileY, int2 inputCoords, ref Contender current)
		{
			int id_tile = this.geometryBuffer.GetKey(tileX, tileY, 0);
			int length = id_tile + this.geometryBuffer.tileLength;
			int _countIterations = 0;

			for (int id_contender = id_tile; id_contender < length; id_contender++)
			{
				this.countIterations = Math.Max(this.countIterations, ++_countIterations);

				int2 coords = this.geometryBuffer.coordinates[id_contender];
				if (inputCoords == coords)
				{
					continue;
				}

				Contender contender = this.geometryBuffer.sortedContenders[id_contender];

				float radius = this.geometryBuffer.contedersRadiuses[id_contender];
				float distance = (coords - inputCoords).Length;

				if (distance <= radius && contender.depth <= current.depth)
				{
					current = contender;
				}
				else
				{
					return current;
				}
			}

			return current;
		}
	}


}