namespace Engine
{
	using System;
	using System.IO;
	using System.Collections;
	using System.Threading;


    public class ArbitraryMesh
    {
		public Vector4[] clusters;
		public Splat[] splats;


		public static void Clusterize (ArbitraryMesh mesh)
		{
			if (mesh.splats.Count % 64 != 0)
			{
				Error("Mesh contains {0} splats, division by 64 equals to {1} per cluster.", mesh.splats.Count, float(mesh.splats.Count) / 64F);
			}

			/*float countClusters = mesh.splats.Count / 64;*/

		}


		public static void CreateFromImages (ArbitraryMesh mesh, String verticesFilename, String normalsFilename, String colorsFilename, String propsFilename)
		{
			Image imageVertices = new Image();
			Image.LoadFromFile(imageVertices, verticesFilename, 3);

			Image imageNormals = new Image();
			Image.LoadFromFile(imageNormals, normalsFilename, 3);

			Image imageColors = new Image();
			Image.LoadFromFile(imageColors, colorsFilename, 3);

			Image imageProps = new Image();
			Image.LoadFromFile(imageProps, propsFilename, 3);

			int countSplats = imageVertices.size.width * imageVertices.size.height;

			mesh.splats = new Splat[countSplats];

			for (int n = 0; n < countSplats; n++)
			{
				int x = int(n % imageVertices.size.width);
				int y = int(n / imageVertices.size.width);

				Vector3 position = imageVertices.GetPixelAsVector3(x, y, true);
				Vector3 normal = imageNormals.GetPixelAsVector3(x, y, true);
				Vector3 color = imageColors.GetPixelAsVector3(x, y, false);
				Vector3 prop = imageProps.GetPixelAsVector3(x, y, false);

				mesh.splats[n] = Splat(position, normal, color, prop);
			}

			delete imageVertices;
			delete imageNormals;
			delete imageColors;
			delete imageProps;

			ArbitraryMesh.Clusterize(mesh);
		}


		public struct Splat
		{
			public Vector3 position;
			public Vector3 normal;
			public Vector3 color;
			public Vector3 prop;


			public this (Vector3 position, Vector3 normal, Vector3 color, Vector3 prop)
			{
				this.position = position;
				this.normal = normal;
				this.color = color;
				this.prop = prop;
			}
		}
    }


}