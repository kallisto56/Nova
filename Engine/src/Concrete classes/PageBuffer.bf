/*namespace Engine
{
	using System;
	using System.IO;
	using System.Collections;
	using System.Threading;


    public class PageBuffer
    {
		public ShaderStorageBuffer shaderStorageBuffer;
		public uint32[] data;
		public bool shouldUpdate;
		public int dataLength;

		public Result<void> Initialize (int countClusters)
		{
			this.data = new uint32[countClusters * 4];
			return .Err;
		}

		public void AddMesh (Mesh mesh)
		{
			ThrowUnimplemented();
			/*for (int n = 0; n < mesh.clusters.Count; n++)
			{
				Mesh.Cluster cluster = mesh.clusters[n];
				cluster.index = dataLength++;
			}*/
		}

		public bool CanFitMesh (Mesh mesh)
		{
			return default;
		}

		public void RemoveMesh (Mesh mesh)
		{

		}
    }


}*/