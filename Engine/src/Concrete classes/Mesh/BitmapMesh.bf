namespace Engine
{
	using System;
	using System.IO;
	using System.Collections;
	using System.Threading;


    public class BitmapMesh
    {
		public Mesh.Cluster[] clusters;


		public static void Load (Mesh mesh, String verticesFilename, String normalsFilename, String colorsFilename, String propertiesFilename)
		{
			Random random = scope Random();
			var perf = scope Performance.Counter("BitmapMesh.Load");
			perf.Start();
			
			Image imageVertices = new Image();
			Image imageNormals = new Image();
			Image imageColors = new Image();
			Image imageProperties = new Image();

			Image.LoadFromFile(imageVertices, verticesFilename, 3);
			Image.LoadFromFile(imageNormals, normalsFilename, 3);
			Image.LoadFromFile(imageColors, colorsFilename, 3);
			Image.LoadFromFile(imageProperties, propertiesFilename, 3);

			int countClusters = (imageVertices.size.width * imageVertices.size.height) / 64;

			mesh.clusters = new Mesh.Cluster[countClusters];
			int clusterID = 0;

			Vector3[64] vertices = .();
			Vector3[64] normals = .();
			Color[64] colors = .();
			Vector3[64] props = .();


			for (int xoffset = 0; xoffset < imageVertices.size.width; xoffset += 8)
			{
				for (int yoffset = 0; yoffset < imageVertices.size.height; yoffset += 8)
				{
					int splatID = 0;

					for (int x = 0; x < 8; x++)
					{
						for (int y = 0; y < 8; y++)
						{
							vertices[splatID] = imageVertices.GetPixelAsVector3(xoffset + x, yoffset + y) / 255F;
							normals[splatID] = imageNormals.GetPixelAsVector3(xoffset + x, yoffset + y) / 255F;
							colors[splatID] = imageColors.GetPixel(xoffset + x, yoffset + y);
							props[splatID] = imageProperties.GetPixelAsVector3(xoffset + x, yoffset + y) / 255F;

							splatID++;
						}
					}

					Mesh.Cluster cluster = mesh.clusters[clusterID] = new Mesh.Cluster();

					for (int n = 0; n < vertices.Count; n++)
					{
						Vector3 position = vertices[n];
						Vector3 normal = normals[n];
						Color color = colors[n];
						Vector3 prop = props[n];
						{
							uint8 r = uint8(random.Next(0, 255));
							uint8 g = uint8(random.Next(0, 255));
							uint8 b = uint8(random.Next(0, 255));
							/*r = g = b;*/
							color = Color(r, g, b, 255);
							/*color = Color(prop.x / 255F, prop.y / 255F, prop.z / 255F, 1F);*/
						}

						float splatRadius = prop.x;//float(random.Next(0, 127)) / 255F;//prop.x;
						float materialRoughness = prop.y;
						float materialMetalness = prop.z;
						
						float positionStrength = 1F;
						float normalStrength = 1F;
						float colorStrength = 1F;
						float animSpeed = 1F;
						float animOffset = 1F;
						float materialIntesity = 1F;
						float localAmbientOcclusion = 1F;

						cluster.splats[n] = Mesh.Splat(
							position,
							positionStrength,
							normal,
							normalStrength,
							splatRadius,
							0,
							animSpeed,
							animOffset,
							color,
							colorStrength,
							materialRoughness,
							materialMetalness,
							materialIntesity,
							localAmbientOcclusion
						);

						/*Console.Clear();
						Console.WriteLine("input-position: {0}", position.x);
						Console.WriteLine("splat: {0}", cluster.splats[n]);
						Console.WriteLine("splat.position: {0}", cluster.splats[n].values[0].position.x);
						Console.Read();*/
					}

					clusterID++;
				}
			}

			delete imageVertices;
			delete imageNormals;
			delete imageColors;
			delete imageProperties;

			perf.Dispose();
			Console.WriteLine("Count clusters: {0}", countClusters);
			Console.WriteLine("{0}: {1}", perf.name, perf.value);
		}


		static float Convert (uint8 value)
		{
			return float(value) / 255F;
		}


		static Vector3 Convert (Color color)
		{
			return Vector3(float(color.r) / 255F, float(color.g) / 255F, float(color.b) / 255F);
		}


		static Vector3 MakeSignedNormalized (Color value)
		{
			Vector3 vector = Vector3(
				(float(value.r - 127F) / 127F),
				(float(value.g - 127F) / 127F),
				(float(value.b - 127F) / 127F)
			);

			return vector;
		}


		/*static Vector3 ConvertSigned (Color color)
		{
			Vector3 value = Vector3(
				float(color.r) / 255F,
				float(color.g) / 255F,
				float(color.b) / 255F
			) - Vector3(127F, 127F, 127F);

			return Vector3.Round(value);
		}*/


    }


}