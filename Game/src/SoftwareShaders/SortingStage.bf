namespace Game
{
	using System;
	using Engine;


	public class SortingStage : SoftwareShader
	{
		public GeometryBuffer geometryBuffer;
		public int2 screenBounds;
		public Vector2 clippingPlane;

		public InstructionSet.Instruction[] instructions;
		public Mesh.Splat[] splats;


		public override void Main(int3 gl_GlobalInvocationID)
		{
			// Find index for the first contender in depth buffer
			int id_tile = this.geometryBuffer.GetKey(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y, 0);

			// ...
			Contender[9] sorting = Contender[9]();
			int2[9] coordinates = int2[9]();

			// Copy contenders from depth buffer to sorting buffer
			for (int z = 0; z < this.geometryBuffer.tileLength; z++)
			{
				int x = z % this.geometryBuffer.tileSize;
				int y = z / this.geometryBuffer.tileSize;

				int2 coords = int2(
					gl_GlobalInvocationID.x * geometryBuffer.tileSize + x,
					gl_GlobalInvocationID.y * geometryBuffer.tileSize + y
				);

				int id_contender = coords.y * screenBounds.width + coords.x;
				Contender contender = this.geometryBuffer.contenders[id_contender];

				sorting[z] = contender;
				coordinates[z] = coords;
			}

			// Sort contenders by radius and depth.
			// First we sort by radius, the largest splats will be at the begining of the array.
			// We sort by depth if radius of compared splats is equal.
			for (int id_lhs = 0; id_lhs < this.geometryBuffer.tileLength; id_lhs++)
			{
				for (int id_rhs = 1; id_rhs < this.geometryBuffer.tileLength; id_rhs++)
				{
					Contender lhs = sorting[id_lhs];
					Contender rhs = sorting[id_rhs];

					// If LHS is less than RHS, then swap values
					if (lhs.depth >= rhs.depth)
					{
						Contender tmpContender = lhs;
						int2 tmpCoords = coordinates[id_lhs];

						sorting[id_lhs] = sorting[id_rhs];
						coordinates[id_lhs] = coordinates[id_rhs];

						sorting[id_rhs] = tmpContender;
						coordinates[id_rhs] = tmpCoords;
					}
				}
			}

			// Copy contenders from depth buffer to sorting buffer
			for (int z = 0; z < this.geometryBuffer.tileLength; z++)
			{
				int id_contender = id_tile + z;
				Contender contender = sorting[z];
				int2 coords = coordinates[z];
				this.geometryBuffer.sortedContenders[id_contender] = contender;
				this.geometryBuffer.coordinates[id_contender] = coords;

				if (contender.depth != uint32.MaxValue)
				{
					InstructionSet.Instruction i = this.instructions[contender.instruction];
					Mesh.Splat splat = this.splats[i.clusterIndex + contender.splat];
					float splatRadius = splat.values[Mesh.Splat.PROP0].x;

					this.geometryBuffer.contedersRadiuses[id_contender] = CalculateRadius(contender.depth, clippingPlane, 0F, 10F, int(-splatRadius * 8));
				}
				else
				{
					this.geometryBuffer.contedersRadiuses[id_contender] = 0F;
				}
			}
		}

		
		public void MainEx(int3 gl_GlobalInvocationID)
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

				int id_contender = coords.y * screenBounds.width + coords.x;
				Contender contender = this.geometryBuffer.contenders[id_contender];

				int id_sorted = id_tile + z;
				this.geometryBuffer.sortedContenders[id_sorted] = contender;
				this.geometryBuffer.coordinates[id_sorted] = coords;

				if (contender.depth != uint32.MaxValue)
				{
					InstructionSet.Instruction i = this.instructions[contender.instruction];
					Mesh.Splat splat = this.splats[i.clusterIndex + contender.splat];
					float splatRadius = splat.values[Mesh.Splat.PROP0].x;

					this.geometryBuffer.contedersRadiuses[id_sorted] = CalculateRadius(contender.depth, clippingPlane, 00F, 14F, int(-splatRadius * 8));
				}
				else
				{
					this.geometryBuffer.contedersRadiuses[id_sorted] = 0F;
				}
			}

			// Sort contenders by radius and depth.
			// First we sort by radius, the largest splats will be at the begining of the array.
			// We sort by depth if radius of compared splats is equal.
			for (int x = 0; x < this.geometryBuffer.tileLength; x++)
			{
				for (int y = 1; y < this.geometryBuffer.tileLength; y++)
				{
					int id_lhs = id_tile + x;
					Contender lhs = this.geometryBuffer.sortedContenders[id_lhs];
					float lhsRadius = this.geometryBuffer.contedersRadiuses[id_lhs];

					int id_rhs = id_tile + y;
					Contender rhs = this.geometryBuffer.sortedContenders[id_rhs];
					float rhsRadius = this.geometryBuffer.contedersRadiuses[id_rhs];

					// If LHS is less than RHS, then swap values
					if (LessThan(lhs, rhs, lhsRadius, rhsRadius) == true)
					{
						Contender tmpContender = lhs;
						float tmpRadius = lhsRadius;
						int2 tmpCoords = this.geometryBuffer.coordinates[id_lhs];

						this.geometryBuffer.sortedContenders[id_lhs] = this.geometryBuffer.sortedContenders[id_rhs];
						this.geometryBuffer.contedersRadiuses[id_lhs] = this.geometryBuffer.contedersRadiuses[id_rhs];
						this.geometryBuffer.coordinates[id_lhs] = this.geometryBuffer.coordinates[id_rhs];

						this.geometryBuffer.sortedContenders[id_rhs] = tmpContender;
						this.geometryBuffer.contedersRadiuses[id_rhs] = tmpRadius;
						this.geometryBuffer.coordinates[id_rhs] = tmpCoords;
					}
				}
			}
		}


		bool LessThan (Contender lhs, Contender rhs, float lhsRadius, float rhsRadius)
		{
			if (lhs.depth > rhs.depth)
			{
				return true;
			}
			else if (lhs.depth == rhs.depth && lhsRadius < rhsRadius)
			{
				return true;
			}

			return false;
		}
	}


}