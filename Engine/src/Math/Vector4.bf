namespace Engine
{
	using System;
    
    /// <summary>
    /// A vector of type float with 4 components.
    /// </summary>
    [Union]
    public struct Vector4 : IHashable
    {

        //#region Fields
        
        /// <summary>
        /// component data
        /// </summary>
        public float[4] values;
        
        /// <summary>
        /// Returns an object that can be used for arbitrary swizzling (e.g. swizzle.zy)
        /// </summary>
        /*public readonly swizzle_float4 swizzle;*/

        //#endregion


        //#region Constructors
        
        /// <summary>
        /// Component-wise constructor
        /// </summary>
        public this()
        {
            values = .(0F, 0F, 0F, 0F);
        }
        
        /// <summary>
        /// Component-wise constructor
        /// </summary>
        public this(float x, float y, float z, float w)
        {
            values = .(x,y,z,w);
        }
        
        /// <summary>
        /// all-same-value constructor
        /// </summary>
        public this(float v)
        {
            values = .(v,v,v,v);
        }
        
        /// <summary>
        /// from-vector constructor (empty fields are zero/false)
        /// </summary>
        public this(Vector2 v)
        {
            values = .(v.x,v.y,0f,0f);
        }
        
        /// <summary>
        /// from-vector-and-value constructor (empty fields are zero/false)
        /// </summary>
        public this(Vector2 v, float z)
        {
            values = .(v.x,v.y,z,0f);
        }
        
        /// <summary>
        /// from-vector-and-value constructor
        /// </summary>
        public this(Vector2 v, float z, float w)
        {
            values = .(v.x,v.y,z,w);
        }
        
        /// <summary>
        /// from-vector constructor (empty fields are zero/false)
        /// </summary>
        public this(Vector3 v)
        {
            values = .(v.x,v.y,v.z,0f);
        }
        
        /// <summary>
        /// from-vector-and-value constructor
        /// </summary>
        public this(Vector3 v, float w)
        {
            values = .(v.x,v.y,v.z,w);
        }
        
        /// <summary>
        /// from-vector constructor
        /// </summary>
        public this(Vector4 v)
        {
            values = .(v.x,v.y,v.z,v.w);
        }
        
        /// <summary>
        /// From-array constructor (superfluous values are ignored, missing values are zero-filled).
        /// </summary>
        public this(float[] v)
        {
            let c = v.Count;
            values = .((c < 0) ? 0f : v[0],(c < 1) ? 0f : v[1],(c < 2) ? 0f : v[2],(c < 3) ? 0f : v[3]);
        }
        
        /// <summary>
        /// From-array constructor with base index (superfluous values are ignored, missing values are zero-filled).
        /// </summary>
        public this(float[] v, int startIndex)
        {
            let c = v.Count;
            values = .((c + startIndex < 0) ? 0f : v[0 + startIndex],(c + startIndex < 1) ? 0f : v[1 + startIndex],(c + startIndex < 2) ? 0f : v[2 + startIndex],(c + startIndex < 3) ? 0f : v[3 + startIndex]);
        }

        //#endregion


        //#region Implicit Operators
        
        /// <summary>
        /// Implicitly converts this to a double4.
        /// </summary>
        /*public static implicit operator double4(float4 v) =>  double4((double)v.x, (double)v.y, (double)v.z, (double)v.w);*/

        //#endregion


        //#region Explicit Operators
        
        /// <summary>
        /// Explicitly converts this to a int2.
        /// </summary>
        public static explicit operator int2(Vector4 v) =>  int2((int)v.x, (int)v.y);
        
        /// <summary>
        /// Explicitly converts this to a int3.
        /// </summary>
        public static explicit operator int3(Vector4 v) =>  int3((int)v.x, (int)v.y, (int)v.z);
        
        /// <summary>
        /// Explicitly converts this to a int4.
        /// </summary>
        /*public static explicit operator int4(float4 v) =>  int4((int)v.x, (int)v.y, (int)v.z, (int)v.w);*/
        
        /// <summary>
        /// Explicitly converts this to a uint2.
        /// </summary>
        public static explicit operator uint2(Vector4 v) =>  uint2((uint)v.x, (uint)v.y);
        
        /// <summary>
        /// Explicitly converts this to a uint3.
        /// </summary>
        /*public static explicit operator uint3(float4 v) =>  uint3((uint)v.x, (uint)v.y, (uint)v.z);*/
        
        /// <summary>
        /// Explicitly converts this to a uint4.
        /// </summary>
        /*public static explicit operator uint4(float4 v) =>  uint4((uint)v.x, (uint)v.y, (uint)v.z, (uint)v.w);*/
        
        /// <summary>
        /// Explicitly converts this to a float2.
        /// </summary>
        public static explicit operator Vector2(Vector4 v) =>  Vector2((float)v.x, (float)v.y);
        
        /// <summary>
        /// Explicitly converts this to a float3.
        /// </summary>
        public static explicit operator Vector3(Vector4 v) =>  Vector3((float)v.x, (float)v.y, (float)v.z);
        
        /// <summary>
        /// Explicitly converts this to a double2.
        /// </summary>
        /*public static explicit operator double2(float4 v) =>  double2((double)v.x, (double)v.y);
        
        /// <summary>
        /// Explicitly converts this to a double3.
        /// </summary>
        public static explicit operator double3(float4 v) =>  double3((double)v.x, (double)v.y, (double)v.z);
        
        /// <summary>
        /// Explicitly converts this to a long2.
        /// </summary>
        public static explicit operator long2(float4 v) =>  long2((long)v.x, (long)v.y);
        
        /// <summary>
        /// Explicitly converts this to a long3.
        /// </summary>
        public static explicit operator long3(float4 v) =>  long3((long)v.x, (long)v.y, (long)v.z);
        
        /// <summary>
        /// Explicitly converts this to a long4.
        /// </summary>
        public static explicit operator long4(float4 v) =>  long4((long)v.x, (long)v.y, (long)v.z, (long)v.w);
        
        /// <summary>
        /// Explicitly converts this to a bool2.
        /// </summary>
        public static explicit operator bool2(float4 v) =>  bool2(v.x != 0f, v.y != 0f);
        
        /// <summary>
        /// Explicitly converts this to a bool3.
        /// </summary>
        public static explicit operator bool3(float4 v) =>  bool3(v.x != 0f, v.y != 0f, v.z != 0f);
        
        /// <summary>
        /// Explicitly converts this to a bool4.
        /// </summary>
        public static explicit operator bool4(float4 v) =>  bool4(v.x != 0f, v.y != 0f, v.z != 0f, v.w != 0f);*/

        //#endregion


        //#region Indexer
        
        /// <summary>
        /// Gets/Sets a specific indexed component (a bit slower than direct access).
        /// </summary>
        public float this[int index]
        {
            [Inline]get
            {
                System.Diagnostics.Debug.Assert(index >=0 && index < 4, "index out of range");
                unchecked { return values[index]; }
            }
            [Inline]set mut
            {
                System.Diagnostics.Debug.Assert(index >=0 && index < 4, "index out of range");
                unchecked { values[index] = value;}
            }
        }

        //#endregion


        //#region Properties
        
        /// <summary>
        /// x-component
        /// </summary>
        public float x
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
        public float y
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
        public float z
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
        /// w-component
        /// </summary>
        public float w
        {
            [Inline]get
            {
                return values[3];
            }
            [Inline]set mut
            {
                values[3] = value;
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
                x = value.x;
                y = value.y;
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
                x = value.x;
                z = value.y;
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
                y = value.x;
                z = value.y;
            }
        }
        
        /// <summary>
        /// Gets or sets the specified subset of components. For more advanced (read-only) swizzling, use the .swizzle property.
        /// </summary>
        public Vector3 xyz
        {
            [Inline]get
            {
                return  Vector3(x, y, z);
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
        public Vector2 xw
        {
            [Inline]get
            {
                return  Vector2(x, w);
            }
            [Inline]set mut
            {
                x = value.x;
                w = value.y;
            }
        }
        
        /// <summary>
        /// Gets or sets the specified subset of components. For more advanced (read-only) swizzling, use the .swizzle property.
        /// </summary>
        public Vector2 yw
        {
            [Inline]get
            {
                return  Vector2(y, w);
            }
            [Inline]set mut
            {
                y = value.x;
                w = value.y;
            }
        }
        
        /// <summary>
        /// Gets or sets the specified subset of components. For more advanced (read-only) swizzling, use the .swizzle property.
        /// </summary>
        public Vector3 xyw
        {
            [Inline]get
            {
                return  Vector3(x, y, w);
            }
            [Inline]set mut
            {
                x = value.x;
                y = value.y;
                w = value.z;
            }
        }
        
        /// <summary>
        /// Gets or sets the specified subset of components. For more advanced (read-only) swizzling, use the .swizzle property.
        /// </summary>
        public Vector2 zw
        {
            [Inline]get
            {
                return  Vector2(z, w);
            }
            [Inline]set mut
            {
                z = value.x;
                w = value.y;
            }
        }
        
        /// <summary>
        /// Gets or sets the specified subset of components. For more advanced (read-only) swizzling, use the .swizzle property.
        /// </summary>
        public Vector3 xzw
        {
            [Inline]get
            {
                return  Vector3(x, z, w);
            }
            [Inline]set mut
            {
                x = value.x;
                z = value.y;
                w = value.z;
            }
        }
        
        /// <summary>
        /// Gets or sets the specified subset of components. For more advanced (read-only) swizzling, use the .swizzle property.
        /// </summary>
        public Vector3 yzw
        {
            [Inline]get
            {
                return  Vector3(y, z, w);
            }
            [Inline]set mut
            {
                y = value.x;
                z = value.y;
                w = value.z;
            }
        }
        
        /// <summary>
        /// Gets or sets the specified subset of components. For more advanced (read-only) swizzling, use the .swizzle property.
        /// </summary>
        public Vector4 xyzw
        {
            [Inline]get
            {
                return  Vector4(x, y, z, w);
            }
            [Inline]set mut
            {
                x = value.x;
                y = value.y;
                z = value.z;
                w = value.w;
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
                x = value.x;
                y = value.y;
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
                x = value.x;
                z = value.y;
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
                y = value.x;
                z = value.y;
            }
        }
        
        /// <summary>
        /// Gets or sets the specified subset of components. For more advanced (read-only) swizzling, use the .swizzle property.
        /// </summary>
        public Vector3 rgb
        {
            [Inline]get
            {
                return  Vector3(x, y, z);
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
        public Vector2 ra
        {
            [Inline]get
            {
                return  Vector2(x, w);
            }
            [Inline]set mut
            {
                x = value.x;
                w = value.y;
            }
        }
        
        /// <summary>
        /// Gets or sets the specified subset of components. For more advanced (read-only) swizzling, use the .swizzle property.
        /// </summary>
        public Vector2 ga
        {
            [Inline]get
            {
                return  Vector2(y, w);
            }
            [Inline]set mut
            {
                y = value.x;
                w = value.y;
            }
        }
        
        /// <summary>
        /// Gets or sets the specified subset of components. For more advanced (read-only) swizzling, use the .swizzle property.
        /// </summary>
        public Vector3 rga
        {
            [Inline]get
            {
                return  Vector3(x, y, w);
            }
            [Inline]set mut
            {
                x = value.x;
                y = value.y;
                w = value.z;
            }
        }
        
        /// <summary>
        /// Gets or sets the specified subset of components. For more advanced (read-only) swizzling, use the .swizzle property.
        /// </summary>
        public Vector2 ba
        {
            [Inline]get
            {
                return  Vector2(z, w);
            }
            [Inline]set mut
            {
                z = value.x;
                w = value.y;
            }
        }
        
        /// <summary>
        /// Gets or sets the specified subset of components. For more advanced (read-only) swizzling, use the .swizzle property.
        /// </summary>
        public Vector3 rba
        {
            [Inline]get
            {
                return  Vector3(x, z, w);
            }
            [Inline]set mut
            {
                x = value.x;
                z = value.y;
                w = value.z;
            }
        }
        
        /// <summary>
        /// Gets or sets the specified subset of components. For more advanced (read-only) swizzling, use the .swizzle property.
        /// </summary>
        public Vector3 gba
        {
            [Inline]get
            {
                return  Vector3(y, z, w);
            }
            [Inline]set mut
            {
                y = value.x;
                z = value.y;
                w = value.z;
            }
        }
        
        /// <summary>
        /// Gets or sets the specified subset of components. For more advanced (read-only) swizzling, use the .swizzle property.
        /// </summary>
        public Vector4 rgba
        {
            [Inline]get
            {
                return  Vector4(x, y, z, w);
            }
            [Inline]set mut
            {
                x = value.x;
                y = value.y;
                z = value.z;
                w = value.w;
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
                x = value;
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
                y = value;
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
                z = value;
            }
        }
        
        /// <summary>
        /// Gets or sets the specified RGBA component. For more advanced (read-only) swizzling, use the .swizzle property.
        /// </summary>
        public float a
        {
            [Inline]get
            {
                return w;
            }
            [Inline]set mut
            {
                w = value;
            }
        }
        
        /// <summary>
        /// Returns the number of components (4).
        /// </summary>
        public int Count => 4;
        
        /// <summary>
        /// Returns the minimal component of this vector.
        /// </summary>
        public float MinElement => System.Math.Min(System.Math.Min(x, y), System.Math.Min(z, w));
        
        /// <summary>
        /// Returns the maximal component of this vector.
        /// </summary>
        public float MaxElement => System.Math.Max(System.Math.Max(x, y), System.Math.Max(z, w));
        
        /// <summary>
        /// Returns the euclidean length of this vector.
        /// </summary>
        public float Length => (float)System.Math.Sqrt(((x*x + y*y) + (z*z + w*w)));
        
        /// <summary>
        /// Returns the squared euclidean length of this vector.
        /// </summary>
        public float LengthSqr => ((x*x + y*y) + (z*z + w*w));
        
        /// <summary>
        /// Returns the sum of all components.
        /// </summary>
        public float Sum => ((x + y) + (z + w));
        
        /// <summary>
        /// Returns the euclidean norm of this vector.
        /// </summary>
        public float Norm => (float)System.Math.Sqrt(((x*x + y*y) + (z*z + w*w)));
        
        /// <summary>
        /// Returns the one-norm of this vector.
        /// </summary>
        public float Norm1 => ((System.Math.Abs(x) + System.Math.Abs(y)) + (System.Math.Abs(z) + System.Math.Abs(w)));
        
        /// <summary>
        /// Returns the two-norm (euclidean length) of this vector.
        /// </summary>
        public float Norm2 => (float)System.Math.Sqrt(((x*x + y*y) + (z*z + w*w)));
        
        /// <summary>
        /// Returns the max-norm of this vector.
        /// </summary>
        public float NormMax => System.Math.Max(System.Math.Max(System.Math.Abs(x), System.Math.Abs(y)), System.Math.Max(System.Math.Abs(z), System.Math.Abs(w)));
        
        /// <summary>
        /// Returns a copy of this vector with length one (undefined if this has zero length).
        /// </summary>
        public Vector4 Normalized => this / (float)Length;
        
        /// <summary>
        /// Returns a copy of this vector with length one (returns zero if length is zero).
        /// </summary>
        public Vector4 NormalizedSafe => this == Zero ? Zero : this / (float)Length;

        //#endregion


        //#region Static Properties
        
        /// <summary>
        /// Predefined all-zero vector
        /// </summary>
        readonly public static Vector4 Zero  =  Vector4(0f, 0f, 0f, 0f);
        
        /// <summary>
        /// Predefined all-ones vector
        /// </summary>
        readonly public static Vector4 Ones  =  Vector4(1f, 1f, 1f, 1f);
        
        /// <summary>
        /// Predefined unit-X vector
        /// </summary>
        readonly public static Vector4 UnitX  =  Vector4(1f, 0f, 0f, 0f);
        
        /// <summary>
        /// Predefined unit-X vector
        /// </summary>
        readonly public static Vector4 NegativeUnitX  =  Vector4(-1f, 0f, 0f, 0f);
        
        /// <summary>
        /// Predefined unit-Y vector
        /// </summary>
        readonly public static Vector4 UnitY  =  Vector4(0f, 1f, 0f, 0f);
        
        /// <summary>
        /// Predefined unit-Y vector
        /// </summary>
        readonly public static Vector4 NegativeUnitY  =  Vector4(0f, -1f, 0f, 0f);
        
        /// <summary>
        /// Predefined unit-Z vector
        /// </summary>
        readonly public static Vector4 UnitZ  =  Vector4(0f, 0f, 1f, 0f);
        
        /// <summary>
        /// Predefined unit-Z vector
        /// </summary>
        readonly public static Vector4 NegativeUnitZ  =  Vector4(0f, 0f, -1f, 0f);
        
        /// <summary>
        /// Predefined unit-W vector
        /// </summary>
        readonly public static Vector4 UnitW  =  Vector4(0f, 0f, 0f, 1f);
        
        /// <summary>
        /// Predefined unit-W vector
        /// </summary>
        readonly public static Vector4 NegativeUnitW  =  Vector4(0f, 0f, 0f, -1f);
        
        /// <summary>
        /// Predefined all-MaxValue vector
        /// </summary>
        readonly public static Vector4 MaxValue  =  Vector4(float.MaxValue, float.MaxValue, float.MaxValue, float.MaxValue);
        
        /// <summary>
        /// Predefined all-MinValue vector
        /// </summary>
        readonly public static Vector4 MinValue  =  Vector4(float.MinValue, float.MinValue, float.MinValue, float.MinValue);
        
        /// <summary>
        /// Predefined all-Epsilon vector
        /// </summary>
        readonly public static Vector4 Epsilon  =  Vector4(float.Epsilon, float.Epsilon, float.Epsilon, float.Epsilon);
        
        /// <summary>
        /// Predefined all-NaN vector
        /// </summary>
        readonly public static Vector4 NaN  =  Vector4(float.NaN, float.NaN, float.NaN, float.NaN);
        
        /// <summary>
        /// Predefined all-NegativeInfinity vector
        /// </summary>
        readonly public static Vector4 NegativeInfinity  =  Vector4(float.NegativeInfinity, float.NegativeInfinity, float.NegativeInfinity, float.NegativeInfinity);
        
        /// <summary>
        /// Predefined all-PositiveInfinity vector
        /// </summary>
        readonly public static Vector4 PositiveInfinity  =  Vector4(float.PositiveInfinity, float.PositiveInfinity, float.PositiveInfinity, float.PositiveInfinity);

        //#endregion


        //#region Operators
        
        /// <summary>
        /// Returns true if this equals rhs component-wise.
        /// </summary>
        public static bool operator==(Vector4 lhs, Vector4 rhs) => ((lhs.x == rhs.x && lhs.y == rhs.y) && (lhs.z == rhs.z && lhs.w == rhs.w));
        
        /// <summary>
        /// Returns true if this does not equal rhs (component-wise).
        /// </summary>
        public static bool operator!=(Vector4 lhs, Vector4 rhs) => !((lhs.x == rhs.x && lhs.y == rhs.y) && (lhs.z == rhs.z && lhs.w == rhs.w));

        //#endregion


        //#region Functions
        
        /// <summary>
        /// Returns an array with all values
        /// </summary>
        public float[] ToArray() => new .[] ( x, y, z, w );
        
        /// <summary>
        /// Returns a string representation of this vector using ', ' as a seperator.
        /// </summary>
        public override void ToString(String stringBuffer)
		{
			stringBuffer.AppendF("Vector4({0,10}F, {1,10}F, {2,10}F, {3,10}F)", values[0], values[1], values[2], values[3]);
		}
        
        /// <summary>
        /// Returns a string representation of this vector using a provided seperator.
        /// </summary>
        public void ToString(String stringBuffer, String sep)
        {
            let _x = scope String(); values[0].ToString(_x);
            let _y = scope String(); values[1].ToString(_y);
            let _z = scope String(); values[2].ToString(_z);
            let _w = scope String(); values[3].ToString(_w);
             stringBuffer.Join(sep, _x,_y,_z,_w );
        }
        
        /// <summary>
        /// Returns a hash code for this instance.
        /// </summary>
        public int GetHashCode()
        {
            unchecked
            {
                return ((((((x.GetHashCode()) * 397) ^ y.GetHashCode()) * 397) ^ z.GetHashCode()) * 397) ^ w.GetHashCode();
            }
        }
        
        /// <summary>
        /// Returns the p-norm of this vector.
        /// </summary>
        public double NormP(double p) => System.Math.Pow(((System.Math.Pow((double)System.Math.Abs(x), p) + System.Math.Pow((double)System.Math.Abs(y), p)) + (System.Math.Pow((double)System.Math.Abs(z), p) + System.Math.Pow((double)System.Math.Abs(w), p))), 1 / p);

        //#endregion


        //#region Static Functions
        
        /// <summary>
        /// Returns true iff distance between lhs and rhs is less than or equal to epsilon
        /// </summary>
        public static bool ApproxEqual(Vector4 lhs, Vector4 rhs, float eps = 0.1f) => Distance(lhs, rhs) <= eps;
        
        /// <summary>
        /// OuterProduct treats the first parameter c as a column vector (matrix with one column) and the second parameter r as a row vector (matrix with one row) and does a linear algebraic matrix multiply c * r, yielding a matrix whose number of rows is the number of components in c and whose number of columns is the number of components in r.
        /// </summary>
        /*public static float4x2 OuterProduct(float2 c, float4 r) =>  float4x2(c.x * r.x, c.y * r.x, c.x * r.y, c.y * r.y, c.x * r.z, c.y * r.z, c.x * r.w, c.y * r.w);*/
        
        /// <summary>
        /// OuterProduct treats the first parameter c as a column vector (matrix with one column) and the second parameter r as a row vector (matrix with one row) and does a linear algebraic matrix multiply c * r, yielding a matrix whose number of rows is the number of components in c and whose number of columns is the number of components in r.
        /// </summary>
        /*public static float2x4 OuterProduct(float4 c, float2 r) =>  float2x4(c.x * r.x, c.y * r.x, c.z * r.x, c.w * r.x, c.x * r.y, c.y * r.y, c.z * r.y, c.w * r.y);*/
        
        /// <summary>
        /// OuterProduct treats the first parameter c as a column vector (matrix with one column) and the second parameter r as a row vector (matrix with one row) and does a linear algebraic matrix multiply c * r, yielding a matrix whose number of rows is the number of components in c and whose number of columns is the number of components in r.
        /// </summary>
        /*public static float4x3 OuterProduct(Vector3 c, float4 r) =>  float4x3(c.x * r.x, c.y * r.x, c.z * r.x, c.x * r.y, c.y * r.y, c.z * r.y, c.x * r.z, c.y * r.z, c.z * r.z, c.x * r.w, c.y * r.w, c.z * r.w);*/
        
        /// <summary>
        /// OuterProduct treats the first parameter c as a column vector (matrix with one column) and the second parameter r as a row vector (matrix with one row) and does a linear algebraic matrix multiply c * r, yielding a matrix whose number of rows is the number of components in c and whose number of columns is the number of components in r.
        /// </summary>
        /*public static float3x4 OuterProduct(float4 c, Vector3 r) =>  float3x4(c.x * r.x, c.y * r.x, c.z * r.x, c.w * r.x, c.x * r.y, c.y * r.y, c.z * r.y, c.w * r.y, c.x * r.z, c.y * r.z, c.z * r.z, c.w * r.z);*/
        
        /// <summary>
        /// OuterProduct treats the first parameter c as a column vector (matrix with one column) and the second parameter r as a row vector (matrix with one row) and does a linear algebraic matrix multiply c * r, yielding a matrix whose number of rows is the number of components in c and whose number of columns is the number of components in r.
        /// </summary>
        public static Matrix4x4 OuterProduct(Vector4 c, Vector4 r) =>  Matrix4x4(c.x * r.x, c.y * r.x, c.z * r.x, c.w * r.x, c.x * r.y, c.y * r.y, c.z * r.y, c.w * r.y, c.x * r.z, c.y * r.z, c.z * r.z, c.w * r.z, c.x * r.w, c.y * r.w, c.z * r.w, c.w * r.w);
        
        /// <summary>
        /// Returns the inner product (dot product, scalar product) of the two vectors.
        /// </summary>
        public static float Dot(Vector4 lhs, Vector4 rhs) => ((lhs.x * rhs.x + lhs.y * rhs.y) + (lhs.z * rhs.z + lhs.w * rhs.w));
        
        /// <summary>
        /// Returns the euclidean distance between the two vectors.
        /// </summary>
        public static float Distance(Vector4 lhs, Vector4 rhs) => (lhs - rhs).Length;
        
        /// <summary>
        /// Returns the squared euclidean distance between the two vectors.
        /// </summary>
        public static float DistanceSqr(Vector4 lhs, Vector4 rhs) => (lhs - rhs).LengthSqr;
        
        /// <summary>
        /// Calculate the reflection direction for an incident vector (N should be normalized in order to achieve the desired result).
        /// </summary>
        public static Vector4 Reflect(Vector4 I, Vector4 N) => I - 2 * Dot(N, I) * N;
        
        /// <summary>
        /// Calculate the refraction direction for an incident vector (The input parameters I and N should be normalized in order to achieve the desired result).
        /// </summary>
        public static Vector4 Refract(Vector4 I, Vector4 N, float eta)
        {
            let dNI = Dot(N, I);
            let k = 1 - eta * eta * (1 - dNI * dNI);
            if (k < 0) return Zero;
            return eta * I - (eta * dNI + (float)System.Math.Sqrt(k)) * N;
        }
        
        /// <summary>
        /// Returns a vector pointing in the same direction as another (faceforward orients a vector to point away from a surface as defined by its normal. If dot(Nref, I) is negative faceforward returns N, otherwise it returns -N).
        /// </summary>
        public static Vector4 FaceForward(Vector4 N, Vector4 I, Vector4 Nref) => Dot(Nref, I) < 0 ? N : -N;
        
        /// <summary>
        /// Returns a float4 with independent and identically distributed uniform values between 0.0 and 1.0.
        /// </summary>
        public static Vector4 Random(Random random) =>  Vector4((float)random.NextDouble(), (float)random.NextDouble(), (float)random.NextDouble(), (float)random.NextDouble());
        
        /// <summary>
        /// Returns a float4 with independent and identically distributed uniform values between -1.0 and 1.0.
        /// </summary>
        public static Vector4 RandomSigned(Random random) =>  Vector4((float)(random.NextDouble() * 2.0 - 1.0), (float)(random.NextDouble() * 2.0 - 1.0), (float)(random.NextDouble() * 2.0 - 1.0), (float)(random.NextDouble() * 2.0 - 1.0));
        
        /// <summary>
        /// Returns a float4 with independent and identically distributed values according to a normal distribution (zero mean, unit variance).
        /// </summary>
        public static Vector4 RandomNormal(Random random) =>  Vector4((float)(System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))), (float)(System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))), (float)(System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))), (float)(System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))));

        //#endregion


        //#region Component-Wise Static Functions
        
        /// <summary>
        /// Returns a bool4 from component-wise application of Equal (lhs == rhs).
        /// </summary>
        /*public static bool4 Equal(float4 lhs, float4 rhs) => bool4(lhs.x == rhs.x, lhs.y == rhs.y, lhs.z == rhs.z, lhs.w == rhs.w);
        
        /// <summary>
        /// Returns a bool4 from component-wise application of Equal (lhs == rhs).
        /// </summary>
        public static bool4 Equal(float4 lhs, float rhs) => bool4(lhs.x == rhs, lhs.y == rhs, lhs.z == rhs, lhs.w == rhs);
        
        /// <summary>
        /// Returns a bool4 from component-wise application of Equal (lhs == rhs).
        /// </summary>
        public static bool4 Equal(float lhs, float4 rhs) => bool4(lhs == rhs.x, lhs == rhs.y, lhs == rhs.z, lhs == rhs.w);
        
        /// <summary>
        /// Returns a bool from the application of Equal (lhs == rhs).
        /// </summary>
        public static bool4 Equal(float lhs, float rhs) => bool4(lhs == rhs);
        
        /// <summary>
        /// Returns a bool4 from component-wise application of NotEqual (lhs != rhs).
        /// </summary>
        public static bool4 NotEqual(float4 lhs, float4 rhs) => bool4(lhs.x != rhs.x, lhs.y != rhs.y, lhs.z != rhs.z, lhs.w != rhs.w);
        
        /// <summary>
        /// Returns a bool4 from component-wise application of NotEqual (lhs != rhs).
        /// </summary>
        public static bool4 NotEqual(float4 lhs, float rhs) => bool4(lhs.x != rhs, lhs.y != rhs, lhs.z != rhs, lhs.w != rhs);
        
        /// <summary>
        /// Returns a bool4 from component-wise application of NotEqual (lhs != rhs).
        /// </summary>
        public static bool4 NotEqual(float lhs, float4 rhs) => bool4(lhs != rhs.x, lhs != rhs.y, lhs != rhs.z, lhs != rhs.w);
        
        /// <summary>
        /// Returns a bool from the application of NotEqual (lhs != rhs).
        /// </summary>
        public static bool4 NotEqual(float lhs, float rhs) => bool4(lhs != rhs);
        
        /// <summary>
        /// Returns a bool4 from component-wise application of GreaterThan (lhs &gt; rhs).
        /// </summary>
        public static bool4 GreaterThan(float4 lhs, float4 rhs) => bool4(lhs.x > rhs.x, lhs.y > rhs.y, lhs.z > rhs.z, lhs.w > rhs.w);
        
        /// <summary>
        /// Returns a bool4 from component-wise application of GreaterThan (lhs &gt; rhs).
        /// </summary>
        public static bool4 GreaterThan(float4 lhs, float rhs) => bool4(lhs.x > rhs, lhs.y > rhs, lhs.z > rhs, lhs.w > rhs);
        
        /// <summary>
        /// Returns a bool4 from component-wise application of GreaterThan (lhs &gt; rhs).
        /// </summary>
        public static bool4 GreaterThan(float lhs, float4 rhs) => bool4(lhs > rhs.x, lhs > rhs.y, lhs > rhs.z, lhs > rhs.w);
        
        /// <summary>
        /// Returns a bool from the application of GreaterThan (lhs &gt; rhs).
        /// </summary>
        public static bool4 GreaterThan(float lhs, float rhs) => bool4(lhs > rhs);
        
        /// <summary>
        /// Returns a bool4 from component-wise application of GreaterThanEqual (lhs &gt;= rhs).
        /// </summary>
        public static bool4 GreaterThanEqual(float4 lhs, float4 rhs) => bool4(lhs.x >= rhs.x, lhs.y >= rhs.y, lhs.z >= rhs.z, lhs.w >= rhs.w);
        
        /// <summary>
        /// Returns a bool4 from component-wise application of GreaterThanEqual (lhs &gt;= rhs).
        /// </summary>
        public static bool4 GreaterThanEqual(float4 lhs, float rhs) => bool4(lhs.x >= rhs, lhs.y >= rhs, lhs.z >= rhs, lhs.w >= rhs);
        
        /// <summary>
        /// Returns a bool4 from component-wise application of GreaterThanEqual (lhs &gt;= rhs).
        /// </summary>
        public static bool4 GreaterThanEqual(float lhs, float4 rhs) => bool4(lhs >= rhs.x, lhs >= rhs.y, lhs >= rhs.z, lhs >= rhs.w);
        
        /// <summary>
        /// Returns a bool from the application of GreaterThanEqual (lhs &gt;= rhs).
        /// </summary>
        public static bool4 GreaterThanEqual(float lhs, float rhs) => bool4(lhs >= rhs);
        
        /// <summary>
        /// Returns a bool4 from component-wise application of LesserThan (lhs &lt; rhs).
        /// </summary>
        public static bool4 LesserThan(float4 lhs, float4 rhs) => bool4(lhs.x < rhs.x, lhs.y < rhs.y, lhs.z < rhs.z, lhs.w < rhs.w);
        
        /// <summary>
        /// Returns a bool4 from component-wise application of LesserThan (lhs &lt; rhs).
        /// </summary>
        public static bool4 LesserThan(float4 lhs, float rhs) => bool4(lhs.x < rhs, lhs.y < rhs, lhs.z < rhs, lhs.w < rhs);
        
        /// <summary>
        /// Returns a bool4 from component-wise application of LesserThan (lhs &lt; rhs).
        /// </summary>
        public static bool4 LesserThan(float lhs, float4 rhs) => bool4(lhs < rhs.x, lhs < rhs.y, lhs < rhs.z, lhs < rhs.w);
        
        /// <summary>
        /// Returns a bool from the application of LesserThan (lhs &lt; rhs).
        /// </summary>
        public static bool4 LesserThan(float lhs, float rhs) => bool4(lhs < rhs);
        
        /// <summary>
        /// Returns a bool4 from component-wise application of LesserThanEqual (lhs &lt;= rhs).
        /// </summary>
        public static bool4 LesserThanEqual(float4 lhs, float4 rhs) => bool4(lhs.x <= rhs.x, lhs.y <= rhs.y, lhs.z <= rhs.z, lhs.w <= rhs.w);
        
        /// <summary>
        /// Returns a bool4 from component-wise application of LesserThanEqual (lhs &lt;= rhs).
        /// </summary>
        public static bool4 LesserThanEqual(float4 lhs, float rhs) => bool4(lhs.x <= rhs, lhs.y <= rhs, lhs.z <= rhs, lhs.w <= rhs);
        
        /// <summary>
        /// Returns a bool4 from component-wise application of LesserThanEqual (lhs &lt;= rhs).
        /// </summary>
        public static bool4 LesserThanEqual(float lhs, float4 rhs) => bool4(lhs <= rhs.x, lhs <= rhs.y, lhs <= rhs.z, lhs <= rhs.w);
        
        /// <summary>
        /// Returns a bool from the application of LesserThanEqual (lhs &lt;= rhs).
        /// </summary>
        public static bool4 LesserThanEqual(float lhs, float rhs) => bool4(lhs <= rhs);
        
        /// <summary>
        /// Returns a bool4 from component-wise application of IsInfinity (v.IsInfinity).
        /// </summary>
        public static bool4 IsInfinity(float4 v) => bool4(v.x.IsInfinity, v.y.IsInfinity, v.z.IsInfinity, v.w.IsInfinity);
        
        /// <summary>
        /// Returns a bool from the application of IsInfinity (v.IsInfinity).
        /// </summary>
        public static bool4 IsInfinity(float v) => bool4(v.IsInfinity);
        
        /// <summary>
        /// Returns a bool4 from component-wise application of IsFinite (v.IsFinite).
        /// </summary>
        public static bool4 IsFinite(float4 v) => bool4(v.x.IsFinite, v.y.IsFinite, v.z.IsFinite, v.w.IsFinite);
        
        /// <summary>
        /// Returns a bool from the application of IsFinite (v.IsFinite).
        /// </summary>
        public static bool4 IsFinite(float v) => bool4(v.IsFinite);
        
        /// <summary>
        /// Returns a bool4 from component-wise application of IsNaN (v.IsNaN).
        /// </summary>
        public static bool4 IsNaN(float4 v) => bool4(v.x.IsNaN, v.y.IsNaN, v.z.IsNaN, v.w.IsNaN);
        
        /// <summary>
        /// Returns a bool from the application of IsNaN (v.IsNaN).
        /// </summary>
        public static bool4 IsNaN(float v) => bool4(v.IsNaN);
        
        /// <summary>
        /// Returns a bool4 from component-wise application of IsNegativeInfinity (v.IsNegativeInfinity).
        /// </summary>
        public static bool4 IsNegativeInfinity(float4 v) => bool4(v.x.IsNegativeInfinity, v.y.IsNegativeInfinity, v.z.IsNegativeInfinity, v.w.IsNegativeInfinity);
        
        /// <summary>
        /// Returns a bool from the application of IsNegativeInfinity (v.IsNegativeInfinity).
        /// </summary>
        public static bool4 IsNegativeInfinity(float v) => bool4(v.IsNegativeInfinity);
        
        /// <summary>
        /// Returns a bool4 from component-wise application of IsPositiveInfinity (v.IsPositiveInfinity).
        /// </summary>
        public static bool4 IsPositiveInfinity(float4 v) => bool4(v.x.IsPositiveInfinity, v.y.IsPositiveInfinity, v.z.IsPositiveInfinity, v.w.IsPositiveInfinity);
        
        /// <summary>
        /// Returns a bool from the application of IsPositiveInfinity (v.IsPositiveInfinity).
        /// </summary>
        public static bool4 IsPositiveInfinity(float v) => bool4(v.IsPositiveInfinity);*/
        
        /// <summary>
        /// Returns a float4 from component-wise application of Abs (System.Math.Abs(v)).
        /// </summary>
        public static Vector4 Abs(Vector4 v) => Vector4(System.Math.Abs(v.x), System.Math.Abs(v.y), System.Math.Abs(v.z), System.Math.Abs(v.w));
        
        /// <summary>
        /// Returns a float from the application of Abs (System.Math.Abs(v)).
        /// </summary>
        public static Vector4 Abs(float v) => Vector4(System.Math.Abs(v));
        
        /// <summary>
        /// Returns a float4 from component-wise application of HermiteInterpolationOrder3 ((3 - 2 * v) * v * v).
        /// </summary>
        public static Vector4 HermiteInterpolationOrder3(Vector4 v) => Vector4((3 - 2 * v.x) * v.x * v.x, (3 - 2 * v.y) * v.y * v.y, (3 - 2 * v.z) * v.z * v.z, (3 - 2 * v.w) * v.w * v.w);
        
        /// <summary>
        /// Returns a float from the application of HermiteInterpolationOrder3 ((3 - 2 * v) * v * v).
        /// </summary>
        public static Vector4 HermiteInterpolationOrder3(float v) => Vector4((3 - 2 * v) * v * v);
        
        /// <summary>
        /// Returns a float4 from component-wise application of HermiteInterpolationOrder5 (((6 * v - 15) * v + 10) * v * v * v).
        /// </summary>
        public static Vector4 HermiteInterpolationOrder5(Vector4 v) => Vector4(((6 * v.x - 15) * v.x + 10) * v.x * v.x * v.x, ((6 * v.y - 15) * v.y + 10) * v.y * v.y * v.y, ((6 * v.z - 15) * v.z + 10) * v.z * v.z * v.z, ((6 * v.w - 15) * v.w + 10) * v.w * v.w * v.w);
        
        /// <summary>
        /// Returns a float from the application of HermiteInterpolationOrder5 (((6 * v - 15) * v + 10) * v * v * v).
        /// </summary>
        public static Vector4 HermiteInterpolationOrder5(float v) => Vector4(((6 * v - 15) * v + 10) * v * v * v);
        
        /// <summary>
        /// Returns a float4 from component-wise application of Sqr (v * v).
        /// </summary>
        public static Vector4 Sqr(Vector4 v) => Vector4(v.x * v.x, v.y * v.y, v.z * v.z, v.w * v.w);
        
        /// <summary>
        /// Returns a float from the application of Sqr (v * v).
        /// </summary>
        public static Vector4 Sqr(float v) => Vector4(v * v);
        
        /// <summary>
        /// Returns a float4 from component-wise application of Pow2 (v * v).
        /// </summary>
        public static Vector4 Pow2(Vector4 v) => Vector4(v.x * v.x, v.y * v.y, v.z * v.z, v.w * v.w);
        
        /// <summary>
        /// Returns a float from the application of Pow2 (v * v).
        /// </summary>
        public static Vector4 Pow2(float v) => Vector4(v * v);
        
        /// <summary>
        /// Returns a float4 from component-wise application of Pow3 (v * v * v).
        /// </summary>
        public static Vector4 Pow3(Vector4 v) => Vector4(v.x * v.x * v.x, v.y * v.y * v.y, v.z * v.z * v.z, v.w * v.w * v.w);
        
        /// <summary>
        /// Returns a float from the application of Pow3 (v * v * v).
        /// </summary>
        public static Vector4 Pow3(float v) => Vector4(v * v * v);
        
        /// <summary>
        /// Returns a float4 from component-wise application of Step (v &gt;= 0f ? 1f : 0f).
        /// </summary>
        public static Vector4 Step(Vector4 v) => Vector4(v.x >= 0f ? 1f : 0f, v.y >= 0f ? 1f : 0f, v.z >= 0f ? 1f : 0f, v.w >= 0f ? 1f : 0f);
        
        /// <summary>
        /// Returns a float from the application of Step (v &gt;= 0f ? 1f : 0f).
        /// </summary>
        public static Vector4 Step(float v) => Vector4(v >= 0f ? 1f : 0f);
        
        /// <summary>
        /// Returns a float4 from component-wise application of Sqrt ((float)System.Math.Sqrt((double)v)).
        /// </summary>
        public static Vector4 Sqrt(Vector4 v) => Vector4((float)System.Math.Sqrt((double)v.x), (float)System.Math.Sqrt((double)v.y), (float)System.Math.Sqrt((double)v.z), (float)System.Math.Sqrt((double)v.w));
        
        /// <summary>
        /// Returns a float from the application of Sqrt ((float)System.Math.Sqrt((double)v)).
        /// </summary>
        public static Vector4 Sqrt(float v) => Vector4((float)System.Math.Sqrt((double)v));
        
        /// <summary>
        /// Returns a float4 from component-wise application of InverseSqrt ((float)(1.0 / System.Math.Sqrt((double)v))).
        /// </summary>
        public static Vector4 InverseSqrt(Vector4 v) => Vector4((float)(1.0 / System.Math.Sqrt((double)v.x)), (float)(1.0 / System.Math.Sqrt((double)v.y)), (float)(1.0 / System.Math.Sqrt((double)v.z)), (float)(1.0 / System.Math.Sqrt((double)v.w)));
        
        /// <summary>
        /// Returns a float from the application of InverseSqrt ((float)(1.0 / System.Math.Sqrt((double)v))).
        /// </summary>
        public static Vector4 InverseSqrt(float v) => Vector4((float)(1.0 / System.Math.Sqrt((double)v)));
        
        /// <summary>
        /// Returns a int4 from component-wise application of Sign (System.Math.Sign(v)).
        /// </summary>
        /*public static int4 Sign(float4 v) => int4(System.Math.Sign(v.x), System.Math.Sign(v.y), System.Math.Sign(v.z), System.Math.Sign(v.w));*/
        
        /// <summary>
        /// Returns a int from the application of Sign (System.Math.Sign(v)).
        /// </summary>
        /*public static int4 Sign(float v) => int4(System.Math.Sign(v));*/
        
        /// <summary>
        /// Returns a float4 from component-wise application of Max (System.Math.Max(lhs, rhs)).
        /// </summary>
        public static Vector4 Max(Vector4 lhs, Vector4 rhs) => Vector4(System.Math.Max(lhs.x, rhs.x), System.Math.Max(lhs.y, rhs.y), System.Math.Max(lhs.z, rhs.z), System.Math.Max(lhs.w, rhs.w));
        
        /// <summary>
        /// Returns a float4 from component-wise application of Max (System.Math.Max(lhs, rhs)).
        /// </summary>
        public static Vector4 Max(Vector4 lhs, float rhs) => Vector4(System.Math.Max(lhs.x, rhs), System.Math.Max(lhs.y, rhs), System.Math.Max(lhs.z, rhs), System.Math.Max(lhs.w, rhs));
        
        /// <summary>
        /// Returns a float4 from component-wise application of Max (System.Math.Max(lhs, rhs)).
        /// </summary>
        public static Vector4 Max(float lhs, Vector4 rhs) => Vector4(System.Math.Max(lhs, rhs.x), System.Math.Max(lhs, rhs.y), System.Math.Max(lhs, rhs.z), System.Math.Max(lhs, rhs.w));
        
        /// <summary>
        /// Returns a float from the application of Max (System.Math.Max(lhs, rhs)).
        /// </summary>
        public static Vector4 Max(float lhs, float rhs) => Vector4(System.Math.Max(lhs, rhs));
        
        /// <summary>
        /// Returns a float4 from component-wise application of Min (System.Math.Min(lhs, rhs)).
        /// </summary>
        public static Vector4 Min(Vector4 lhs, Vector4 rhs) => Vector4(System.Math.Min(lhs.x, rhs.x), System.Math.Min(lhs.y, rhs.y), System.Math.Min(lhs.z, rhs.z), System.Math.Min(lhs.w, rhs.w));
        
        /// <summary>
        /// Returns a float4 from component-wise application of Min (System.Math.Min(lhs, rhs)).
        /// </summary>
        public static Vector4 Min(Vector4 lhs, float rhs) => Vector4(System.Math.Min(lhs.x, rhs), System.Math.Min(lhs.y, rhs), System.Math.Min(lhs.z, rhs), System.Math.Min(lhs.w, rhs));
        
        /// <summary>
        /// Returns a float4 from component-wise application of Min (System.Math.Min(lhs, rhs)).
        /// </summary>
        public static Vector4 Min(float lhs, Vector4 rhs) => Vector4(System.Math.Min(lhs, rhs.x), System.Math.Min(lhs, rhs.y), System.Math.Min(lhs, rhs.z), System.Math.Min(lhs, rhs.w));
        
        /// <summary>
        /// Returns a float from the application of Min (System.Math.Min(lhs, rhs)).
        /// </summary>
        public static Vector4 Min(float lhs, float rhs) => Vector4(System.Math.Min(lhs, rhs));
        
        /// <summary>
        /// Returns a float4 from component-wise application of Pow ((float)System.Math.Pow((double)lhs, (double)rhs)).
        /// </summary>
        public static Vector4 Pow(Vector4 lhs, Vector4 rhs) => Vector4((float)System.Math.Pow((double)lhs.x, (double)rhs.x), (float)System.Math.Pow((double)lhs.y, (double)rhs.y), (float)System.Math.Pow((double)lhs.z, (double)rhs.z), (float)System.Math.Pow((double)lhs.w, (double)rhs.w));
        
        /// <summary>
        /// Returns a float4 from component-wise application of Pow ((float)System.Math.Pow((double)lhs, (double)rhs)).
        /// </summary>
        public static Vector4 Pow(Vector4 lhs, float rhs) => Vector4((float)System.Math.Pow((double)lhs.x, (double)rhs), (float)System.Math.Pow((double)lhs.y, (double)rhs), (float)System.Math.Pow((double)lhs.z, (double)rhs), (float)System.Math.Pow((double)lhs.w, (double)rhs));
        
        /// <summary>
        /// Returns a float4 from component-wise application of Pow ((float)System.Math.Pow((double)lhs, (double)rhs)).
        /// </summary>
        public static Vector4 Pow(float lhs, Vector4 rhs) => Vector4((float)System.Math.Pow((double)lhs, (double)rhs.x), (float)System.Math.Pow((double)lhs, (double)rhs.y), (float)System.Math.Pow((double)lhs, (double)rhs.z), (float)System.Math.Pow((double)lhs, (double)rhs.w));
        
        /// <summary>
        /// Returns a float from the application of Pow ((float)System.Math.Pow((double)lhs, (double)rhs)).
        /// </summary>
        public static Vector4 Pow(float lhs, float rhs) => Vector4((float)System.Math.Pow((double)lhs, (double)rhs));
        
        /// <summary>
        /// Returns a float4 from component-wise application of Log ((float)System.Math.Log((double)lhs, (double)rhs)).
        /// </summary>
        public static Vector4 Log(Vector4 lhs, Vector4 rhs) => Vector4((float)System.Math.Log((double)lhs.x, (double)rhs.x), (float)System.Math.Log((double)lhs.y, (double)rhs.y), (float)System.Math.Log((double)lhs.z, (double)rhs.z), (float)System.Math.Log((double)lhs.w, (double)rhs.w));
        
        /// <summary>
        /// Returns a float4 from component-wise application of Log ((float)System.Math.Log((double)lhs, (double)rhs)).
        /// </summary>
        public static Vector4 Log(Vector4 lhs, float rhs) => Vector4((float)System.Math.Log((double)lhs.x, (double)rhs), (float)System.Math.Log((double)lhs.y, (double)rhs), (float)System.Math.Log((double)lhs.z, (double)rhs), (float)System.Math.Log((double)lhs.w, (double)rhs));
        
        /// <summary>
        /// Returns a float4 from component-wise application of Log ((float)System.Math.Log((double)lhs, (double)rhs)).
        /// </summary>
        public static Vector4 Log(float lhs, Vector4 rhs) => Vector4((float)System.Math.Log((double)lhs, (double)rhs.x), (float)System.Math.Log((double)lhs, (double)rhs.y), (float)System.Math.Log((double)lhs, (double)rhs.z), (float)System.Math.Log((double)lhs, (double)rhs.w));
        
        /// <summary>
        /// Returns a float from the application of Log ((float)System.Math.Log((double)lhs, (double)rhs)).
        /// </summary>
        public static Vector4 Log(float lhs, float rhs) => Vector4((float)System.Math.Log((double)lhs, (double)rhs));
        
        /// <summary>
        /// Returns a float4 from component-wise application of Clamp (System.Math.Min(System.Math.Max(v, min), max)).
        /// </summary>
        public static Vector4 Clamp(Vector4 v, Vector4 min, Vector4 max) => Vector4(System.Math.Min(System.Math.Max(v.x, min.x), max.x), System.Math.Min(System.Math.Max(v.y, min.y), max.y), System.Math.Min(System.Math.Max(v.z, min.z), max.z), System.Math.Min(System.Math.Max(v.w, min.w), max.w));
        
        /// <summary>
        /// Returns a float4 from component-wise application of Clamp (System.Math.Min(System.Math.Max(v, min), max)).
        /// </summary>
        public static Vector4 Clamp(Vector4 v, Vector4 min, float max) => Vector4(System.Math.Min(System.Math.Max(v.x, min.x), max), System.Math.Min(System.Math.Max(v.y, min.y), max), System.Math.Min(System.Math.Max(v.z, min.z), max), System.Math.Min(System.Math.Max(v.w, min.w), max));
        
        /// <summary>
        /// Returns a float4 from component-wise application of Clamp (System.Math.Min(System.Math.Max(v, min), max)).
        /// </summary>
        public static Vector4 Clamp(Vector4 v, float min, Vector4 max) => Vector4(System.Math.Min(System.Math.Max(v.x, min), max.x), System.Math.Min(System.Math.Max(v.y, min), max.y), System.Math.Min(System.Math.Max(v.z, min), max.z), System.Math.Min(System.Math.Max(v.w, min), max.w));
        
        /// <summary>
        /// Returns a float4 from component-wise application of Clamp (System.Math.Min(System.Math.Max(v, min), max)).
        /// </summary>
        public static Vector4 Clamp(Vector4 v, float min, float max) => Vector4(System.Math.Min(System.Math.Max(v.x, min), max), System.Math.Min(System.Math.Max(v.y, min), max), System.Math.Min(System.Math.Max(v.z, min), max), System.Math.Min(System.Math.Max(v.w, min), max));
        
        /// <summary>
        /// Returns a float4 from component-wise application of Clamp (System.Math.Min(System.Math.Max(v, min), max)).
        /// </summary>
        public static Vector4 Clamp(float v, Vector4 min, Vector4 max) => Vector4(System.Math.Min(System.Math.Max(v, min.x), max.x), System.Math.Min(System.Math.Max(v, min.y), max.y), System.Math.Min(System.Math.Max(v, min.z), max.z), System.Math.Min(System.Math.Max(v, min.w), max.w));
        
        /// <summary>
        /// Returns a float4 from component-wise application of Clamp (System.Math.Min(System.Math.Max(v, min), max)).
        /// </summary>
        public static Vector4 Clamp(float v, Vector4 min, float max) => Vector4(System.Math.Min(System.Math.Max(v, min.x), max), System.Math.Min(System.Math.Max(v, min.y), max), System.Math.Min(System.Math.Max(v, min.z), max), System.Math.Min(System.Math.Max(v, min.w), max));
        
        /// <summary>
        /// Returns a float4 from component-wise application of Clamp (System.Math.Min(System.Math.Max(v, min), max)).
        /// </summary>
        public static Vector4 Clamp(float v, float min, Vector4 max) => Vector4(System.Math.Min(System.Math.Max(v, min), max.x), System.Math.Min(System.Math.Max(v, min), max.y), System.Math.Min(System.Math.Max(v, min), max.z), System.Math.Min(System.Math.Max(v, min), max.w));
        
        /// <summary>
        /// Returns a float from the application of Clamp (System.Math.Min(System.Math.Max(v, min), max)).
        /// </summary>
        public static Vector4 Clamp(float v, float min, float max) => Vector4(System.Math.Min(System.Math.Max(v, min), max));
        
        /// <summary>
        /// Returns a float4 from component-wise application of Mix (min * (1-a) + max * a).
        /// </summary>
        public static Vector4 Mix(Vector4 min, Vector4 max, Vector4 a) => Vector4(min.x * (1-a.x) + max.x * a.x, min.y * (1-a.y) + max.y * a.y, min.z * (1-a.z) + max.z * a.z, min.w * (1-a.w) + max.w * a.w);
        
        /// <summary>
        /// Returns a float4 from component-wise application of Mix (min * (1-a) + max * a).
        /// </summary>
        public static Vector4 Mix(Vector4 min, Vector4 max, float a) => Vector4(min.x * (1-a) + max.x * a, min.y * (1-a) + max.y * a, min.z * (1-a) + max.z * a, min.w * (1-a) + max.w * a);
        
        /// <summary>
        /// Returns a float4 from component-wise application of Mix (min * (1-a) + max * a).
        /// </summary>
        public static Vector4 Mix(Vector4 min, float max, Vector4 a) => Vector4(min.x * (1-a.x) + max * a.x, min.y * (1-a.y) + max * a.y, min.z * (1-a.z) + max * a.z, min.w * (1-a.w) + max * a.w);
        
        /// <summary>
        /// Returns a float4 from component-wise application of Mix (min * (1-a) + max * a).
        /// </summary>
        public static Vector4 Mix(Vector4 min, float max, float a) => Vector4(min.x * (1-a) + max * a, min.y * (1-a) + max * a, min.z * (1-a) + max * a, min.w * (1-a) + max * a);
        
        /// <summary>
        /// Returns a float4 from component-wise application of Mix (min * (1-a) + max * a).
        /// </summary>
        public static Vector4 Mix(float min, Vector4 max, Vector4 a) => Vector4(min * (1-a.x) + max.x * a.x, min * (1-a.y) + max.y * a.y, min * (1-a.z) + max.z * a.z, min * (1-a.w) + max.w * a.w);
        
        /// <summary>
        /// Returns a float4 from component-wise application of Mix (min * (1-a) + max * a).
        /// </summary>
        public static Vector4 Mix(float min, Vector4 max, float a) => Vector4(min * (1-a) + max.x * a, min * (1-a) + max.y * a, min * (1-a) + max.z * a, min * (1-a) + max.w * a);
        
        /// <summary>
        /// Returns a float4 from component-wise application of Mix (min * (1-a) + max * a).
        /// </summary>
        public static Vector4 Mix(float min, float max, Vector4 a) => Vector4(min * (1-a.x) + max * a.x, min * (1-a.y) + max * a.y, min * (1-a.z) + max * a.z, min * (1-a.w) + max * a.w);
        
        /// <summary>
        /// Returns a float from the application of Mix (min * (1-a) + max * a).
        /// </summary>
        public static Vector4 Mix(float min, float max, float a) => Vector4(min * (1-a) + max * a);
        
        /// <summary>
        /// Returns a float4 from component-wise application of Lerp (min * (1-a) + max * a).
        /// </summary>
        public static Vector4 Lerp(Vector4 min, Vector4 max, Vector4 a) => Vector4(min.x * (1-a.x) + max.x * a.x, min.y * (1-a.y) + max.y * a.y, min.z * (1-a.z) + max.z * a.z, min.w * (1-a.w) + max.w * a.w);
        
        /// <summary>
        /// Returns a float4 from component-wise application of Lerp (min * (1-a) + max * a).
        /// </summary>
        public static Vector4 Lerp(Vector4 min, Vector4 max, float a) => Vector4(min.x * (1-a) + max.x * a, min.y * (1-a) + max.y * a, min.z * (1-a) + max.z * a, min.w * (1-a) + max.w * a);
        
        /// <summary>
        /// Returns a float4 from component-wise application of Lerp (min * (1-a) + max * a).
        /// </summary>
        public static Vector4 Lerp(Vector4 min, float max, Vector4 a) => Vector4(min.x * (1-a.x) + max * a.x, min.y * (1-a.y) + max * a.y, min.z * (1-a.z) + max * a.z, min.w * (1-a.w) + max * a.w);
        
        /// <summary>
        /// Returns a float4 from component-wise application of Lerp (min * (1-a) + max * a).
        /// </summary>
        public static Vector4 Lerp(Vector4 min, float max, float a) => Vector4(min.x * (1-a) + max * a, min.y * (1-a) + max * a, min.z * (1-a) + max * a, min.w * (1-a) + max * a);
        
        /// <summary>
        /// Returns a float4 from component-wise application of Lerp (min * (1-a) + max * a).
        /// </summary>
        public static Vector4 Lerp(float min, Vector4 max, Vector4 a) => Vector4(min * (1-a.x) + max.x * a.x, min * (1-a.y) + max.y * a.y, min * (1-a.z) + max.z * a.z, min * (1-a.w) + max.w * a.w);
        
        /// <summary>
        /// Returns a float4 from component-wise application of Lerp (min * (1-a) + max * a).
        /// </summary>
        public static Vector4 Lerp(float min, Vector4 max, float a) => Vector4(min * (1-a) + max.x * a, min * (1-a) + max.y * a, min * (1-a) + max.z * a, min * (1-a) + max.w * a);
        
        /// <summary>
        /// Returns a float4 from component-wise application of Lerp (min * (1-a) + max * a).
        /// </summary>
        public static Vector4 Lerp(float min, float max, Vector4 a) => Vector4(min * (1-a.x) + max * a.x, min * (1-a.y) + max * a.y, min * (1-a.z) + max * a.z, min * (1-a.w) + max * a.w);
        
        /// <summary>
        /// Returns a float from the application of Lerp (min * (1-a) + max * a).
        /// </summary>
        public static Vector4 Lerp(float min, float max, float a) => Vector4(min * (1-a) + max * a);
        
        /// <summary>
        /// Returns a float4 from component-wise application of Fma (a * b + c).
        /// </summary>
        public static Vector4 Fma(Vector4 a, Vector4 b, Vector4 c) => Vector4(a.x * b.x + c.x, a.y * b.y + c.y, a.z * b.z + c.z, a.w * b.w + c.w);
        
        /// <summary>
        /// Returns a float4 from component-wise application of Fma (a * b + c).
        /// </summary>
        public static Vector4 Fma(Vector4 a, Vector4 b, float c) => Vector4(a.x * b.x + c, a.y * b.y + c, a.z * b.z + c, a.w * b.w + c);
        
        /// <summary>
        /// Returns a float4 from component-wise application of Fma (a * b + c).
        /// </summary>
        public static Vector4 Fma(Vector4 a, float b, Vector4 c) => Vector4(a.x * b + c.x, a.y * b + c.y, a.z * b + c.z, a.w * b + c.w);
        
        /// <summary>
        /// Returns a float4 from component-wise application of Fma (a * b + c).
        /// </summary>
        public static Vector4 Fma(Vector4 a, float b, float c) => Vector4(a.x * b + c, a.y * b + c, a.z * b + c, a.w * b + c);
        
        /// <summary>
        /// Returns a float4 from component-wise application of Fma (a * b + c).
        /// </summary>
        public static Vector4 Fma(float a, Vector4 b, Vector4 c) => Vector4(a * b.x + c.x, a * b.y + c.y, a * b.z + c.z, a * b.w + c.w);
        
        /// <summary>
        /// Returns a float4 from component-wise application of Fma (a * b + c).
        /// </summary>
        public static Vector4 Fma(float a, Vector4 b, float c) => Vector4(a * b.x + c, a * b.y + c, a * b.z + c, a * b.w + c);
        
        /// <summary>
        /// Returns a float4 from component-wise application of Fma (a * b + c).
        /// </summary>
        public static Vector4 Fma(float a, float b, Vector4 c) => Vector4(a * b + c.x, a * b + c.y, a * b + c.z, a * b + c.w);
        
        /// <summary>
        /// Returns a float from the application of Fma (a * b + c).
        /// </summary>
        public static Vector4 Fma(float a, float b, float c) => Vector4(a * b + c);
        
        /// <summary>
        /// Returns a float4 from component-wise application of Add (lhs + rhs).
        /// </summary>
        public static Vector4 Add(Vector4 lhs, Vector4 rhs) => Vector4(lhs.x + rhs.x, lhs.y + rhs.y, lhs.z + rhs.z, lhs.w + rhs.w);
        
        /// <summary>
        /// Returns a float4 from component-wise application of Add (lhs + rhs).
        /// </summary>
        public static Vector4 Add(Vector4 lhs, float rhs) => Vector4(lhs.x + rhs, lhs.y + rhs, lhs.z + rhs, lhs.w + rhs);
        
        /// <summary>
        /// Returns a float4 from component-wise application of Add (lhs + rhs).
        /// </summary>
        public static Vector4 Add(float lhs, Vector4 rhs) => Vector4(lhs + rhs.x, lhs + rhs.y, lhs + rhs.z, lhs + rhs.w);
        
        /// <summary>
        /// Returns a float from the application of Add (lhs + rhs).
        /// </summary>
        public static Vector4 Add(float lhs, float rhs) => Vector4(lhs + rhs);
        
        /// <summary>
        /// Returns a float4 from component-wise application of Sub (lhs - rhs).
        /// </summary>
        public static Vector4 Sub(Vector4 lhs, Vector4 rhs) => Vector4(lhs.x - rhs.x, lhs.y - rhs.y, lhs.z - rhs.z, lhs.w - rhs.w);
        
        /// <summary>
        /// Returns a float4 from component-wise application of Sub (lhs - rhs).
        /// </summary>
        public static Vector4 Sub(Vector4 lhs, float rhs) => Vector4(lhs.x - rhs, lhs.y - rhs, lhs.z - rhs, lhs.w - rhs);
        
        /// <summary>
        /// Returns a float4 from component-wise application of Sub (lhs - rhs).
        /// </summary>
        public static Vector4 Sub(float lhs, Vector4 rhs) => Vector4(lhs - rhs.x, lhs - rhs.y, lhs - rhs.z, lhs - rhs.w);
        
        /// <summary>
        /// Returns a float from the application of Sub (lhs - rhs).
        /// </summary>
        public static Vector4 Sub(float lhs, float rhs) => Vector4(lhs - rhs);
        
        /// <summary>
        /// Returns a float4 from component-wise application of Mul (lhs * rhs).
        /// </summary>
        public static Vector4 Mul(Vector4 lhs, Vector4 rhs) => Vector4(lhs.x * rhs.x, lhs.y * rhs.y, lhs.z * rhs.z, lhs.w * rhs.w);
        
        /// <summary>
        /// Returns a float4 from component-wise application of Mul (lhs * rhs).
        /// </summary>
        public static Vector4 Mul(Vector4 lhs, float rhs) => Vector4(lhs.x * rhs, lhs.y * rhs, lhs.z * rhs, lhs.w * rhs);
        
        /// <summary>
        /// Returns a float4 from component-wise application of Mul (lhs * rhs).
        /// </summary>
        public static Vector4 Mul(float lhs, Vector4 rhs) => Vector4(lhs * rhs.x, lhs * rhs.y, lhs * rhs.z, lhs * rhs.w);
        
        /// <summary>
        /// Returns a float from the application of Mul (lhs * rhs).
        /// </summary>
        public static Vector4 Mul(float lhs, float rhs) => Vector4(lhs * rhs);
        
        /// <summary>
        /// Returns a float4 from component-wise application of Div (lhs / rhs).
        /// </summary>
        public static Vector4 Div(Vector4 lhs, Vector4 rhs) => Vector4(lhs.x / rhs.x, lhs.y / rhs.y, lhs.z / rhs.z, lhs.w / rhs.w);
        
        /// <summary>
        /// Returns a float4 from component-wise application of Div (lhs / rhs).
        /// </summary>
        public static Vector4 Div(Vector4 lhs, float rhs) => Vector4(lhs.x / rhs, lhs.y / rhs, lhs.z / rhs, lhs.w / rhs);
        
        /// <summary>
        /// Returns a float4 from component-wise application of Div (lhs / rhs).
        /// </summary>
        public static Vector4 Div(float lhs, Vector4 rhs) => Vector4(lhs / rhs.x, lhs / rhs.y, lhs / rhs.z, lhs / rhs.w);
        
        /// <summary>
        /// Returns a float from the application of Div (lhs / rhs).
        /// </summary>
        public static Vector4 Div(float lhs, float rhs) => Vector4(lhs / rhs);
        
        /// <summary>
        /// Returns a float4 from component-wise application of Modulo (lhs % rhs).
        /// </summary>
        public static Vector4 Modulo(Vector4 lhs, Vector4 rhs) => Vector4(lhs.x % rhs.x, lhs.y % rhs.y, lhs.z % rhs.z, lhs.w % rhs.w);
        
        /// <summary>
        /// Returns a float4 from component-wise application of Modulo (lhs % rhs).
        /// </summary>
        public static Vector4 Modulo(Vector4 lhs, float rhs) => Vector4(lhs.x % rhs, lhs.y % rhs, lhs.z % rhs, lhs.w % rhs);
        
        /// <summary>
        /// Returns a float4 from component-wise application of Modulo (lhs % rhs).
        /// </summary>
        public static Vector4 Modulo(float lhs, Vector4 rhs) => Vector4(lhs % rhs.x, lhs % rhs.y, lhs % rhs.z, lhs % rhs.w);
        
        /// <summary>
        /// Returns a float from the application of Modulo (lhs % rhs).
        /// </summary>
        public static Vector4 Modulo(float lhs, float rhs) => Vector4(lhs % rhs);
        
        /// <summary>
        /// Returns a float4 from component-wise application of Degrees (Radians-To-Degrees Conversion).
        /// </summary>
        public static Vector4 Degrees(Vector4 v) => Vector4((float)(v.x * 57.295779513082320876798154814105170332405472466564321f), (float)(v.y * 57.295779513082320876798154814105170332405472466564321f), (float)(v.z * 57.295779513082320876798154814105170332405472466564321f), (float)(v.w * 57.295779513082320876798154814105170332405472466564321f));
        
        /// <summary>
        /// Returns a float from the application of Degrees (Radians-To-Degrees Conversion).
        /// </summary>
        public static Vector4 Degrees(float v) => Vector4((float)(v * 57.295779513082320876798154814105170332405472466564321f));
        
        /// <summary>
        /// Returns a float4 from component-wise application of Radians (Degrees-To-Radians Conversion).
        /// </summary>
        public static Vector4 Radians(Vector4 v) => Vector4((float)(v.x * 0.0174532925199432957692369076848861271344287188854172f), (float)(v.y * 0.0174532925199432957692369076848861271344287188854172f), (float)(v.z * 0.0174532925199432957692369076848861271344287188854172f), (float)(v.w * 0.0174532925199432957692369076848861271344287188854172f));
        
        /// <summary>
        /// Returns a float from the application of Radians (Degrees-To-Radians Conversion).
        /// </summary>
        public static Vector4 Radians(float v) => Vector4((float)(v * 0.0174532925199432957692369076848861271344287188854172f));
        
        /// <summary>
        /// Returns a float4 from component-wise application of Acos (System.Math.Acos(v)).
        /// </summary>
        public static Vector4 Acos(Vector4 v) => Vector4(System.Math.Acos(v.x), System.Math.Acos(v.y), System.Math.Acos(v.z), System.Math.Acos(v.w));
        
        /// <summary>
        /// Returns a float from the application of Acos (System.Math.Acos(v)).
        /// </summary>
        public static Vector4 Acos(float v) => Vector4(System.Math.Acos(v));
        
        /// <summary>
        /// Returns a float4 from component-wise application of Asin (System.Math.Asin(v)).
        /// </summary>
        public static Vector4 Asin(Vector4 v) => Vector4(System.Math.Asin(v.x), System.Math.Asin(v.y), System.Math.Asin(v.z), System.Math.Asin(v.w));
        
        /// <summary>
        /// Returns a float from the application of Asin (System.Math.Asin(v)).
        /// </summary>
        public static Vector4 Asin(float v) => Vector4(System.Math.Asin(v));
        
        /// <summary>
        /// Returns a float4 from component-wise application of Atan (System.Math.Atan(v)).
        /// </summary>
        public static Vector4 Atan(Vector4 v) => Vector4(System.Math.Atan(v.x), System.Math.Atan(v.y), System.Math.Atan(v.z), System.Math.Atan(v.w));
        
        /// <summary>
        /// Returns a float from the application of Atan (System.Math.Atan(v)).
        /// </summary>
        public static Vector4 Atan(float v) => Vector4(System.Math.Atan(v));
        
        /// <summary>
        /// Returns a float4 from component-wise application of Cos (System.Math.Cos(v)).
        /// </summary>
        public static Vector4 Cos(Vector4 v) => Vector4(System.Math.Cos(v.x), System.Math.Cos(v.y), System.Math.Cos(v.z), System.Math.Cos(v.w));
        
        /// <summary>
        /// Returns a float from the application of Cos (System.Math.Cos(v)).
        /// </summary>
        public static Vector4 Cos(float v) => Vector4(System.Math.Cos(v));
        
        /// <summary>
        /// Returns a float4 from component-wise application of Cosh (System.Math.Cosh(v)).
        /// </summary>
        public static Vector4 Cosh(Vector4 v) => Vector4(System.Math.Cosh(v.x), System.Math.Cosh(v.y), System.Math.Cosh(v.z), System.Math.Cosh(v.w));
        
        /// <summary>
        /// Returns a float from the application of Cosh (System.Math.Cosh(v)).
        /// </summary>
        public static Vector4 Cosh(float v) => Vector4(System.Math.Cosh(v));
        
        /// <summary>
        /// Returns a float4 from component-wise application of Exp (System.Math.Exp(v)).
        /// </summary>
        public static Vector4 Exp(Vector4 v) => Vector4(System.Math.Exp(v.x), System.Math.Exp(v.y), System.Math.Exp(v.z), System.Math.Exp(v.w));
        
        /// <summary>
        /// Returns a float from the application of Exp (System.Math.Exp(v)).
        /// </summary>
        public static Vector4 Exp(float v) => Vector4(System.Math.Exp(v));
        
        /// <summary>
        /// Returns a float4 from component-wise application of Log (System.Math.Log(v)).
        /// </summary>
        public static Vector4 Log(Vector4 v) => Vector4(System.Math.Log(v.x), System.Math.Log(v.y), System.Math.Log(v.z), System.Math.Log(v.w));
        
        /// <summary>
        /// Returns a float from the application of Log (System.Math.Log(v)).
        /// </summary>
        public static Vector4 Log(float v) => Vector4(System.Math.Log(v));
        
        /// <summary>
        /// Returns a float4 from component-wise application of Log2 (System.Math.Log(v, 2)).
        /// </summary>
        public static Vector4 Log2(Vector4 v) => Vector4(System.Math.Log(v.x, 2), System.Math.Log(v.y, 2), System.Math.Log(v.z, 2), System.Math.Log(v.w, 2));
        
        /// <summary>
        /// Returns a float from the application of Log2 (System.Math.Log(v, 2)).
        /// </summary>
        public static Vector4 Log2(float v) => Vector4(System.Math.Log(v, 2));
        
        /// <summary>
        /// Returns a float4 from component-wise application of Log10 (System.Math.Log10(v)).
        /// </summary>
        public static Vector4 Log10(Vector4 v) => Vector4(System.Math.Log10(v.x), System.Math.Log10(v.y), System.Math.Log10(v.z), System.Math.Log10(v.w));
        
        /// <summary>
        /// Returns a float from the application of Log10 (System.Math.Log10(v)).
        /// </summary>
        public static Vector4 Log10(float v) => Vector4(System.Math.Log10(v));
        
        /// <summary>
        /// Returns a float4 from component-wise application of Floor (System.Math.Floor(v)).
        /// </summary>
        public static Vector4 Floor(Vector4 v) => Vector4(System.Math.Floor(v.x), System.Math.Floor(v.y), System.Math.Floor(v.z), System.Math.Floor(v.w));
        
        /// <summary>
        /// Returns a float from the application of Floor (System.Math.Floor(v)).
        /// </summary>
        public static Vector4 Floor(float v) => Vector4(System.Math.Floor(v));
        
        /// <summary>
        /// Returns a float4 from component-wise application of Ceiling (System.Math.Ceiling(v)).
        /// </summary>
        public static Vector4 Ceiling(Vector4 v) => Vector4(System.Math.Ceiling(v.x), System.Math.Ceiling(v.y), System.Math.Ceiling(v.z), System.Math.Ceiling(v.w));
        
        /// <summary>
        /// Returns a float from the application of Ceiling (System.Math.Ceiling(v)).
        /// </summary>
        public static Vector4 Ceiling(float v) => Vector4(System.Math.Ceiling(v));
        
        /// <summary>
        /// Returns a float4 from component-wise application of Round (System.Math.Round(v)).
        /// </summary>
        public static Vector4 Round(Vector4 v) => Vector4(System.Math.Round(v.x), System.Math.Round(v.y), System.Math.Round(v.z), System.Math.Round(v.w));
        
        /// <summary>
        /// Returns a float from the application of Round (System.Math.Round(v)).
        /// </summary>
        public static Vector4 Round(float v) => Vector4(System.Math.Round(v));
        
        /// <summary>
        /// Returns a float4 from component-wise application of Sin (System.Math.Sin(v)).
        /// </summary>
        public static Vector4 Sin(Vector4 v) => Vector4(System.Math.Sin(v.x), System.Math.Sin(v.y), System.Math.Sin(v.z), System.Math.Sin(v.w));
        
        /// <summary>
        /// Returns a float from the application of Sin (System.Math.Sin(v)).
        /// </summary>
        public static Vector4 Sin(float v) => Vector4(System.Math.Sin(v));
        
        /// <summary>
        /// Returns a float4 from component-wise application of Sinh (System.Math.Sinh(v)).
        /// </summary>
        public static Vector4 Sinh(Vector4 v) => Vector4(System.Math.Sinh(v.x), System.Math.Sinh(v.y), System.Math.Sinh(v.z), System.Math.Sinh(v.w));
        
        /// <summary>
        /// Returns a float from the application of Sinh (System.Math.Sinh(v)).
        /// </summary>
        public static Vector4 Sinh(float v) => Vector4(System.Math.Sinh(v));
        
        /// <summary>
        /// Returns a float4 from component-wise application of Tan (System.Math.Tan(v)).
        /// </summary>
        public static Vector4 Tan(Vector4 v) => Vector4(System.Math.Tan(v.x), System.Math.Tan(v.y), System.Math.Tan(v.z), System.Math.Tan(v.w));
        
        /// <summary>
        /// Returns a float from the application of Tan (System.Math.Tan(v)).
        /// </summary>
        public static Vector4 Tan(float v) => Vector4(System.Math.Tan(v));
        
        /// <summary>
        /// Returns a float4 from component-wise application of Tanh (System.Math.Tanh(v)).
        /// </summary>
        public static Vector4 Tanh(Vector4 v) => Vector4(System.Math.Tanh(v.x), System.Math.Tanh(v.y), System.Math.Tanh(v.z), System.Math.Tanh(v.w));
        
        /// <summary>
        /// Returns a float from the application of Tanh (System.Math.Tanh(v)).
        /// </summary>
        public static Vector4 Tanh(float v) => Vector4(System.Math.Tanh(v));
        
        /// <summary>
        /// Returns a float4 from component-wise application of Truncate (System.Math.Truncate(v)).
        /// </summary>
        public static Vector4 Truncate(Vector4 v) => Vector4(System.Math.Truncate(v.x), System.Math.Truncate(v.y), System.Math.Truncate(v.z), System.Math.Truncate(v.w));
        
        /// <summary>
        /// Returns a float from the application of Truncate (System.Math.Truncate(v)).
        /// </summary>
        public static Vector4 Truncate(float v) => Vector4(System.Math.Truncate(v));
        
        /// <summary>
        /// Returns a float4 from component-wise application of Fract ((v - System.Math.Floor(v))).
        /// </summary>
        public static Vector4 Fract(Vector4 v) => Vector4((v.x - System.Math.Floor(v.x)), (v.y - System.Math.Floor(v.y)), (v.z - System.Math.Floor(v.z)), (v.w - System.Math.Floor(v.w)));
        
        /// <summary>
        /// Returns a float from the application of Fract ((v - System.Math.Floor(v))).
        /// </summary>
        public static Vector4 Fract(float v) => Vector4((v - System.Math.Floor(v)));
        
        /// <summary>
        /// Returns a float4 from component-wise application of TruncateFast ((int64)(v)).
        /// </summary>
        public static Vector4 TruncateFast(Vector4 v) => Vector4((int64)(v.x), (int64)(v.y), (int64)(v.z), (int64)(v.w));
        
        /// <summary>
        /// Returns a float from the application of TruncateFast ((int64)(v)).
        /// </summary>
        public static Vector4 TruncateFast(float v) => Vector4((int64)(v));
        
        /// <summary>
        /// Returns a float4 with independent and identically distributed uniform values between 'minValue' and 'maxValue'.
        /// </summary>
        public static Vector4 Random(Random random, Vector4 minValue, Vector4 maxValue) => Vector4((float)random.NextDouble() * (maxValue.x - minValue.x) + minValue.x, (float)random.NextDouble() * (maxValue.y - minValue.y) + minValue.y, (float)random.NextDouble() * (maxValue.z - minValue.z) + minValue.z, (float)random.NextDouble() * (maxValue.w - minValue.w) + minValue.w);
        
        /// <summary>
        /// Returns a float4 with independent and identically distributed uniform values between 'minValue' and 'maxValue'.
        /// </summary>
        public static Vector4 Random(Random random, Vector4 minValue, float maxValue) => Vector4((float)random.NextDouble() * (maxValue - minValue.x) + minValue.x, (float)random.NextDouble() * (maxValue - minValue.y) + minValue.y, (float)random.NextDouble() * (maxValue - minValue.z) + minValue.z, (float)random.NextDouble() * (maxValue - minValue.w) + minValue.w);
        
        /// <summary>
        /// Returns a float4 with independent and identically distributed uniform values between 'minValue' and 'maxValue'.
        /// </summary>
        public static Vector4 Random(Random random, float minValue, Vector4 maxValue) => Vector4((float)random.NextDouble() * (maxValue.x - minValue) + minValue, (float)random.NextDouble() * (maxValue.y - minValue) + minValue, (float)random.NextDouble() * (maxValue.z - minValue) + minValue, (float)random.NextDouble() * (maxValue.w - minValue) + minValue);
        
        /// <summary>
        /// Returns a float4 with independent and identically distributed uniform values between 'minValue' and 'maxValue'.
        /// </summary>
        public static Vector4 Random(Random random, float minValue, float maxValue) => Vector4((float)random.NextDouble() * (maxValue - minValue) + minValue);
        
        /// <summary>
        /// Returns a float4 with independent and identically distributed uniform values between 'minValue' and 'maxValue'.
        /// </summary>
        public static Vector4 RandomUniform(Random random, Vector4 minValue, Vector4 maxValue) => Vector4((float)random.NextDouble() * (maxValue.x - minValue.x) + minValue.x, (float)random.NextDouble() * (maxValue.y - minValue.y) + minValue.y, (float)random.NextDouble() * (maxValue.z - minValue.z) + minValue.z, (float)random.NextDouble() * (maxValue.w - minValue.w) + minValue.w);
        
        /// <summary>
        /// Returns a float4 with independent and identically distributed uniform values between 'minValue' and 'maxValue'.
        /// </summary>
        public static Vector4 RandomUniform(Random random, Vector4 minValue, float maxValue) => Vector4((float)random.NextDouble() * (maxValue - minValue.x) + minValue.x, (float)random.NextDouble() * (maxValue - minValue.y) + minValue.y, (float)random.NextDouble() * (maxValue - minValue.z) + minValue.z, (float)random.NextDouble() * (maxValue - minValue.w) + minValue.w);
        
        /// <summary>
        /// Returns a float4 with independent and identically distributed uniform values between 'minValue' and 'maxValue'.
        /// </summary>
        public static Vector4 RandomUniform(Random random, float minValue, Vector4 maxValue) => Vector4((float)random.NextDouble() * (maxValue.x - minValue) + minValue, (float)random.NextDouble() * (maxValue.y - minValue) + minValue, (float)random.NextDouble() * (maxValue.z - minValue) + minValue, (float)random.NextDouble() * (maxValue.w - minValue) + minValue);
        
        /// <summary>
        /// Returns a float4 with independent and identically distributed uniform values between 'minValue' and 'maxValue'.
        /// </summary>
        public static Vector4 RandomUniform(Random random, float minValue, float maxValue) => Vector4((float)random.NextDouble() * (maxValue - minValue) + minValue);
        
        /// <summary>
        /// Returns a float4 with independent and identically distributed values according to a normal/Gaussian distribution with specified mean and variance.
        /// </summary>
        public static Vector4 RandomNormal(Random random, Vector4 mean, Vector4 variance) => Vector4((float)(System.Math.Sqrt((double)variance.x) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean.x, (float)(System.Math.Sqrt((double)variance.y) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean.y, (float)(System.Math.Sqrt((double)variance.z) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean.z, (float)(System.Math.Sqrt((double)variance.w) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean.w);
        
        /// <summary>
        /// Returns a float4 with independent and identically distributed values according to a normal/Gaussian distribution with specified mean and variance.
        /// </summary>
        public static Vector4 RandomNormal(Random random, Vector4 mean, float variance) => Vector4((float)(System.Math.Sqrt((double)variance) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean.x, (float)(System.Math.Sqrt((double)variance) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean.y, (float)(System.Math.Sqrt((double)variance) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean.z, (float)(System.Math.Sqrt((double)variance) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean.w);
        
        /// <summary>
        /// Returns a float4 with independent and identically distributed values according to a normal/Gaussian distribution with specified mean and variance.
        /// </summary>
        public static Vector4 RandomNormal(Random random, float mean, Vector4 variance) => Vector4((float)(System.Math.Sqrt((double)variance.x) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean, (float)(System.Math.Sqrt((double)variance.y) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean, (float)(System.Math.Sqrt((double)variance.z) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean, (float)(System.Math.Sqrt((double)variance.w) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean);
        
        /// <summary>
        /// Returns a float4 with independent and identically distributed values according to a normal/Gaussian distribution with specified mean and variance.
        /// </summary>
        public static Vector4 RandomNormal(Random random, float mean, float variance) => Vector4((float)(System.Math.Sqrt((double)variance) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean);
        
        /// <summary>
        /// Returns a float4 with independent and identically distributed values according to a normal/Gaussian distribution with specified mean and variance.
        /// </summary>
        public static Vector4 RandomGaussian(Random random, Vector4 mean, Vector4 variance) => Vector4((float)(System.Math.Sqrt((double)variance.x) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean.x, (float)(System.Math.Sqrt((double)variance.y) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean.y, (float)(System.Math.Sqrt((double)variance.z) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean.z, (float)(System.Math.Sqrt((double)variance.w) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean.w);
        
        /// <summary>
        /// Returns a float4 with independent and identically distributed values according to a normal/Gaussian distribution with specified mean and variance.
        /// </summary>
        public static Vector4 RandomGaussian(Random random, Vector4 mean, float variance) => Vector4((float)(System.Math.Sqrt((double)variance) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean.x, (float)(System.Math.Sqrt((double)variance) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean.y, (float)(System.Math.Sqrt((double)variance) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean.z, (float)(System.Math.Sqrt((double)variance) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean.w);
        
        /// <summary>
        /// Returns a float4 with independent and identically distributed values according to a normal/Gaussian distribution with specified mean and variance.
        /// </summary>
        public static Vector4 RandomGaussian(Random random, float mean, Vector4 variance) => Vector4((float)(System.Math.Sqrt((double)variance.x) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean, (float)(System.Math.Sqrt((double)variance.y) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean, (float)(System.Math.Sqrt((double)variance.z) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean, (float)(System.Math.Sqrt((double)variance.w) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean);
        
        /// <summary>
        /// Returns a float4 with independent and identically distributed values according to a normal/Gaussian distribution with specified mean and variance.
        /// </summary>
        public static Vector4 RandomGaussian(Random random, float mean, float variance) => Vector4((float)(System.Math.Sqrt((double)variance) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean);

        //#endregion


        //#region Component-Wise Operator Overloads
        
        /// <summary>
        /// Returns a bool4 from component-wise application of operator&lt; (lhs &lt; rhs).
        /// </summary>
        /*public static bool4 operator<(float4 lhs, float4 rhs) => bool4(lhs.x < rhs.x, lhs.y < rhs.y, lhs.z < rhs.z, lhs.w < rhs.w);
        
        /// <summary>
        /// Returns a bool4 from component-wise application of operator&lt; (lhs &lt; rhs).
        /// </summary>
        public static bool4 operator<(float4 lhs, float rhs) => bool4(lhs.x < rhs, lhs.y < rhs, lhs.z < rhs, lhs.w < rhs);
        
        /// <summary>
        /// Returns a bool4 from component-wise application of operator&lt; (lhs &lt; rhs).
        /// </summary>
        public static bool4 operator<(float lhs, float4 rhs) => bool4(lhs < rhs.x, lhs < rhs.y, lhs < rhs.z, lhs < rhs.w);
        
        /// <summary>
        /// Returns a bool4 from component-wise application of operator&lt;= (lhs &lt;= rhs).
        /// </summary>
        public static bool4 operator<=(float4 lhs, float4 rhs) => bool4(lhs.x <= rhs.x, lhs.y <= rhs.y, lhs.z <= rhs.z, lhs.w <= rhs.w);
        
        /// <summary>
        /// Returns a bool4 from component-wise application of operator&lt;= (lhs &lt;= rhs).
        /// </summary>
        public static bool4 operator<=(float4 lhs, float rhs) => bool4(lhs.x <= rhs, lhs.y <= rhs, lhs.z <= rhs, lhs.w <= rhs);
        
        /// <summary>
        /// Returns a bool4 from component-wise application of operator&lt;= (lhs &lt;= rhs).
        /// </summary>
        public static bool4 operator<=(float lhs, float4 rhs) => bool4(lhs <= rhs.x, lhs <= rhs.y, lhs <= rhs.z, lhs <= rhs.w);
        
        /// <summary>
        /// Returns a bool4 from component-wise application of operator&gt; (lhs &gt; rhs).
        /// </summary>
        public static bool4 operator>(float4 lhs, float4 rhs) => bool4(lhs.x > rhs.x, lhs.y > rhs.y, lhs.z > rhs.z, lhs.w > rhs.w);
        
        /// <summary>
        /// Returns a bool4 from component-wise application of operator&gt; (lhs &gt; rhs).
        /// </summary>
        public static bool4 operator>(float4 lhs, float rhs) => bool4(lhs.x > rhs, lhs.y > rhs, lhs.z > rhs, lhs.w > rhs);
        
        /// <summary>
        /// Returns a bool4 from component-wise application of operator&gt; (lhs &gt; rhs).
        /// </summary>
        public static bool4 operator>(float lhs, float4 rhs) => bool4(lhs > rhs.x, lhs > rhs.y, lhs > rhs.z, lhs > rhs.w);
        
        /// <summary>
        /// Returns a bool4 from component-wise application of operator&gt;= (lhs &gt;= rhs).
        /// </summary>
        public static bool4 operator>=(float4 lhs, float4 rhs) => bool4(lhs.x >= rhs.x, lhs.y >= rhs.y, lhs.z >= rhs.z, lhs.w >= rhs.w);
        
        /// <summary>
        /// Returns a bool4 from component-wise application of operator&gt;= (lhs &gt;= rhs).
        /// </summary>
        public static bool4 operator>=(float4 lhs, float rhs) => bool4(lhs.x >= rhs, lhs.y >= rhs, lhs.z >= rhs, lhs.w >= rhs);
        
        /// <summary>
        /// Returns a bool4 from component-wise application of operator&gt;= (lhs &gt;= rhs).
        /// </summary>
        public static bool4 operator>=(float lhs, float4 rhs) => bool4(lhs >= rhs.x, lhs >= rhs.y, lhs >= rhs.z, lhs >= rhs.w);*/
        
        /// <summary>
        /// Returns a float4 from component-wise application of operator+ (lhs + rhs).
        /// </summary>
        public static Vector4 operator+(Vector4 lhs, Vector4 rhs) => Vector4(lhs.x + rhs.x, lhs.y + rhs.y, lhs.z + rhs.z, lhs.w + rhs.w);
        
        /// <summary>
        /// Returns a float4 from component-wise application of operator+ (lhs + rhs).
        /// </summary>
        public static Vector4 operator+(Vector4 lhs, float rhs) => Vector4(lhs.x + rhs, lhs.y + rhs, lhs.z + rhs, lhs.w + rhs);
        
        /// <summary>
        /// Returns a float4 from component-wise application of operator+ (lhs + rhs).
        /// </summary>
        public static Vector4 operator+(float lhs, Vector4 rhs) => Vector4(lhs + rhs.x, lhs + rhs.y, lhs + rhs.z, lhs + rhs.w);
        
        /// <summary>
        /// Returns a float4 from component-wise application of operator- (lhs - rhs).
        /// </summary>
        public static Vector4 operator-(Vector4 lhs, Vector4 rhs) => Vector4(lhs.x - rhs.x, lhs.y - rhs.y, lhs.z - rhs.z, lhs.w - rhs.w);
        
        /// <summary>
        /// Returns a float4 from component-wise application of operator- (lhs - rhs).
        /// </summary>
        public static Vector4 operator-(Vector4 lhs, float rhs) => Vector4(lhs.x - rhs, lhs.y - rhs, lhs.z - rhs, lhs.w - rhs);
        
        /// <summary>
        /// Returns a float4 from component-wise application of operator- (lhs - rhs).
        /// </summary>
        public static Vector4 operator-(float lhs, Vector4 rhs) => Vector4(lhs - rhs.x, lhs - rhs.y, lhs - rhs.z, lhs - rhs.w);
        
        /// <summary>
        /// Returns a float4 from component-wise application of operator* (lhs * rhs).
        /// </summary>
        public static Vector4 operator*(Vector4 lhs, Vector4 rhs) => Vector4(lhs.x * rhs.x, lhs.y * rhs.y, lhs.z * rhs.z, lhs.w * rhs.w);
        
        /// <summary>
        /// Returns a float4 from component-wise application of operator* (lhs * rhs).
        /// </summary>
        public static Vector4 operator*(Vector4 lhs, float rhs) => Vector4(lhs.x * rhs, lhs.y * rhs, lhs.z * rhs, lhs.w * rhs);
        
        /// <summary>
        /// Returns a float4 from component-wise application of operator* (lhs * rhs).
        /// </summary>
        public static Vector4 operator*(float lhs, Vector4 rhs) => Vector4(lhs * rhs.x, lhs * rhs.y, lhs * rhs.z, lhs * rhs.w);
        
        /// <summary>
        /// Returns a float4 from component-wise application of operator/ (lhs / rhs).
        /// </summary>
        public static Vector4 operator/(Vector4 lhs, Vector4 rhs) => Vector4(lhs.x / rhs.x, lhs.y / rhs.y, lhs.z / rhs.z, lhs.w / rhs.w);
        
        /// <summary>
        /// Returns a float4 from component-wise application of operator/ (lhs / rhs).
        /// </summary>
        public static Vector4 operator/(Vector4 lhs, float rhs) => Vector4(lhs.x / rhs, lhs.y / rhs, lhs.z / rhs, lhs.w / rhs);
        
        /// <summary>
        /// Returns a float4 from component-wise application of operator/ (lhs / rhs).
        /// </summary>
        public static Vector4 operator/(float lhs, Vector4 rhs) => Vector4(lhs / rhs.x, lhs / rhs.y, lhs / rhs.z, lhs / rhs.w);
        
        /// <summary>
        /// Returns a float4 from component-wise application of operator- (-v).
        /// </summary>
        public static Vector4 operator-(Vector4 v) => Vector4(-v.x, -v.y, -v.z, -v.w);
        
        /// <summary>
        /// Returns a float4 from component-wise application of operator% (lhs % rhs).
        /// </summary>
        public static Vector4 operator%(Vector4 lhs, Vector4 rhs) => Vector4(lhs.x % rhs.x, lhs.y % rhs.y, lhs.z % rhs.z, lhs.w % rhs.w);
        
        /// <summary>
        /// Returns a float4 from component-wise application of operator% (lhs % rhs).
        /// </summary>
        public static Vector4 operator%(Vector4 lhs, float rhs) => Vector4(lhs.x % rhs, lhs.y % rhs, lhs.z % rhs, lhs.w % rhs);
        
        /// <summary>
        /// Returns a float4 from component-wise application of operator% (lhs % rhs).
        /// </summary>
        public static Vector4 operator%(float lhs, Vector4 rhs) => Vector4(lhs % rhs.x, lhs % rhs.y, lhs % rhs.z, lhs % rhs.w);

        //#endregion

    }
}
