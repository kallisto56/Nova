namespace System.Engine;


using System;
using System.Diagnostics;
using System.Math;


public class Transform : Component
{
	Vector3 _position = Vector3.zero;
	Quaternion _rotation = Quaternion.Identity;
	Vector3 _scale = Vector3.one;

	public Vector3 position
	{
		get { return this._position; }
		set { this._position = value; this.isDirty = true; }
	}

	public Quaternion rotation
	{
		get { return this._rotation; }
		set { this._rotation = value; this.isDirty = true; }
	}

	public Vector3 scale
	{
		get { return this._scale; }
		set { this._scale = value; this.isDirty = true; }
	}

	public bool isDirty = true;
	public Matrix4x4 worldMatrix;

	public Vector3 forward => this.rotation * Vector3.forward;
	public Vector3 back => this.rotation * Vector3.back;
	public Vector3 right => this.rotation * Vector3.right;
	public Vector3 left => this.rotation * Vector3.left;
	public Vector3 up => this.rotation * Vector3.up;
	public Vector3 down => this.rotation * Vector3.down;


	public this ()
	{

	}


	public this (Vector3 position)
	{
		this._position = position;
	}


	public this (Vector3 position, Quaternion rotation)
	{
		this._position = position;
		this._rotation = rotation;
	}


	public this (Vector3 position, Quaternion rotation, Vector3 scale)
	{
		this._position = position;
		this._rotation = rotation;
		this._scale = scale;
	}


	public Matrix4x4 ComputeLocalMatrix ()
	{
		return Matrix4x4.Translate(this.position) * Matrix4x4(this.rotation) * Matrix4x4.Scale(this.scale);
	}


	public Matrix4x4 ComputeWorldMatrix (Matrix4x4 parentWorldMatrix)
	{
		this.isDirty = false;
		this.worldMatrix = parentWorldMatrix * this.ComputeLocalMatrix();
		return this.worldMatrix;
	}


	public Matrix4x4 ComputeWorldMatrix ()
	{
		this.isDirty = false;
		this.worldMatrix = this.ComputeLocalMatrix();
		return this.worldMatrix;
	}


	public void LookAt (Vector3 target, Vector3 upwards)
	{
		Vector3 direction = (target - this.position).normalized;
		this.rotation = Quaternion(Matrix4x4.LookAt(this.position, direction, upwards));
	}


	public override void ToString(String strBuffer)
	{
		strBuffer.AppendF("Transform({0}, {1}, {2});", this.position, this.rotation, this.scale);
	}


}