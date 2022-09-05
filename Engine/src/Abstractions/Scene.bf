namespace Engine
{
	using System;
	using System.Collections;


	public abstract class Scene
	{
		public String name;
		public bool isEnabled;

		public CameraComponent mainCamera;

		public List<GameObject> gameObjects;
		public List<MeshComponent> meshComponents;
		public List<CameraComponent> cameraComponents;
		public List<SceneComponent> sceneComponents;
		public List<Behaviour> behaviours;

		public List<ComponentSystem> componentSystems;


		public ~this ()
		{
			DeleteContainerAndItems!(this.gameObjects);
			DeleteContainerAndItems!(this.meshComponents);
			DeleteContainerAndItems!(this.cameraComponents);
			DeleteContainerAndItems!(this.sceneComponents);
			DeleteContainerAndItems!(this.behaviours);
			DeleteContainerAndItems!(this.componentSystems);
		}


		public T Add<T> () where T : SceneComponent
		{
			T component = new T();
			if (this.sceneComponents == null)
			{
				this.sceneComponents = new List<SceneComponent>();
			}
			this.sceneComponents.Add(component);
			return component;
		}


		public GameObject Create<T> (Transform transform = null) where T : GameObject
		{
			GameObject gameObject = new GameObject();

			if (transform == null)
			{
				gameObject.transform = new Transform();
			}
			else
			{
				gameObject.transform = transform;
			}

			if (this.gameObjects == null)
			{
				this.gameObjects = new List<GameObject>();
			}
			this.gameObjects.Add(gameObject);
			return gameObject;
		}


		public MeshComponent Add<T> (GameObject gameObject) where T : MeshComponent
		{
			MeshComponent meshComponent = new T();
			meshComponent.gameObject = gameObject;

			if (this.meshComponents == null)
			{
				this.meshComponents = new List<MeshComponent>();
			}
			this.meshComponents.Add(meshComponent);
			return meshComponent;
		}


		public CameraComponent Add<T> (GameObject gameObject) where T : CameraComponent
		{
			CameraComponent cameraComponent = new T();
			if (this.cameraComponents == null)
			{
				this.cameraComponents = new List<CameraComponent>();
			}
			this.cameraComponents.Add(cameraComponent);
			return cameraComponent;
		}


		public T Create<T> () where T : Behaviour
		{
			T behaviour = new T();
			if (this.behaviours == null)
			{
				this.behaviours = new List<Behaviour>();
			}
			this.behaviours.Add(behaviour);
			return behaviour;
		}


		public T Create<T> () where T : ComponentSystem
		{
			T componentSystem = new T();
			componentSystem.scene = this;
			if (this.componentSystems == null)
			{
				this.componentSystems = new List<ComponentSystem>();
			}
			this.componentSystems.Add(componentSystem);
			return componentSystem;
		}

		
		public virtual Result<void> Initialize ()
		{
			if (this.gameObjects != null)
			{
				/*this.componentSystems.Add(new Engine.Systems.GameObjectSystem());*/
			}

			if (this.meshComponents != null)
			{
				/*this.componentSystems.Add(new Engine.Systems.MeshComponentSystem());*/
			}

			if (this.cameraComponents != null)
			{
				/*this.componentSystems.Add(new Engine.Systems.CameraComponentSystem());*/
			}

			if (this.sceneComponents != null)
			{
				/*this.componentSystems.Add(new Engine.Systems.SceneComponentSystem());*/
			}

			if (this.behaviours != null)
			{
				/*this.componentSystems.Add(new Engine.Systems.BehaviourSystem());*/
			}

			return .Ok;
		}

		public virtual void Shutdown ()
		{
			if (this.gameObjects != null)
			{
				for (int n = 0; n < this.componentSystems.Count; n++)
				{
					this.componentSystems[n].Shutdown();
				}
			}

			if (this.meshComponents != null)
			{
				/*this.componentSystems.Add(new Engine.Systems.MeshComponentSystem());*/
			}

			if (this.cameraComponents != null)
			{
				/*this.componentSystems.Add(new Engine.Systems.CameraComponentSystem());*/
			}

			if (this.sceneComponents != null)
			{
				/*this.componentSystems.Add(new Engine.Systems.SceneComponentSystem());*/
				for (int n = 0; n < this.sceneComponents.Count; n++)
				{
					this.sceneComponents[n].Shutdown(this);
				}
			}

			if (this.behaviours != null)
			{
				for (int n = 0; n < this.behaviours.Count; n++)
				{
					this.behaviours[n].Shutdown(this);
				}
			}
		}


		public virtual void Update (bool isRendering)
		{
			if (this.componentSystems != null)
			{
				for (int n = 0; n < this.componentSystems.Count; n++)
				{
					this.componentSystems[n].Update();
				}
			}

			if (this.sceneComponents != null)
			{
				for (int n = 0; n < this.sceneComponents.Count; n++)
				{
					this.sceneComponents[n].Update(this);
				}
			}

			if (this.behaviours != null)
			{
				for (int n = 0; n < this.behaviours.Count; n++)
				{
					this.behaviours[n].Update(this);
				}
			}
		}


	}


}