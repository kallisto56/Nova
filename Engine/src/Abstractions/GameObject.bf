namespace Engine
{
	using System;
	using System.Collections;


	public class GameObject
	{
		public bool isEnabled;

		public GameObject parent;

		public Transform transform;
		public List<GameObject> children;
		public List<Component> components;


		public ~this ()
		{
			delete this.transform;
			DeleteContainerAndItems!(this.children);
			DeleteContainerAndItems!(this.components);
		}


		public T Create <T> () where T : CameraComponent
		{
			T component = new T(this);

			if (this.components == null)
			{
				this.components = new List<Component>();
			}

			this.components.Add(component);
			return component;
		}


		public void UpdateTransformations (bool forceUpdate = false)
		{
			if (this.transform.isDirty == false && forceUpdate == false)
			{
				return;
			}

			if (this.parent != null)
			{
				this.transform.ComputeWorldMatrix(this.parent.transform.worldMatrix);
			}
			else
			{
				this.transform.ComputeWorldMatrix();
			}

			if (this.children == null || this.children.Count == 0)
			{
				return;
			}

			for (int n = 0; n < this.children.Count; n++)
			{
				this.children[n].UpdateTransformations(forceUpdate);
			}
		}


		/*public static void AddChild (GameObject parent, GameObject child)
		{
			if (parent.children == null)
			{
				parent.children = new List<GameObject>();
			}

			parent.children.Add(child);
		}

		public static void RemoveChild (GameObject parent, GameObject child, bool deleteEmptyList)
		{
			parent.children.Remove(child);
			if (deleteEmptyList == true && parent.children.Count == 0)
			{
				delete parent.children;
			}
		}

		public static void AddComponent (GameObject gameObject, Component component)
		{
			if (gameObject.components == null)
			{
				gameObject.components = new List<Component>();
			}
			gameObject.components.Add(component);
		}

		public static void RemoveComponent (GameObject gameObject, Component component, bool deleteEmptyList)
		{
			gameObject.components.Remove(component);
			if (deleteEmptyList == true && gameObject.components.Count == 0)
			{
				delete gameObject.components;
			}
		}*/
	}


}