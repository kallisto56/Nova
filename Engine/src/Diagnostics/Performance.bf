namespace Engine
{
	using System;
	using System.Diagnostics;


	public static class Performance
	{
		public static Counter updateGameComponents = new Counter("Update game objects") ~ delete _;
		public static Counter batchMeshes = new Counter("Batch meshes") ~ delete _;

		public static Measurement measurement = .ticks;


		public enum Measurement
		{
			ticks,
			milliseconds
		}


		public class Counter : IDisposable
		{
			public Stopwatch stopwatch;
			public String name;
			public String description;
			public int64 value;


			public this (String name)
			{
				this.name = name;
				this.description = new String();
				this.stopwatch = new Stopwatch();
			}


			public ~this ()
			{
				delete this.description;
				delete this.stopwatch;
			}


			public Counter Start ()
			{
				this.stopwatch.Reset();
				this.stopwatch.Start();
				return this;
			}


			public void Dispose ()
			{
				this.stopwatch.Stop();

				this.value = Performance.measurement == .milliseconds
					? this.stopwatch.ElapsedMilliseconds
					: this.stopwatch.ElapsedMicroseconds;

				String unitName = Performance.measurement == .ticks ? "ticks" : "ms";

				this.description.Clear();
				this.description.AppendF("{0}: {1} {2}", this.name, this.value, unitName);
			}


		}


	}


}