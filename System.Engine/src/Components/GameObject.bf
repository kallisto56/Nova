namespace System.Engine;


using System;
using System.Diagnostics;
using System.Collections;
using System.Math;


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


	public T Create <T> () where T : Component
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


}