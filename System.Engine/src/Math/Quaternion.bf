namespace System.Math
{
	using System;
    
    /// <summary>
    /// A quaternion of type float.
    /// </summary>
    public struct Quaternion : IEquatable<Quaternion>
    {

        //#region Fields
        
        /// <summary>
        /// component data
        /// </summary>
        public float[4] values;


		public override void ToString(String strBuffer)
		{
			strBuffer.AppendF("Quaternion({0}F, {1}F, {2}F, {3}F)", values[0], values[1], values[2], values[3]);
		}

        //#endregion


        //#region Constructors
        
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
        /// copy constructor
        /// </summary>
        public this(Quaternion q)
        {
            values = .(q.x,q.y,q.z,q.w);
        }
        
        /// <summary>
        /// vector-and-scalar constructor (CAUTION: not angle-axis, use FromAngleAxis instead)
        /// </summary>
        public this(Vector3 v, float s)
        {
            values = .(v.x,v.y,v.z,s);
        }
        
        /// <summary>
        /// Creates a quaternion from the rotational part of a float3x3.
        /// </summary>
        public this(float3x3 m)
            : this(FromMat3(m))
        {
        }
        
        /// <summary>
        /// Creates a quaternion from the rotational part of a float4x4.
        /// </summary>
        public this(Matrix4x4 m)
            : this(FromMat4(m))
        {
        }

        //#endregion


        //#region Implicit Operators
        
        /// <summary>
        /// Implicitly converts this to a qdouble.
        /// </summary>
        /*public static implicit operator qdouble(Quaternion v) =>  qdouble((double)v.x, (double)v.y, (double)v.z, (double)v.w);*/

        //#endregion


        //#region Explicit Operators
        
        /// <summary>
        /// Explicitly converts this to a int4.
        /// </summary>
        /*public static explicit operator int4(Quaternion v) =>  int4((int)v.x, (int)v.y, (int)v.z, (int)v.w);*/
        
        /// <summary>
        /// Explicitly converts this to a qint.
        /// </summary>
        /*public static explicit operator qint(Quaternion v) =>  qint((int)v.x, (int)v.y, (int)v.z, (int)v.w);*/
        
        /// <summary>
        /// Explicitly converts this to a uint4.
        /// </summary>
        /*public static explicit operator uint4(Quaternion v) =>  uint4((uint)v.x, (uint)v.y, (uint)v.z, (uint)v.w);*/
        
        /// <summary>
        /// Explicitly converts this to a quint.
        /// </summary>
        /*public static explicit operator quint(Quaternion v) =>  quint((uint)v.x, (uint)v.y, (uint)v.z, (uint)v.w);*/
        
        /// <summary>
        /// Explicitly converts this to a float4.
        /// </summary>
        public static explicit operator Vector4(Quaternion v) =>  Vector4((float)v.x, (float)v.y, (float)v.z, (float)v.w);
        
        /// <summary>
        /// Explicitly converts this to a double4.
        /// </summary>
        /*public static explicit operator double4(Quaternion v) =>  double4((double)v.x, (double)v.y, (double)v.z, (double)v.w);*/
        
        /// <summary>
        /// Explicitly converts this to a long4.
        /// </summary>
        /*public static explicit operator long4(Quaternion v) =>  long4((long)v.x, (long)v.y, (long)v.z, (long)v.w);*/
        
        /// <summary>
        /// Explicitly converts this to a qlong.
        /// </summary>
        /*public static explicit operator qlong(Quaternion v) =>  qlong((long)v.x, (long)v.y, (long)v.z, (long)v.w);*/
        
        /// <summary>
        /// Explicitly converts this to a bool4.
        /// </summary>
        /*public static explicit operator bool4(Quaternion v) =>  bool4(v.x != 0f, v.y != 0f, v.z != 0f, v.w != 0f);*/
        
        /// <summary>
        /// Explicitly converts this to a qbool.
        /// </summary>
        /*public static explicit operator qbool(Quaternion v) =>  qbool(v.x != 0f, v.y != 0f, v.z != 0f, v.w != 0f);*/
        
        /// <summary>
        /// Creates a quaternion from the rotational part of a float3x3.
        /// </summary>
        /*public static explicit operator Quaternion(float3x3 m) => FromMat3(m);*/
        
        /// <summary>
        /// Creates a quaternion from the rotational part of a float4x4.
        /// </summary>
        public static explicit operator Quaternion(Matrix4x4 m) => FromMat4(m);

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
        /// Returns the number of components (4).
        /// </summary>
        public int Count => 4;
        
        /// <summary>
        /// Returns the euclidean length of this quaternion.
        /// </summary>
        public float Length => (float)System.Math.Sqrt(((x*x + y*y) + (z*z + w*w)));
        
        /// <summary>
        /// Returns the squared euclidean length of this quaternion.
        /// </summary>
        public float LengthSqr => ((x*x + y*y) + (z*z + w*w));
        
        /// <summary>
        /// Returns a copy of this quaternion with length one (undefined if this has zero length).
        /// </summary>
        public Quaternion Normalized => this / (float)Length;
        
        /// <summary>
        /// Returns a copy of this quaternion with length one (returns zero if length is zero).
        /// </summary>
        public Quaternion NormalizedSafe => this == Zero ? Identity : this / (float)Length;
        
        /// <summary>
        /// Returns the represented angle of this quaternion.
        /// </summary>
        public double Angle => System.Math.Acos((double)w) * 2.0;
        
        /// <summary>
        /// Returns the represented axis of this quaternion.
        /// </summary>
        public Vector3 Axis
        {
            [Inline]get
            {
                let s1 = 1 - w * w;
                if (s1 < 0) return Vector3.forward;
                let s2 = 1 / System.Math.Sqrt(s1);
                return  Vector3((float)(x * s2), (float)(y * s2), (float)(z * s2));
            }
        }
        
        /// <summary>
        /// Returns the represented yaw angle of this quaternion.
        /// </summary>
        public double Yaw => System.Math.Asin(-2.0 * (double)(x * z - w * y));
        
        /// <summary>
        /// Returns the represented pitch angle of this quaternion.
        /// </summary>
        public double Pitch => System.Math.Atan2(2.0 * (double)(y * z + w * x), (double)(w * w - x * x - y * y + z * z));
        
        /// <summary>
        /// Returns the represented roll angle of this quaternion.
        /// </summary>
        public double Roll => System.Math.Atan2(2.0 * (double)(x * y + w * z), (double)(w * w + x * x - y * y - z * z));
        
        /// <summary>
        /// Returns the represented euler angles (pitch, yaw, roll) of this quaternion.
        /// </summary>
        public Vector3 EulerAngles =>  Vector3(float(Pitch), float(Yaw), float(Roll));
        
        /// <summary>
        /// Creates a float3x3 that realizes the rotation of this quaternion
        /// </summary>
        public float3x3 ToMat3 =>  float3x3(1 - 2 * (y*y + z*z), 2 * (x*y + w*z), 2 * (x*z - w*y), 2 * (x*y - w*z), 1 - 2 * (x*x + z*z), 2 * (y*z + w*x), 2 * (x*z + w*y), 2 * (y*z - w*x), 1 - 2 * (x*x + y*y));
        
        /// <summary>
        /// Creates a float4x4 that realizes the rotation of this quaternion
        /// </summary>
        public Matrix4x4 ToMat4 => Matrix4x4(this.ToMat3);
        
        /// <summary>
        /// Returns the conjugated quaternion
        /// </summary>
        public Quaternion Conjugate =>  Quaternion(-x, -y, -z, w);
        
        /// <summary>
        /// Returns the inverse quaternion
        /// </summary>
        public Quaternion Inverse => Conjugate / LengthSqr;

        //#endregion


        //#region Static Properties
        
        /// <summary>
        /// Predefined all-zero quaternion
        /// </summary>
        readonly public static Quaternion Zero  =  Quaternion(0f, 0f, 0f, 0f);
        
        /// <summary>
        /// Predefined all-ones quaternion
        /// </summary>
        readonly public static Quaternion Ones  =  Quaternion(1f, 1f, 1f, 1f);
        
        /// <summary>
        /// Predefined identity quaternion
        /// </summary>
        readonly public static Quaternion Identity  =  Quaternion(0f, 0f, 0f, 1f);
        
        /// <summary>
        /// Predefined unit-X quaternion
        /// </summary>
        readonly public static Quaternion UnitX  =  Quaternion(1f, 0f, 0f, 0f);
        
        /// <summary>
        /// Predefined unit-Y quaternion
        /// </summary>
        readonly public static Quaternion UnitY  =  Quaternion(0f, 1f, 0f, 0f);
        
        /// <summary>
        /// Predefined unit-Z quaternion
        /// </summary>
        readonly public static Quaternion UnitZ  =  Quaternion(0f, 0f, 1f, 0f);
        
        /// <summary>
        /// Predefined unit-W quaternion
        /// </summary>
        readonly public static Quaternion UnitW  =  Quaternion(0f, 0f, 0f, 1f);
        
        /// <summary>
        /// Predefined all-MaxValue quaternion
        /// </summary>
        readonly public static Quaternion MaxValue  =  Quaternion(float.MaxValue, float.MaxValue, float.MaxValue, float.MaxValue);
        
        /// <summary>
        /// Predefined all-MinValue quaternion
        /// </summary>
        readonly public static Quaternion MinValue  =  Quaternion(float.MinValue, float.MinValue, float.MinValue, float.MinValue);
        
        /// <summary>
        /// Predefined all-Epsilon quaternion
        /// </summary>
        readonly public static Quaternion Epsilon  =  Quaternion(float.Epsilon, float.Epsilon, float.Epsilon, float.Epsilon);
        
        /// <summary>
        /// Predefined all-NaN quaternion
        /// </summary>
        readonly public static Quaternion NaN  =  Quaternion(float.NaN, float.NaN, float.NaN, float.NaN);
        
        /// <summary>
        /// Predefined all-NegativeInfinity quaternion
        /// </summary>
        readonly public static Quaternion NegativeInfinity  =  Quaternion(float.NegativeInfinity, float.NegativeInfinity, float.NegativeInfinity, float.NegativeInfinity);
        
        /// <summary>
        /// Predefined all-PositiveInfinity quaternion
        /// </summary>
        readonly public static Quaternion PositiveInfinity  =  Quaternion(float.PositiveInfinity, float.PositiveInfinity, float.PositiveInfinity, float.PositiveInfinity);

        //#endregion


        //#region Operators
        
        /// <summary>
        /// Returns true iff this equals rhs component-wise.
        /// </summary>
        public static bool operator==(Quaternion lhs, Quaternion rhs) => lhs.Equals(rhs);
        
        /// <summary>
        /// Returns true iff this does not equal rhs (component-wise).
        /// </summary>
        public static bool operator!=(Quaternion lhs, Quaternion rhs) => !lhs.Equals(rhs);
        
        /// <summary>
        /// Returns proper multiplication of two quaternions.
        /// </summary>
        public static Quaternion operator*(Quaternion p, Quaternion q) =>  Quaternion(p.w * q.x + p.x * q.w + p.y * q.z - p.z * q.y, p.w * q.y + p.y * q.w + p.z * q.x - p.x * q.z, p.w * q.z + p.z * q.w + p.x * q.y - p.y * q.x, p.w * q.w - p.x * q.x - p.y * q.y - p.z * q.z);
        
        /// <summary>
        /// Returns a vector rotated by the quaternion.
        /// </summary>
        public static Vector3 operator*(Quaternion q, Vector3 v)
        {
            let qv =  Vector3(q.x, q.y, q.z);
            let uv = Vector3.Cross(qv, v);
            let uuv = Vector3.Cross(qv, uv);
            return v + ((uv * q.w) + uuv) * 2;
        }
        
        /// <summary>
        /// Returns a vector rotated by the quaternion (preserves v.w).
        /// </summary>
        public static Vector4 operator*(Quaternion q, Vector4 v) =>  Vector4(q *  Vector3(v), v.w);
        
        /// <summary>
        /// Returns a vector rotated by the inverted quaternion.
        /// </summary>
        public static Vector3 operator*(Vector3 v, Quaternion q) => q.Inverse * v;
        
        /// <summary>
        /// Returns a vector rotated by the inverted quaternion (preserves v.w).
        /// </summary>
        public static Vector4 operator*(Vector4 v, Quaternion q) => q.Inverse * v;

        //#endregion


        //#region Functions
        
        /// <summary>
        /// Returns an array with all values
        /// </summary>
        public float[] ToArray() => new .[] ( x, y, z, w );
        
        /// <summary>
        /// Returns true iff this equals rhs component-wise.
        /// </summary>
        public bool Equals(Quaternion rhs) => ((x == rhs.x && y == rhs.y) && (z == rhs.z && w == rhs.w));
        
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
        /// Rotates this quaternion from an axis and an angle (in radians).
        /// </summary>
        public Quaternion Rotated(float angle, Vector3 v) => this * FromAxisAngle(angle, v);

        //#endregion


        //#region Static Functions
        
        /// <summary>
        /// Returns the inner product (dot product, scalar product) of the two quaternions.
        /// </summary>
        public static float Dot(Quaternion lhs, Quaternion rhs) => ((lhs.x * rhs.x + lhs.y * rhs.y) + (lhs.z * rhs.z + lhs.w * rhs.w));
        
        /// <summary>
        /// Creates a quaternion from an axis and an angle (in radians).
        /// </summary>
        public static Quaternion FromAxisAngle(float angle, Vector3 v)
        {
            let s = System.Math.Sin((double)angle * 0.5);
            let c = System.Math.Cos((double)angle * 0.5);
            return  Quaternion((float)((double)v.x * s), (float)((double)v.y * s), (float)((double)v.z * s), (float)c);
        }
        
        /// <summary>
        /// Creates a quaternion from the rotational part of a float4x4.
        /// </summary>
        public static Quaternion FromMat3(float3x3 m)
        {
            var fourXSquaredMinus1 = m.m00 - m.m11 - m.m22;
            var fourYSquaredMinus1 = m.m11 - m.m00 - m.m22;
            var fourZSquaredMinus1 = m.m22 - m.m00 - m.m11;
            var fourWSquaredMinus1 = m.m00 + m.m11 + m.m22;
            var biggestIndex = 0;
            var fourBiggestSquaredMinus1 = fourWSquaredMinus1;
            if(fourXSquaredMinus1 > fourBiggestSquaredMinus1)
            {
                fourBiggestSquaredMinus1 = fourXSquaredMinus1;
                biggestIndex = 1;
            }
            if(fourYSquaredMinus1 > fourBiggestSquaredMinus1)
            {
                fourBiggestSquaredMinus1 = fourYSquaredMinus1;
                biggestIndex = 2;
            }
            if(fourZSquaredMinus1 > fourBiggestSquaredMinus1)
            {
                fourBiggestSquaredMinus1 = fourZSquaredMinus1;
                biggestIndex = 3;
            }
            var biggestVal = System.Math.Sqrt((double)fourBiggestSquaredMinus1 + 1.0) * 0.5;
            var mult = 0.25 / biggestVal;
            switch(biggestIndex)
            {
                case 0: return  Quaternion((float)((double)(m.m12 - m.m21) * mult), (float)((double)(m.m20 - m.m02) * mult), (float)((double)(m.m01 - m.m10) * mult), (float)(biggestVal));
                case 1: return  Quaternion((float)(biggestVal), (float)((double)(m.m01 + m.m10) * mult), (float)((double)(m.m20 + m.m02) * mult), (float)((double)(m.m12 - m.m21) * mult));
                case 2: return  Quaternion((float)((double)(m.m01 + m.m10) * mult), (float)(biggestVal), (float)((double)(m.m12 + m.m21) * mult), (float)((double)(m.m20 - m.m02) * mult));
                default: return  Quaternion((float)((double)(m.m20 + m.m02) * mult), (float)((double)(m.m12 + m.m21) * mult), (float)(biggestVal), (float)((double)(m.m01 - m.m10) * mult));
            }
        }
        
        /// <summary>
        /// Creates a quaternion from the rotational part of a float3x3.
        /// </summary>
        public static Quaternion FromMat4(Matrix4x4 m) => FromMat3( float3x3(m));
        
        /// <summary>
        /// Returns the cross product between two quaternions.
        /// </summary>
        public static Quaternion Cross(Quaternion q1, Quaternion q2) =>  Quaternion(q1.w * q2.x + q1.x * q2.w + q1.y * q2.z - q1.z * q2.y, q1.w * q2.y + q1.y * q2.w + q1.z * q2.x - q1.x * q2.z, q1.w * q2.z + q1.z * q2.w + q1.x * q2.y - q1.y * q2.x, q1.w * q2.w - q1.x * q2.x - q1.y * q2.y - q1.z * q2.z);
        
        /// <summary>
        /// Calculates a proper spherical interpolation between two quaternions (only works for normalized quaternions).
        /// </summary>
        /*public static Quaternion Mix(Quaternion x, Quaternion y, float a)
        {
            let cosTheta = (double)Dot(x, y);
            if (cosTheta > 1 - float.Epsilon)
                return Lerp(x, y, a);
            else
            {
                let angle = System.Math.Acos((double)cosTheta);
                return (Quaternion)( (System.Math.Sin((1 - (double)a) * angle) * (qdouble)x + System.Math.Sin((double)a * angle) * (qdouble)y) / System.Math.Sin(angle) );
            }
        }*/
        
        /// <summary>
        /// Calculates a proper spherical interpolation between two quaternions (only works for normalized quaternions).
        /// </summary>
        /*public static Quaternion SLerp(Quaternion x, Quaternion y, float a)
        {
            var z = y;
            var cosTheta = (double)Dot(x, y);
            if (cosTheta < 0) { z = -y; cosTheta = -cosTheta; }
            if (cosTheta > 1 - float.Epsilon)
                return Lerp(x, z, a);
            else
            {
                var angle = System.Math.Acos((double)cosTheta);
                return (Quaternion)( (System.Math.Sin((1 - (double)a) * angle) * (qdouble)x + System.Math.Sin((double)a * angle) * (qdouble)z) / System.Math.Sin(angle) );
            }
        }*/
        
        /// <summary>
        /// Applies squad interpolation of these quaternions
        /// </summary>
        /*public static Quaternion Squad(Quaternion q1, Quaternion q2, Quaternion s1, Quaternion s2, float h) => Mix(Mix(q1, q2, h), Mix(s1, s2, h), 2 * (1 - h) * h);*/

        //#endregion


        //#region Component-Wise Static Functions
        
        /// <summary>
        /// Returns a bool4 from component-wise application of IsInfinity (v.IsInfinity).
        /// </summary>
        /*public static bool4 IsInfinity(Quaternion v) => bool4(v.x.IsInfinity, v.y.IsInfinity, v.z.IsInfinity, v.w.IsInfinity);*/
        
        /// <summary>
        /// Returns a bool from the application of IsInfinity (v.IsInfinity).
        /// </summary>
        /*public static bool4 IsInfinity(float v) => bool4(v.IsInfinity);*/
        
        /// <summary>
        /// Returns a bool4 from component-wise application of IsFinite (v.IsFinite).
        /// </summary>
        /*public static bool4 IsFinite(Quaternion v) => bool4(v.x.IsFinite, v.y.IsFinite, v.z.IsFinite, v.w.IsFinite);*/
        
        /// <summary>
        /// Returns a bool from the application of IsFinite (v.IsFinite).
        /// </summary>
        /*public static bool4 IsFinite(float v) => bool4(v.IsFinite);*/
        
        /// <summary>
        /// Returns a bool4 from component-wise application of IsNaN (v.IsNaN).
        /// </summary>
        /*public static bool4 IsNaN(Quaternion v) => bool4(v.x.IsNaN, v.y.IsNaN, v.z.IsNaN, v.w.IsNaN);*/
        
        /// <summary>
        /// Returns a bool from the application of IsNaN (v.IsNaN).
        /// </summary>
        /*public static bool4 IsNaN(float v) => bool4(v.IsNaN);*/
        
        /// <summary>
        /// Returns a bool4 from component-wise application of IsNegativeInfinity (v.IsNegativeInfinity).
        /// </summary>
        /*public static bool4 IsNegativeInfinity(Quaternion v) => bool4(v.x.IsNegativeInfinity, v.y.IsNegativeInfinity, v.z.IsNegativeInfinity, v.w.IsNegativeInfinity);*/
        
        /// <summary>
        /// Returns a bool from the application of IsNegativeInfinity (v.IsNegativeInfinity).
        /// </summary>
        /*public static bool4 IsNegativeInfinity(float v) => bool4(v.IsNegativeInfinity);*/
        
        /// <summary>
        /// Returns a bool4 from component-wise application of IsPositiveInfinity (v.IsPositiveInfinity).
        /// </summary>
        /*public static bool4 IsPositiveInfinity(Quaternion v) => bool4(v.x.IsPositiveInfinity, v.y.IsPositiveInfinity, v.z.IsPositiveInfinity, v.w.IsPositiveInfinity);*/
        
        /// <summary>
        /// Returns a bool from the application of IsPositiveInfinity (v.IsPositiveInfinity).
        /// </summary>
        /*public static bool4 IsPositiveInfinity(float v) => bool4(v.IsPositiveInfinity);*/
        
        /// <summary>
        /// Returns a bool4 from component-wise application of Equal (lhs == rhs).
        /// </summary>
        /*public static bool4 Equal(Quaternion lhs, Quaternion rhs) => bool4(lhs.x == rhs.x, lhs.y == rhs.y, lhs.z == rhs.z, lhs.w == rhs.w);*/
        
        /// <summary>
        /// Returns a bool4 from component-wise application of Equal (lhs == rhs).
        /// </summary>
        /*public static bool4 Equal(Quaternion lhs, float rhs) => bool4(lhs.x == rhs, lhs.y == rhs, lhs.z == rhs, lhs.w == rhs);*/
        
        /// <summary>
        /// Returns a bool4 from component-wise application of Equal (lhs == rhs).
        /// </summary>
        /*public static bool4 Equal(float lhs, Quaternion rhs) => bool4(lhs == rhs.x, lhs == rhs.y, lhs == rhs.z, lhs == rhs.w);*/
        
        /// <summary>
        /// Returns a bool from the application of Equal (lhs == rhs).
        /// </summary>
        /*public static bool4 Equal(float lhs, float rhs) => bool4(lhs == rhs);*/
        
        /// <summary>
        /// Returns a bool4 from component-wise application of NotEqual (lhs != rhs).
        /// </summary>
        /*public static bool4 NotEqual(Quaternion lhs, Quaternion rhs) => bool4(lhs.x != rhs.x, lhs.y != rhs.y, lhs.z != rhs.z, lhs.w != rhs.w);*/
        
        /// <summary>
        /// Returns a bool4 from component-wise application of NotEqual (lhs != rhs).
        /// </summary>
        /*public static bool4 NotEqual(Quaternion lhs, float rhs) => bool4(lhs.x != rhs, lhs.y != rhs, lhs.z != rhs, lhs.w != rhs);*/
        
        /// <summary>
        /// Returns a bool4 from component-wise application of NotEqual (lhs != rhs).
        /// </summary>
        /*public static bool4 NotEqual(float lhs, Quaternion rhs) => bool4(lhs != rhs.x, lhs != rhs.y, lhs != rhs.z, lhs != rhs.w);*/
        
        /// <summary>
        /// Returns a bool from the application of NotEqual (lhs != rhs).
        /// </summary>
        /*public static bool4 NotEqual(float lhs, float rhs) => bool4(lhs != rhs);*/
        
        /// <summary>
        /// Returns a bool4 from component-wise application of GreaterThan (lhs &gt; rhs).
        /// </summary>
        /*public static bool4 GreaterThan(Quaternion lhs, Quaternion rhs) => bool4(lhs.x > rhs.x, lhs.y > rhs.y, lhs.z > rhs.z, lhs.w > rhs.w);*/
        
        /// <summary>
        /// Returns a bool4 from component-wise application of GreaterThan (lhs &gt; rhs).
        /// </summary>
        /*public static bool4 GreaterThan(Quaternion lhs, float rhs) => bool4(lhs.x > rhs, lhs.y > rhs, lhs.z > rhs, lhs.w > rhs);*/
        
        /// <summary>
        /// Returns a bool4 from component-wise application of GreaterThan (lhs &gt; rhs).
        /// </summary>
        /*public static bool4 GreaterThan(float lhs, Quaternion rhs) => bool4(lhs > rhs.x, lhs > rhs.y, lhs > rhs.z, lhs > rhs.w);*/
        
        /// <summary>
        /// Returns a bool from the application of GreaterThan (lhs &gt; rhs).
        /// </summary>
        /*public static bool4 GreaterThan(float lhs, float rhs) => bool4(lhs > rhs);*/
        
        /// <summary>
        /// Returns a bool4 from component-wise application of GreaterThanEqual (lhs &gt;= rhs).
        /// </summary>
        /*public static bool4 GreaterThanEqual(Quaternion lhs, Quaternion rhs) => bool4(lhs.x >= rhs.x, lhs.y >= rhs.y, lhs.z >= rhs.z, lhs.w >= rhs.w);*/
        
        /// <summary>
        /// Returns a bool4 from component-wise application of GreaterThanEqual (lhs &gt;= rhs).
        /// </summary>
        /*public static bool4 GreaterThanEqual(Quaternion lhs, float rhs) => bool4(lhs.x >= rhs, lhs.y >= rhs, lhs.z >= rhs, lhs.w >= rhs);*/
        
        /// <summary>
        /// Returns a bool4 from component-wise application of GreaterThanEqual (lhs &gt;= rhs).
        /// </summary>
        /*public static bool4 GreaterThanEqual(float lhs, Quaternion rhs) => bool4(lhs >= rhs.x, lhs >= rhs.y, lhs >= rhs.z, lhs >= rhs.w);*/
        
        /// <summary>
        /// Returns a bool from the application of GreaterThanEqual (lhs &gt;= rhs).
        /// </summary>
        /*public static bool4 GreaterThanEqual(float lhs, float rhs) => bool4(lhs >= rhs);*/
        
        /// <summary>
        /// Returns a bool4 from component-wise application of LesserThan (lhs &lt; rhs).
        /// </summary>
        /*public static bool4 LesserThan(Quaternion lhs, Quaternion rhs) => bool4(lhs.x < rhs.x, lhs.y < rhs.y, lhs.z < rhs.z, lhs.w < rhs.w);*/
        
        /// <summary>
        /// Returns a bool4 from component-wise application of LesserThan (lhs &lt; rhs).
        /// </summary>
        /*public static bool4 LesserThan(Quaternion lhs, float rhs) => bool4(lhs.x < rhs, lhs.y < rhs, lhs.z < rhs, lhs.w < rhs);*/
        
        /// <summary>
        /// Returns a bool4 from component-wise application of LesserThan (lhs &lt; rhs).
        /// </summary>
        /*public static bool4 LesserThan(float lhs, Quaternion rhs) => bool4(lhs < rhs.x, lhs < rhs.y, lhs < rhs.z, lhs < rhs.w);*/
        
        /// <summary>
        /// Returns a bool from the application of LesserThan (lhs &lt; rhs).
        /// </summary>
        /*public static bool4 LesserThan(float lhs, float rhs) => bool4(lhs < rhs);*/
        
        /// <summary>
        /// Returns a bool4 from component-wise application of LesserThanEqual (lhs &lt;= rhs).
        /// </summary>
        /*public static bool4 LesserThanEqual(Quaternion lhs, Quaternion rhs) => bool4(lhs.x <= rhs.x, lhs.y <= rhs.y, lhs.z <= rhs.z, lhs.w <= rhs.w);*/
        
        /// <summary>
        /// Returns a bool4 from component-wise application of LesserThanEqual (lhs &lt;= rhs).
        /// </summary>
        /*public static bool4 LesserThanEqual(Quaternion lhs, float rhs) => bool4(lhs.x <= rhs, lhs.y <= rhs, lhs.z <= rhs, lhs.w <= rhs);*/
        
        /// <summary>
        /// Returns a bool4 from component-wise application of LesserThanEqual (lhs &lt;= rhs).
        /// </summary>
        /*public static bool4 LesserThanEqual(float lhs, Quaternion rhs) => bool4(lhs <= rhs.x, lhs <= rhs.y, lhs <= rhs.z, lhs <= rhs.w);*/
        
        /// <summary>
        /// Returns a bool from the application of LesserThanEqual (lhs &lt;= rhs).
        /// </summary>
        /*public static bool4 LesserThanEqual(float lhs, float rhs) => bool4(lhs <= rhs);*/
        
        /// <summary>
        /// Returns a qfloat from component-wise application of Lerp (min * (1-a) + max * a).
        /// </summary>
        public static Quaternion Lerp(Quaternion min, Quaternion max, Quaternion a) => Quaternion(min.x * (1-a.x) + max.x * a.x, min.y * (1-a.y) + max.y * a.y, min.z * (1-a.z) + max.z * a.z, min.w * (1-a.w) + max.w * a.w);
        
        /// <summary>
        /// Returns a qfloat from component-wise application of Lerp (min * (1-a) + max * a).
        /// </summary>
        public static Quaternion Lerp(Quaternion min, Quaternion max, float a) => Quaternion(min.x * (1-a) + max.x * a, min.y * (1-a) + max.y * a, min.z * (1-a) + max.z * a, min.w * (1-a) + max.w * a);
        
        /// <summary>
        /// Returns a qfloat from component-wise application of Lerp (min * (1-a) + max * a).
        /// </summary>
        public static Quaternion Lerp(Quaternion min, float max, Quaternion a) => Quaternion(min.x * (1-a.x) + max * a.x, min.y * (1-a.y) + max * a.y, min.z * (1-a.z) + max * a.z, min.w * (1-a.w) + max * a.w);
        
        /// <summary>
        /// Returns a qfloat from component-wise application of Lerp (min * (1-a) + max * a).
        /// </summary>
        public static Quaternion Lerp(Quaternion min, float max, float a) => Quaternion(min.x * (1-a) + max * a, min.y * (1-a) + max * a, min.z * (1-a) + max * a, min.w * (1-a) + max * a);
        
        /// <summary>
        /// Returns a qfloat from component-wise application of Lerp (min * (1-a) + max * a).
        /// </summary>
        public static Quaternion Lerp(float min, Quaternion max, Quaternion a) => Quaternion(min * (1-a.x) + max.x * a.x, min * (1-a.y) + max.y * a.y, min * (1-a.z) + max.z * a.z, min * (1-a.w) + max.w * a.w);
        
        /// <summary>
        /// Returns a qfloat from component-wise application of Lerp (min * (1-a) + max * a).
        /// </summary>
        public static Quaternion Lerp(float min, Quaternion max, float a) => Quaternion(min * (1-a) + max.x * a, min * (1-a) + max.y * a, min * (1-a) + max.z * a, min * (1-a) + max.w * a);
        
        /// <summary>
        /// Returns a qfloat from component-wise application of Lerp (min * (1-a) + max * a).
        /// </summary>
        public static Quaternion Lerp(float min, float max, Quaternion a) => Quaternion(min * (1-a.x) + max * a.x, min * (1-a.y) + max * a.y, min * (1-a.z) + max * a.z, min * (1-a.w) + max * a.w);
        
        /// <summary>
        /// Returns a qfloat from the application of Lerp (min * (1-a) + max * a).
        /// </summary>
        public static Quaternion Lerp(float min, float max, float a) => Quaternion(min * (1-a) + max * a);

        //#endregion


        //#region Component-Wise Operator Overloads
        
        /// <summary>
        /// Returns a bool4 from component-wise application of operator&lt; (lhs &lt; rhs).
        /// </summary>
        /*public static bool4 operator<(Quaternion lhs, Quaternion rhs) => bool4(lhs.x < rhs.x, lhs.y < rhs.y, lhs.z < rhs.z, lhs.w < rhs.w);*/
        
        /// <summary>
        /// Returns a bool4 from component-wise application of operator&lt; (lhs &lt; rhs).
        /// </summary>
        /*public static bool4 operator<(Quaternion lhs, float rhs) => bool4(lhs.x < rhs, lhs.y < rhs, lhs.z < rhs, lhs.w < rhs);*/
        
        /// <summary>
        /// Returns a bool4 from component-wise application of operator&lt; (lhs &lt; rhs).
        /// </summary>
        /*public static bool4 operator<(float lhs, Quaternion rhs) => bool4(lhs < rhs.x, lhs < rhs.y, lhs < rhs.z, lhs < rhs.w);*/
        
        /// <summary>
        /// Returns a bool4 from component-wise application of operator&lt;= (lhs &lt;= rhs).
        /// </summary>
        /*public static bool4 operator<=(Quaternion lhs, Quaternion rhs) => bool4(lhs.x <= rhs.x, lhs.y <= rhs.y, lhs.z <= rhs.z, lhs.w <= rhs.w);*/
        
        /// <summary>
        /// Returns a bool4 from component-wise application of operator&lt;= (lhs &lt;= rhs).
        /// </summary>
        /*public static bool4 operator<=(Quaternion lhs, float rhs) => bool4(lhs.x <= rhs, lhs.y <= rhs, lhs.z <= rhs, lhs.w <= rhs);*/
        
        /// <summary>
        /// Returns a bool4 from component-wise application of operator&lt;= (lhs &lt;= rhs).
        /// </summary>
        /*public static bool4 operator<=(float lhs, Quaternion rhs) => bool4(lhs <= rhs.x, lhs <= rhs.y, lhs <= rhs.z, lhs <= rhs.w);*/
        
        /// <summary>
        /// Returns a bool4 from component-wise application of operator&gt; (lhs &gt; rhs).
        /// </summary>
        /*public static bool4 operator>(Quaternion lhs, Quaternion rhs) => bool4(lhs.x > rhs.x, lhs.y > rhs.y, lhs.z > rhs.z, lhs.w > rhs.w);*/
        
        /// <summary>
        /// Returns a bool4 from component-wise application of operator&gt; (lhs &gt; rhs).
        /// </summary>
        /*public static bool4 operator>(Quaternion lhs, float rhs) => bool4(lhs.x > rhs, lhs.y > rhs, lhs.z > rhs, lhs.w > rhs);*/
        
        /// <summary>
        /// Returns a bool4 from component-wise application of operator&gt; (lhs &gt; rhs).
        /// </summary>
        /*public static bool4 operator>(float lhs, Quaternion rhs) => bool4(lhs > rhs.x, lhs > rhs.y, lhs > rhs.z, lhs > rhs.w);*/
        
        /// <summary>
        /// Returns a bool4 from component-wise application of operator&gt;= (lhs &gt;= rhs).
        /// </summary>
        /*public static bool4 operator>=(Quaternion lhs, Quaternion rhs) => bool4(lhs.x >= rhs.x, lhs.y >= rhs.y, lhs.z >= rhs.z, lhs.w >= rhs.w);*/
        
        /// <summary>
        /// Returns a bool4 from component-wise application of operator&gt;= (lhs &gt;= rhs).
        /// </summary>
        /*public static bool4 operator>=(Quaternion lhs, float rhs) => bool4(lhs.x >= rhs, lhs.y >= rhs, lhs.z >= rhs, lhs.w >= rhs);*/
        
        /// <summary>
        /// Returns a bool4 from component-wise application of operator&gt;= (lhs &gt;= rhs).
        /// </summary>
        /*public static bool4 operator>=(float lhs, Quaternion rhs) => bool4(lhs >= rhs.x, lhs >= rhs.y, lhs >= rhs.z, lhs >= rhs.w);*/
        
        /// <summary>
        /// Returns a qfloat from component-wise application of operator- (-v).
        /// </summary>
        public static Quaternion operator-(Quaternion v) => Quaternion(-v.x, -v.y, -v.z, -v.w);
        
        /// <summary>
        /// Returns a qfloat from component-wise application of operator+ (lhs + rhs).
        /// </summary>
        public static Quaternion operator+(Quaternion lhs, Quaternion rhs) => Quaternion(lhs.x + rhs.x, lhs.y + rhs.y, lhs.z + rhs.z, lhs.w + rhs.w);
        
        /// <summary>
        /// Returns a qfloat from component-wise application of operator+ (lhs + rhs).
        /// </summary>
        public static Quaternion operator+(Quaternion lhs, float rhs) => Quaternion(lhs.x + rhs, lhs.y + rhs, lhs.z + rhs, lhs.w + rhs);
        
        /// <summary>
        /// Returns a qfloat from component-wise application of operator+ (lhs + rhs).
        /// </summary>
        public static Quaternion operator+(float lhs, Quaternion rhs) => Quaternion(lhs + rhs.x, lhs + rhs.y, lhs + rhs.z, lhs + rhs.w);
        
        /// <summary>
        /// Returns a qfloat from component-wise application of operator- (lhs - rhs).
        /// </summary>
        public static Quaternion operator-(Quaternion lhs, Quaternion rhs) => Quaternion(lhs.x - rhs.x, lhs.y - rhs.y, lhs.z - rhs.z, lhs.w - rhs.w);
        
        /// <summary>
        /// Returns a qfloat from component-wise application of operator- (lhs - rhs).
        /// </summary>
        public static Quaternion operator-(Quaternion lhs, float rhs) => Quaternion(lhs.x - rhs, lhs.y - rhs, lhs.z - rhs, lhs.w - rhs);
        
        /// <summary>
        /// Returns a qfloat from component-wise application of operator- (lhs - rhs).
        /// </summary>
        public static Quaternion operator-(float lhs, Quaternion rhs) => Quaternion(lhs - rhs.x, lhs - rhs.y, lhs - rhs.z, lhs - rhs.w);
        
        /// <summary>
        /// Returns a qfloat from component-wise application of operator* (lhs * rhs).
        /// </summary>
        public static Quaternion operator*(Quaternion lhs, float rhs) => Quaternion(lhs.x * rhs, lhs.y * rhs, lhs.z * rhs, lhs.w * rhs);
        
        /// <summary>
        /// Returns a qfloat from component-wise application of operator* (lhs * rhs).
        /// </summary>
        public static Quaternion operator*(float lhs, Quaternion rhs) => Quaternion(lhs * rhs.x, lhs * rhs.y, lhs * rhs.z, lhs * rhs.w);
        
        /// <summary>
        /// Returns a qfloat from component-wise application of operator/ (lhs / rhs).
        /// </summary>
        public static Quaternion operator/(Quaternion lhs, float rhs) => Quaternion(lhs.x / rhs, lhs.y / rhs, lhs.z / rhs, lhs.w / rhs);

        //#endregion

    }
}
