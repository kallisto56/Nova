namespace Game
{
	using System;
	using Engine;


	public class TransformationStage : SoftwareShader
	{
		public InstructionSet.Instruction[] instructions;

		public Matrix4x4[] matrices;
		public Mesh.Splat[] splats;

		public GeometryBuffer geometryBuffer;
		public Surface surface;
		public int2 screenBounds;

		public Vector2 clippingPlane;


		public override void Main (int3 gl_GlobalInvocationID)
		{
			// ...
			let id_instruction = gl_GlobalInvocationID.x;
			let i = this.instructions[id_instruction];

			// Get matrices (camera, mesh and calculate MVP)
			let meshMatrix = this.matrices[i.meshIndex];
			let viewProjection = this.matrices[i.cameraIndex];
			let mvp = viewProjection * meshMatrix;

			// Iterate over splats of the cluster
			for (int n = 0; n < 64; n++)
			{
				// Retrieve splat from the cluster
				int id_splat = i.clusterIndex + n;
				Mesh.Splat splat = this.splats[id_splat];

				// Get local position of the splat
				Vector4p splatPosition = splat.values[Mesh.Splat.POSITION];
				Vector3 local = Vector3(splatPosition.x, splatPosition.y, splatPosition.z) / 255F;

				// Transform into world-space coordinates
				Vector4 world = meshMatrix * Vector4(local, 0F);

				// Transform into screen-space coordinates
				Vector4 uv = mvp * Vector4(world.xyz, 1F);
				Vector3 screen = uv.xyz / uv.w;

				// Cull splats outside of our view
				if (uv.w <= 0F && screen.x >= -1F && screen.x <= 1F && screen.y >= -1F && screen.y <= 1F)
				{
					// Preparing contender
					int2 coords = NormalizeScreenCoords(screen.xy, this.screenBounds);
					uint32 depth = EncodeDepth(uv.w, this.clippingPlane);
					Contender contender = Contender(depth, uint32(id_instruction), uint8(n));

					// Atomic operation
					int key = geometryBuffer.GetKey(int(coords.x), int(coords.y));
					atomicMin(ref geometryBuffer.contenders, key, contender);
				}
			}
			
		}
	}


}