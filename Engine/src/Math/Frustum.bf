namespace Engine
{
	using System;


	class Frustum
	{
		public Vector4[6] planes = Vector4[6]();
		public static int NEAR = 0;
		public static int FAR = 1;

		public static int LEFT = 2;
		public static int RIGHT = 3;
		public static int TOP = 4;
		public static int BOTTOM = 5;


		public bool RightParallelepipedInFrustum(Vector3 Min, Vector3 Max)
		{
			bool inside = true;
			//тестируем 6 плоскостей фрустума
			for (int i = 0; i < 6; i++)
			{
			  //находим ближайшую к плоскости вершину
			  //проверяем, если она находится за плоскостью, то объект вне врустума
				float d = Math.Max(Min.x * this.planes[i].x, Max.x * this.planes[i].x)
					+ Math.Max(Min.y * this.planes[i].y, Max.y * this.planes[i].y)
					+ Math.Max(Min.z * this.planes[i].z, Max.z * this.planes[i].z)
					+ this.planes[i].w;
				inside &= d > 0;
			  //return false; //флаг работает быстрее
			}
			//если не нашли разделяющей плоскости, считаем объект видим
			return inside;
		}


		public bool RightParallelepipedInFrustum2(Vector4 Min, Vector4 Max)
		{
		//этот код показывает общую идею - как работает кулинг боксов, AABB и OBB
			//Min & Max 2 точки AABB в мировом пространстве
			//Мы можем трансформировать 8 точек бокса в мировое пространство
			//и подставить (вместо Min и Max) в уравнения, получив кулинг OBB-фрустум

		  //тестируем 6 плоскостей фрустума
			for (int i = 0; i < 6; i++)
			{
			//пробуем найти такую плоскость, для которой все 8 точек находятся за ней
				//тестируем 8 точек бокса
				//считаем расстояние от точки до плоскости
				//если точка впереди плоскости, то данная плоскость не является разделяющей
				if (this.planes[i][0] * Min[0] + this.planes[i][1] * Max[1] +
					this.planes[i][2] * Min[2] + this.planes[i][3] > 0)
					continue;
				if (this.planes[i][0] * Min[0] + this.planes[i][1] * Max[1] +
					this.planes[i][2] * Max[2] + this.planes[i][3] > 0)
					continue;
				if (this.planes[i][0] * Max[0] + this.planes[i][1] * Max[1] +
					this.planes[i][2] * Max[2] + this.planes[i][3] > 0)
					continue;
				if (this.planes[i][0] * Max[0] + this.planes[i][1] * Max[1] +
					this.planes[i][2] * Min[2] + this.planes[i][3] > 0)
					continue;
				if (this.planes[i][0] * Max[0] + this.planes[i][1] * Min[1] +
					this.planes[i][2] * Min[2] + this.planes[i][3] > 0)
					continue;
				if (this.planes[i][0] * Max[0] + this.planes[i][1] * Min[1] +
					this.planes[i][2] * Max[2] + this.planes[i][3] > 0)
					continue;
				if (this.planes[i][0] * Min[0] + this.planes[i][1] * Min[1] +
					this.planes[i][2] * Max[2] + this.planes[i][3] > 0)
					continue;
				if (this.planes[i][0] * Min[0] + this.planes[i][1] * Min[1] +
					this.planes[i][2] * Min[2] + this.planes[i][3] > 0)
					continue;

			  //если все вершины бокса находятся за плоскостью, то мы нашли разделяющую плоскость -
			  //объект находится вне фрустума
				return false;
			}
		  //если не нашли разделяющей плоскости, то считаем что объект видимый
			return true;
		}


		public bool SphereInFrustum(Vector3 position, float radius)
		{
			bool response = true;

			//тестируем 6 плоскостей фрустума
			for (int i = 0; i < 6; i++)
			{
			  //считаем расстояние от центра сферы до плоскости
			  //если центр сферы находится за плоскостью и расстояние больше чем радиус сферы,
			  //то объект не попадает во фрустум
				if (this.planes[i].x * position.x + this.planes[i].y * position.y +
					this.planes[i].z * position.z + this.planes[i].w <= -radius)
					response = false;
				//return false; //флаг работает быстрее
			}
			return response;
			//return true;
		}


		// https://gist.github.com/noct/3580326
		public void Generate(Matrix4x4 matrix)
		{
			float xw = matrix.values[03];
			float yw = matrix.values[07];
			float zw = matrix.values[11];
			float ww = matrix.values[15];

			float xz = matrix.values[02];
			float yz = matrix.values[06];
			float zz = matrix.values[10];
			float wz = matrix.values[14];

			// near
			this.planes[NEAR].x = xw - xz;
			this.planes[NEAR].y = yw - yz;
			this.planes[NEAR].z = zw - zz;
			this.planes[NEAR].w = ww - wz;

			// far
			this.planes[FAR].x = xw + xz;
			this.planes[FAR].y = yw + yz;
			this.planes[FAR].z = zw + zz;
			this.planes[FAR].w = ww + wz;

			float xx = matrix[00];
			float yx = matrix[04];
			float zx = matrix[08];
			float wx = matrix[12];

			// left
			this.planes[LEFT].x = xw - xx;
			this.planes[LEFT].y = yw - yx;
			this.planes[LEFT].z = zw - zx;
			this.planes[LEFT].w = ww - wx;

			// right
			this.planes[RIGHT].x = xw + xx;
			this.planes[RIGHT].y = yw + yx;
			this.planes[RIGHT].z = zw + zx;
			this.planes[RIGHT].w = ww + wx;

			float xy = matrix[01];
			float yy = matrix[05];
			float zy = matrix[09];
			float wy = matrix[13];

			// top
			this.planes[TOP].x = xw + xy;
			this.planes[TOP].y = yw + yy;
			this.planes[TOP].z = zw + zy;
			this.planes[TOP].w = ww + wy;

			// bottom
			this.planes[BOTTOM].x = xw - xy;
			this.planes[BOTTOM].y = yw - yy;
			this.planes[BOTTOM].z = zw - zy;
			this.planes[BOTTOM].w = ww - wy;

			// ...
			for (int index = 0; index < 6; index++)
			{
				float inverseLength = 1F / Math.Sqrt(
					this.planes[index].x * this.planes[index].x +
					this.planes[index].y * this.planes[index].y +
					this.planes[index].z * this.planes[index].z
					);

				this.planes[index] *= inverseLength;
			}
		}
	}
}