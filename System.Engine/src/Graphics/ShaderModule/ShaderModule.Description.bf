namespace System.Engine;


using System;
using System.Collections;


extension ShaderModule
{
	public struct Description
	{
		public Stages stages;
		public List<uint8> sourceCode;
		public String entryPoint;


		public this (Stages stages, List<uint8> sourceCode, String entryPoint = "main")
		{
			this.stages = stages;
			this.sourceCode = sourceCode;
			this.entryPoint = entryPoint;
		}
	}
}