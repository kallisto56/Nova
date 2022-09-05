namespace Engine
{
	using System;
	using System.IO;
	using System.Collections;
	using System.Threading;


    public class Mesh
    {
		public Cluster[] clusters;

		


		public this ()
		{
		}


		public ~this ()
		{
			DeleteContainerAndItems!(this.clusters);
		}


		public class Cluster
		{
			public int indexInBuffer;
			public Vector4 boundingSphere;
			public Splat[64] splats;
		}


		[Union, CRepr]
		public struct Splat
		{
			public static readonly int POSITION = 0;
			public static readonly int NORMAL = 1;
			public static readonly int COLOR = 2;
			public static readonly int PROP0 = 3;
			public static readonly int PROP1 = 4;

			public Vector4p[5] values;

			public this ()
			{
				this.values = .(Vector4p(255, 255, 255, 255), Vector4p(255, 255, 255, 255), Vector4p(255, 255, 255, 255), Vector4p(255, 255, 255, 255), Vector4p(255, 255, 255, 255));
			}


			// 0xXXYYZZSS - position + strength
			// 0xXXYYZZSS - normal + strength

			// 0xFF000000 - splat radius
			// 0x00FF0000 - ##############
			// 0x0000FF00 - anim.speed;
			// 0x000000FF - anim.offset;

			// 0xFF000000 - color.r;
			// 0x00FF0000 - color.g;
			// 0x0000FF00 - color.b;
			// 0x000000FF - color.strength;

			// 0xFF000000 - material.roughness;
			// 0x00FF0000 - material.metalness;
			// 0x0000FF00 - material.intensity;
			// 0x000000FF - local ambient occlusion;
			public this (
				Vector3 position,
				float positionStrength,

				Vector3 normal,
				float normalStrength,

				float splatRadius,
				float freeSlot,
				float animationSpeed,
				float animationOffset,

				Color color,
				float colorStrength,

				float roughness,
				float metalness,
				float intencity,
				float ambientOcclusion
			)
			{
				this.values[POSITION] = Vector4p(0, 0, 0, 0);
				this.values[NORMAL] = Vector4p(0, 0, 0, 0);
				this.values[COLOR] = Vector4p(0, 0, 0, 0);
				this.values[PROP0] = Vector4p(uint8(splatRadius * 255F), 0, 0, 0);
				this.values[PROP1] = Vector4p(0, 0, 0, 0);

				this.values[POSITION] = Vector4p(
					uint8(position.x * 255F),
					uint8(position.y * 255F),
					uint8(position.z * 255F),
					uint8(positionStrength * 255F)
				);

				/*this.values[1] = Vector4p(position.x, position.y, position.z, positionStrength);
				this.values[1].normalStrength = normalStrength;

				this.values[2].splatRadius = splatRadius;
				/*this.values[2].freeSlot = freeSlot;*/
				this.values[2].animationSpeed = animationSpeed;
				this.values[2].animationOffset = animationOffset;*/

				this.values[COLOR] = Vector4p(
					color.r,
					color.g,
					color.b,
					uint8(colorStrength * 255F)
				);
				/*Console.WriteLine("{0:X8}", this.values[COLOR].values);*/
				/*this.values[3].colorStrength = colorStrength;*/

				/*this.values[4].roughness = roughness;
				this.values[4].metalness = metalness;
				this.values[4].intensity = intencity;
				this.values[4].ambientOcclusion = ambientOcclusion;*/
			}

			public override void ToString(String strBuffer)
			{
				strBuffer.Append("Mesh.Splat(");
				this.values[0].ToString(strBuffer);
				strBuffer.Append(" | ");
				this.values[1].ToString(strBuffer);
				strBuffer.Append(" | ");
				this.values[2].ToString(strBuffer);
				strBuffer.Append(" | ");
				this.values[3].ToString(strBuffer);
				strBuffer.Append(" | ");
				this.values[4].ToString(strBuffer);
				strBuffer.Append(")");
			}
		}


		/*[Union]
		public struct Splat
		{
			public static readonly int stride = 4;//sizeof(Splat);
			// 0xXXYYZZSS - position.strength
			// 0xFFF00000 - position
			// 0x000FFF00 - normal
			// 0x000000FF - splat radius

			// 0xFF000000 - position.strength;
			// 0x00FF0000 - normal.strength;
			// 0x0000FF00 - anim.speed;
			// 0x000000FF - anim.offset;

			// 0xFF000000 - color.r;
			// 0x00FF0000 - color.g;
			// 0x0000FF00 - color.b;
			// 0x000000FF - color.strength;

			// 0xFF000000 - material.roughness;
			// 0x00FF0000 - material.metalness;
			// 0x0000FF00 - material.intensity;
			// 0x000000FF - local ambient occlusion;

			public uint32[4] values;


			public this (
				uint32 position,
				/*uint8 px, uint8 py, uint8 pz,
				uint8 nx, uint8 ny, uint8 nz,*/
				uint8 splatRadius,
				uint8 positionStrength,
				uint8 normalStrength,
				uint8 animSpeed,
				uint8 animOffset,
				uint8 colorR,
				uint8 colorG,
				uint8 colorB,
				uint8 colorStrength,
				uint8 materialRoughness,
				uint8 materialMetalness,
				uint8 materialIntencity,
				uint8 localAmbientOcclusion
			)
			{
				/*Console.WriteLine("Splat.position: ({0}, {1}, {2})", px, py, pz);*/
				/*Console.WriteLine("Splat.normal:   ({0}, {1}, {2})", nx, ny, nz);*/

				this.values[0] = position;
				/*this.values[0] = BitPacking.Pack_ABCDEFGG(px, py, pz, nx, ny, nz, splatRadius);*/
				this.values[1] = BitPacking.Pack_AABBCCDD(positionStrength, normalStrength, animSpeed, animOffset);
				this.values[2] = BitPacking.Pack_AABBCCDD(colorR, colorG, colorB, colorStrength);
				this.values[3] = BitPacking.Pack_AABBCCDD(materialRoughness, materialMetalness, materialIntencity, localAmbientOcclusion);
			}
		}*/


    }


}