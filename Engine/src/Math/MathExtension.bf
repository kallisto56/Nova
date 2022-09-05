namespace System
{
	extension Math
	{
		public static float InverseLerp (float a, float b, float t)
		{
			if (a != b)
			{
				return Clamp01((t - a) / (b - a));
			}

			return 0f;
		}

		public static float Clamp01 (float value)
		{
			if (value < 0F)
			{
			    return 0F;
			}
			else if (value > 1F)
			{
				return 1F;
			}

			return value;
		}
	}
}