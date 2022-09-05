namespace Engine
{
	using System;
	using System.Collections;


	public class WelzlBoundingSphere
	{
		public Vector3 center;
		public float radius;
		private const float RadiusEpsilon = 1.00001f;


		// Welzl minimum bounding sphere algorithm
		public void CalculateWelzl (ref Vector3[64] points, int length, int supportCount = 0, int index = 0)
		{
			// Adapt the bounding Sphere (radius, center, ...)
			switch (supportCount)
			{
				case 0:
					this.radius = 0;
					this.center = Vector3.zero;
					break;
				case 1:
					this.radius = 1.0f - RadiusEpsilon;
					this.center = points[index - 1];
					break;
				case 2:
					this.SetSphere(points[index - 1], points[index - 2]);
					break;
				case 3:
					this.SetSphere(points[index - 1], points[index - 2], points[index - 3]);
					break;
				case 4:
					this.SetSphere(points[index - 1], points[index - 2], points[index - 3], points[index - 4]);
					return;
			}

			// For each point
			for (int i = 0; i < length; i++)
			{
				// Get the current point's coordinate
				Vector3 comp = points[i + index];
				float distSqr;

				// Returns the squared length of this vector : (comp - _center)
				distSqr = (comp - this.center).LengthSqr;

				// Determine if comp is inside or outside of the bounding sphere
				if (distSqr - (this.radius * this.radius) > RadiusEpsilon - 1.0f)
				{
					for (int j = i; j > 0; j--)
					{
						Vector3 a = points[j + index];
						Vector3 b = points[j - 1 + index];
						points[j + index] = b;
						points[j - 1 + index] = a;
					}

					//Increment supportCount and index then do a recursive call
					this.CalculateWelzl(ref points, i, supportCount + 1, index + 1);
				}
			}
		}


		// 2 support points for Welzl algorithm
		void SetSphere (Vector3 O, Vector3 A)
		{
			this.radius = (float)System.Math.Sqrt(((A.x - O.x) * (A.x - O.x) + (A.y - O.y)
				* (A.y - O.y) + (A.z - O.z) * (A.z - O.z)) / 4.0f) + WelzlBoundingSphere.RadiusEpsilon - 1.0f;
			float x = (1 - 0.5f) * O.x + 0.5f * A.x;
			float y = (1 - 0.5f) * O.y + 0.5f * A.y;
			float z = (1 - 0.5f) * O.z + 0.5f * A.z;

			this.center = Vector3(x, y, z);
		}


		// 3 support points for Welzl algorithm
		void SetSphere (Vector3 O, Vector3 A, Vector3 B)
		{
			Vector3 a = A - O;
			Vector3 b = B - O;
			//Get cross product of a and b
			Vector3 aCrossB = Vector3.Cross(a, b);
			//Get dot/scalar product of aCrossB.aCrossB
			float denom = 2.0f * Vector3.Dot(aCrossB, aCrossB);
			if (denom == 0)
			{
				center = Vector3.zero;
				radius = 0;
			}
			else
			{
				Vector3 o = ((Vector3.Cross(aCrossB, a) * b.LengthSqr) + (Vector3.Cross(b, aCrossB) * a.LengthSqr)) / denom;
				radius = o.Length * RadiusEpsilon;
				center = O + o;
			}
		}


		// 4 support points for Welzl algorithm
		void SetSphere (Vector3 O, Vector3 A, Vector3 B, Vector3 C)
		{
			Vector3 a = A - O;
			Vector3 b = B - O;
			Vector3 c = C - O;

			float denom = 2.0f * (a.x * (b.y * c.z - c.y * b.z) - b.x
				* (a.y * c.z - c.y * a.z) + c.x * (a.y * b.z - b.y * a.z));
			if (denom == 0)
			{
				center = Vector3.zero;
				radius = 0;
			}
			else
			{
				Vector3 o = ((Vector3.Cross(a, b) * c.LengthSqr)
					+ (Vector3.Cross(c, a) * b.LengthSqr)
					+ (Vector3.Cross(b, c) * a.LengthSqr)) / denom;
				radius = o.Length * RadiusEpsilon;
				center = O + o;
			}
		}


	}


}