namespace System.Engine;


using System;
using System.Math;


extension Pipeline
{
	public struct BlendStateDescription
	{
		public Color<float> blendFactor;
		public BlendAttachmentDescription[] attachmentStates;
		public bool alphaToCoverageEnabled = false; // TODO: alphaToCoverageEnabled
		public bool alphaToOneEnable = false; // TODO: alphaToOneEnable


		public this (Color<float> blendFactor, params BlendAttachmentDescription[] attachmentStates)
		{
		    this.blendFactor = blendFactor;
		    this.attachmentStates = attachmentStates;
		}


		public static readonly BlendStateDescription singleOverrideBlend = BlendStateDescription
		{
		    attachmentStates = new BlendAttachmentDescription[] (.OverrideBlend)
		} ~ delete _.attachmentStates;


		public static readonly BlendStateDescription singleAlphaBlend = BlendStateDescription
		{
		    attachmentStates = new BlendAttachmentDescription[] (.AlphaBlend)
		} ~ delete _.attachmentStates;


		public static readonly BlendStateDescription singleAdditiveBlend = BlendStateDescription
		{
		    attachmentStates = new BlendAttachmentDescription[] (.AdditiveBlend)
		} ~ delete _.attachmentStates;


		public static readonly BlendStateDescription singleDisabled = BlendStateDescription
		{
		    attachmentStates = new BlendAttachmentDescription[] (.Disabled)
		} ~ delete _.attachmentStates;


		public static readonly BlendStateDescription empty = BlendStateDescription
		{
		    attachmentStates = null
		};
	}
}