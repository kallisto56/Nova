namespace Engine
{
	using System;
	using System.Collections;
	using System.Diagnostics;
	using System.Threading;


	public class State
	{
		public bool isPendingClosure = false;
		public bool isRendering = false;

		public int targetFPS = 60;
		public double lastUpdateTime = 0;
		public double lastRenderTime = 0;
		public double currentTime = 0.0;
	}


}