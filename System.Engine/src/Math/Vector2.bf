namespace System.Math;


using System.Diagnostics;


[CRepr, Ordered, Packed, Union]
public struct Vector2 : IHashable
{

    //#region Fields
    
    /// <summary>
    /// component data
    /// </summary>
    public float[2] values;
    
    /// <summary>
    /// Returns an object that can be used for arbitrary swizzling (e.g. swizzle.zy)
    /// </summary>
    /*public readonly swizzle_float2 swizzle;*/

    //#endregion


    //#region Constructors
    
    /// <summary>
    /// Component-wise constructor
    /// </summary>
    public this(float x, float y)
    {
        values = .(x,y);
    }
    
    /// <summary>
    /// all-same-value constructor
    /// </summary>
    public this(float v)
    {
        values = .(v,v);
    }
    
    /// <summary>
    /// from-vector constructor
    /// </summary>
    public this(Vector2 v)
    {
        values = .(v.x,v.y);
    }
    
    /// <summary>
    /// from-vector constructor (additional fields are truncated)
    /// </summary>
    public this(Vector3 v)
    {
        values = .(v.x,v.y);
    }
    
    /// <summary>
    /// from-vector constructor (additional fields are truncated)
    /// </summary>
    public this(Vector4 v)
    {
        values = .(v.x,v.y);
    }
    
    /// <summary>
    /// From-array constructor (superfluous values are ignored, missing values are zero-filled).
    /// </summary>
    public this(float[] v)
    {
        let c = v.Count;
        values = .((c < 0) ? 0f : v[0],(c < 1) ? 0f : v[1]);
    }
    
    /// <summary>
    /// From-array constructor with base index (superfluous values are ignored, missing values are zero-filled).
    /// </summary>
    public this(float[] v, int startIndex)
    {
        let c = v.Count;
        values = .((c + startIndex < 0) ? 0f : v[0 + startIndex],(c + startIndex < 1) ? 0f : v[1 + startIndex]);
    }

    //#endregion


    //#region Implicit Operators
    
    /// <summary>
    /// Implicitly converts this to a double2.
    /// </summary>
    /*public static implicit operator double2(float2 v) =>  double2((double)v.x, (double)v.y);*/

    //#endregion


    //#region Explicit Operators
    
    /// <summary>
    /// Explicitly converts this to a int2.
    /// </summary>
    /*public static explicit operator int2(Vector2 v) =>  int2(int32(v.x), int32(v.y));*/
    
    /// <summary>
    /// Explicitly converts this to a int3. (Higher components are zeroed)
    /// </summary>
    /*public static explicit operator int3(Vector2 v) =>  int3(int32(v.x), int32(v.y), 0);*/
    
    /// <summary>
    /// Explicitly converts this to a int4. (Higher components are zeroed)
    /// </summary>
    /*public static explicit operator int4(float2 v) =>  int4((int)v.x, (int)v.y, 0, 0);*/
    
    /// <summary>
    /// Explicitly converts this to a uint2.
    /// </summary>
    /*public static explicit operator uint2(Vector2 v) =>  uint2((uint)v.x, (uint)v.y);*/
    
    /// <summary>
    /// Explicitly converts this to a uint3. (Higher components are zeroed)
    /// </summary>
    /*public static explicit operator uint3(float2 v) =>  uint3((uint)v.x, (uint)v.y, 0u);*/
    
    /// <summary>
    /// Explicitly converts this to a uint4. (Higher components are zeroed)
    /// </summary>
    /*public static explicit operator uint4(float2 v) =>  uint4((uint)v.x, (uint)v.y, 0u, 0u);*/
    
    /// <summary>
    /// Explicitly converts this to a float3. (Higher components are zeroed)
    /// </summary>
    public static explicit operator Vector3(Vector2 v) =>  Vector3((float)v.x, (float)v.y, 0f);
    
    /// <summary>
    /// Explicitly converts this to a float4. (Higher components are zeroed)
    /// </summary>
    public static explicit operator Vector4(Vector2 v) =>  Vector4((float)v.x, (float)v.y, 0f, 0f);
    
    /// <summary>
    /// Explicitly converts this to a double3. (Higher components are zeroed)
    /// </summary>
    /*public static explicit operator double3(float2 v) =>  double3((double)v.x, (double)v.y, 0.0);*/
    
    /// <summary>
    /// Explicitly converts this to a double4. (Higher components are zeroed)
    /// </summary>
    /*public static explicit operator double4(float2 v) =>  double4((double)v.x, (double)v.y, 0.0, 0.0);*/
    
    /// <summary>
    /// Explicitly converts this to a long2.
    /// </summary>
    /*public static explicit operator long2(float2 v) =>  long2((long)v.x, (long)v.y);*/
    
    /// <summary>
    /// Explicitly converts this to a long3. (Higher components are zeroed)
    /// </summary>
    /*public static explicit operator long3(float2 v) =>  long3((long)v.x, (long)v.y, 0);*/
    
    /// <summary>
    /// Explicitly converts this to a long4. (Higher components are zeroed)
    /// </summary>
    /*public static explicit operator long4(float2 v) =>  long4((long)v.x, (long)v.y, 0, 0);*/
    
    /// <summary>
    /// Explicitly converts this to a bool2.
    /// </summary>
    /*public static explicit operator bool2(float2 v) =>  bool2(v.x != 0f, v.y != 0f);*/
    
    /// <summary>
    /// Explicitly converts this to a bool3. (Higher components are zeroed)
    /// </summary>
    /*public static explicit operator bool3(float2 v) =>  bool3(v.x != 0f, v.y != 0f, false);*/
    
    /// <summary>
    /// Explicitly converts this to a bool4. (Higher components are zeroed)
    /// </summary>
    /*public static explicit operator bool4(float2 v) =>  bool4(v.x != 0f, v.y != 0f, false, false);*/

    //#endregion


    //#region Indexer
    
    /// <summary>
    /// Gets/Sets a specific indexed component (a bit slower than direct access).
    /// </summary>
    public float this[int index]
    {
        [Inline]get
        {
            System.Diagnostics.Debug.Assert(index >=0 && index < 2, "index out of range");
            unchecked { return values[index]; }
        }
        [Inline]set mut
        {
            System.Diagnostics.Debug.Assert(index >=0 && index < 2, "index out of range");
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
    /// 0-component
    /// </summary>
    public float width
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
    /// 1-component
    /// </summary>
    public float height
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
    /// Returns the number of components (2).
    /// </summary>
    public int Count => 2;
    
    /// <summary>
    /// Returns the minimal component of this vector.
    /// </summary>
    public float MinElement => System.Math.Min(x, y);
    
    /// <summary>
    /// Returns the maximal component of this vector.
    /// </summary>
    public float MaxElement => System.Math.Max(x, y);
    
    /// <summary>
    /// Returns the euclidean length of this vector.
    /// </summary>
    public float Length => (float)System.Math.Sqrt((x*x + y*y));
    
    /// <summary>
    /// Returns the squared euclidean length of this vector.
    /// </summary>
    public float LengthSqr => (x*x + y*y);
    
    /// <summary>
    /// Returns the sum of all components.
    /// </summary>
    public float Sum => (x + y);
    
    /// <summary>
    /// Returns the euclidean norm of this vector.
    /// </summary>
    public float Norm => (float)System.Math.Sqrt((x*x + y*y));
    
    /// <summary>
    /// Returns the one-norm of this vector.
    /// </summary>
    public float Norm1 => (System.Math.Abs(x) + System.Math.Abs(y));
    
    /// <summary>
    /// Returns the two-norm (euclidean length) of this vector.
    /// </summary>
    public float Norm2 => (float)System.Math.Sqrt((x*x + y*y));
    
    /// <summary>
    /// Returns the max-norm of this vector.
    /// </summary>
    public float NormMax => System.Math.Max(System.Math.Abs(x), System.Math.Abs(y));
    
    /// <summary>
    /// Returns a copy of this vector with length one (undefined if this has zero length).
    /// </summary>
    public Vector2 Normalized => this / (float)Length;
    
    /// <summary>
    /// Returns a copy of this vector with length one (returns zero if length is zero).
    /// </summary>
    public Vector2 NormalizedSafe => this == zero ? zero : this / (float)Length;
    
    /// <summary>
    /// Returns the vector angle (atan2(y, x)) in radians.
    /// </summary>
    public double Angle => System.Math.Atan2((double)y, (double)x);
    
    /// <summary>
    /// Returns a perpendicular vector.
    /// </summary>
    public Vector2 Perpendicular => Vector2(y, -x);

    //#endregion


    //#region Static Properties
    
    /// <summary>
    /// Predefined all-zero vector
    /// </summary>
    readonly public static Vector2 zero  =  Vector2(0f, 0f);
    
    /// <summary>
    /// Predefined all-ones vector
    /// </summary>
    readonly public static Vector2 one  =  Vector2(1f, 1f);
    
    /// <summary>
    /// Predefined unit-X vector
    /// </summary>
    readonly public static Vector2 UnitX  =  Vector2(1f, 0f);
    
    /// <summary>
    /// Predefined unit-X vector
    /// </summary>
    readonly public static Vector2 NegativeUnitX  =  Vector2(-1f, 0f);
    
    /// <summary>
    /// Predefined unit-Y vector
    /// </summary>
    readonly public static Vector2 UnitY  =  Vector2(0f, 1f);
    
    /// <summary>
    /// Predefined unit-Y vector
    /// </summary>
    readonly public static Vector2 NegativeUnitY  =  Vector2(0f, -1f);
    
    /// <summary>
    /// Predefined all-MaxValue vector
    /// </summary>
    readonly public static Vector2 MaxValue  =  Vector2(float.MaxValue, float.MaxValue);
    
    /// <summary>
    /// Predefined all-MinValue vector
    /// </summary>
    readonly public static Vector2 MinValue  =  Vector2(float.MinValue, float.MinValue);
    
    /// <summary>
    /// Predefined all-Epsilon vector
    /// </summary>
    readonly public static Vector2 Epsilon  =  Vector2(float.Epsilon, float.Epsilon);
    
    /// <summary>
    /// Predefined all-NaN vector
    /// </summary>
    readonly public static Vector2 NaN  =  Vector2(float.NaN, float.NaN);
    
    /// <summary>
    /// Predefined all-NegativeInfinity vector
    /// </summary>
    readonly public static Vector2 NegativeInfinity  =  Vector2(float.NegativeInfinity, float.NegativeInfinity);
    
    /// <summary>
    /// Predefined all-PositiveInfinity vector
    /// </summary>
    readonly public static Vector2 PositiveInfinity  =  Vector2(float.PositiveInfinity, float.PositiveInfinity);

    //#endregion


    //#region Operators
    
    /// <summary>
    /// Returns true if this equals rhs component-wise.
    /// </summary>
    public static bool operator==(Vector2 lhs, Vector2 rhs) => (lhs.x == rhs.x && lhs.y == rhs.y);
    
    /// <summary>
    /// Returns true if this does not equal rhs (component-wise).
    /// </summary>
    public static bool operator!=(Vector2 lhs, Vector2 rhs) => !(lhs.x == rhs.x && lhs.y == rhs.y);

    //#endregion


    //#region Functions
    
    /// <summary>
    /// Returns an array with all values
    /// </summary>
    public float[] ToArray() => new .[] ( x, y );
    
    /// <summary>
    /// Returns a string representation of this vector using ', ' as a seperator.
    /// </summary>
    public override void ToString(String stringBuffer) => ToString(stringBuffer, ", ");
    
    /// <summary>
    /// Returns a string representation of this vector using a provided seperator.
    /// </summary>
    public void ToString(String stringBuffer, String sep)
    {
        let _x = scope String(); values[0].ToString(_x);
        let _y = scope String(); values[1].ToString(_y);
         stringBuffer.Join(sep, _x,_y );
    }
    
    /// <summary>
    /// Returns a hash code for this instance.
    /// </summary>
    public int GetHashCode()
    {
        unchecked
        {
            return ((x.GetHashCode()) * 397) ^ y.GetHashCode();
        }
    }
    
    /// <summary>
    /// Returns the p-norm of this vector.
    /// </summary>
    public double NormP(double p) => System.Math.Pow((System.Math.Pow((double)System.Math.Abs(x), p) + System.Math.Pow((double)System.Math.Abs(y), p)), 1 / p);
    
    /// <summary>
    /// Returns a 2D vector that was rotated by a given angle in radians (CAUTION: result is casted and may be truncated).
    /// </summary>
    /*public float2 Rotated(double angleInRad) => (float2)(double2.FromAngle(Angle + angleInRad) * (double)Length);*/

    //#endregion


    //#region Static Functions
    
    /// <summary>
    /// Returns true iff distance between lhs and rhs is less than or equal to epsilon
    /// </summary>
    public static bool ApproxEqual(Vector2 lhs, Vector2 rhs, float eps = 0.1f) => Distance(lhs, rhs) <= eps;
    
    /// <summary>
    /// OuterProduct treats the first parameter c as a column vector (matrix with one column) and the second parameter r as a row vector (matrix with one row) and does a linear algebraic matrix multiply c * r, yielding a matrix whose number of rows is the number of components in c and whose number of columns is the number of components in r.
    /// </summary>
    /*public static float2x2 OuterProduct(float2 c, float2 r) =>  float2x2(c.x * r.x, c.y * r.x, c.x * r.y, c.y * r.y);*/
    
    /// <summary>
    /// OuterProduct treats the first parameter c as a column vector (matrix with one column) and the second parameter r as a row vector (matrix with one row) and does a linear algebraic matrix multiply c * r, yielding a matrix whose number of rows is the number of components in c and whose number of columns is the number of components in r.
    /// </summary>
    /*public static float2x3 OuterProduct(Vector3 c, float2 r) =>  float2x3(c.x * r.x, c.y * r.x, c.z * r.x, c.x * r.y, c.y * r.y, c.z * r.y);*/
    
    /// <summary>
    /// OuterProduct treats the first parameter c as a column vector (matrix with one column) and the second parameter r as a row vector (matrix with one row) and does a linear algebraic matrix multiply c * r, yielding a matrix whose number of rows is the number of components in c and whose number of columns is the number of components in r.
    /// </summary>
    /*public static float3x2 OuterProduct(float2 c, Vector3 r) =>  float3x2(c.x * r.x, c.y * r.x, c.x * r.y, c.y * r.y, c.x * r.z, c.y * r.z);*/
    
    /// <summary>
    /// OuterProduct treats the first parameter c as a column vector (matrix with one column) and the second parameter r as a row vector (matrix with one row) and does a linear algebraic matrix multiply c * r, yielding a matrix whose number of rows is the number of components in c and whose number of columns is the number of components in r.
    /// </summary>
    /*public static float2x4 OuterProduct(float4 c, float2 r) =>  float2x4(c.x * r.x, c.y * r.x, c.z * r.x, c.w * r.x, c.x * r.y, c.y * r.y, c.z * r.y, c.w * r.y);*/
    
    /// <summary>
    /// OuterProduct treats the first parameter c as a column vector (matrix with one column) and the second parameter r as a row vector (matrix with one row) and does a linear algebraic matrix multiply c * r, yielding a matrix whose number of rows is the number of components in c and whose number of columns is the number of components in r.
    /// </summary>
    /*public static float4x2 OuterProduct(float2 c, float4 r) =>  float4x2(c.x * r.x, c.y * r.x, c.x * r.y, c.y * r.y, c.x * r.z, c.y * r.z, c.x * r.w, c.y * r.w);*/
    
    /// <summary>
    /// Returns a unit 2D vector with a given angle in radians (CAUTION: result may be truncated for integer types).
    /// </summary>
    public static Vector2 FromAngle(double angleInRad) =>  Vector2((float)System.Math.Cos(angleInRad), (float)System.Math.Sin(angleInRad));
    
    /// <summary>
    /// Returns the inner product (dot product, scalar product) of the two vectors.
    /// </summary>
    public static float Dot(Vector2 lhs, Vector2 rhs) => (lhs.x * rhs.x + lhs.y * rhs.y);
    
    /// <summary>
    /// Returns the euclidean distance between the two vectors.
    /// </summary>
    public static float Distance(Vector2 lhs, Vector2 rhs) => (lhs - rhs).Length;
    
    /// <summary>
    /// Returns the squared euclidean distance between the two vectors.
    /// </summary>
    public static float DistanceSqr(Vector2 lhs, Vector2 rhs) => (lhs - rhs).LengthSqr;
    
    /// <summary>
    /// Calculate the reflection direction for an incident vector (N should be normalized in order to achieve the desired result).
    /// </summary>
    public static Vector2 Reflect(Vector2 I, Vector2 N) => I - 2 * Dot(N, I) * N;
    
    /// <summary>
    /// Calculate the refraction direction for an incident vector (The input parameters I and N should be normalized in order to achieve the desired result).
    /// </summary>
    public static Vector2 Refract(Vector2 I, Vector2 N, float eta)
    {
        let dNI = Dot(N, I);
        let k = 1 - eta * eta * (1 - dNI * dNI);
        if (k < 0) return zero;
        return eta * I - (eta * dNI + (float)System.Math.Sqrt(k)) * N;
    }
    
    /// <summary>
    /// Returns a vector pointing in the same direction as another (faceforward orients a vector to point away from a surface as defined by its normal. If dot(Nref, I) is negative faceforward returns N, otherwise it returns -N).
    /// </summary>
    public static Vector2 FaceForward(Vector2 N, Vector2 I, Vector2 Nref) => Dot(Nref, I) < 0 ? N : -N;
    
    /// <summary>
    /// Returns the length of the outer product (cross product, vector product) of the two vectors.
    /// </summary>
    public static float Cross(Vector2 l, Vector2 r) => l.x * r.y - l.y * r.x;
    
    /// <summary>
    /// Returns a float2 with independent and identically distributed uniform values between 0.0 and 1.0.
    /// </summary>
    public static Vector2 Random(Random random) =>  Vector2((float)random.NextDouble(), (float)random.NextDouble());
    
    /// <summary>
    /// Returns a float2 with independent and identically distributed uniform values between -1.0 and 1.0.
    /// </summary>
    public static Vector2 RandomSigned(Random random) =>  Vector2((float)(random.NextDouble() * 2.0 - 1.0), (float)(random.NextDouble() * 2.0 - 1.0));
    
    /// <summary>
    /// Returns a float2 with independent and identically distributed values according to a normal distribution (zero mean, unit variance).
    /// </summary>
    public static Vector2 RandomNormal(Random random) =>  Vector2((float)(System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))), (float)(System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))));

    //#endregion


    //#region Component-Wise Static Functions
    
    /// <summary>
    /// Returns a bool2 from component-wise application of Equal (lhs == rhs).
    /// </summary>
    /*public static bool2 Equal(float2 lhs, float2 rhs) => bool2(lhs.x == rhs.x, lhs.y == rhs.y);*/
    
    /// <summary>
    /// Returns a bool2 from component-wise application of Equal (lhs == rhs).
    /// </summary>
    /*public static bool2 Equal(float2 lhs, float rhs) => bool2(lhs.x == rhs, lhs.y == rhs);*/
    
    /// <summary>
    /// Returns a bool2 from component-wise application of Equal (lhs == rhs).
    /// </summary>
    /*public static bool2 Equal(float lhs, float2 rhs) => bool2(lhs == rhs.x, lhs == rhs.y);*/
    
    /// <summary>
    /// Returns a bool from the application of Equal (lhs == rhs).
    /// </summary>
    /*public static bool2 Equal(float lhs, float rhs) => bool2(lhs == rhs);*/
    
    /// <summary>
    /// Returns a bool2 from component-wise application of NotEqual (lhs != rhs).
    /// </summary>
    /*public static bool2 NotEqual(float2 lhs, float2 rhs) => bool2(lhs.x != rhs.x, lhs.y != rhs.y);*/
    
    /// <summary>
    /// Returns a bool2 from component-wise application of NotEqual (lhs != rhs).
    /// </summary>
    /*public static bool2 NotEqual(float2 lhs, float rhs) => bool2(lhs.x != rhs, lhs.y != rhs);*/
    
    /// <summary>
    /// Returns a bool2 from component-wise application of NotEqual (lhs != rhs).
    /// </summary>
    /*public static bool2 NotEqual(float lhs, float2 rhs) => bool2(lhs != rhs.x, lhs != rhs.y);*/
    
    /// <summary>
    /// Returns a bool from the application of NotEqual (lhs != rhs).
    /// </summary>
    /*public static bool2 NotEqual(float lhs, float rhs) => bool2(lhs != rhs);*/
    
    /// <summary>
    /// Returns a bool2 from component-wise application of GreaterThan (lhs &gt; rhs).
    /// </summary>
    /*public static bool2 GreaterThan(float2 lhs, float2 rhs) => bool2(lhs.x > rhs.x, lhs.y > rhs.y);*/
    
    /// <summary>
    /// Returns a bool2 from component-wise application of GreaterThan (lhs &gt; rhs).
    /// </summary>
    /*public static bool2 GreaterThan(float2 lhs, float rhs) => bool2(lhs.x > rhs, lhs.y > rhs);*/
    
    /// <summary>
    /// Returns a bool2 from component-wise application of GreaterThan (lhs &gt; rhs).
    /// </summary>
    /*public static bool2 GreaterThan(float lhs, float2 rhs) => bool2(lhs > rhs.x, lhs > rhs.y);*/
    
    /// <summary>
    /// Returns a bool from the application of GreaterThan (lhs &gt; rhs).
    /// </summary>
    /*public static bool2 GreaterThan(float lhs, float rhs) => bool2(lhs > rhs);*/
    
    /// <summary>
    /// Returns a bool2 from component-wise application of GreaterThanEqual (lhs &gt;= rhs).
    /// </summary>
    /*public static bool2 GreaterThanEqual(float2 lhs, float2 rhs) => bool2(lhs.x >= rhs.x, lhs.y >= rhs.y);*/
    
    /// <summary>
    /// Returns a bool2 from component-wise application of GreaterThanEqual (lhs &gt;= rhs).
    /// </summary>
    /*public static bool2 GreaterThanEqual(float2 lhs, float rhs) => bool2(lhs.x >= rhs, lhs.y >= rhs);*/
    
    /// <summary>
    /// Returns a bool2 from component-wise application of GreaterThanEqual (lhs &gt;= rhs).
    /// </summary>
    /*public static bool2 GreaterThanEqual(float lhs, float2 rhs) => bool2(lhs >= rhs.x, lhs >= rhs.y);*/
    
    /// <summary>
    /// Returns a bool from the application of GreaterThanEqual (lhs &gt;= rhs).
    /// </summary>
    /*public static bool2 GreaterThanEqual(float lhs, float rhs) => bool2(lhs >= rhs);*/
    
    /// <summary>
    /// Returns a bool2 from component-wise application of LesserThan (lhs &lt; rhs).
    /// </summary>
    /*public static bool2 LesserThan(float2 lhs, float2 rhs) => bool2(lhs.x < rhs.x, lhs.y < rhs.y);*/
    
    /// <summary>
    /// Returns a bool2 from component-wise application of LesserThan (lhs &lt; rhs).
    /// </summary>
    /*public static bool2 LesserThan(float2 lhs, float rhs) => bool2(lhs.x < rhs, lhs.y < rhs);*/
    
    /// <summary>
    /// Returns a bool2 from component-wise application of LesserThan (lhs &lt; rhs).
    /// </summary>
    /*public static bool2 LesserThan(float lhs, float2 rhs) => bool2(lhs < rhs.x, lhs < rhs.y);*/
    
    /// <summary>
    /// Returns a bool from the application of LesserThan (lhs &lt; rhs).
    /// </summary>
    /*public static bool2 LesserThan(float lhs, float rhs) => bool2(lhs < rhs);*/
    
    /// <summary>
    /// Returns a bool2 from component-wise application of LesserThanEqual (lhs &lt;= rhs).
    /// </summary>
    /*public static bool2 LesserThanEqual(float2 lhs, float2 rhs) => bool2(lhs.x <= rhs.x, lhs.y <= rhs.y);*/
    
    /// <summary>
    /// Returns a bool2 from component-wise application of LesserThanEqual (lhs &lt;= rhs).
    /// </summary>
    /*public static bool2 LesserThanEqual(float2 lhs, float rhs) => bool2(lhs.x <= rhs, lhs.y <= rhs);*/
    
    /// <summary>
    /// Returns a bool2 from component-wise application of LesserThanEqual (lhs &lt;= rhs).
    /// </summary>
    /*public static bool2 LesserThanEqual(float lhs, float2 rhs) => bool2(lhs <= rhs.x, lhs <= rhs.y);*/
    
    /// <summary>
    /// Returns a bool from the application of LesserThanEqual (lhs &lt;= rhs).
    /// </summary>
    /*public static bool2 LesserThanEqual(float lhs, float rhs) => bool2(lhs <= rhs);*/
    
    /// <summary>
    /// Returns a bool2 from component-wise application of IsInfinity (v.IsInfinity).
    /// </summary>
    /*public static bool2 IsInfinity(float2 v) => bool2(v.x.IsInfinity, v.y.IsInfinity);*/
    
    /// <summary>
    /// Returns a bool from the application of IsInfinity (v.IsInfinity).
    /// </summary>
    /*public static bool2 IsInfinity(float v) => bool2(v.IsInfinity);*/
    
    /// <summary>
    /// Returns a bool2 from component-wise application of IsFinite (v.IsFinite).
    /// </summary>
    /*public static bool2 IsFinite(float2 v) => bool2(v.x.IsFinite, v.y.IsFinite);*/
    
    /// <summary>
    /// Returns a bool from the application of IsFinite (v.IsFinite).
    /// </summary>
    /*public static bool2 IsFinite(float v) => bool2(v.IsFinite);*/
    
    /// <summary>
    /// Returns a bool2 from component-wise application of IsNaN (v.IsNaN).
    /// </summary>
    /*public static bool2 IsNaN(float2 v) => bool2(v.x.IsNaN, v.y.IsNaN);*/
    
    /// <summary>
    /// Returns a bool from the application of IsNaN (v.IsNaN).
    /// </summary>
    /*public static bool2 IsNaN(float v) => bool2(v.IsNaN);*/
    
    /// <summary>
    /// Returns a bool2 from component-wise application of IsNegativeInfinity (v.IsNegativeInfinity).
    /// </summary>
    /*public static bool2 IsNegativeInfinity(float2 v) => bool2(v.x.IsNegativeInfinity, v.y.IsNegativeInfinity);*/
    
    /// <summary>
    /// Returns a bool from the application of IsNegativeInfinity (v.IsNegativeInfinity).
    /// </summary>
    /*public static bool2 IsNegativeInfinity(float v) => bool2(v.IsNegativeInfinity);*/
    
    /// <summary>
    /// Returns a bool2 from component-wise application of IsPositiveInfinity (v.IsPositiveInfinity).
    /// </summary>
    /*public static bool2 IsPositiveInfinity(float2 v) => bool2(v.x.IsPositiveInfinity, v.y.IsPositiveInfinity);*/
    
    /// <summary>
    /// Returns a bool from the application of IsPositiveInfinity (v.IsPositiveInfinity).
    /// </summary>
    /*public static bool2 IsPositiveInfinity(float v) => bool2(v.IsPositiveInfinity);*/
    
    /// <summary>
    /// Returns a float2 from component-wise application of Abs (System.Math.Abs(v)).
    /// </summary>
    public static Vector2 Abs(Vector2 v) => Vector2(System.Math.Abs(v.x), System.Math.Abs(v.y));
    
    /// <summary>
    /// Returns a float from the application of Abs (System.Math.Abs(v)).
    /// </summary>
    public static Vector2 Abs(float v) => Vector2(System.Math.Abs(v));
    
    /// <summary>
    /// Returns a float2 from component-wise application of HermiteInterpolationOrder3 ((3 - 2 * v) * v * v).
    /// </summary>
    public static Vector2 HermiteInterpolationOrder3(Vector2 v) => Vector2((3 - 2 * v.x) * v.x * v.x, (3 - 2 * v.y) * v.y * v.y);
    
    /// <summary>
    /// Returns a float from the application of HermiteInterpolationOrder3 ((3 - 2 * v) * v * v).
    /// </summary>
    public static Vector2 HermiteInterpolationOrder3(float v) => Vector2((3 - 2 * v) * v * v);
    
    /// <summary>
    /// Returns a float2 from component-wise application of HermiteInterpolationOrder5 (((6 * v - 15) * v + 10) * v * v * v).
    /// </summary>
    public static Vector2 HermiteInterpolationOrder5(Vector2 v) => Vector2(((6 * v.x - 15) * v.x + 10) * v.x * v.x * v.x, ((6 * v.y - 15) * v.y + 10) * v.y * v.y * v.y);
    
    /// <summary>
    /// Returns a float from the application of HermiteInterpolationOrder5 (((6 * v - 15) * v + 10) * v * v * v).
    /// </summary>
    public static Vector2 HermiteInterpolationOrder5(float v) => Vector2(((6 * v - 15) * v + 10) * v * v * v);
    
    /// <summary>
    /// Returns a float2 from component-wise application of Sqr (v * v).
    /// </summary>
    public static Vector2 Sqr(Vector2 v) => Vector2(v.x * v.x, v.y * v.y);
    
    /// <summary>
    /// Returns a float from the application of Sqr (v * v).
    /// </summary>
    public static Vector2 Sqr(float v) => Vector2(v * v);
    
    /// <summary>
    /// Returns a float2 from component-wise application of Pow2 (v * v).
    /// </summary>
    public static Vector2 Pow2(Vector2 v) => Vector2(v.x * v.x, v.y * v.y);
    
    /// <summary>
    /// Returns a float from the application of Pow2 (v * v).
    /// </summary>
    public static Vector2 Pow2(float v) => Vector2(v * v);
    
    /// <summary>
    /// Returns a float2 from component-wise application of Pow3 (v * v * v).
    /// </summary>
    public static Vector2 Pow3(Vector2 v) => Vector2(v.x * v.x * v.x, v.y * v.y * v.y);
    
    /// <summary>
    /// Returns a float from the application of Pow3 (v * v * v).
    /// </summary>
    public static Vector2 Pow3(float v) => Vector2(v * v * v);
    
    /// <summary>
    /// Returns a float2 from component-wise application of Step (v &gt;= 0f ? 1f : 0f).
    /// </summary>
    public static Vector2 Step(Vector2 v) => Vector2(v.x >= 0f ? 1f : 0f, v.y >= 0f ? 1f : 0f);
    
    /// <summary>
    /// Returns a float from the application of Step (v &gt;= 0f ? 1f : 0f).
    /// </summary>
    public static Vector2 Step(float v) => Vector2(v >= 0f ? 1f : 0f);
    
    /// <summary>
    /// Returns a float2 from component-wise application of Sqrt ((float)System.Math.Sqrt((double)v)).
    /// </summary>
    public static Vector2 Sqrt(Vector2 v) => Vector2((float)System.Math.Sqrt((double)v.x), (float)System.Math.Sqrt((double)v.y));
    
    /// <summary>
    /// Returns a float from the application of Sqrt ((float)System.Math.Sqrt((double)v)).
    /// </summary>
    public static Vector2 Sqrt(float v) => Vector2((float)System.Math.Sqrt((double)v));
    
    /// <summary>
    /// Returns a float2 from component-wise application of InverseSqrt ((float)(1.0 / System.Math.Sqrt((double)v))).
    /// </summary>
    public static Vector2 InverseSqrt(Vector2 v) => Vector2((float)(1.0 / System.Math.Sqrt((double)v.x)), (float)(1.0 / System.Math.Sqrt((double)v.y)));
    
    /// <summary>
    /// Returns a float from the application of InverseSqrt ((float)(1.0 / System.Math.Sqrt((double)v))).
    /// </summary>
    public static Vector2 InverseSqrt(float v) => Vector2((float)(1.0 / System.Math.Sqrt((double)v)));
    
    /// <summary>
    /// Returns a int2 from component-wise application of Sign (System.Math.Sign(v)).
    /// </summary>
    /*public static int2 Sign(Vector2 v) => int2(int32(System.Math.Sign(v.x)), int32(System.Math.Sign(v.y)));*/
    
    /// <summary>
    /// Returns a int from the application of Sign (System.Math.Sign(v)).
    /// </summary>
    /*public static int2 Sign(float v) => int2(Math.Sign(v));*/
    
    /// <summary>
    /// Returns a float2 from component-wise application of Max (System.Math.Max(lhs, rhs)).
    /// </summary>
    public static Vector2 Max(Vector2 lhs, Vector2 rhs) => Vector2(System.Math.Max(lhs.x, rhs.x), System.Math.Max(lhs.y, rhs.y));
    
    /// <summary>
    /// Returns a float2 from component-wise application of Max (System.Math.Max(lhs, rhs)).
    /// </summary>
    public static Vector2 Max(Vector2 lhs, float rhs) => Vector2(System.Math.Max(lhs.x, rhs), System.Math.Max(lhs.y, rhs));
    
    /// <summary>
    /// Returns a float2 from component-wise application of Max (System.Math.Max(lhs, rhs)).
    /// </summary>
    public static Vector2 Max(float lhs, Vector2 rhs) => Vector2(System.Math.Max(lhs, rhs.x), System.Math.Max(lhs, rhs.y));
    
    /// <summary>
    /// Returns a float from the application of Max (System.Math.Max(lhs, rhs)).
    /// </summary>
    public static Vector2 Max(float lhs, float rhs) => Vector2(System.Math.Max(lhs, rhs));
    
    /// <summary>
    /// Returns a float2 from component-wise application of Min (System.Math.Min(lhs, rhs)).
    /// </summary>
    public static Vector2 Min(Vector2 lhs, Vector2 rhs) => Vector2(System.Math.Min(lhs.x, rhs.x), System.Math.Min(lhs.y, rhs.y));
    
    /// <summary>
    /// Returns a float2 from component-wise application of Min (System.Math.Min(lhs, rhs)).
    /// </summary>
    public static Vector2 Min(Vector2 lhs, float rhs) => Vector2(System.Math.Min(lhs.x, rhs), System.Math.Min(lhs.y, rhs));
    
    /// <summary>
    /// Returns a float2 from component-wise application of Min (System.Math.Min(lhs, rhs)).
    /// </summary>
    public static Vector2 Min(float lhs, Vector2 rhs) => Vector2(System.Math.Min(lhs, rhs.x), System.Math.Min(lhs, rhs.y));
    
    /// <summary>
    /// Returns a float from the application of Min (System.Math.Min(lhs, rhs)).
    /// </summary>
    public static Vector2 Min(float lhs, float rhs) => Vector2(System.Math.Min(lhs, rhs));
    
    /// <summary>
    /// Returns a float2 from component-wise application of Pow ((float)System.Math.Pow((double)lhs, (double)rhs)).
    /// </summary>
    public static Vector2 Pow(Vector2 lhs, Vector2 rhs) => Vector2((float)System.Math.Pow((double)lhs.x, (double)rhs.x), (float)System.Math.Pow((double)lhs.y, (double)rhs.y));
    
    /// <summary>
    /// Returns a float2 from component-wise application of Pow ((float)System.Math.Pow((double)lhs, (double)rhs)).
    /// </summary>
    public static Vector2 Pow(Vector2 lhs, float rhs) => Vector2((float)System.Math.Pow((double)lhs.x, (double)rhs), (float)System.Math.Pow((double)lhs.y, (double)rhs));
    
    /// <summary>
    /// Returns a float2 from component-wise application of Pow ((float)System.Math.Pow((double)lhs, (double)rhs)).
    /// </summary>
    public static Vector2 Pow(float lhs, Vector2 rhs) => Vector2((float)System.Math.Pow((double)lhs, (double)rhs.x), (float)System.Math.Pow((double)lhs, (double)rhs.y));
    
    /// <summary>
    /// Returns a float from the application of Pow ((float)System.Math.Pow((double)lhs, (double)rhs)).
    /// </summary>
    public static Vector2 Pow(float lhs, float rhs) => Vector2((float)System.Math.Pow((double)lhs, (double)rhs));
    
    /// <summary>
    /// Returns a float2 from component-wise application of Log ((float)System.Math.Log((double)lhs, (double)rhs)).
    /// </summary>
    public static Vector2 Log(Vector2 lhs, Vector2 rhs) => Vector2((float)System.Math.Log((double)lhs.x, (double)rhs.x), (float)System.Math.Log((double)lhs.y, (double)rhs.y));
    
    /// <summary>
    /// Returns a float2 from component-wise application of Log ((float)System.Math.Log((double)lhs, (double)rhs)).
    /// </summary>
    public static Vector2 Log(Vector2 lhs, float rhs) => Vector2((float)System.Math.Log((double)lhs.x, (double)rhs), (float)System.Math.Log((double)lhs.y, (double)rhs));
    
    /// <summary>
    /// Returns a float2 from component-wise application of Log ((float)System.Math.Log((double)lhs, (double)rhs)).
    /// </summary>
    public static Vector2 Log(float lhs, Vector2 rhs) => Vector2((float)System.Math.Log((double)lhs, (double)rhs.x), (float)System.Math.Log((double)lhs, (double)rhs.y));
    
    /// <summary>
    /// Returns a float from the application of Log ((float)System.Math.Log((double)lhs, (double)rhs)).
    /// </summary>
    public static Vector2 Log(float lhs, float rhs) => Vector2((float)System.Math.Log((double)lhs, (double)rhs));
    
    /// <summary>
    /// Returns a float2 from component-wise application of Clamp (System.Math.Min(System.Math.Max(v, min), max)).
    /// </summary>
    public static Vector2 Clamp(Vector2 v, Vector2 min, Vector2 max) => Vector2(System.Math.Min(System.Math.Max(v.x, min.x), max.x), System.Math.Min(System.Math.Max(v.y, min.y), max.y));
    
    /// <summary>
    /// Returns a float2 from component-wise application of Clamp (System.Math.Min(System.Math.Max(v, min), max)).
    /// </summary>
    public static Vector2 Clamp(Vector2 v, Vector2 min, float max) => Vector2(System.Math.Min(System.Math.Max(v.x, min.x), max), System.Math.Min(System.Math.Max(v.y, min.y), max));
    
    /// <summary>
    /// Returns a float2 from component-wise application of Clamp (System.Math.Min(System.Math.Max(v, min), max)).
    /// </summary>
    public static Vector2 Clamp(Vector2 v, float min, Vector2 max) => Vector2(System.Math.Min(System.Math.Max(v.x, min), max.x), System.Math.Min(System.Math.Max(v.y, min), max.y));
    
    /// <summary>
    /// Returns a float2 from component-wise application of Clamp (System.Math.Min(System.Math.Max(v, min), max)).
    /// </summary>
    public static Vector2 Clamp(Vector2 v, float min, float max) => Vector2(System.Math.Min(System.Math.Max(v.x, min), max), System.Math.Min(System.Math.Max(v.y, min), max));
    
    /// <summary>
    /// Returns a float2 from component-wise application of Clamp (System.Math.Min(System.Math.Max(v, min), max)).
    /// </summary>
    public static Vector2 Clamp(float v, Vector2 min, Vector2 max) => Vector2(System.Math.Min(System.Math.Max(v, min.x), max.x), System.Math.Min(System.Math.Max(v, min.y), max.y));
    
    /// <summary>
    /// Returns a float2 from component-wise application of Clamp (System.Math.Min(System.Math.Max(v, min), max)).
    /// </summary>
    public static Vector2 Clamp(float v, Vector2 min, float max) => Vector2(System.Math.Min(System.Math.Max(v, min.x), max), System.Math.Min(System.Math.Max(v, min.y), max));
    
    /// <summary>
    /// Returns a float2 from component-wise application of Clamp (System.Math.Min(System.Math.Max(v, min), max)).
    /// </summary>
    public static Vector2 Clamp(float v, float min, Vector2 max) => Vector2(System.Math.Min(System.Math.Max(v, min), max.x), System.Math.Min(System.Math.Max(v, min), max.y));
    
    /// <summary>
    /// Returns a float from the application of Clamp (System.Math.Min(System.Math.Max(v, min), max)).
    /// </summary>
    public static Vector2 Clamp(float v, float min, float max) => Vector2(System.Math.Min(System.Math.Max(v, min), max));
    
    /// <summary>
    /// Returns a float2 from component-wise application of Mix (min * (1-a) + max * a).
    /// </summary>
    public static Vector2 Mix(Vector2 min, Vector2 max, Vector2 a) => Vector2(min.x * (1-a.x) + max.x * a.x, min.y * (1-a.y) + max.y * a.y);
    
    /// <summary>
    /// Returns a float2 from component-wise application of Mix (min * (1-a) + max * a).
    /// </summary>
    public static Vector2 Mix(Vector2 min, Vector2 max, float a) => Vector2(min.x * (1-a) + max.x * a, min.y * (1-a) + max.y * a);
    
    /// <summary>
    /// Returns a float2 from component-wise application of Mix (min * (1-a) + max * a).
    /// </summary>
    public static Vector2 Mix(Vector2 min, float max, Vector2 a) => Vector2(min.x * (1-a.x) + max * a.x, min.y * (1-a.y) + max * a.y);
    
    /// <summary>
    /// Returns a float2 from component-wise application of Mix (min * (1-a) + max * a).
    /// </summary>
    public static Vector2 Mix(Vector2 min, float max, float a) => Vector2(min.x * (1-a) + max * a, min.y * (1-a) + max * a);
    
    /// <summary>
    /// Returns a float2 from component-wise application of Mix (min * (1-a) + max * a).
    /// </summary>
    public static Vector2 Mix(float min, Vector2 max, Vector2 a) => Vector2(min * (1-a.x) + max.x * a.x, min * (1-a.y) + max.y * a.y);
    
    /// <summary>
    /// Returns a float2 from component-wise application of Mix (min * (1-a) + max * a).
    /// </summary>
    public static Vector2 Mix(float min, Vector2 max, float a) => Vector2(min * (1-a) + max.x * a, min * (1-a) + max.y * a);
    
    /// <summary>
    /// Returns a float2 from component-wise application of Mix (min * (1-a) + max * a).
    /// </summary>
    public static Vector2 Mix(float min, float max, Vector2 a) => Vector2(min * (1-a.x) + max * a.x, min * (1-a.y) + max * a.y);
    
    /// <summary>
    /// Returns a float from the application of Mix (min * (1-a) + max * a).
    /// </summary>
    public static Vector2 Mix(float min, float max, float a) => Vector2(min * (1-a) + max * a);
    
    /// <summary>
    /// Returns a float2 from component-wise application of Lerp (min * (1-a) + max * a).
    /// </summary>
    public static Vector2 Lerp(Vector2 min, Vector2 max, Vector2 a) => Vector2(min.x * (1-a.x) + max.x * a.x, min.y * (1-a.y) + max.y * a.y);
    
    /// <summary>
    /// Returns a float2 from component-wise application of Lerp (min * (1-a) + max * a).
    /// </summary>
    public static Vector2 Lerp(Vector2 min, Vector2 max, float a) => Vector2(min.x * (1-a) + max.x * a, min.y * (1-a) + max.y * a);
    
    /// <summary>
    /// Returns a float2 from component-wise application of Lerp (min * (1-a) + max * a).
    /// </summary>
    public static Vector2 Lerp(Vector2 min, float max, Vector2 a) => Vector2(min.x * (1-a.x) + max * a.x, min.y * (1-a.y) + max * a.y);
    
    /// <summary>
    /// Returns a float2 from component-wise application of Lerp (min * (1-a) + max * a).
    /// </summary>
    public static Vector2 Lerp(Vector2 min, float max, float a) => Vector2(min.x * (1-a) + max * a, min.y * (1-a) + max * a);
    
    /// <summary>
    /// Returns a float2 from component-wise application of Lerp (min * (1-a) + max * a).
    /// </summary>
    public static Vector2 Lerp(float min, Vector2 max, Vector2 a) => Vector2(min * (1-a.x) + max.x * a.x, min * (1-a.y) + max.y * a.y);
    
    /// <summary>
    /// Returns a float2 from component-wise application of Lerp (min * (1-a) + max * a).
    /// </summary>
    public static Vector2 Lerp(float min, Vector2 max, float a) => Vector2(min * (1-a) + max.x * a, min * (1-a) + max.y * a);
    
    /// <summary>
    /// Returns a float2 from component-wise application of Lerp (min * (1-a) + max * a).
    /// </summary>
    public static Vector2 Lerp(float min, float max, Vector2 a) => Vector2(min * (1-a.x) + max * a.x, min * (1-a.y) + max * a.y);
    
    /// <summary>
    /// Returns a float from the application of Lerp (min * (1-a) + max * a).
    /// </summary>
    public static Vector2 Lerp(float min, float max, float a) => Vector2(min * (1-a) + max * a);
    
    /// <summary>
    /// Returns a float2 from component-wise application of Fma (a * b + c).
    /// </summary>
    public static Vector2 Fma(Vector2 a, Vector2 b, Vector2 c) => Vector2(a.x * b.x + c.x, a.y * b.y + c.y);
    
    /// <summary>
    /// Returns a float2 from component-wise application of Fma (a * b + c).
    /// </summary>
    public static Vector2 Fma(Vector2 a, Vector2 b, float c) => Vector2(a.x * b.x + c, a.y * b.y + c);
    
    /// <summary>
    /// Returns a float2 from component-wise application of Fma (a * b + c).
    /// </summary>
    public static Vector2 Fma(Vector2 a, float b, Vector2 c) => Vector2(a.x * b + c.x, a.y * b + c.y);
    
    /// <summary>
    /// Returns a float2 from component-wise application of Fma (a * b + c).
    /// </summary>
    public static Vector2 Fma(Vector2 a, float b, float c) => Vector2(a.x * b + c, a.y * b + c);
    
    /// <summary>
    /// Returns a float2 from component-wise application of Fma (a * b + c).
    /// </summary>
    public static Vector2 Fma(float a, Vector2 b, Vector2 c) => Vector2(a * b.x + c.x, a * b.y + c.y);
    
    /// <summary>
    /// Returns a float2 from component-wise application of Fma (a * b + c).
    /// </summary>
    public static Vector2 Fma(float a, Vector2 b, float c) => Vector2(a * b.x + c, a * b.y + c);
    
    /// <summary>
    /// Returns a float2 from component-wise application of Fma (a * b + c).
    /// </summary>
    public static Vector2 Fma(float a, float b, Vector2 c) => Vector2(a * b + c.x, a * b + c.y);
    
    /// <summary>
    /// Returns a float from the application of Fma (a * b + c).
    /// </summary>
    public static Vector2 Fma(float a, float b, float c) => Vector2(a * b + c);
    
    /// <summary>
    /// Returns a float2 from component-wise application of Add (lhs + rhs).
    /// </summary>
    public static Vector2 Add(Vector2 lhs, Vector2 rhs) => Vector2(lhs.x + rhs.x, lhs.y + rhs.y);
    
    /// <summary>
    /// Returns a float2 from component-wise application of Add (lhs + rhs).
    /// </summary>
    public static Vector2 Add(Vector2 lhs, float rhs) => Vector2(lhs.x + rhs, lhs.y + rhs);
    
    /// <summary>
    /// Returns a float2 from component-wise application of Add (lhs + rhs).
    /// </summary>
    public static Vector2 Add(float lhs, Vector2 rhs) => Vector2(lhs + rhs.x, lhs + rhs.y);
    
    /// <summary>
    /// Returns a float from the application of Add (lhs + rhs).
    /// </summary>
    public static Vector2 Add(float lhs, float rhs) => Vector2(lhs + rhs);
    
    /// <summary>
    /// Returns a float2 from component-wise application of Sub (lhs - rhs).
    /// </summary>
    public static Vector2 Sub(Vector2 lhs, Vector2 rhs) => Vector2(lhs.x - rhs.x, lhs.y - rhs.y);
    
    /// <summary>
    /// Returns a float2 from component-wise application of Sub (lhs - rhs).
    /// </summary>
    public static Vector2 Sub(Vector2 lhs, float rhs) => Vector2(lhs.x - rhs, lhs.y - rhs);
    
    /// <summary>
    /// Returns a float2 from component-wise application of Sub (lhs - rhs).
    /// </summary>
    public static Vector2 Sub(float lhs, Vector2 rhs) => Vector2(lhs - rhs.x, lhs - rhs.y);
    
    /// <summary>
    /// Returns a float from the application of Sub (lhs - rhs).
    /// </summary>
    public static Vector2 Sub(float lhs, float rhs) => Vector2(lhs - rhs);
    
    /// <summary>
    /// Returns a float2 from component-wise application of Mul (lhs * rhs).
    /// </summary>
    public static Vector2 Mul(Vector2 lhs, Vector2 rhs) => Vector2(lhs.x * rhs.x, lhs.y * rhs.y);
    
    /// <summary>
    /// Returns a float2 from component-wise application of Mul (lhs * rhs).
    /// </summary>
    public static Vector2 Mul(Vector2 lhs, float rhs) => Vector2(lhs.x * rhs, lhs.y * rhs);
    
    /// <summary>
    /// Returns a float2 from component-wise application of Mul (lhs * rhs).
    /// </summary>
    public static Vector2 Mul(float lhs, Vector2 rhs) => Vector2(lhs * rhs.x, lhs * rhs.y);
    
    /// <summary>
    /// Returns a float from the application of Mul (lhs * rhs).
    /// </summary>
    public static Vector2 Mul(float lhs, float rhs) => Vector2(lhs * rhs);
    
    /// <summary>
    /// Returns a float2 from component-wise application of Div (lhs / rhs).
    /// </summary>
    public static Vector2 Div(Vector2 lhs, Vector2 rhs) => Vector2(lhs.x / rhs.x, lhs.y / rhs.y);
    
    /// <summary>
    /// Returns a float2 from component-wise application of Div (lhs / rhs).
    /// </summary>
    public static Vector2 Div(Vector2 lhs, float rhs) => Vector2(lhs.x / rhs, lhs.y / rhs);
    
    /// <summary>
    /// Returns a float2 from component-wise application of Div (lhs / rhs).
    /// </summary>
    public static Vector2 Div(float lhs, Vector2 rhs) => Vector2(lhs / rhs.x, lhs / rhs.y);
    
    /// <summary>
    /// Returns a float from the application of Div (lhs / rhs).
    /// </summary>
    public static Vector2 Div(float lhs, float rhs) => Vector2(lhs / rhs);
    
    /// <summary>
    /// Returns a float2 from component-wise application of Modulo (lhs % rhs).
    /// </summary>
    public static Vector2 Modulo(Vector2 lhs, Vector2 rhs) => Vector2(lhs.x % rhs.x, lhs.y % rhs.y);
    
    /// <summary>
    /// Returns a float2 from component-wise application of Modulo (lhs % rhs).
    /// </summary>
    public static Vector2 Modulo(Vector2 lhs, float rhs) => Vector2(lhs.x % rhs, lhs.y % rhs);
    
    /// <summary>
    /// Returns a float2 from component-wise application of Modulo (lhs % rhs).
    /// </summary>
    public static Vector2 Modulo(float lhs, Vector2 rhs) => Vector2(lhs % rhs.x, lhs % rhs.y);
    
    /// <summary>
    /// Returns a float from the application of Modulo (lhs % rhs).
    /// </summary>
    public static Vector2 Modulo(float lhs, float rhs) => Vector2(lhs % rhs);
    
    /// <summary>
    /// Returns a float2 from component-wise application of Degrees (Radians-To-Degrees Conversion).
    /// </summary>
    public static Vector2 Degrees(Vector2 v) => Vector2((float)(v.x * 57.295779513082320876798154814105170332405472466564321f), (float)(v.y * 57.295779513082320876798154814105170332405472466564321f));
    
    /// <summary>
    /// Returns a float from the application of Degrees (Radians-To-Degrees Conversion).
    /// </summary>
    public static Vector2 Degrees(float v) => Vector2((float)(v * 57.295779513082320876798154814105170332405472466564321f));
    
    /// <summary>
    /// Returns a float2 from component-wise application of Radians (Degrees-To-Radians Conversion).
    /// </summary>
    public static Vector2 Radians(Vector2 v) => Vector2((float)(v.x * 0.0174532925199432957692369076848861271344287188854172f), (float)(v.y * 0.0174532925199432957692369076848861271344287188854172f));
    
    /// <summary>
    /// Returns a float from the application of Radians (Degrees-To-Radians Conversion).
    /// </summary>
    public static Vector2 Radians(float v) => Vector2((float)(v * 0.0174532925199432957692369076848861271344287188854172f));
    
    /// <summary>
    /// Returns a float2 from component-wise application of Acos (System.Math.Acos(v)).
    /// </summary>
    public static Vector2 Acos(Vector2 v) => Vector2(System.Math.Acos(v.x), System.Math.Acos(v.y));
    
    /// <summary>
    /// Returns a float from the application of Acos (System.Math.Acos(v)).
    /// </summary>
    public static Vector2 Acos(float v) => Vector2(System.Math.Acos(v));
    
    /// <summary>
    /// Returns a float2 from component-wise application of Asin (System.Math.Asin(v)).
    /// </summary>
    public static Vector2 Asin(Vector2 v) => Vector2(System.Math.Asin(v.x), System.Math.Asin(v.y));
    
    /// <summary>
    /// Returns a float from the application of Asin (System.Math.Asin(v)).
    /// </summary>
    public static Vector2 Asin(float v) => Vector2(System.Math.Asin(v));
    
    /// <summary>
    /// Returns a float2 from component-wise application of Atan (System.Math.Atan(v)).
    /// </summary>
    public static Vector2 Atan(Vector2 v) => Vector2(System.Math.Atan(v.x), System.Math.Atan(v.y));
    
    /// <summary>
    /// Returns a float from the application of Atan (System.Math.Atan(v)).
    /// </summary>
    public static Vector2 Atan(float v) => Vector2(System.Math.Atan(v));
    
    /// <summary>
    /// Returns a float2 from component-wise application of Cos (System.Math.Cos(v)).
    /// </summary>
    public static Vector2 Cos(Vector2 v) => Vector2(System.Math.Cos(v.x), System.Math.Cos(v.y));
    
    /// <summary>
    /// Returns a float from the application of Cos (System.Math.Cos(v)).
    /// </summary>
    public static Vector2 Cos(float v) => Vector2(System.Math.Cos(v));
    
    /// <summary>
    /// Returns a float2 from component-wise application of Cosh (System.Math.Cosh(v)).
    /// </summary>
    public static Vector2 Cosh(Vector2 v) => Vector2(System.Math.Cosh(v.x), System.Math.Cosh(v.y));
    
    /// <summary>
    /// Returns a float from the application of Cosh (System.Math.Cosh(v)).
    /// </summary>
    public static Vector2 Cosh(float v) => Vector2(System.Math.Cosh(v));
    
    /// <summary>
    /// Returns a float2 from component-wise application of Exp (System.Math.Exp(v)).
    /// </summary>
    public static Vector2 Exp(Vector2 v) => Vector2(System.Math.Exp(v.x), System.Math.Exp(v.y));
    
    /// <summary>
    /// Returns a float from the application of Exp (System.Math.Exp(v)).
    /// </summary>
    public static Vector2 Exp(float v) => Vector2(System.Math.Exp(v));
    
    /// <summary>
    /// Returns a float2 from component-wise application of Log (System.Math.Log(v)).
    /// </summary>
    public static Vector2 Log(Vector2 v) => Vector2(System.Math.Log(v.x), System.Math.Log(v.y));
    
    /// <summary>
    /// Returns a float from the application of Log (System.Math.Log(v)).
    /// </summary>
    public static Vector2 Log(float v) => Vector2(System.Math.Log(v));
    
    /// <summary>
    /// Returns a float2 from component-wise application of Log2 (System.Math.Log(v, 2)).
    /// </summary>
    public static Vector2 Log2(Vector2 v) => Vector2(System.Math.Log(v.x, 2), System.Math.Log(v.y, 2));
    
    /// <summary>
    /// Returns a float from the application of Log2 (System.Math.Log(v, 2)).
    /// </summary>
    public static Vector2 Log2(float v) => Vector2(System.Math.Log(v, 2));
    
    /// <summary>
    /// Returns a float2 from component-wise application of Log10 (System.Math.Log10(v)).
    /// </summary>
    public static Vector2 Log10(Vector2 v) => Vector2(System.Math.Log10(v.x), System.Math.Log10(v.y));
    
    /// <summary>
    /// Returns a float from the application of Log10 (System.Math.Log10(v)).
    /// </summary>
    public static Vector2 Log10(float v) => Vector2(System.Math.Log10(v));
    
    /// <summary>
    /// Returns a float2 from component-wise application of Floor (System.Math.Floor(v)).
    /// </summary>
    public static Vector2 Floor(Vector2 v) => Vector2(System.Math.Floor(v.x), System.Math.Floor(v.y));
    
    /// <summary>
    /// Returns a float from the application of Floor (System.Math.Floor(v)).
    /// </summary>
    public static Vector2 Floor(float v) => Vector2(System.Math.Floor(v));
    
    /// <summary>
    /// Returns a float2 from component-wise application of Ceiling (System.Math.Ceiling(v)).
    /// </summary>
    public static Vector2 Ceiling(Vector2 v) => Vector2(System.Math.Ceiling(v.x), System.Math.Ceiling(v.y));
    
    /// <summary>
    /// Returns a float from the application of Ceiling (System.Math.Ceiling(v)).
    /// </summary>
    public static Vector2 Ceiling(float v) => Vector2(System.Math.Ceiling(v));
    
    /// <summary>
    /// Returns a float2 from component-wise application of Round (System.Math.Round(v)).
    /// </summary>
    public static Vector2 Round(Vector2 v) => Vector2(System.Math.Round(v.x), System.Math.Round(v.y));
    
    /// <summary>
    /// Returns a float from the application of Round (System.Math.Round(v)).
    /// </summary>
    public static Vector2 Round(float v) => Vector2(System.Math.Round(v));
    
    /// <summary>
    /// Returns a float2 from component-wise application of Sin (System.Math.Sin(v)).
    /// </summary>
    public static Vector2 Sin(Vector2 v) => Vector2(System.Math.Sin(v.x), System.Math.Sin(v.y));
    
    /// <summary>
    /// Returns a float from the application of Sin (System.Math.Sin(v)).
    /// </summary>
    public static Vector2 Sin(float v) => Vector2(System.Math.Sin(v));
    
    /// <summary>
    /// Returns a float2 from component-wise application of Sinh (System.Math.Sinh(v)).
    /// </summary>
    public static Vector2 Sinh(Vector2 v) => Vector2(System.Math.Sinh(v.x), System.Math.Sinh(v.y));
    
    /// <summary>
    /// Returns a float from the application of Sinh (System.Math.Sinh(v)).
    /// </summary>
    public static Vector2 Sinh(float v) => Vector2(System.Math.Sinh(v));
    
    /// <summary>
    /// Returns a float2 from component-wise application of Tan (System.Math.Tan(v)).
    /// </summary>
    public static Vector2 Tan(Vector2 v) => Vector2(System.Math.Tan(v.x), System.Math.Tan(v.y));
    
    /// <summary>
    /// Returns a float from the application of Tan (System.Math.Tan(v)).
    /// </summary>
    public static Vector2 Tan(float v) => Vector2(System.Math.Tan(v));
    
    /// <summary>
    /// Returns a float2 from component-wise application of Tanh (System.Math.Tanh(v)).
    /// </summary>
    public static Vector2 Tanh(Vector2 v) => Vector2(System.Math.Tanh(v.x), System.Math.Tanh(v.y));
    
    /// <summary>
    /// Returns a float from the application of Tanh (System.Math.Tanh(v)).
    /// </summary>
    public static Vector2 Tanh(float v) => Vector2(System.Math.Tanh(v));
    
    /// <summary>
    /// Returns a float2 from component-wise application of Truncate (System.Math.Truncate(v)).
    /// </summary>
    public static Vector2 Truncate(Vector2 v) => Vector2(System.Math.Truncate(v.x), System.Math.Truncate(v.y));
    
    /// <summary>
    /// Returns a float from the application of Truncate (System.Math.Truncate(v)).
    /// </summary>
    public static Vector2 Truncate(float v) => Vector2(System.Math.Truncate(v));
    
    /// <summary>
    /// Returns a float2 from component-wise application of Fract ((v - System.Math.Floor(v))).
    /// </summary>
    public static Vector2 Fract(Vector2 v) => Vector2((v.x - System.Math.Floor(v.x)), (v.y - System.Math.Floor(v.y)));
    
    /// <summary>
    /// Returns a float from the application of Fract ((v - System.Math.Floor(v))).
    /// </summary>
    public static Vector2 Fract(float v) => Vector2((v - System.Math.Floor(v)));
    
    /// <summary>
    /// Returns a float2 from component-wise application of TruncateFast ((int64)(v)).
    /// </summary>
    public static Vector2 TruncateFast(Vector2 v) => Vector2((int64)(v.x), (int64)(v.y));
    
    /// <summary>
    /// Returns a float from the application of TruncateFast ((int64)(v)).
    /// </summary>
    public static Vector2 TruncateFast(float v) => Vector2((int64)(v));
    
    /// <summary>
    /// Returns a float2 with independent and identically distributed uniform values between 'minValue' and 'maxValue'.
    /// </summary>
    public static Vector2 Random(Random random, Vector2 minValue, Vector2 maxValue) => Vector2((float)random.NextDouble() * (maxValue.x - minValue.x) + minValue.x, (float)random.NextDouble() * (maxValue.y - minValue.y) + minValue.y);
    
    /// <summary>
    /// Returns a float2 with independent and identically distributed uniform values between 'minValue' and 'maxValue'.
    /// </summary>
    public static Vector2 Random(Random random, Vector2 minValue, float maxValue) => Vector2((float)random.NextDouble() * (maxValue - minValue.x) + minValue.x, (float)random.NextDouble() * (maxValue - minValue.y) + minValue.y);
    
    /// <summary>
    /// Returns a float2 with independent and identically distributed uniform values between 'minValue' and 'maxValue'.
    /// </summary>
    public static Vector2 Random(Random random, float minValue, Vector2 maxValue) => Vector2((float)random.NextDouble() * (maxValue.x - minValue) + minValue, (float)random.NextDouble() * (maxValue.y - minValue) + minValue);
    
    /// <summary>
    /// Returns a float2 with independent and identically distributed uniform values between 'minValue' and 'maxValue'.
    /// </summary>
    public static Vector2 Random(Random random, float minValue, float maxValue) => Vector2((float)random.NextDouble() * (maxValue - minValue) + minValue);
    
    /// <summary>
    /// Returns a float2 with independent and identically distributed uniform values between 'minValue' and 'maxValue'.
    /// </summary>
    public static Vector2 RandomUniform(Random random, Vector2 minValue, Vector2 maxValue) => Vector2((float)random.NextDouble() * (maxValue.x - minValue.x) + minValue.x, (float)random.NextDouble() * (maxValue.y - minValue.y) + minValue.y);
    
    /// <summary>
    /// Returns a float2 with independent and identically distributed uniform values between 'minValue' and 'maxValue'.
    /// </summary>
    public static Vector2 RandomUniform(Random random, Vector2 minValue, float maxValue) => Vector2((float)random.NextDouble() * (maxValue - minValue.x) + minValue.x, (float)random.NextDouble() * (maxValue - minValue.y) + minValue.y);
    
    /// <summary>
    /// Returns a float2 with independent and identically distributed uniform values between 'minValue' and 'maxValue'.
    /// </summary>
    public static Vector2 RandomUniform(Random random, float minValue, Vector2 maxValue) => Vector2((float)random.NextDouble() * (maxValue.x - minValue) + minValue, (float)random.NextDouble() * (maxValue.y - minValue) + minValue);
    
    /// <summary>
    /// Returns a float2 with independent and identically distributed uniform values between 'minValue' and 'maxValue'.
    /// </summary>
    public static Vector2 RandomUniform(Random random, float minValue, float maxValue) => Vector2((float)random.NextDouble() * (maxValue - minValue) + minValue);
    
    /// <summary>
    /// Returns a float2 with independent and identically distributed values according to a normal/Gaussian distribution with specified mean and variance.
    /// </summary>
    public static Vector2 RandomNormal(Random random, Vector2 mean, Vector2 variance) => Vector2((float)(System.Math.Sqrt((double)variance.x) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean.x, (float)(System.Math.Sqrt((double)variance.y) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean.y);
    
    /// <summary>
    /// Returns a float2 with independent and identically distributed values according to a normal/Gaussian distribution with specified mean and variance.
    /// </summary>
    public static Vector2 RandomNormal(Random random, Vector2 mean, float variance) => Vector2((float)(System.Math.Sqrt((double)variance) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean.x, (float)(System.Math.Sqrt((double)variance) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean.y);
    
    /// <summary>
    /// Returns a float2 with independent and identically distributed values according to a normal/Gaussian distribution with specified mean and variance.
    /// </summary>
    public static Vector2 RandomNormal(Random random, float mean, Vector2 variance) => Vector2((float)(System.Math.Sqrt((double)variance.x) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean, (float)(System.Math.Sqrt((double)variance.y) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean);
    
    /// <summary>
    /// Returns a float2 with independent and identically distributed values according to a normal/Gaussian distribution with specified mean and variance.
    /// </summary>
    public static Vector2 RandomNormal(Random random, float mean, float variance) => Vector2((float)(System.Math.Sqrt((double)variance) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean);
    
    /// <summary>
    /// Returns a float2 with independent and identically distributed values according to a normal/Gaussian distribution with specified mean and variance.
    /// </summary>
    public static Vector2 RandomGaussian(Random random, Vector2 mean, Vector2 variance) => Vector2((float)(System.Math.Sqrt((double)variance.x) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean.x, (float)(System.Math.Sqrt((double)variance.y) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean.y);
    
    /// <summary>
    /// Returns a float2 with independent and identically distributed values according to a normal/Gaussian distribution with specified mean and variance.
    /// </summary>
    public static Vector2 RandomGaussian(Random random, Vector2 mean, float variance) => Vector2((float)(System.Math.Sqrt((double)variance) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean.x, (float)(System.Math.Sqrt((double)variance) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean.y);
    
    /// <summary>
    /// Returns a float2 with independent and identically distributed values according to a normal/Gaussian distribution with specified mean and variance.
    /// </summary>
    public static Vector2 RandomGaussian(Random random, float mean, Vector2 variance) => Vector2((float)(System.Math.Sqrt((double)variance.x) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean, (float)(System.Math.Sqrt((double)variance.y) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean);
    
    /// <summary>
    /// Returns a float2 with independent and identically distributed values according to a normal/Gaussian distribution with specified mean and variance.
    /// </summary>
    public static Vector2 RandomGaussian(Random random, float mean, float variance) => Vector2((float)(System.Math.Sqrt((double)variance) * System.Math.Cos(2 * System.Math.PI_d * random.NextDouble()) * System.Math.Sqrt(-2.0 * System.Math.Log(random.NextDouble()))) + mean);

    //#endregion


    //#region Component-Wise Operator Overloads
    
    /// <summary>
    /// Returns a bool2 from component-wise application of operator&lt; (lhs &lt; rhs).
    /// </summary>
    /*public static bool2 operator<(float2 lhs, float2 rhs) => bool2(lhs.x < rhs.x, lhs.y < rhs.y);*/
    
    /// <summary>
    /// Returns a bool2 from component-wise application of operator&lt; (lhs &lt; rhs).
    /// </summary>
    /*public static bool2 operator<(float2 lhs, float rhs) => bool2(lhs.x < rhs, lhs.y < rhs);*/
    
    /// <summary>
    /// Returns a bool2 from component-wise application of operator&lt; (lhs &lt; rhs).
    /// </summary>
    /*public static bool2 operator<(float lhs, float2 rhs) => bool2(lhs < rhs.x, lhs < rhs.y);*/
    
    /// <summary>
    /// Returns a bool2 from component-wise application of operator&lt;= (lhs &lt;= rhs).
    /// </summary>
    /*public static bool2 operator<=(float2 lhs, float2 rhs) => bool2(lhs.x <= rhs.x, lhs.y <= rhs.y);*/
    
    /// <summary>
    /// Returns a bool2 from component-wise application of operator&lt;= (lhs &lt;= rhs).
    /// </summary>
    /*public static bool2 operator<=(float2 lhs, float rhs) => bool2(lhs.x <= rhs, lhs.y <= rhs);*/
    
    /// <summary>
    /// Returns a bool2 from component-wise application of operator&lt;= (lhs &lt;= rhs).
    /// </summary>
    /*public static bool2 operator<=(float lhs, float2 rhs) => bool2(lhs <= rhs.x, lhs <= rhs.y);*/
    
    /// <summary>
    /// Returns a bool2 from component-wise application of operator&gt; (lhs &gt; rhs).
    /// </summary>
    /*public static bool2 operator>(float2 lhs, float2 rhs) => bool2(lhs.x > rhs.x, lhs.y > rhs.y);*/
    
    /// <summary>
    /// Returns a bool2 from component-wise application of operator&gt; (lhs &gt; rhs).
    /// </summary>
    /*public static bool2 operator>(float2 lhs, float rhs) => bool2(lhs.x > rhs, lhs.y > rhs);*/
    
    /// <summary>
    /// Returns a bool2 from component-wise application of operator&gt; (lhs &gt; rhs).
    /// </summary>
    /*public static bool2 operator>(float lhs, float2 rhs) => bool2(lhs > rhs.x, lhs > rhs.y);*/
    
    /// <summary>
    /// Returns a bool2 from component-wise application of operator&gt;= (lhs &gt;= rhs).
    /// </summary>
    /*public static bool2 operator>=(float2 lhs, float2 rhs) => bool2(lhs.x >= rhs.x, lhs.y >= rhs.y);*/
    
    /// <summary>
    /// Returns a bool2 from component-wise application of operator&gt;= (lhs &gt;= rhs).
    /// </summary>
    /*public static bool2 operator>=(float2 lhs, float rhs) => bool2(lhs.x >= rhs, lhs.y >= rhs);*/
    
    /// <summary>
    /// Returns a bool2 from component-wise application of operator&gt;= (lhs &gt;= rhs).
    /// </summary>
    /*public static bool2 operator>=(float lhs, float2 rhs) => bool2(lhs >= rhs.x, lhs >= rhs.y);*/
    
    /// <summary>
    /// Returns a float2 from component-wise application of operator+ (lhs + rhs).
    /// </summary>
    public static Vector2 operator+(Vector2 lhs, Vector2 rhs) => Vector2(lhs.x + rhs.x, lhs.y + rhs.y);
    
    /// <summary>
    /// Returns a float2 from component-wise application of operator+ (lhs + rhs).
    /// </summary>
    public static Vector2 operator+(Vector2 lhs, float rhs) => Vector2(lhs.x + rhs, lhs.y + rhs);
    
    /// <summary>
    /// Returns a float2 from component-wise application of operator+ (lhs + rhs).
    /// </summary>
    public static Vector2 operator+(float lhs, Vector2 rhs) => Vector2(lhs + rhs.x, lhs + rhs.y);
    
    /// <summary>
    /// Returns a float2 from component-wise application of operator- (lhs - rhs).
    /// </summary>
    public static Vector2 operator-(Vector2 lhs, Vector2 rhs) => Vector2(lhs.x - rhs.x, lhs.y - rhs.y);
    
    /// <summary>
    /// Returns a float2 from component-wise application of operator- (lhs - rhs).
    /// </summary>
    public static Vector2 operator-(Vector2 lhs, float rhs) => Vector2(lhs.x - rhs, lhs.y - rhs);
    
    /// <summary>
    /// Returns a float2 from component-wise application of operator- (lhs - rhs).
    /// </summary>
    public static Vector2 operator-(float lhs, Vector2 rhs) => Vector2(lhs - rhs.x, lhs - rhs.y);
    
    /// <summary>
    /// Returns a float2 from component-wise application of operator* (lhs * rhs).
    /// </summary>
    public static Vector2 operator*(Vector2 lhs, Vector2 rhs) => Vector2(lhs.x * rhs.x, lhs.y * rhs.y);
    
    /// <summary>
    /// Returns a float2 from component-wise application of operator* (lhs * rhs).
    /// </summary>
    public static Vector2 operator*(Vector2 lhs, float rhs) => Vector2(lhs.x * rhs, lhs.y * rhs);
    
    /// <summary>
    /// Returns a float2 from component-wise application of operator* (lhs * rhs).
    /// </summary>
    public static Vector2 operator*(float lhs, Vector2 rhs) => Vector2(lhs * rhs.x, lhs * rhs.y);
    
    /// <summary>
    /// Returns a float2 from component-wise application of operator/ (lhs / rhs).
    /// </summary>
    public static Vector2 operator/(Vector2 lhs, Vector2 rhs) => Vector2(lhs.x / rhs.x, lhs.y / rhs.y);
    
    /// <summary>
    /// Returns a float2 from component-wise application of operator/ (lhs / rhs).
    /// </summary>
    public static Vector2 operator/(Vector2 lhs, float rhs) => Vector2(lhs.x / rhs, lhs.y / rhs);
    
    /// <summary>
    /// Returns a float2 from component-wise application of operator/ (lhs / rhs).
    /// </summary>
    public static Vector2 operator/(float lhs, Vector2 rhs) => Vector2(lhs / rhs.x, lhs / rhs.y);
    
    /// <summary>
    /// Returns a float2 from component-wise application of operator- (-v).
    /// </summary>
    public static Vector2 operator-(Vector2 v) => Vector2(-v.x, -v.y);
    
    /// <summary>
    /// Returns a float2 from component-wise application of operator% (lhs % rhs).
    /// </summary>
    public static Vector2 operator%(Vector2 lhs, Vector2 rhs) => Vector2(lhs.x % rhs.x, lhs.y % rhs.y);
    
    /// <summary>
    /// Returns a float2 from component-wise application of operator% (lhs % rhs).
    /// </summary>
    public static Vector2 operator%(Vector2 lhs, float rhs) => Vector2(lhs.x % rhs, lhs.y % rhs);
    
    /// <summary>
    /// Returns a float2 from component-wise application of operator% (lhs % rhs).
    /// </summary>
    public static Vector2 operator%(float lhs, Vector2 rhs) => Vector2(lhs % rhs.x, lhs % rhs.y);

    //#endregion

}