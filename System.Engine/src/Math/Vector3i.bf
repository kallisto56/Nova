namespace System.Math
{
    using System;
    
    /// <summary>
    /// A vector of type float with 3 components.
    /// </summary>
    [Union]
    public struct Vector3i : IHashable
    {

        //#region Fields
        
        /// <summary>
        /// component data
        /// </summary>
        public int[3] values;
        
        /// <summary>
        /// Returns an object that can be used for arbitrary swizzling (e.g. swizzle.zy)
        /// </summary>
        /*public readonly swizzle_int3 swizzle;*/

        //#endregion


        //#region Constructors
        
        /// <summary>
        /// Component-wise constructor
        /// </summary>
        public this(int x, int y, int z)
        {
            values = .(x,y,z);
        }
        
        /// <summary>
        /// Component-wise constructor
        /// </summary>
        public this()
        {
            values = .(0, 0, 0);
        }
        
        /// <summary>
        /// all-same-value constructor
        /// </summary>
        public this(int v)
        {
            values = .(v,v,v);
        }
        
        /// <summary>
        /// from-vector constructor (empty fields are zero/false)
        /// </summary>
        public this(Vector2 v)
        {
            values = .(int(v.x),int(v.y),0);
        }
        
        /// <summary>
        /// from-vector-and-value constructor
        /// </summary>
        public this(Vector2 v, int z)
        {
            values = .(int(v.x),int(v.y),z);
        }
        
        /// <summary>
        /// from-vector constructor
        /// </summary>
        public this(Vector3i v)
        {
            values = .(v.x,v.y,v.z);
        }
        
        /// <summary>
        /// from-vector constructor (additional fields are truncated)
        /// </summary>
        public this(Vector4 v)
        {
            values = .(int(v.x),int(v.y),int(v.z));
        }
        
        /// <summary>
        /// From-array constructor (superfluous values are ignored, missing values are zero-filled).
        /// </summary>
        public this(int[] v)
        {
            let c = v.Count;
            values = .((c < 0) ? 0 : v[0],(c < 1) ? 0 : v[1],(c < 2) ? 0 : v[2]);
        }
        
        /*/// <summary>
        /// From-array constructor with base index (superfluous values are ignored, missing values are zero-filled).
        /// </summary>
        public this(int[] v, int startIndex)
        {
            let c = v.Count;
            values = .((c + startIndex < 0) ? 0f : v[0 + startIndex],(c + startIndex < 1) ? 0f : v[1 + startIndex],(c + startIndex < 2) ? 0f : v[2 + startIndex]);
        }*/

        //#endregion


        //#region Implicit Operators
        
        /// <summary>
        /// Implicitly converts this to a double3.
        /// </summary>
        /*public static implicit operator double3(Vector3i v) =>  double3((double)v.x, (double)v.y, (double)v.z);*/

        //#endregion


        //#region Explicit Operators
        
        /// <summary>
        /// Explicitly converts this to a int2.
        /// </summary>
        /*public static explicit operator int2(Vector3i v) =>  int2(int32(v.x), int32(v.y));*/
        
        /// <summary>
        /// Explicitly converts this to a int3.
        /// </summary>
        /*public static explicit operator int3(Vector3i v) =>  int3(int32(v.x), int32(v.y), int32(v.z));*/
        
        /// <summary>
        /// Explicitly converts this to a int4. (Higher components are zeroed)
        /// </summary>
        /*public static explicit operator int4(Vector3i v) =>  int4((int)v.x, (int)v.y, (int)v.z, 0);*/
        
        /// <summary>
        /// Explicitly converts this to a uint2.
        /// </summary>
        /*public static explicit operator uint2(Vector3i v) =>  uint2((uint)v.x, (uint)v.y);*/
        
        /// <summary>
        /// Explicitly converts this to a uint3.
        /// </summary>
        /*public static explicit operator uint3(Vector3i v) =>  uint3((uint)v.x, (uint)v.y, (uint)v.z);*/
        
        /// <summary>
        /// Explicitly converts this to a uint4. (Higher components are zeroed)
        /// </summary>
        /*public static explicit operator uint4(Vector3i v) =>  uint4((uint)v.x, (uint)v.y, (uint)v.z, 0u);*/
        
        /// <summary>
        /// Explicitly converts this to a float2.
        /// </summary>
        public static explicit operator Vector2(Vector3i v) =>  Vector2((float)v.x, (float)v.y);
        
        /// <summary>
        /// Explicitly converts this to a float4. (Higher components are zeroed)
        /// </summary>
        public static explicit operator Vector4(Vector3i v) =>  Vector4((float)v.x, (float)v.y, (float)v.z, 0f);
        
        /// <summary>
        /// Explicitly converts this to a double2.
        /// </summary>
        /*public static explicit operator double2(Vector3i v) =>  double2((double)v.x, (double)v.y);
        
        /// <summary>
        /// Explicitly converts this to a double4. (Higher components are zeroed)
        /// </summary>
        public static explicit operator double4(Vector3i v) =>  double4((double)v.x, (double)v.y, (double)v.z, 0.0);
        
        /// <summary>
        /// Explicitly converts this to a long2.
        /// </summary>
        public static explicit operator long2(Vector3i v) =>  long2((long)v.x, (long)v.y);
        
        /// <summary>
        /// Explicitly converts this to a long3.
        /// </summary>
        public static explicit operator long3(Vector3i v) =>  long3((long)v.x, (long)v.y, (long)v.z);
        
        /// <summary>
        /// Explicitly converts this to a long4. (Higher components are zeroed)
        /// </summary>
        public static explicit operator long4(Vector3i v) =>  long4((long)v.x, (long)v.y, (long)v.z, 0);
        
        /// <summary>
        /// Explicitly converts this to a bool2.
        /// </summary>
        public static explicit operator bool2(Vector3i v) =>  bool2(v.x != 0f, v.y != 0f);
        
        /// <summary>
        /// Explicitly converts this to a bool3.
        /// </summary>
        public static explicit operator bool3(Vector3i v) =>  bool3(v.x != 0f, v.y != 0f, v.z != 0f);
        
        /// <summary>
        /// Explicitly converts this to a bool4. (Higher components are zeroed)
        /// </summary>
        public static explicit operator bool4(Vector3i v) =>  bool4(v.x != 0f, v.y != 0f, v.z != 0f, false);*/

        //#endregion


        //#region Indexer
        
        /// <summary>
        /// Gets/Sets a specific indexed component (a bit slower than direct access).
        /// </summary>
        public int this[int index]
        {
            [Inline]get
            {
                System.Diagnostics.Debug.Assert(index >=0 && index < 3, "index out of range");
                unchecked { return values[index]; }
            }
            [Inline]set mut
            {
                System.Diagnostics.Debug.Assert(index >=0 && index < 3, "index out of range");
                unchecked { values[index] = value;}
            }
        }

        //#endregion


        //#region Properties
        
        /// <summary>
        /// x-component
        /// </summary>
        public int x
        {
            [Inline]get
            {
                return values[0];
            }
            [Inline]set mut
            {
                values[0] = value;
            }
        }
        
        /// <summary>
        /// y-component
        /// </summary>
        public int y
        {
            [Inline]get
            {
                return values[1];
            }
            [Inline]set mut
            {
                values[1] = value;
            }
        }
        
        /// <summary>
        /// z-component
        /// </summary>
        public int z
        {
            [Inline]get
            {
                return values[2];
            }
            [Inline]set mut
            {
                values[2] = value;
            }
        }
        
        /// <summary>
        /// Gets or sets the specified subset of components. For more advanced (read-only) swizzling, use the .swizzle property.
        /// </summary>
        public Vector2 xy
        {
            [Inline]get
            {
                return  Vector2(x, y);
            }
            [Inline]set mut
            {
                x = int(value.x);
                y = int(value.y);
            }
        }
        
        /// <summary>
        /// Gets or sets the specified subset of components. For more advanced (read-only) swizzling, use the .swizzle property.
        /// </summary>
        public Vector2 xz
        {
            [Inline]get
            {
                return  Vector2(x, z);
            }
            [Inline]set mut
            {
                x = int(value.x);
                z = int(value.y);
            }
        }
        
        /// <summary>
        /// Gets or sets the specified subset of components. For more advanced (read-only) swizzling, use the .swizzle property.
        /// </summary>
        public Vector2 yz
        {
            [Inline]get
            {
                return  Vector2(y, z);
            }
            [Inline]set mut
            {
                y = int(value.x);
                z = int(value.y);
            }
        }
        
        /// <summary>
        /// Gets or sets the specified subset of components. For more advanced (read-only) swizzling, use the .swizzle property.
        /// </summary>
        public Vector3i xyz
        {
            [Inline]get
            {
                return  Vector3i(x, y, z);
            }
            [Inline]set mut
            {
                x = value.x;
                y = value.y;
                z = value.z;
            }
        }
        
        /// <summary>
        /// Gets or sets the specified subset of components. For more advanced (read-only) swizzling, use the .swizzle property.
        /// </summary>
        public Vector2 rg
        {
            [Inline]get
            {
                return  Vector2(x, y);
            }
            [Inline]set mut
            {
                x = int(value.x);
                y = int(value.y);
            }
        }
        
        /// <summary>
        /// Gets or sets the specified subset of components. For more advanced (read-only) swizzling, use the .swizzle property.
        /// </summary>
        public Vector2 rb
        {
            [Inline]get
            {
                return  Vector2(x, z);
            }
            [Inline]set mut
            {
                x = int(value.x);
                z = int(value.y);
            }
        }
        
        /// <summary>
        /// Gets or sets the specified subset of components. For more advanced (read-only) swizzling, use the .swizzle property.
        /// </summary>
        public Vector2 gb
        {
            [Inline]get
            {
                return  Vector2(y, z);
            }
            [Inline]set mut
            {
                y = int(value.x);
                z = int(value.y);
            }
        }
        
        /// <summary>
        /// Gets or sets the specified subset of components. For more advanced (read-only) swizzling, use the .swizzle property.
        /// </summary>
        public Vector3i rgb
        {
            [Inline]get
            {
                return  Vector3i(x, y, z);
            }
            [Inline]set mut
            {
                x = value.x;
                y = value.y;
                z = value.z;
            }
        }
        
        /// <summary>
        /// Gets or sets the specified RGBA component. For more advanced (read-only) swizzling, use the .swizzle property.
        /// </summary>
        public float r
        {
            [Inline]get
            {
                return x;
            }
            [Inline]set mut
            {
                x = int(value);
            }
        }
        
        /// <summary>
        /// Gets or sets the specified RGBA component. For more advanced (read-only) swizzling, use the .swizzle property.
        /// </summary>
        public float g
        {
            [Inline]get
            {
                return y;
            }
            [Inline]set mut
            {
                y = int(value);
            }
        }
        
        /// <summary>
        /// Gets or sets the specified RGBA component. For more advanced (read-only) swizzling, use the .swizzle property.
        /// </summary>
        public float b
        {
            [Inline]get
            {
                return z;
            }
            [Inline]set mut
            {
                z = int(value);
            }
        }
        
        /// <summary>
        /// Returns the number of components (3).
        /// </summary>
        public int Count => 3;
        
        /// <summary>
        /// Returns the minimal component of this vector.
        /// </summary>
        public float MinElement => System.Math.Min(System.Math.Min(x, y), z);
        
        /// <summary>
        /// Returns the maximal component of this vector.
        /// </summary>
        public float MaxElement => System.Math.Max(System.Math.Max(x, y), z);
        
        /// <summary>
        /// Returns the euclidean length of this vector.
        /// </summary>
        public float Length => (float)System.Math.Sqrt(((x*x + y*y) + z*z));
        
        /// <summary>
        /// Returns the squared euclidean length of this vector.
        /// </summary>
        public float LengthSqr => ((x*x + y*y) + z*z);
        
        /// <summary>
        /// Returns the sum of all components.
        /// </summary>
        public float Sum => ((x + y) + z);
        
        /// <summary>
        /// Returns the euclidean norm of this vector.
        /// </summary>
        public float Norm => (float)System.Math.Sqrt(((x*x + y*y) + z*z));
        
        /// <summary>
        /// Returns the one-norm of this vector.
        /// </summary>
        public float Norm1 => ((System.Math.Abs(x) + System.Math.Abs(y)) + System.Math.Abs(z));
        
        /// <summary>
        /// Returns the two-norm (euclidean length) of this vector.
        /// </summary>
        public float Norm2 => (float)System.Math.Sqrt(((x*x + y*y) + z*z));
        
        /// <summary>
        /// Returns the max-norm of this vector.
        /// </summary>
        public float NormMax => System.Math.Max(System.Math.Max(System.Math.Abs(x), System.Math.Abs(y)), System.Math.Abs(z));
        
        /// <summary>
        /// Returns a copy of this vector with length one (undefined if this has zero length).
        /// </summary>
        public Vector3i normalized => this / (int)Length;
        
        /// <summary>
        /// Returns a copy of this vector with length one (returns zero if length is zero).
        /// </summary>
        public Vector3i normalizedSafe => this == zero ? zero : this / (int)Length;

        //#endregion


        //#region Static Properties
        
        /// <summary>
        /// Predefined all-zero vector
        /// </summary>
        readonly public static Vector3i zero  =  Vector3i(0, 0, 0);

		/// <summary>
		/// Predefined all-ones vector
		/// </summary>
		readonly public static Vector3i one  =  Vector3i(1, 1, 1);

		/// <summary>
		/// Predefined unit-X vector
		/// </summary>
		readonly public static Vector3i right  =  Vector3i(1, 0, 0);

		/// <summary>
		/// Predefined unit-X vector
		/// </summary>
		readonly public static Vector3i left  =  Vector3i(-1, 0, 0);

		/// <summary>
		/// Predefined unit-Y vector
		/// </summary>
		readonly public static Vector3i up  =  Vector3i(0, 1, 0);

		/// <summary>
		/// Predefined unit-Y vector
		/// </summary>
		readonly public static Vector3i down  =  Vector3i(0, -1, 0);

		/// <summary>
		/// Predefined unit-Z vector
		/// </summary>
		readonly public static Vector3i forward  =  Vector3i(0, 0, 1);

		/// <summary>
		/// Predefined unit-Z vector
		/// </summary>
		readonly public static Vector3i back  =  Vector3i(0, 0, -1);
        
        /// <summary>
        /// Predefined all-MaxValue vector
        /// </summary>
        readonly public static Vector3i MaxValue  =  Vector3i(int.MaxValue, int.MaxValue, int.MaxValue);

		/// <summary>
		/// Predefined all-MinValue vector
		/// </summary>
		readonly public static Vector3i MinValue  =  Vector3i(int.MinValue, int.MinValue, int.MinValue);

		/// <summary>
		/// Predefined all-NegativeInfinity vector
		/// </summary>
		readonly public static Vector3i NegativeInfinity  =  Vector3i(int.MinValue, int.MinValue, int.MinValue);

		/// <summary>
		/// Predefined all-PositiveInfinity vector
		/// </summary>
		readonly public static Vector3i PositiveInfinity  =  Vector3i(int.MaxValue, int.MaxValue, int.MaxValue);

        //#endregion


        //#region Operators
        
        /// <summary>
        /// Returns true if this equals rhs component-wise.
        /// </summary>
        public static bool operator==(Vector3i lhs, Vector3i rhs) => ((lhs.x == rhs.x && lhs.y == rhs.y) && lhs.z == rhs.z);
        
        /// <summary>
        /// Returns true if this does not equal rhs (component-wise).
        /// </summary>
        public static bool operator!=(Vector3i lhs, Vector3i rhs) => !((lhs.x == rhs.x && lhs.y == rhs.y) && lhs.z == rhs.z);

        //#endregion


        //#region Functions
        
        /// <summary>
        /// Returns an array with all values
        /// </summary>
        public float[] ToArray() => new .[] ( x, y, z );
        
        /// <summary>
        /// Returns a string representation of this vector using ', ' as a seperator.
        /// </summary>
        public override void ToString(String stringBuffer)
        {
            stringBuffer.AppendF("Vector3i({0}F, {1}F, {2}F)", values[0], values[1], values[2]);
        }
        
        /// <summary>
        /// Returns a string representation of this vector using a provided seperator.
        /// </summary>
        public void ToString(String stringBuffer, String sep)
        {
            let _x = scope String(); values[0].ToString(_x);
            let _y = scope String(); values[1].ToString(_y);
            let _z = scope String(); values[2].ToString(_z);
             stringBuffer.Join(sep, _x,_y,_z );
        }
        
        /// <summary>
        /// Returns a hash code for this instance.
        /// </summary>
        public int GetHashCode()
        {
            unchecked
            {
                return ((((x.GetHashCode()) * 397) ^ y.GetHashCode()) * 397) ^ z.GetHashCode();
            }
        }
        
        /// <summary>
        /// Returns the p-norm of this vector.
        /// </summary>
        public double NormP(double p) => System.Math.Pow(((System.Math.Pow((double)System.Math.Abs(x), p) + System.Math.Pow((double)System.Math.Abs(y), p)) + System.Math.Pow((double)System.Math.Abs(z), p)), 1 / p);

        //#endregion


        //#region Static Functions
        
        /// <summary>
        /// Returns true iff distance between lhs and rhs is less than or equal to epsilon
        /// </summary>
        public static bool ApproxEqual(Vector3i lhs, Vector3i rhs, float eps = 0.1f) => Distance(lhs, rhs) <= eps;
        
        /// <summary>
        /// OuterProduct treats the first parameter c as a column vector (matrix with one column) and the second parameter r as a row vector (matrix with one row) and does a linear algebraic matrix multiply c * r, yielding a matrix whose number of rows is the number of components in c and whose number of columns is the number of components in r.
        /// </summary>
        /*public static float3x2 OuterProduct(float2 c, Vector3i r) =>  float3x2(c.x * r.x, c.y * r.x, c.x * r.y, c.y * r.y, c.x * r.z, c.y * r.z);*/
        
        /// <summary>
        /// OuterProduct treats the first parameter c as a column vector (matrix with one column) and the second parameter r as a row vector (matrix with one row) and does a linear algebraic matrix multiply c * r, yielding a matrix whose number of rows is the number of components in c and whose number of columns is the number of components in r.
        /// </summary>
        /*public static float2x3 OuterProduct(Vector3i c, float2 r) =>  float2x3(c.x * r.x, c.y * r.x, c.z * r.x, c.x * r.y, c.y * r.y, c.z * r.y);*/
        
        /// <summary>
        /// OuterProduct treats the first parameter c as a column vector (matrix with one column) and the second parameter r as a row vector (matrix with one row) and does a linear algebraic matrix multiply c * r, yielding a matrix whose number of rows is the number of components in c and whose number of columns is the number of components in r.
        /// </summary>
        public static float3x3 OuterProduct(Vector3i c, Vector3i r) =>  float3x3(c.x * r.x, c.y * r.x, c.z * r.x, c.x * r.y, c.y * r.y, c.z * r.y, c.x * r.z, c.y * r.z, c.z * r.z);
        
        /// <summary>
        /// OuterProduct treats the first parameter c as a column vector (matrix with one column) and the second parameter r as a row vector (matrix with one row) and does a linear algebraic matrix multiply c * r, yielding a matrix whose number of rows is the number of components in c and whose number of columns is the number of components in r.
        /// </summary>
        /*public static float3x4 OuterProduct(float4 c, Vector3i r) =>  float3x4(c.x * r.x, c.y * r.x, c.z * r.x, c.w * r.x, c.x * r.y, c.y * r.y, c.z * r.y, c.w * r.y, c.x * r.z, c.y * r.z, c.z * r.z, c.w * r.z);*/
        
        /// <summary>
        /// OuterProduct treats the first parameter c as a column vector (matrix with one column) and the second parameter r as a row vector (matrix with one row) and does a linear algebraic matrix multiply c * r, yielding a matrix whose number of rows is the number of components in c and whose number of columns is the number of components in r.
        /// </summary>
        /*public static float4x3 OuterProduct(Vector3i c, float4 r) =>  float4x3(c.x * r.x, c.y * r.x, c.z * r.x, c.x * r.y, c.y * r.y, c.z * r.y, c.x * r.z, c.y * r.z, c.z * r.z, c.x * r.w, c.y * r.w, c.z * r.w);*/
        
        /// <summary>
        /// Returns the inner product (dot product, scalar product) of the two vectors.
        /// </summary>
        public static float Dot(Vector3i lhs, Vector3i rhs) => ((lhs.x * rhs.x + lhs.y * rhs.y) + lhs.z * rhs.z);
        
        /// <summary>
        /// Returns the euclidean distance between the two vectors.
        /// </summary>
        public static float Distance(Vector3i lhs, Vector3i rhs) => (lhs - rhs).Length;
        
        /// <summary>
        /// Returns the squared euclidean distance between the two vectors.
        /// </summary>
        public static float DistanceSqr(Vector3i lhs, Vector3i rhs) => (lhs - rhs).LengthSqr;
        
        /// <summary>
        /// Calculate the reflection direction for an incident vector (N should be normalized in order to achieve the desired result).
        /// </summary>
        /*public static Vector3i Reflect(Vector3i I, Vector3i N) => I - 2 * Dot(N, I) * N;*/
        
        /// <summary>
        /// Calculate the refraction direction for an incident vector (The input parameters I and N should be normalized in order to achieve the desired result).
        /// </summary>
        /*public static Vector3i Refract(Vector3i I, Vector3i N, float eta)
        {
            let dNI = Dot(N, I);
            let k = 1 - eta * eta * (1 - dNI * dNI);
            if (k < 0) return zero;
            return eta * I - (eta * dNI + (float)System.Math.Sqrt(k)) * N;
        }*/
        
        /// <summary>
        /// Returns a vector pointing in the same direction as another (faceforward orients a vector to point away from a surface as defined by its normal. If dot(Nref, I) is negative faceforward returns N, otherwise it returns -N).
        /// </summary>
        public static Vector3i FaceForward(Vector3i N, Vector3i I, Vector3i Nref) => Dot(Nref, I) < 0 ? N : -N;
        
        /// <summary>
        /// Returns the outer product (cross product, vector product) of the two vectors.
        /// </summary>
        public static Vector3i Cross(Vector3i l, Vector3i r) =>  Vector3i(l.y * r.z - l.z * r.y, l.z * r.x - l.x * r.z, l.x * r.y - l.y * r.x);
        
        /// <summary>
        /// Returns a float3 with independent and identically distributed uniform values between 0.0 and 1.0.
        /// </summary>
        /*public static Vector3i Random(Random random) =>  Vector3i((float)random.NextDouble(), (float)random.NextDouble(), (float)random.NextDouble());*/
        
        /// <summary>
        /// Returns a float3 with independent and identically distributed uniform values between -1.0 and 1.0.
        /// </summary>
        /*public static Vector3i RandomSigned(Random random) =>  Vector3i((float)(random.NextDouble() * 2.0 - 1.0), (float)(random.NextDouble() * 2.0 - 1.0), (float)(random.NextDouble() * 2.0 - 1.0));*/
        
        /// <summary>
        /// Returns a float3 with independent and identically distributed values according to a normal distribution (zero mean, unit variance).
        /// </summary>
        /*public static Vector3i RandomNormal(Random random) =>  Vector3i((float)(System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))), (float)(System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))), (float)(System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))));*/

        //#endregion


        //#region Component-Wise Static Functions
        
        /// <summary>
        /// Returns a bool3 from component-wise application of Equal (lhs == rhs).
        /// </summary>
        /*public static bool3 Equal(Vector3i lhs, Vector3i rhs) => bool3(lhs.x == rhs.x, lhs.y == rhs.y, lhs.z == rhs.z);
        
        /// <summary>
        /// Returns a bool3 from component-wise application of Equal (lhs == rhs).
        /// </summary>
        public static bool3 Equal(Vector3i lhs, float rhs) => bool3(lhs.x == rhs, lhs.y == rhs, lhs.z == rhs);
        
        /// <summary>
        /// Returns a bool3 from component-wise application of Equal (lhs == rhs).
        /// </summary>
        public static bool3 Equal(float lhs, Vector3i rhs) => bool3(lhs == rhs.x, lhs == rhs.y, lhs == rhs.z);
        
        /// <summary>
        /// Returns a bool from the application of Equal (lhs == rhs).
        /// </summary>
        public static bool3 Equal(float lhs, float rhs) => bool3(lhs == rhs);
        
        /// <summary>
        /// Returns a bool3 from component-wise application of NotEqual (lhs != rhs).
        /// </summary>
        public static bool3 NotEqual(Vector3i lhs, Vector3i rhs) => bool3(lhs.x != rhs.x, lhs.y != rhs.y, lhs.z != rhs.z);
        
        /// <summary>
        /// Returns a bool3 from component-wise application of NotEqual (lhs != rhs).
        /// </summary>
        public static bool3 NotEqual(Vector3i lhs, float rhs) => bool3(lhs.x != rhs, lhs.y != rhs, lhs.z != rhs);
        
        /// <summary>
        /// Returns a bool3 from component-wise application of NotEqual (lhs != rhs).
        /// </summary>
        public static bool3 NotEqual(float lhs, Vector3i rhs) => bool3(lhs != rhs.x, lhs != rhs.y, lhs != rhs.z);
        
        /// <summary>
        /// Returns a bool from the application of NotEqual (lhs != rhs).
        /// </summary>
        public static bool3 NotEqual(float lhs, float rhs) => bool3(lhs != rhs);
        
        /// <summary>
        /// Returns a bool3 from component-wise application of GreaterThan (lhs &gt; rhs).
        /// </summary>
        public static bool3 GreaterThan(Vector3i lhs, Vector3i rhs) => bool3(lhs.x > rhs.x, lhs.y > rhs.y, lhs.z > rhs.z);
        
        /// <summary>
        /// Returns a bool3 from component-wise application of GreaterThan (lhs &gt; rhs).
        /// </summary>
        public static bool3 GreaterThan(Vector3i lhs, float rhs) => bool3(lhs.x > rhs, lhs.y > rhs, lhs.z > rhs);
        
        /// <summary>
        /// Returns a bool3 from component-wise application of GreaterThan (lhs &gt; rhs).
        /// </summary>
        public static bool3 GreaterThan(float lhs, Vector3i rhs) => bool3(lhs > rhs.x, lhs > rhs.y, lhs > rhs.z);
        
        /// <summary>
        /// Returns a bool from the application of GreaterThan (lhs &gt; rhs).
        /// </summary>
        public static bool3 GreaterThan(float lhs, float rhs) => bool3(lhs > rhs);
        
        /// <summary>
        /// Returns a bool3 from component-wise application of GreaterThanEqual (lhs &gt;= rhs).
        /// </summary>
        public static bool3 GreaterThanEqual(Vector3i lhs, Vector3i rhs) => bool3(lhs.x >= rhs.x, lhs.y >= rhs.y, lhs.z >= rhs.z);
        
        /// <summary>
        /// Returns a bool3 from component-wise application of GreaterThanEqual (lhs &gt;= rhs).
        /// </summary>
        public static bool3 GreaterThanEqual(Vector3i lhs, float rhs) => bool3(lhs.x >= rhs, lhs.y >= rhs, lhs.z >= rhs);
        
        /// <summary>
        /// Returns a bool3 from component-wise application of GreaterThanEqual (lhs &gt;= rhs).
        /// </summary>
        public static bool3 GreaterThanEqual(float lhs, Vector3i rhs) => bool3(lhs >= rhs.x, lhs >= rhs.y, lhs >= rhs.z);
        
        /// <summary>
        /// Returns a bool from the application of GreaterThanEqual (lhs &gt;= rhs).
        /// </summary>
        public static bool3 GreaterThanEqual(float lhs, float rhs) => bool3(lhs >= rhs);
        
        /// <summary>
        /// Returns a bool3 from component-wise application of LesserThan (lhs &lt; rhs).
        /// </summary>
        public static bool3 LesserThan(Vector3i lhs, Vector3i rhs) => bool3(lhs.x < rhs.x, lhs.y < rhs.y, lhs.z < rhs.z);
        
        /// <summary>
        /// Returns a bool3 from component-wise application of LesserThan (lhs &lt; rhs).
        /// </summary>
        public static bool3 LesserThan(Vector3i lhs, float rhs) => bool3(lhs.x < rhs, lhs.y < rhs, lhs.z < rhs);
        
        /// <summary>
        /// Returns a bool3 from component-wise application of LesserThan (lhs &lt; rhs).
        /// </summary>
        public static bool3 LesserThan(float lhs, Vector3i rhs) => bool3(lhs < rhs.x, lhs < rhs.y, lhs < rhs.z);
        
        /// <summary>
        /// Returns a bool from the application of LesserThan (lhs &lt; rhs).
        /// </summary>
        public static bool3 LesserThan(float lhs, float rhs) => bool3(lhs < rhs);
        
        /// <summary>
        /// Returns a bool3 from component-wise application of LesserThanEqual (lhs &lt;= rhs).
        /// </summary>
        public static bool3 LesserThanEqual(Vector3i lhs, Vector3i rhs) => bool3(lhs.x <= rhs.x, lhs.y <= rhs.y, lhs.z <= rhs.z);
        
        /// <summary>
        /// Returns a bool3 from component-wise application of LesserThanEqual (lhs &lt;= rhs).
        /// </summary>
        public static bool3 LesserThanEqual(Vector3i lhs, float rhs) => bool3(lhs.x <= rhs, lhs.y <= rhs, lhs.z <= rhs);
        
        /// <summary>
        /// Returns a bool3 from component-wise application of LesserThanEqual (lhs &lt;= rhs).
        /// </summary>
        public static bool3 LesserThanEqual(float lhs, Vector3i rhs) => bool3(lhs <= rhs.x, lhs <= rhs.y, lhs <= rhs.z);
        
        /// <summary>
        /// Returns a bool from the application of LesserThanEqual (lhs &lt;= rhs).
        /// </summary>
        public static bool3 LesserThanEqual(float lhs, float rhs) => bool3(lhs <= rhs);
        
        /// <summary>
        /// Returns a bool3 from component-wise application of IsInfinity (v.IsInfinity).
        /// </summary>
        public static bool3 IsInfinity(Vector3i v) => bool3(v.x.IsInfinity, v.y.IsInfinity, v.z.IsInfinity);
        
        /// <summary>
        /// Returns a bool from the application of IsInfinity (v.IsInfinity).
        /// </summary>
        public static bool3 IsInfinity(float v) => bool3(v.IsInfinity);
        
        /// <summary>
        /// Returns a bool3 from component-wise application of IsFinite (v.IsFinite).
        /// </summary>
        public static bool3 IsFinite(Vector3i v) => bool3(v.x.IsFinite, v.y.IsFinite, v.z.IsFinite);
        
        /// <summary>
        /// Returns a bool from the application of IsFinite (v.IsFinite).
        /// </summary>
        public static bool3 IsFinite(float v) => bool3(v.IsFinite);
        
        /// <summary>
        /// Returns a bool3 from component-wise application of IsNaN (v.IsNaN).
        /// </summary>
        public static bool3 IsNaN(Vector3i v) => bool3(v.x.IsNaN, v.y.IsNaN, v.z.IsNaN);
        
        /// <summary>
        /// Returns a bool from the application of IsNaN (v.IsNaN).
        /// </summary>
        public static bool3 IsNaN(float v) => bool3(v.IsNaN);
        
        /// <summary>
        /// Returns a bool3 from component-wise application of IsNegativeInfinity (v.IsNegativeInfinity).
        /// </summary>
        public static bool3 IsNegativeInfinity(Vector3i v) => bool3(v.x.IsNegativeInfinity, v.y.IsNegativeInfinity, v.z.IsNegativeInfinity);
        
        /// <summary>
        /// Returns a bool from the application of IsNegativeInfinity (v.IsNegativeInfinity).
        /// </summary>
        public static bool3 IsNegativeInfinity(float v) => bool3(v.IsNegativeInfinity);
        
        /// <summary>
        /// Returns a bool3 from component-wise application of IsPositiveInfinity (v.IsPositiveInfinity).
        /// </summary>
        public static bool3 IsPositiveInfinity(Vector3i v) => bool3(v.x.IsPositiveInfinity, v.y.IsPositiveInfinity, v.z.IsPositiveInfinity);
        
        /// <summary>
        /// Returns a bool from the application of IsPositiveInfinity (v.IsPositiveInfinity).
        /// </summary>
        public static bool3 IsPositiveInfinity(float v) => bool3(v.IsPositiveInfinity);*/
        
        /// <summary>
        /// Returns a float3 from component-wise application of Abs (System.Math.Abs(v)).
        /// </summary>
        public static Vector3i Abs(Vector3i v) => Vector3i(System.Math.Abs(v.x), System.Math.Abs(v.y), System.Math.Abs(v.z));
        
        /// <summary>
        /// Returns a float from the application of Abs (System.Math.Abs(v)).
        /// </summary>
        public static Vector3i Abs(int v) => Vector3i(System.Math.Abs(v));
        
        /// <summary>
        /// Returns a float3 from component-wise application of HermiteInterpolationOrder3 ((3 - 2 * v) * v * v).
        /// </summary>
        public static Vector3i HermiteInterpolationOrder3(Vector3i v) => Vector3i((3 - 2 * v.x) * v.x * v.x, (3 - 2 * v.y) * v.y * v.y, (3 - 2 * v.z) * v.z * v.z);
        
        /// <summary>
        /// Returns a float from the application of HermiteInterpolationOrder3 ((3 - 2 * v) * v * v).
        /// </summary>
        public static Vector3i HermiteInterpolationOrder3(int v) => Vector3i((3 - 2 * v) * v * v);
        
        /// <summary>
        /// Returns a float3 from component-wise application of HermiteInterpolationOrder5 (((6 * v - 15) * v + 10) * v * v * v).
        /// </summary>
        public static Vector3i HermiteInterpolationOrder5(Vector3i v) => Vector3i(((6 * v.x - 15) * v.x + 10) * v.x * v.x * v.x, ((6 * v.y - 15) * v.y + 10) * v.y * v.y * v.y, ((6 * v.z - 15) * v.z + 10) * v.z * v.z * v.z);
        
        /// <summary>
        /// Returns a float from the application of HermiteInterpolationOrder5 (((6 * v - 15) * v + 10) * v * v * v).
        /// </summary>
        public static Vector3i HermiteInterpolationOrder5(int v) => Vector3i(((6 * v - 15) * v + 10) * v * v * v);
        
        /// <summary>
        /// Returns a float3 from component-wise application of Sqr (v * v).
        /// </summary>
        public static Vector3i Sqr(Vector3i v) => Vector3i(v.x * v.x, v.y * v.y, v.z * v.z);
        
        /// <summary>
        /// Returns a float from the application of Sqr (v * v).
        /// </summary>
        public static Vector3i Sqr(int v) => Vector3i(v * v);
        
        /// <summary>
        /// Returns a float3 from component-wise application of Pow2 (v * v).
        /// </summary>
        public static Vector3i Pow2(Vector3i v) => Vector3i(v.x * v.x, v.y * v.y, v.z * v.z);
        
        /// <summary>
        /// Returns a float from the application of Pow2 (v * v).
        /// </summary>
        public static Vector3i Pow2(int v) => Vector3i(v * v);
        
        /// <summary>
        /// Returns a float3 from component-wise application of Pow3 (v * v * v).
        /// </summary>
        public static Vector3i Pow3(Vector3i v) => Vector3i(v.x * v.x * v.x, v.y * v.y * v.y, v.z * v.z * v.z);
        
        /// <summary>
        /// Returns a float from the application of Pow3 (v * v * v).
        /// </summary>
        public static Vector3i Pow3(int v) => Vector3i(v * v * v);
        
        /// <summary>
        /// Returns a float3 from component-wise application of Step (v &gt;= 0f ? 1f : 0f).
        /// </summary>
        public static Vector3i Step(Vector3i v) => Vector3i(v.x >= 0 ? 1 : 0, v.y >= 0 ? 1 : 0, v.z >= 0 ? 1 : 0);
        
        /*/// <summary>
        /// Returns a float from the application of Step (v &gt;= 0f ? 1f : 0f).
        /// </summary>
        public static Vector3i Step(float v) => Vector3i(v >= 0f ? 1f : 0f);
        
        /// <summary>
        /// Returns a float3 from component-wise application of Sqrt ((float)System.Math.Sqrt((double)v)).
        /// </summary>
        public static Vector3i Sqrt(Vector3i v) => Vector3i((float)System.Math.Sqrt((double)v.x), (float)System.Math.Sqrt((double)v.y), (float)System.Math.Sqrt((double)v.z));
        
        /// <summary>
        /// Returns a float from the application of Sqrt ((float)System.Math.Sqrt((double)v)).
        /// </summary>
        public static Vector3i Sqrt(float v) => Vector3i((float)System.Math.Sqrt((double)v));
        
        /// <summary>
        /// Returns a float3 from component-wise application of InverseSqrt ((float)(1.0 / System.Math.Sqrt((double)v))).
        /// </summary>
        public static Vector3i InverseSqrt(Vector3i v) => Vector3i((float)(1.0 / System.Math.Sqrt((double)v.x)), (float)(1.0 / System.Math.Sqrt((double)v.y)), (float)(1.0 / System.Math.Sqrt((double)v.z)));
        
        /// <summary>
        /// Returns a float from the application of InverseSqrt ((float)(1.0 / System.Math.Sqrt((double)v))).
        /// </summary>
        public static Vector3i InverseSqrt(float v) => Vector3i((float)(1.0 / System.Math.Sqrt((double)v)));*/
        
        /// <summary>
        /// Returns a int3 from component-wise application of Sign (System.Math.Sign(v)).
        /// </summary>
        /*public static int3 Sign(Vector3i v) => int3(int32(System.Math.Sign(v.x)), int32(System.Math.Sign(v.y)), int32(System.Math.Sign(v.z)));*/
        
        /// <summary>
        /// Returns a int from the application of Sign (System.Math.Sign(v)).
        /// </summary>
        /*public static int3 Sign(float v) => int3(System.Math.Sign(v));*/
        
        /// <summary>
        /// Returns a float3 from component-wise application of Max (System.Math.Max(lhs, rhs)).
        /// </summary>
        /*public static Vector3i Max(Vector3i lhs, Vector3i rhs) => Vector3i(System.Math.Max(lhs.x, rhs.x), System.Math.Max(lhs.y, rhs.y), System.Math.Max(lhs.z, rhs.z));
        
        /// <summary>
        /// Returns a float3 from component-wise application of Max (System.Math.Max(lhs, rhs)).
        /// </summary>
        public static Vector3i Max(Vector3i lhs, float rhs) => Vector3i(System.Math.Max(lhs.x, rhs), System.Math.Max(lhs.y, rhs), System.Math.Max(lhs.z, rhs));
        
        /// <summary>
        /// Returns a float3 from component-wise application of Max (System.Math.Max(lhs, rhs)).
        /// </summary>
        public static Vector3i Max(float lhs, Vector3i rhs) => Vector3i(System.Math.Max(lhs, rhs.x), System.Math.Max(lhs, rhs.y), System.Math.Max(lhs, rhs.z));
        
        /// <summary>
        /// Returns a float from the application of Max (System.Math.Max(lhs, rhs)).
        /// </summary>
        public static Vector3i Max(float lhs, float rhs) => Vector3i(System.Math.Max(lhs, rhs));
        
        /// <summary>
        /// Returns a float3 from component-wise application of Min (System.Math.Min(lhs, rhs)).
        /// </summary>
        public static Vector3i Min(Vector3i lhs, Vector3i rhs) => Vector3i(System.Math.Min(lhs.x, rhs.x), System.Math.Min(lhs.y, rhs.y), System.Math.Min(lhs.z, rhs.z));
        
        /// <summary>
        /// Returns a float3 from component-wise application of Min (System.Math.Min(lhs, rhs)).
        /// </summary>
        public static Vector3i Min(Vector3i lhs, float rhs) => Vector3i(System.Math.Min(lhs.x, rhs), System.Math.Min(lhs.y, rhs), System.Math.Min(lhs.z, rhs));
        
        /// <summary>
        /// Returns a float3 from component-wise application of Min (System.Math.Min(lhs, rhs)).
        /// </summary>
        public static Vector3i Min(float lhs, Vector3i rhs) => Vector3i(System.Math.Min(lhs, rhs.x), System.Math.Min(lhs, rhs.y), System.Math.Min(lhs, rhs.z));
        
        /// <summary>
        /// Returns a float from the application of Min (System.Math.Min(lhs, rhs)).
        /// </summary>
        public static Vector3i Min(float lhs, float rhs) => Vector3i(System.Math.Min(lhs, rhs));
        
        /// <summary>
        /// Returns a float3 from component-wise application of Pow ((float)System.Math.Pow((double)lhs, (double)rhs)).
        /// </summary>
        public static Vector3i Pow(Vector3i lhs, Vector3i rhs) => Vector3i((float)System.Math.Pow((double)lhs.x, (double)rhs.x), (float)System.Math.Pow((double)lhs.y, (double)rhs.y), (float)System.Math.Pow((double)lhs.z, (double)rhs.z));
        
        /// <summary>
        /// Returns a float3 from component-wise application of Pow ((float)System.Math.Pow((double)lhs, (double)rhs)).
        /// </summary>
        public static Vector3i Pow(Vector3i lhs, float rhs) => Vector3i((float)System.Math.Pow((double)lhs.x, (double)rhs), (float)System.Math.Pow((double)lhs.y, (double)rhs), (float)System.Math.Pow((double)lhs.z, (double)rhs));
        
        /// <summary>
        /// Returns a float3 from component-wise application of Pow ((float)System.Math.Pow((double)lhs, (double)rhs)).
        /// </summary>
        public static Vector3i Pow(float lhs, Vector3i rhs) => Vector3i((float)System.Math.Pow((double)lhs, (double)rhs.x), (float)System.Math.Pow((double)lhs, (double)rhs.y), (float)System.Math.Pow((double)lhs, (double)rhs.z));
        
        /// <summary>
        /// Returns a float from the application of Pow ((float)System.Math.Pow((double)lhs, (double)rhs)).
        /// </summary>
        public static Vector3i Pow(float lhs, float rhs) => Vector3i((float)System.Math.Pow((double)lhs, (double)rhs));
        
        /// <summary>
        /// Returns a float3 from component-wise application of Log ((float)System.Math.Log((double)lhs, (double)rhs)).
        /// </summary>
        public static Vector3i Log(Vector3i lhs, Vector3i rhs) => Vector3i((float)System.Math.Log((double)lhs.x, (double)rhs.x), (float)System.Math.Log((double)lhs.y, (double)rhs.y), (float)System.Math.Log((double)lhs.z, (double)rhs.z));
        
        /// <summary>
        /// Returns a float3 from component-wise application of Log ((float)System.Math.Log((double)lhs, (double)rhs)).
        /// </summary>
        public static Vector3i Log(Vector3i lhs, float rhs) => Vector3i((float)System.Math.Log((double)lhs.x, (double)rhs), (float)System.Math.Log((double)lhs.y, (double)rhs), (float)System.Math.Log((double)lhs.z, (double)rhs));
        
        /// <summary>
        /// Returns a float3 from component-wise application of Log ((float)System.Math.Log((double)lhs, (double)rhs)).
        /// </summary>
        public static Vector3i Log(float lhs, Vector3i rhs) => Vector3i((float)System.Math.Log((double)lhs, (double)rhs.x), (float)System.Math.Log((double)lhs, (double)rhs.y), (float)System.Math.Log((double)lhs, (double)rhs.z));
        
        /// <summary>
        /// Returns a float from the application of Log ((float)System.Math.Log((double)lhs, (double)rhs)).
        /// </summary>
        public static Vector3i Log(float lhs, float rhs) => Vector3i((float)System.Math.Log((double)lhs, (double)rhs));*/
        
        /// <summary>
        /// Returns a float3 from component-wise application of Clamp (System.Math.Min(System.Math.Max(v, min), max)).
        /// </summary>
        public static Vector3i Clamp(Vector3i v, Vector3i min, Vector3i max) => Vector3i(System.Math.Min(System.Math.Max(v.x, min.x), max.x), System.Math.Min(System.Math.Max(v.y, min.y), max.y), System.Math.Min(System.Math.Max(v.z, min.z), max.z));
        
        /*/// <summary>
        /// Returns a float3 from component-wise application of Clamp (System.Math.Min(System.Math.Max(v, min), max)).
        /// </summary>
        public static Vector3i Clamp(Vector3i v, Vector3i min, float max) => Vector3i(System.Math.Min(System.Math.Max(v.x, min.x), max), System.Math.Min(System.Math.Max(v.y, min.y), max), System.Math.Min(System.Math.Max(v.z, min.z), max));
        
        /// <summary>
        /// Returns a float3 from component-wise application of Clamp (System.Math.Min(System.Math.Max(v, min), max)).
        /// </summary>
        public static Vector3i Clamp(Vector3i v, float min, Vector3i max) => Vector3i(System.Math.Min(System.Math.Max(v.x, min), max.x), System.Math.Min(System.Math.Max(v.y, min), max.y), System.Math.Min(System.Math.Max(v.z, min), max.z));
        
        /// <summary>
        /// Returns a float3 from component-wise application of Clamp (System.Math.Min(System.Math.Max(v, min), max)).
        /// </summary>
        public static Vector3i Clamp(Vector3i v, float min, float max) => Vector3i(System.Math.Min(System.Math.Max(v.x, min), max), System.Math.Min(System.Math.Max(v.y, min), max), System.Math.Min(System.Math.Max(v.z, min), max));
        
        /// <summary>
        /// Returns a float3 from component-wise application of Clamp (System.Math.Min(System.Math.Max(v, min), max)).
        /// </summary>
        public static Vector3i Clamp(float v, Vector3i min, Vector3i max) => Vector3i(System.Math.Min(System.Math.Max(v, min.x), max.x), System.Math.Min(System.Math.Max(v, min.y), max.y), System.Math.Min(System.Math.Max(v, min.z), max.z));
        
        /// <summary>
        /// Returns a float3 from component-wise application of Clamp (System.Math.Min(System.Math.Max(v, min), max)).
        /// </summary>
        public static Vector3i Clamp(float v, Vector3i min, float max) => Vector3i(System.Math.Min(System.Math.Max(v, min.x), max), System.Math.Min(System.Math.Max(v, min.y), max), System.Math.Min(System.Math.Max(v, min.z), max));
        
        /// <summary>
        /// Returns a float3 from component-wise application of Clamp (System.Math.Min(System.Math.Max(v, min), max)).
        /// </summary>
        public static Vector3i Clamp(float v, float min, Vector3i max) => Vector3i(System.Math.Min(System.Math.Max(v, min), max.x), System.Math.Min(System.Math.Max(v, min), max.y), System.Math.Min(System.Math.Max(v, min), max.z));
        
        /// <summary>
        /// Returns a float from the application of Clamp (System.Math.Min(System.Math.Max(v, min), max)).
        /// </summary>
        public static Vector3i Clamp(float v, float min, float max) => Vector3i(System.Math.Min(System.Math.Max(v, min), max));*/
        
        /// <summary>
        /// Returns a float3 from component-wise application of Mix (min * (1-a) + max * a).
        /// </summary>
        public static Vector3i Mix(Vector3i min, Vector3i max, Vector3i a) => Vector3i(min.x * (1-a.x) + max.x * a.x, min.y * (1-a.y) + max.y * a.y, min.z * (1-a.z) + max.z * a.z);
        
        /*/// <summary>
        /// Returns a float3 from component-wise application of Mix (min * (1-a) + max * a).
        /// </summary>
        public static Vector3i Mix(Vector3i min, Vector3i max, float a) => Vector3i(min.x * (1-a) + max.x * a, min.y * (1-a) + max.y * a, min.z * (1-a) + max.z * a);
        
        /// <summary>
        /// Returns a float3 from component-wise application of Mix (min * (1-a) + max * a).
        /// </summary>
        public static Vector3i Mix(Vector3i min, float max, Vector3i a) => Vector3i(min.x * (1-a.x) + max * a.x, min.y * (1-a.y) + max * a.y, min.z * (1-a.z) + max * a.z);
        
        /// <summary>
        /// Returns a float3 from component-wise application of Mix (min * (1-a) + max * a).
        /// </summary>
        public static Vector3i Mix(Vector3i min, float max, float a) => Vector3i(min.x * (1-a) + max * a, min.y * (1-a) + max * a, min.z * (1-a) + max * a);
        
        /// <summary>
        /// Returns a float3 from component-wise application of Mix (min * (1-a) + max * a).
        /// </summary>
        public static Vector3i Mix(float min, Vector3i max, Vector3i a) => Vector3i(min * (1-a.x) + max.x * a.x, min * (1-a.y) + max.y * a.y, min * (1-a.z) + max.z * a.z);
        
        /// <summary>
        /// Returns a float3 from component-wise application of Mix (min * (1-a) + max * a).
        /// </summary>
        public static Vector3i Mix(float min, Vector3i max, float a) => Vector3i(min * (1-a) + max.x * a, min * (1-a) + max.y * a, min * (1-a) + max.z * a);
        
        /// <summary>
        /// Returns a float3 from component-wise application of Mix (min * (1-a) + max * a).
        /// </summary>
        public static Vector3i Mix(float min, float max, Vector3i a) => Vector3i(min * (1-a.x) + max * a.x, min * (1-a.y) + max * a.y, min * (1-a.z) + max * a.z);
        
        /// <summary>
        /// Returns a float from the application of Mix (min * (1-a) + max * a).
        /// </summary>
        public static Vector3i Mix(float min, float max, float a) => Vector3i(min * (1-a) + max * a);*/
        
        /*/// <summary>
        /// Returns a float3 from component-wise application of Lerp (min * (1-a) + max * a).
        /// </summary>
        public static Vector3i Lerp(Vector3i min, Vector3i max, Vector3i a) => Vector3i(min.x * (1-a.x) + max.x * a.x, min.y * (1-a.y) + max.y * a.y, min.z * (1-a.z) + max.z * a.z);
        
        /// <summary>
        /// Returns a float3 from component-wise application of Lerp (min * (1-a) + max * a).
        /// </summary>
        public static Vector3i Lerp(Vector3i min, Vector3i max, float a) => Vector3i(min.x * (1-a) + max.x * a, min.y * (1-a) + max.y * a, min.z * (1-a) + max.z * a);
        
        /// <summary>
        /// Returns a float3 from component-wise application of Lerp (min * (1-a) + max * a).
        /// </summary>
        public static Vector3i Lerp(Vector3i min, float max, Vector3i a) => Vector3i(min.x * (1-a.x) + max * a.x, min.y * (1-a.y) + max * a.y, min.z * (1-a.z) + max * a.z);
        
        /// <summary>
        /// Returns a float3 from component-wise application of Lerp (min * (1-a) + max * a).
        /// </summary>
        public static Vector3i Lerp(Vector3i min, float max, float a) => Vector3i(min.x * (1-a) + max * a, min.y * (1-a) + max * a, min.z * (1-a) + max * a);
        
        /// <summary>
        /// Returns a float3 from component-wise application of Lerp (min * (1-a) + max * a).
        /// </summary>
        public static Vector3i Lerp(float min, Vector3i max, Vector3i a) => Vector3i(min * (1-a.x) + max.x * a.x, min * (1-a.y) + max.y * a.y, min * (1-a.z) + max.z * a.z);
        
        /// <summary>
        /// Returns a float3 from component-wise application of Lerp (min * (1-a) + max * a).
        /// </summary>
        public static Vector3i Lerp(float min, Vector3i max, float a) => Vector3i(min * (1-a) + max.x * a, min * (1-a) + max.y * a, min * (1-a) + max.z * a);
        
        /// <summary>
        /// Returns a float3 from component-wise application of Lerp (min * (1-a) + max * a).
        /// </summary>
        public static Vector3i Lerp(float min, float max, Vector3i a) => Vector3i(min * (1-a.x) + max * a.x, min * (1-a.y) + max * a.y, min * (1-a.z) + max * a.z);
        
        /// <summary>
        /// Returns a float from the application of Lerp (min * (1-a) + max * a).
        /// </summary>
        public static Vector3i Lerp(float min, float max, float a) => Vector3i(min * (1-a) + max * a);*/
        
        /// <summary>
        /// Returns a float3 from component-wise application of Fma (a * b + c).
        /// </summary>
        public static Vector3i Fma(Vector3i a, Vector3i b, Vector3i c) => Vector3i(a.x * b.x + c.x, a.y * b.y + c.y, a.z * b.z + c.z);
        
        /*/// <summary>
        /// Returns a float3 from component-wise application of Fma (a * b + c).
        /// </summary>
        public static Vector3i Fma(Vector3i a, Vector3i b, float c) => Vector3i(a.x * b.x + c, a.y * b.y + c, a.z * b.z + c);
        
        /// <summary>
        /// Returns a float3 from component-wise application of Fma (a * b + c).
        /// </summary>
        public static Vector3i Fma(Vector3i a, float b, Vector3i c) => Vector3i(a.x * b + c.x, a.y * b + c.y, a.z * b + c.z);
        
        /// <summary>
        /// Returns a float3 from component-wise application of Fma (a * b + c).
        /// </summary>
        public static Vector3i Fma(Vector3i a, float b, float c) => Vector3i(a.x * b + c, a.y * b + c, a.z * b + c);
        
        /// <summary>
        /// Returns a float3 from component-wise application of Fma (a * b + c).
        /// </summary>
        public static Vector3i Fma(float a, Vector3i b, Vector3i c) => Vector3i(a * b.x + c.x, a * b.y + c.y, a * b.z + c.z);
        
        /// <summary>
        /// Returns a float3 from component-wise application of Fma (a * b + c).
        /// </summary>
        public static Vector3i Fma(float a, Vector3i b, float c) => Vector3i(a * b.x + c, a * b.y + c, a * b.z + c);
        
        /// <summary>
        /// Returns a float3 from component-wise application of Fma (a * b + c).
        /// </summary>
        public static Vector3i Fma(float a, float b, Vector3i c) => Vector3i(a * b + c.x, a * b + c.y, a * b + c.z);
        
        /// <summary>
        /// Returns a float from the application of Fma (a * b + c).
        /// </summary>
        public static Vector3i Fma(float a, float b, float c) => Vector3i(a * b + c);*/
        
        /// <summary>
        /// Returns a float3 from component-wise application of Add (lhs + rhs).
        /// </summary>
        public static Vector3i Add(Vector3i lhs, Vector3i rhs) => Vector3i(lhs.x + rhs.x, lhs.y + rhs.y, lhs.z + rhs.z);
        
        /// <summary>
        /// Returns a float3 from component-wise application of Add (lhs + rhs).
        /// </summary>
        /*public static Vector3i Add(Vector3i lhs, float rhs) => Vector3i(lhs.x + rhs, lhs.y + rhs, lhs.z + rhs);*/
        
        /// <summary>
        /// Returns a float3 from component-wise application of Add (lhs + rhs).
        /// </summary>
        /*public static Vector3i Add(float lhs, Vector3i rhs) => Vector3i(lhs + rhs.x, lhs + rhs.y, lhs + rhs.z);*/
        
        /// <summary>
        /// Returns a float from the application of Add (lhs + rhs).
        /// </summary>
        /*public static Vector3i Add(float lhs, float rhs) => Vector3i(lhs + rhs);*/
        
        /// <summary>
        /// Returns a float3 from component-wise application of Sub (lhs - rhs).
        /// </summary>
        public static Vector3i Sub(Vector3i lhs, Vector3i rhs) => Vector3i(lhs.x - rhs.x, lhs.y - rhs.y, lhs.z - rhs.z);
        
        /// <summary>
        /// Returns a float3 from component-wise application of Sub (lhs - rhs).
        /// </summary>
        /*public static Vector3i Sub(Vector3i lhs, float rhs) => Vector3i(lhs.x - rhs, lhs.y - rhs, lhs.z - rhs);*/
        
        /// <summary>
        /// Returns a float3 from component-wise application of Sub (lhs - rhs).
        /// </summary>
        /*public static Vector3i Sub(float lhs, Vector3i rhs) => Vector3i(lhs - rhs.x, lhs - rhs.y, lhs - rhs.z);*/
        
        /// <summary>
        /// Returns a float from the application of Sub (lhs - rhs).
        /// </summary>
        /*public static Vector3i Sub(float lhs, float rhs) => Vector3i(lhs - rhs);*/
        
        /// <summary>
        /// Returns a float3 from component-wise application of Mul (lhs * rhs).
        /// </summary>
        public static Vector3i Mul(Vector3i lhs, Vector3i rhs) => Vector3i(lhs.x * rhs.x, lhs.y * rhs.y, lhs.z * rhs.z);
        
        /// <summary>
        /// Returns a float3 from component-wise application of Mul (lhs * rhs).
        /// </summary>
        /*public static Vector3i Mul(Vector3i lhs, float rhs) => Vector3i(lhs.x * rhs, lhs.y * rhs, lhs.z * rhs);*/
        
        /// <summary>
        /// Returns a float3 from component-wise application of Mul (lhs * rhs).
        /// </summary>
        /*public static Vector3i Mul(float lhs, Vector3i rhs) => Vector3i(lhs * rhs.x, lhs * rhs.y, lhs * rhs.z);*/
        
        /// <summary>
        /// Returns a float from the application of Mul (lhs * rhs).
        /// </summary>
        /*public static Vector3i Mul(float lhs, float rhs) => Vector3i(lhs * rhs);*/
        
        /// <summary>
        /// Returns a float3 from component-wise application of Div (lhs / rhs).
        /// </summary>
        public static Vector3i Div(Vector3i lhs, Vector3i rhs) => Vector3i(lhs.x / rhs.x, lhs.y / rhs.y, lhs.z / rhs.z);
        
        /// <summary>
        /// Returns a float3 from component-wise application of Div (lhs / rhs).
        /// </summary>
        /*public static Vector3i Div(Vector3i lhs, float rhs) => Vector3i(lhs.x / rhs, lhs.y / rhs, lhs.z / rhs);*/
        
        /// <summary>
        /// Returns a float3 from component-wise application of Div (lhs / rhs).
        /// </summary>
        /*public static Vector3i Div(float lhs, Vector3i rhs) => Vector3i(lhs / rhs.x, lhs / rhs.y, lhs / rhs.z);*/
        
        /// <summary>
        /// Returns a float from the application of Div (lhs / rhs).
        /// </summary>
        /*public static Vector3i Div(float lhs, float rhs) => Vector3i(lhs / rhs);*/
        
        /// <summary>
        /// Returns a float3 from component-wise application of Modulo (lhs % rhs).
        /// </summary>
        public static Vector3i Modulo(Vector3i lhs, Vector3i rhs) => Vector3i(lhs.x % rhs.x, lhs.y % rhs.y, lhs.z % rhs.z);
        
        /// <summary>
        /// Returns a float3 from component-wise application of Modulo (lhs % rhs).
        /// </summary>
        /*public static Vector3i Modulo(Vector3i lhs, float rhs) => Vector3i(lhs.x % rhs, lhs.y % rhs, lhs.z % rhs);*/
        
        /// <summary>
        /// Returns a float3 from component-wise application of Modulo (lhs % rhs).
        /// </summary>
        /*public static Vector3i Modulo(float lhs, Vector3i rhs) => Vector3i(lhs % rhs.x, lhs % rhs.y, lhs % rhs.z);*/
        
        /// <summary>
        /// Returns a float from the application of Modulo (lhs % rhs).
        /// </summary>
        /*public static Vector3i Modulo(float lhs, float rhs) => Vector3i(lhs % rhs);*/
        
        /// <summary>
        /// Returns a float3 from component-wise application of Degrees (Radians-To-Degrees Conversion).
        /// </summary>
        /*public static Vector3i Degrees(Vector3i v) => Vector3i((float)(v.x * 57.295779513082320876798154814105170332405472466564321f), (float)(v.y * 57.295779513082320876798154814105170332405472466564321f), (float)(v.z * 57.295779513082320876798154814105170332405472466564321f));*/
        
        /// <summary>
        /// Returns a float from the application of Degrees (Radians-To-Degrees Conversion).
        /// </summary>
        /*public static Vector3i Degrees(float v) => Vector3i((float)(v * 57.295779513082320876798154814105170332405472466564321f));*/
        
        /// <summary>
        /// Returns a float3 from component-wise application of Radians (Degrees-To-Radians Conversion).
        /// </summary>
        /*public static Vector3i Radians(Vector3i v) => Vector3i((float)(v.x * 0.0174532925199432957692369076848861271344287188854172f), (float)(v.y * 0.0174532925199432957692369076848861271344287188854172f), (float)(v.z * 0.0174532925199432957692369076848861271344287188854172f));*/
        
        /// <summary>
        /// Returns a float from the application of Radians (Degrees-To-Radians Conversion).
        /// </summary>
        /*public static Vector3i Radians(float v) => Vector3i((float)(v * 0.0174532925199432957692369076848861271344287188854172f));*/
        
        /// <summary>
        /// Returns a float3 from component-wise application of Acos (System.Math.Acos(v)).
        /// </summary>
        /*public static Vector3i Acos(Vector3i v) => Vector3i(System.Math.Acos(v.x), System.Math.Acos(v.y), System.Math.Acos(v.z));*/
        
        /// <summary>
        /// Returns a float from the application of Acos (System.Math.Acos(v)).
        /// </summary>
        /*public static Vector3i Acos(float v) => Vector3i(System.Math.Acos(v));*/
        
        /// <summary>
        /// Returns a float3 from component-wise application of Asin (System.Math.Asin(v)).
        /// </summary>
        /*public static Vector3i Asin(Vector3i v) => Vector3i(System.Math.Asin(v.x), System.Math.Asin(v.y), System.Math.Asin(v.z));*/
        
        /// <summary>
        /// Returns a float from the application of Asin (System.Math.Asin(v)).
        /// </summary>
        /*public static Vector3i Asin(float v) => Vector3i(System.Math.Asin(v));*/
        
        /// <summary>
        /// Returns a float3 from component-wise application of Atan (System.Math.Atan(v)).
        /// </summary>
        /*public static Vector3i Atan(Vector3i v) => Vector3i(System.Math.Atan(v.x), System.Math.Atan(v.y), System.Math.Atan(v.z));*/
        
        /// <summary>
        /// Returns a float from the application of Atan (System.Math.Atan(v)).
        /// </summary>
        /*public static Vector3i Atan(float v) => Vector3i(System.Math.Atan(v));*/
        
        /// <summary>
        /// Returns a float3 from component-wise application of Cos (System.Math.Cos(v)).
        /// </summary>
        /*public static Vector3i Cos(Vector3i v) => Vector3i(System.Math.Cos(v.x), System.Math.Cos(v.y), System.Math.Cos(v.z));*/
        
        /// <summary>
        /// Returns a float from the application of Cos (System.Math.Cos(v)).
        /// </summary>
        /*public static Vector3i Cos(float v) => Vector3i(System.Math.Cos(v));*/
        
        /// <summary>
        /// Returns a float3 from component-wise application of Cosh (System.Math.Cosh(v)).
        /// </summary>
        /*public static Vector3i Cosh(Vector3i v) => Vector3i(System.Math.Cosh(v.x), System.Math.Cosh(v.y), System.Math.Cosh(v.z));*/
        
        /// <summary>
        /// Returns a float from the application of Cosh (System.Math.Cosh(v)).
        /// </summary>
        /*/*public static Vector3i Cosh(float v) => Vector3i(System.Math.Cosh(v));*/*/
        
        /// <summary>
        /// Returns a float3 from component-wise application of Exp (System.Math.Exp(v)).
        /// </summary>
        /*public static Vector3i Exp(Vector3i v) => Vector3i(System.Math.Exp(v.x), System.Math.Exp(v.y), System.Math.Exp(v.z));*/
        
        /// <summary>
        /// Returns a float from the application of Exp (System.Math.Exp(v)).
        /// </summary>
        /*public static Vector3i Exp(float v) => Vector3i(System.Math.Exp(v));*/
        
        /// <summary>
        /// Returns a float3 from component-wise application of Log (System.Math.Log(v)).
        /// </summary>
        /*public static Vector3i Log(Vector3i v) => Vector3i(System.Math.Log(v.x), System.Math.Log(v.y), System.Math.Log(v.z));*/
        
        /// <summary>
        /// Returns a float from the application of Log (System.Math.Log(v)).
        /// </summary>
        /*public static Vector3i Log(float v) => Vector3i(System.Math.Log(v));*/
        
        /// <summary>
        /// Returns a float3 from component-wise application of Log2 (System.Math.Log(v, 2)).
        /// </summary>
        /*public static Vector3i Log2(Vector3i v) => Vector3i(System.Math.Log(v.x, 2), System.Math.Log(v.y, 2), System.Math.Log(v.z, 2));*/
        
        /// <summary>
        /// Returns a float from the application of Log2 (System.Math.Log(v, 2)).
        /// </summary>
        /*public static Vector3i Log2(float v) => Vector3i(System.Math.Log(v, 2));*/
        
        /// <summary>
        /// Returns a float3 from component-wise application of Log10 (System.Math.Log10(v)).
        /// </summary>
        /*public static Vector3i Log10(Vector3i v) => Vector3i(System.Math.Log10(v.x), System.Math.Log10(v.y), System.Math.Log10(v.z));*/
        
        /// <summary>
        /// Returns a float from the application of Log10 (System.Math.Log10(v)).
        /// </summary>
        /*public static Vector3i Log10(float v) => Vector3i(System.Math.Log10(v));*/
        
        /// <summary>
        /// Returns a float3 from component-wise application of Floor (System.Math.Floor(v)).
        /// </summary>
        /*public static Vector3i Floor(Vector3i v) => Vector3i(System.Math.Floor(v.x), System.Math.Floor(v.y), System.Math.Floor(v.z));*/
        
        /// <summary>
        /// Returns a float from the application of Floor (System.Math.Floor(v)).
        /// </summary>
        /*public static Vector3i Floor(float v) => Vector3i(System.Math.Floor(v));*/
        
        /// <summary>
        /// Returns a float3 from component-wise application of Ceiling (System.Math.Ceiling(v)).
        /// </summary>
        /*public static Vector3i Ceiling(Vector3i v) => Vector3i(System.Math.Ceiling(v.x), System.Math.Ceiling(v.y), System.Math.Ceiling(v.z));*/
        
        /// <summary>
        /// Returns a float from the application of Ceiling (System.Math.Ceiling(v)).
        /// </summary>
        /*public static Vector3i Ceiling(float v) => Vector3i(System.Math.Ceiling(v));*/
        
        /// <summary>
        /// Returns a float3 from component-wise application of Round (System.Math.Round(v)).
        /// </summary>
        /*public static Vector3i Round(Vector3i v) => Vector3i(System.Math.Round(v.x), System.Math.Round(v.y), System.Math.Round(v.z));*/
        
        /// <summary>
        /// Returns a float from the application of Round (System.Math.Round(v)).
        /// </summary>
        /*public static Vector3i Round(float v) => Vector3i(System.Math.Round(v));*/
        
        /// <summary>
        /// Returns a float3 from component-wise application of Sin (System.Math.Sin(v)).
        /// </summary>
        /*public static Vector3i Sin(Vector3i v) => Vector3i(System.Math.Sin(v.x), System.Math.Sin(v.y), System.Math.Sin(v.z));*/
        
        /// <summary>
        /// Returns a float from the application of Sin (System.Math.Sin(v)).
        /// </summary>
        /*public static Vector3i Sin(float v) => Vector3i(System.Math.Sin(v));*/
        
        /// <summary>
        /// Returns a float3 from component-wise application of Sinh (System.Math.Sinh(v)).
        /// </summary>
        /*public static Vector3i Sinh(Vector3i v) => Vector3i(System.Math.Sinh(v.x), System.Math.Sinh(v.y), System.Math.Sinh(v.z));*/
        
        /// <summary>
        /// Returns a float from the application of Sinh (System.Math.Sinh(v)).
        /// </summary>
        /*public static Vector3i Sinh(float v) => Vector3i(System.Math.Sinh(v));*/
        
        /// <summary>
        /// Returns a float3 from component-wise application of Tan (System.Math.Tan(v)).
        /// </summary>
        /*public static Vector3i Tan(Vector3i v) => Vector3i(System.Math.Tan(v.x), System.Math.Tan(v.y), System.Math.Tan(v.z));*/
        
        /// <summary>
        /// Returns a float from the application of Tan (System.Math.Tan(v)).
        /// </summary>
        /*public static Vector3i Tan(float v) => Vector3i(System.Math.Tan(v));*/
        
        /// <summary>
        /// Returns a float3 from component-wise application of Tanh (System.Math.Tanh(v)).
        /// </summary>
        /*public static Vector3i Tanh(Vector3i v) => Vector3i(System.Math.Tanh(v.x), System.Math.Tanh(v.y), System.Math.Tanh(v.z));*/
        
        /// <summary>
        /// Returns a float from the application of Tanh (System.Math.Tanh(v)).
        /// </summary>
        /*public static Vector3i Tanh(float v) => Vector3i(System.Math.Tanh(v));*/
        
        /// <summary>
        /// Returns a float3 from component-wise application of Truncate (System.Math.Truncate(v)).
        /// </summary>
        /*public static Vector3i Truncate(Vector3i v) => Vector3i(System.Math.Truncate(v.x), System.Math.Truncate(v.y), System.Math.Truncate(v.z));*/
        
        /// <summary>
        /// Returns a float from the application of Truncate (System.Math.Truncate(v)).
        /// </summary>
        /*public static Vector3i Truncate(float v) => Vector3i(System.Math.Truncate(v));*/
        
        /// <summary>
        /// Returns a float3 from component-wise application of Fract ((v - System.Math.Floor(v))).
        /// </summary>
        /*public static Vector3i Fract(Vector3i v) => Vector3i((v.x - System.Math.Floor(v.x)), (v.y - System.Math.Floor(v.y)), (v.z - System.Math.Floor(v.z)));*/
        
        /// <summary>
        /// Returns a float from the application of Fract ((v - System.Math.Floor(v))).
        /// </summary>
        /*public static Vector3i Fract(float v) => Vector3i((v - System.Math.Floor(v)));*/
        
        /// <summary>
        /// Returns a float3 from component-wise application of TruncateFast ((int64)(v)).
        /// </summary>
        public static Vector3i TruncateFast(Vector3i v) => Vector3i((int64)(v.x), (int64)(v.y), (int64)(v.z));
        
        /// <summary>
        /// Returns a float from the application of TruncateFast ((int64)(v)).
        /// </summary>
        public static Vector3i TruncateFast(float v) => Vector3i((int64)(v));
        
        /// <summary>
        /// Returns a float3 with independent and identically distributed uniform values between 'minValue' and 'maxValue'.
        /// </summary>
        /*public static Vector3i Random(Random random, Vector3i minValue, Vector3i maxValue) => Vector3i((float)random.NextDouble() * (maxValue.x - minValue.x) + minValue.x, (float)random.NextDouble() * (maxValue.y - minValue.y) + minValue.y, (float)random.NextDouble() * (maxValue.z - minValue.z) + minValue.z);*/
        
        /// <summary>
        /// Returns a float3 with independent and identically distributed uniform values between 'minValue' and 'maxValue'.
        /// </summary>
        /*public static Vector3i Random(Random random, Vector3i minValue, float maxValue) => Vector3i((float)random.NextDouble() * (maxValue - minValue.x) + minValue.x, (float)random.NextDouble() * (maxValue - minValue.y) + minValue.y, (float)random.NextDouble() * (maxValue - minValue.z) + minValue.z);*/
        
        /// <summary>
        /// Returns a float3 with independent and identically distributed uniform values between 'minValue' and 'maxValue'.
        /// </summary>
        /*public static Vector3i Random(Random random, float minValue, Vector3i maxValue) => Vector3i((float)random.NextDouble() * (maxValue.x - minValue) + minValue, (float)random.NextDouble() * (maxValue.y - minValue) + minValue, (float)random.NextDouble() * (maxValue.z - minValue) + minValue);*/
        
        /// <summary>
        /// Returns a float3 with independent and identically distributed uniform values between 'minValue' and 'maxValue'.
        /// </summary>
        /*public static Vector3i Random(Random random, float minValue, float maxValue) => Vector3i((float)random.NextDouble() * (maxValue - minValue) + minValue);*/
        
        /// <summary>
        /// Returns a float3 with independent and identically distributed uniform values between 'minValue' and 'maxValue'.
        /// </summary>
        /*public static Vector3i RandomUniform(Random random, Vector3i minValue, Vector3i maxValue) => Vector3i((float)random.NextDouble() * (maxValue.x - minValue.x) + minValue.x, (float)random.NextDouble() * (maxValue.y - minValue.y) + minValue.y, (float)random.NextDouble() * (maxValue.z - minValue.z) + minValue.z);*/
        
        /// <summary>
        /// Returns a float3 with independent and identically distributed uniform values between 'minValue' and 'maxValue'.
        /// </summary>
        /*public static Vector3i RandomUniform(Random random, Vector3i minValue, float maxValue) => Vector3i((float)random.NextDouble() * (maxValue - minValue.x) + minValue.x, (float)random.NextDouble() * (maxValue - minValue.y) + minValue.y, (float)random.NextDouble() * (maxValue - minValue.z) + minValue.z);*/
        
        /// <summary>
        /// Returns a float3 with independent and identically distributed uniform values between 'minValue' and 'maxValue'.
        /// </summary>
        /*public static Vector3i RandomUniform(Random random, float minValue, Vector3i maxValue) => Vector3i((float)random.NextDouble() * (maxValue.x - minValue) + minValue, (float)random.NextDouble() * (maxValue.y - minValue) + minValue, (float)random.NextDouble() * (maxValue.z - minValue) + minValue);*/
        
        /// <summary>
        /// Returns a float3 with independent and identically distributed uniform values between 'minValue' and 'maxValue'.
        /// </summary>
        /*public static Vector3i RandomUniform(Random random, float minValue, float maxValue) => Vector3i((float)random.NextDouble() * (maxValue - minValue) + minValue);*/
        
        /// <summary>
        /// Returns a float3 with independent and identically distributed values according to a normal/Gaussian distribution with specified mean and variance.
        /// </summary>
        /*public static Vector3i RandomNormal(Random random, Vector3i mean, Vector3i variance) => Vector3i((float)(System.Math.Sqrt((double)variance.x) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean.x, (float)(System.Math.Sqrt((double)variance.y) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean.y, (float)(System.Math.Sqrt((double)variance.z) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean.z);*/
        
        /// <summary>
        /// Returns a float3 with independent and identically distributed values according to a normal/Gaussian distribution with specified mean and variance.
        /// </summary>
        /*public static Vector3i RandomNormal(Random random, Vector3i mean, float variance) => Vector3i((float)(System.Math.Sqrt((double)variance) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean.x, (float)(System.Math.Sqrt((double)variance) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean.y, (float)(System.Math.Sqrt((double)variance) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean.z);*/
        
        /// <summary>
        /// Returns a float3 with independent and identically distributed values according to a normal/Gaussian distribution with specified mean and variance.
        /// </summary>
        /*public static Vector3i RandomNormal(Random random, float mean, Vector3i variance) => Vector3i((float)(System.Math.Sqrt((double)variance.x) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean, (float)(System.Math.Sqrt((double)variance.y) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean, (float)(System.Math.Sqrt((double)variance.z) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean);*/
        
        /// <summary>
        /// Returns a float3 with independent and identically distributed values according to a normal/Gaussian distribution with specified mean and variance.
        /// </summary>
        /*public static Vector3i RandomNormal(Random random, float mean, float variance) => Vector3i((float)(System.Math.Sqrt((double)variance) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean);*/
        
        /// <summary>
        /// Returns a float3 with independent and identically distributed values according to a normal/Gaussian distribution with specified mean and variance.
        /// </summary>
        /*public static Vector3i RandomGaussian(Random random, Vector3i mean, Vector3i variance) => Vector3i((float)(System.Math.Sqrt((double)variance.x) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean.x, (float)(System.Math.Sqrt((double)variance.y) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean.y, (float)(System.Math.Sqrt((double)variance.z) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean.z);*/
        
        /// <summary>
        /// Returns a float3 with independent and identically distributed values according to a normal/Gaussian distribution with specified mean and variance.
        /// </summary>
        /*public static Vector3i RandomGaussian(Random random, Vector3i mean, float variance) => Vector3i((float)(System.Math.Sqrt((double)variance) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean.x, (float)(System.Math.Sqrt((double)variance) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean.y, (float)(System.Math.Sqrt((double)variance) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean.z);*/
        
        /// <summary>
        /// Returns a float3 with independent and identically distributed values according to a normal/Gaussian distribution with specified mean and variance.
        /// </summary>
        /*public static Vector3i RandomGaussian(Random random, float mean, Vector3i variance) => Vector3i((float)(System.Math.Sqrt((double)variance.x) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean, (float)(System.Math.Sqrt((double)variance.y) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean, (float)(System.Math.Sqrt((double)variance.z) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean);*/
        
        /// <summary>
        /// Returns a float3 with independent and identically distributed values according to a normal/Gaussian distribution with specified mean and variance.
        /// </summary>
        /*public static Vector3i RandomGaussian(Random random, float mean, float variance) => Vector3i((float)(System.Math.Sqrt((double)variance) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean);*/

        //#endregion


        //#region Component-Wise Operator Overloads
        
        /// <summary>
        /// Returns a bool3 from component-wise application of operator&lt; (lhs &lt; rhs).
        /// </summary>
        /*public static bool3 operator<(Vector3i lhs, Vector3i rhs) => bool3(lhs.x < rhs.x, lhs.y < rhs.y, lhs.z < rhs.z);
        
        /// <summary>
        /// Returns a bool3 from component-wise application of operator&lt; (lhs &lt; rhs).
        /// </summary>
        public static bool3 operator<(Vector3i lhs, float rhs) => bool3(lhs.x < rhs, lhs.y < rhs, lhs.z < rhs);
        
        /// <summary>
        /// Returns a bool3 from component-wise application of operator&lt; (lhs &lt; rhs).
        /// </summary>
        public static bool3 operator<(float lhs, Vector3i rhs) => bool3(lhs < rhs.x, lhs < rhs.y, lhs < rhs.z);
        
        /// <summary>
        /// Returns a bool3 from component-wise application of operator&lt;= (lhs &lt;= rhs).
        /// </summary>
        public static bool3 operator<=(Vector3i lhs, Vector3i rhs) => bool3(lhs.x <= rhs.x, lhs.y <= rhs.y, lhs.z <= rhs.z);
        
        /// <summary>
        /// Returns a bool3 from component-wise application of operator&lt;= (lhs &lt;= rhs).
        /// </summary>
        public static bool3 operator<=(Vector3i lhs, float rhs) => bool3(lhs.x <= rhs, lhs.y <= rhs, lhs.z <= rhs);
        
        /// <summary>
        /// Returns a bool3 from component-wise application of operator&lt;= (lhs &lt;= rhs).
        /// </summary>
        public static bool3 operator<=(float lhs, Vector3i rhs) => bool3(lhs <= rhs.x, lhs <= rhs.y, lhs <= rhs.z);
        
        /// <summary>
        /// Returns a bool3 from component-wise application of operator&gt; (lhs &gt; rhs).
        /// </summary>
        public static bool3 operator>(Vector3i lhs, Vector3i rhs) => bool3(lhs.x > rhs.x, lhs.y > rhs.y, lhs.z > rhs.z);
        
        /// <summary>
        /// Returns a bool3 from component-wise application of operator&gt; (lhs &gt; rhs).
        /// </summary>
        public static bool3 operator>(Vector3i lhs, float rhs) => bool3(lhs.x > rhs, lhs.y > rhs, lhs.z > rhs);
        
        /// <summary>
        /// Returns a bool3 from component-wise application of operator&gt; (lhs &gt; rhs).
        /// </summary>
        public static bool3 operator>(float lhs, Vector3i rhs) => bool3(lhs > rhs.x, lhs > rhs.y, lhs > rhs.z);
        
        /// <summary>
        /// Returns a bool3 from component-wise application of operator&gt;= (lhs &gt;= rhs).
        /// </summary>
        public static bool3 operator>=(Vector3i lhs, Vector3i rhs) => bool3(lhs.x >= rhs.x, lhs.y >= rhs.y, lhs.z >= rhs.z);
        
        /// <summary>
        /// Returns a bool3 from component-wise application of operator&gt;= (lhs &gt;= rhs).
        /// </summary>
        public static bool3 operator>=(Vector3i lhs, float rhs) => bool3(lhs.x >= rhs, lhs.y >= rhs, lhs.z >= rhs);
        
        /// <summary>
        /// Returns a bool3 from component-wise application of operator&gt;= (lhs &gt;= rhs).
        /// </summary>
        public static bool3 operator>=(float lhs, Vector3i rhs) => bool3(lhs >= rhs.x, lhs >= rhs.y, lhs >= rhs.z);*/
        
        /// <summary>
        /// Returns a float3 from component-wise application of operator+ (lhs + rhs).
        /// </summary>
        public static Vector3i operator+(Vector3i lhs, Vector3i rhs) => Vector3i(lhs.x + rhs.x, lhs.y + rhs.y, lhs.z + rhs.z);
        
        /// <summary>
        /// Returns a float3 from component-wise application of operator+ (lhs + rhs).
        /// </summary>
        public static Vector3i operator+(Vector3i lhs, int rhs) => Vector3i(lhs.x + rhs, lhs.y + rhs, lhs.z + rhs);
        
        /// <summary>
        /// Returns a float3 from component-wise application of operator+ (lhs + rhs).
        /// </summary>
        public static Vector3i operator+(int lhs, Vector3i rhs) => Vector3i(lhs + rhs.x, lhs + rhs.y, lhs + rhs.z);
        
        /// <summary>
        /// Returns a float3 from component-wise application of operator- (lhs - rhs).
        /// </summary>
        public static Vector3i operator-(Vector3i lhs, Vector3i rhs) => Vector3i(lhs.x - rhs.x, lhs.y - rhs.y, lhs.z - rhs.z);
        
        /// <summary>
        /// Returns a float3 from component-wise application of operator- (lhs - rhs).
        /// </summary>
        public static Vector3i operator-(Vector3i lhs, int rhs) => Vector3i(lhs.x - rhs, lhs.y - rhs, lhs.z - rhs);
        
        /// <summary>
        /// Returns a float3 from component-wise application of operator- (lhs - rhs).
        /// </summary>
        public static Vector3i operator-(int lhs, Vector3i rhs) => Vector3i(lhs - rhs.x, lhs - rhs.y, lhs - rhs.z);
        
        /// <summary>
        /// Returns a float3 from component-wise application of operator* (lhs * rhs).
        /// </summary>
        public static Vector3i operator*(Vector3i lhs, Vector3i rhs) => Vector3i(lhs.x * rhs.x, lhs.y * rhs.y, lhs.z * rhs.z);
        
        /// <summary>
        /// Returns a float3 from component-wise application of operator* (lhs * rhs).
        /// </summary>
        public static Vector3i operator*(Vector3i lhs, int rhs) => Vector3i(lhs.x * rhs, lhs.y * rhs, lhs.z * rhs);
        
        /// <summary>
        /// Returns a float3 from component-wise application of operator* (lhs * rhs).
        /// </summary>
        public static Vector3i operator*(int lhs, Vector3i rhs) => Vector3i(lhs * rhs.x, lhs * rhs.y, lhs * rhs.z);
        
        /// <summary>
        /// Returns a float3 from component-wise application of operator/ (lhs / rhs).
        /// </summary>
        public static Vector3i operator/(Vector3i lhs, Vector3i rhs) => Vector3i(lhs.x / rhs.x, lhs.y / rhs.y, lhs.z / rhs.z);
        
        /// <summary>
        /// Returns a float3 from component-wise application of operator/ (lhs / rhs).
        /// </summary>
        public static Vector3i operator/(Vector3i lhs, int rhs) => Vector3i(lhs.x / rhs, lhs.y / rhs, lhs.z / rhs);
        
        /// <summary>
        /// Returns a float3 from component-wise application of operator/ (lhs / rhs).
        /// </summary>
        public static Vector3i operator/(int lhs, Vector3i rhs) => Vector3i(lhs / rhs.x, lhs / rhs.y, lhs / rhs.z);
        
        /// <summary>
        /// Returns a float3 from component-wise application of operator- (-v).
        /// </summary>
        public static Vector3i operator-(Vector3i v) => Vector3i(-v.x, -v.y, -v.z);
        
        /// <summary>
        /// Returns a float3 from component-wise application of operator% (lhs % rhs).
        /// </summary>
        public static Vector3i operator%(Vector3i lhs, Vector3i rhs) => Vector3i(lhs.x % rhs.x, lhs.y % rhs.y, lhs.z % rhs.z);
        
        /// <summary>
        /// Returns a float3 from component-wise application of operator% (lhs % rhs).
        /// </summary>
        public static Vector3i operator%(Vector3i lhs, int rhs) => Vector3i(lhs.x % rhs, lhs.y % rhs, lhs.z % rhs);
        
        /// <summary>
        /// Returns a float3 from component-wise application of operator% (lhs % rhs).
        /// </summary>
        public static Vector3i operator%(int lhs, Vector3i rhs) => Vector3i(lhs % rhs.x, lhs % rhs.y, lhs % rhs.z);
		public static Vector3i operator >> (Vector3i lhs, int q) => Vector3i(lhs.x >> q, lhs.y >> q, lhs.z >> q);
        public static Vector3i operator >> (int q, Vector3i lhs) => Vector3i(lhs.x >> q, lhs.y >> q, lhs.z >> q);
		public static Vector3i operator & (Vector3i lhs, int q) => Vector3i(lhs.x & q, lhs.y & q, lhs.z & q);
		public static Vector3i operator & (int q, Vector3i lhs) => Vector3i(lhs.x & q, lhs.y & q, lhs.z & q);
		public static Vector3i operator >> (Vector3i lhs, Vector3i rhs) => Vector3i(lhs.x >> rhs.x, lhs.y >> rhs.y, lhs.z >> rhs.z);

        //#endregion

    }
}
