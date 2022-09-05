namespace Game
{
	using System;
	using System.Threading;
	using System.Collections;

	using Engine;


	public class GPUProcessor
	{
		public GPUThread[] threads;
		public volatile bool isPendingCancellation = false;
		public Performance.Counter perfCounter = new Performance.Counter("") ~ delete _;


		public this (int countThreads)
		{
			if (countThreads > 1)
			{
				this.threads = new GPUThread[countThreads];
				for (int n = 0; n < this.threads.Count; n++)
				{
					this.threads[n] = new GPUThread(this);
				}
			}
		}


		public ~this ()
		{
			if (this.threads != null)
			{
				this.isPendingCancellation = true;
				this.WaitForThreadsToClose();
			}

			DeleteContainerAndItems!(this.threads);
		}

		public void SimpleDispatch (SoftwareShader shader, int3 volume)
		{
			using (this.perfCounter.Start())
			{
				for (int y = 0; y < volume.y; y++)
				{
					for (int x = 0; x < volume.x; x++)
					{
						for (int z = 0; z < volume.z; z++)
						{
							shader.Main(int3(x, y, z));
						}
					}
				}
			}
		}

		public void Dispatch (SoftwareShader shader, int3 volume)
		{
			if (this.threads == null)
			{
				this.SimpleDispatch(shader, volume);
				return;
			}

			for (int n = 0; n < this.threads.Count; n++)
			{
				int count = this.threads[n].queue.Count;
				if (count != 0) Console.WriteLine("!!GPUThread[{0}].queue.Count = {1}", n, count);
			}

			int index = 0;
			using (this.perfCounter.Start())
			{
				for (int y = 0; y < volume.y; y++)
				{
					for (int x = 0; x < volume.x; x++)
					{
						for (int z = 0; z < volume.z; z++)
						{
							this.threads[index].queue.Add(GPUThreadArgs(shader, int3(x, y, z)));
							if (index + 1 == this.threads.Count)
							{
								index = 0;
							}
							else
							{
								index = index + 1;
							}
						}
					}
				}
			}

			for (int n = 0; n < this.threads.Count; n++)
			{
				GPUThread thread = this.threads[n];
				thread.queue.Add(GPUThreadArgs(null, int3.Zero));

				if (thread.isStarted == false)
				{
					thread.isStarted = true;
					thread.Start(false);
				}
				else
				{
					thread.Resume();
				}
			}

			WaitForCompletion();
		}


		public void WaitForThreadsToClose ()
		{
			for (int n = 0; n < this.threads.Count; n++)
			{
				this.threads[n].Resume();
			}

			while (true)
			{
				bool allTasksCompleted = true;
				for (int n = 0; n < this.threads.Count; n++)
				{
					if (this.threads[n].IsAlive == true)
					{
						allTasksCompleted = false;
					}
				}

				if (allTasksCompleted == true) break;
			}
		}


		public void WaitForCompletion ()
		{
			while (true)
			{
				Thread.SpinWait(10);

				bool allTasksCompleted = true;
				for (int n = 0; n < this.threads.Count; n++)
				{
					GPUThread thread = this.threads[n];
					if (thread.queue.Count != 0)
					{
						if (thread.isSuspended == true)
						{
							thread.Resume();
						}

						allTasksCompleted = false;
						break;
					}

					
				}

				if (allTasksCompleted == true) return;
			}
		}
	}

	public class GPUThread : Thread
	{
		public Queue<GPUThreadArgs> queue;
		public GPUProcessor processor;
		public bool isStarted = false;
		public volatile bool isSuspended = false;

		public this (GPUProcessor processor) : base(new => this.OnDoWork)
		{
			this.processor = processor;
			this.queue = new Queue<GPUThreadArgs>();
		}

		public this () : base(new => this.OnDoWork)
		{
			Runtime.FatalError();
		}

		public ~this ()
		{
			delete this.queue;
		}

		void OnDoWork ()
		{
			while (true)
			{
				// Suspending thread, when queue is empty
				if (this.queue.IsEmpty == true)
				{
					Volatile.Write<bool>(ref this.isSuspended, true);
					this.Suspend();
				}

				Volatile.Write<bool>(ref this.isSuspended, false);

				// Check reason awakening, there are only two options: we have work, or we asked to close.
				if (this.processor.isPendingCancellation == true)
				{
					Console.WriteLine("GPUProcessor.isCancellationPending == TRUE");
					this.queue.Clear();
					return;
				}


				let response = this.queue.TryPopFront();
				if (response case .Ok(let task))
				{
					if (task.shader != null)
					{
						task.shader.Main(task.args);
					}
				}
				else
				{
					Warning("Queue is empty or failed to pop element from queue.");
				}
			}
		}
	}

	public struct GPUThreadArgs
	{
		public SoftwareShader shader;
		public int3 args;


		public this (SoftwareShader shader, int3 args)
		{
			this.shader = shader;
			this.args = args;
		}
	}
}