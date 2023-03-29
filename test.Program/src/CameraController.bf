namespace test.Program;


using System;
using System.Engine;
using System.Math;
using System.Diagnostics;


public class CameraController
{
	public static CameraController instance;
	public CameraComponent camera;
	public GameObject gameObject;

	// Camera controller related variables
	bool mKeyReleased = true;
	bool isFreeCameraMode = false;
	Vector2 prevMousePosition;
	Vector2 mouseDelta;

	public float movementSpeed = 0.1F;


	public this ()
	{
		CameraController.instance = this;

		this.gameObject = new GameObject();
		this.gameObject.transform = new Transform();
		this.camera = this.gameObject.Create<CameraComponent>();
	}


	public ~this ()
	{
		delete this.gameObject;
	}


	public void Update (Engine e)
	{
		if (e.mouse.IsPressed(1) == true && mKeyReleased == true)//Engine.keyboard.IsPressed(.M) && mKeyReleased == true)
		{
			mKeyReleased = false;

			IMouse.InputMode inputMode = e.mouse.GetInputMode();
			if (inputMode == .disabled)
			{
				e.mouse.SetInputMode(.normal);
				isFreeCameraMode = false;
			}
			else
			{
				e.mouse.SetInputMode(.disabled);
				isFreeCameraMode = true;
				prevMousePosition = Vector2(e.mouse.x, e.mouse.y);
			}
		}

		mKeyReleased = e.mouse.IsPressed(1) == false;
		/*if (Engine.mouse.IsPressed(.BUTTON2) == false)
		{
			mKeyReleased = true;
		}*/

		this.mouseDelta = this.prevMousePosition - Vector2(e.mouse.x, e.mouse.y);
		this.prevMousePosition = Vector2(e.mouse.x, e.mouse.y);

		if (isFreeCameraMode)
		{
			float sensitivity = 0.001F;

			// Horizontal
			camera.gameObject.transform.rotation = camera.gameObject.transform.rotation
				.Inverse.Rotated(-this.mouseDelta.x * sensitivity, Vector3.up).Inverse;

			// Vertical
			camera.gameObject.transform.rotation = camera.gameObject.transform.rotation
				.Rotated(-this.mouseDelta.y * sensitivity, Vector3.right);
		}

		if (e.keyboard.IsPressed(.kP))
		{
			Tracy.WriteLine(this.camera.gameObject.transform);
		}

		Vector3 position = camera.gameObject.transform.position;
		/*float delta = float((Engine.state.currentTime - Engine.state.lastRenderTime) / TimeSpan.TicksPerMillisecond);*/
		/*float speed = 0.1F;//1F / delta;*/
		/*if (e.keyboard.IsPressed(.leftShift)) speed = 0.005F;
		if (e.keyboard.IsPressed(.leftControl)) speed = 2F;*/

		

		/*speed *= 0.000011F;*/
		/*speed = 0.1F;//speed * delta;*/

		if (e.keyboard.IsPressed(.F1))
		{
			position = Vector3.zero;
		}

		if (e.keyboard.IsPressed(.kZ))
		{
			this.movementSpeed -= 0.001F;
		}
		else if (e.keyboard.IsPressed(.kX))
		{
			this.movementSpeed += 0.001F;
		}

		/*this.movementSpeed += e.mouse.scrollOffsetY / 500F;*/
		this.movementSpeed = Math.Clamp(this.movementSpeed, 0.0005F, 0.25F);

		// TODO: There is a misunderstanding regarding how matrices work, because all of those additions to position should be +=
		if (e.keyboard.IsPressed(.kW)) position -= camera.gameObject.transform.forward * this.movementSpeed;
		if (e.keyboard.IsPressed(.kA)) position += camera.gameObject.transform.left * this.movementSpeed;
		if (e.keyboard.IsPressed(.kS)) position -= camera.gameObject.transform.back * this.movementSpeed;
		if (e.keyboard.IsPressed(.kD)) position += camera.gameObject.transform.right * this.movementSpeed;

		if (e.keyboard.IsPressed(.kQ)) position -= camera.gameObject.transform.down * this.movementSpeed;
		if (e.keyboard.IsPressed(.kE)) position -= camera.gameObject.transform.up * this.movementSpeed;

		camera.gameObject.transform.position = position;
	}
}