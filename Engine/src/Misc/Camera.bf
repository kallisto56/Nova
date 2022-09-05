/*namespace Engine.Misc
{
	using System;
	using System.Collections;


	public class Camera
	{
		public Transform transform = new Transform() ~ delete _;
		public Frustum frustum = new Frustum() ~ delete _;
		public float nearPlane = 0.1F;
		public float farPlane = 1000F;
		public float aspectRation = 4F / 3F;//16.0F / 9.0F;
		public float fieldOfView = 45F;


		public ~this ()
		{
			delete this.transform;
		}


		public Matrix4x4 GetProjection()
		{
			return Matrix4x4.Perspective(this.fieldOfView, this.aspectRation, this.nearPlane, this.farPlane);
		}


		public Matrix4x4 GetCameraToWorld()
		{
			return Matrix4x4.Translate(this.transform.position) * Matrix4x4(this.transform.rotation);
		}


	}


}*/