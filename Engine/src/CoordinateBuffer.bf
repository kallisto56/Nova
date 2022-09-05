/*namespace Engine
{
	using System;
	using System.IO;
	using System.Collections;
	using System.Threading;




    public class CoordinateBuffer
    {
		public Matrix4x4[] matrices;
		public Instruction[] instructions;
		public Vector4[] clusters;
		public Mesh.Splat[] splats;

		public int countSplats;
		public int countClusters;
		public int countMatrices;
		public int countInstructions;
		public int clusterCounter = 0;


		public ~this ()
		{
			delete this.matrices;
			delete this.instructions;
			delete this.clusters;
			delete this.splats;
		}


		[Union]
		public struct Instruction
		{
			public uint32[4] values;
			/*public uint32 camera;
			public uint32 mesh;
			public uint32 cluster;
			public uint32 splats;*/

			public this (uint32 camera, uint32 mesh, uint32 cluster, uint32 splats)
			{
				this.values[0] = camera;
				this.values[1] = mesh;
				this.values[2] = cluster;
				this.values[3] = splats;
				/*this.camera = camera;
				this.mesh = mesh;
				this.cluster = cluster;
				this.splats = splats;*/
			}
		}


		public Result<void> Initialize (int countMatrices, int countClusters, int countInstructions, int countSplats)
		{
			this.matrices = new Matrix4x4[countMatrices];
			this.clusters = new Vector4[countClusters];
			this.instructions = new Instruction[countInstructions];
			this.splats = new Mesh.Splat[countSplats];
			return .Ok;
		}


		public void Add (Mesh mesh)
		{
			for (int n = 0; n < mesh.clusters.Count; n++)
			{
				Mesh.Cluster cluster = mesh.clusters[n];
				cluster.indexInBuffer = this.countSplats * 4;
				/*Console.WriteLine("cluster.index: {0}", cluster.indexInBuffer);*/
				for (int i = 0; i < cluster.splats.Count; i++)
				{
					this.splats[this.countSplats] = cluster.splats[i];
					this.countSplats++;
				}
			}
		}


		public uint32 AddMatrix (Matrix4x4 matrix)
		{
			this.matrices[this.countMatrices++] = matrix;
			return uint32(this.countMatrices - 1);
		}


		public uint32 AddCluster (Vector3 center, float boundingSphereRadius)
		{
			this.clusters[this.countClusters++] = Vector4(center, boundingSphereRadius);
			return uint32(this.countClusters - 1);
		}

		public void Add (uint32 camera, uint32 mesh, uint32 clusterCenterID, uint32 splats)
		{
			this.instructions[this.countInstructions] = Instruction(camera, mesh, clusterCenterID, splats);
			this.countInstructions++;
		}


		public void Clear ()
		{
			this.countClusters = 0;
			this.countMatrices = 0;
			this.countInstructions = 0;
		}


    }


}*/