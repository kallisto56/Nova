namespace System.Engine;


using System;
using System.Diagnostics;
using System.Collections;
using System.Math;


public class CameraComponent : Component
{
	public GameObject gameObject;
	public float nearPlane = 0.01F;
	public float farPlane = 50.0F;
	public float aspectRatio = 16.0F / 9.0F;
	public float fieldOfView = 45F;


	public this (GameObject gameObject)
	{
		this.gameObject = gameObject;
	}


	public Matrix4x4 GetProjection (uint32 screenWidth, uint32 screenHeight)
	{
		this.aspectRatio = float(screenWidth) / float(screenHeight);
		return Matrix4x4.Perspective(this.fieldOfView, this.aspectRatio, this.nearPlane, this.farPlane);
	}


	public Matrix4x4 GetView ()
	{
		return (Matrix4x4.Translate(this.gameObject.transform.position) * Matrix4x4(this.gameObject.transform.rotation));
	}


}