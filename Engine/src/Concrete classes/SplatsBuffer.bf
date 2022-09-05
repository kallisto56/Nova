namespace Engine
{
	using System;
	using System.IO;
	using System.Collections;
	using System.Threading;


    public class SplatsBuffer
    {
		public Mesh.Splat[] values;
		public int count;


		public this (int capacity)
		{
			this.values = new Mesh.Splat[capacity];
		}

		public ~this ()
		{
			delete this.values;
		}


		public void Insert (Mesh mesh)
		{
			for (int n = 0; n < mesh.clusters.Count; n++)
			{
				Mesh.Cluster cluster = mesh.clusters[n];
				cluster.indexInBuffer = this.count;

				for (int i = 0; i < cluster.splats.Count; i++)
				{
					this.values[this.count] = cluster.splats[i];
					this.count++;
				}
			}
		}


		public void Insert (Mesh.Cluster cluster)
		{
			cluster.indexInBuffer = this.count;

			for (int i = 0; i < cluster.splats.Count; i++)
			{
				this.values[this.count] = cluster.splats[i];
				this.count++;
			}
		}


		public void Clear ()
		{
			this.count = 0;
		}
    }


}