namespace Game
{
	using System;
	using System.Collections;
	using Engine;
	using Engine.Misc;


	public class CameraController : Behaviour
	{
		public CameraComponent camera;

		// Camera controller related variables
		bool mKeyReleased = true;
		bool isFreeCameraMode = false;


		public override void Update (Scene scene)
		{
			if (Engine.keyboard.IsPressed(.M) && mKeyReleased == true)
			{
				mKeyReleased = false;

				Mouse.InputMode inputMode = Engine.platform.GetMouseInputMode();
				if (inputMode == .disabled)
				{
					Engine.platform.SetMouseInputMode(.normal);
					isFreeCameraMode = false;
				}
				else
				{
					Engine.platform.SetMouseInputMode(.disabled);
					isFreeCameraMode = true;
				}
			}

			if (Engine.keyboard.IsReleased(.M))
			{
				mKeyReleased = true;
			}

			if (isFreeCameraMode)
			{
				float sensitivity = 0.001F;

				camera.gameObject.transform.rotation = Quaternion
					.FromAxisAngle(Engine.mouse.position.x * sensitivity, Vector3.up)
					.Rotated(Engine.mouse.position.y * sensitivity, Vector3.right);
			}

			if (Engine.keyboard.IsPressed(.P))
			{
				Console.WriteLine(this.camera.gameObject.transform);
			}

			Vector3 position = camera.gameObject.transform.position;
			float speed = (Engine.keyboard.IsPressed(.LeftShift) || Engine.keyboard.IsRepeated(.LeftShift)) ? 0.001F : 0.015F;
			if (Engine.keyboard.IsPressed(.W) || Engine.keyboard.IsRepeated(.W)) position += camera.gameObject.transform.forward * speed;
			if (Engine.keyboard.IsPressed(.A) || Engine.keyboard.IsRepeated(.A)) position += camera.gameObject.transform.left * speed;
			if (Engine.keyboard.IsPressed(.S) || Engine.keyboard.IsRepeated(.S)) position += camera.gameObject.transform.back * speed;
			if (Engine.keyboard.IsPressed(.D) || Engine.keyboard.IsRepeated(.D)) position += camera.gameObject.transform.right * speed;

			if (Engine.keyboard.IsPressed(.Q) || Engine.keyboard.IsRepeated(.Q)) position += camera.gameObject.transform.down * speed;
			if (Engine.keyboard.IsPressed(.E) || Engine.keyboard.IsRepeated(.E)) position += camera.gameObject.transform.up * speed;
			camera.gameObject.transform.position = position;
		}
	}


}