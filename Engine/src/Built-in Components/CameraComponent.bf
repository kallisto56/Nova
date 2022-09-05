namespace Engine
{
	using System;
	using System.Collections;


	public class CameraComponent : Component
	{
		public GameObject gameObject;
		public Frustum frustum = new Frustum() ~ delete _;
		public float nearPlane = 0.1F;
		public float farPlane = 1000F;
		public float aspectRatio = 16.0F / 9.0F;
		public float fieldOfView = 45F;


		public this (GameObject gameObject)
		{
			this.gameObject = gameObject;
		}


		public Matrix4x4 GetProjection()
		{
			return Matrix4x4.Perspective(this.fieldOfView, this.aspectRatio, this.nearPlane, this.farPlane);
		}


		public Matrix4x4 GetView()
		{
			return Matrix4x4.Translate(this.gameObject.transform.position) * Matrix4x4(this.gameObject.transform.rotation);
		}
	}


}