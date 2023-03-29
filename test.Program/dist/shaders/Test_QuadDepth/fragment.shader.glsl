#version 450

// layout (depth_unchanged) out float gl_FragDepth;

layout(location = 0) in vec4 inColor;
layout(location = 1) in vec4 inPos;

layout(location = 0) out vec4 outColor;

void main(void)
{
	// gl_FragDepth = inPos.z;
	outColor = inColor;//vec4(inPos.z, inPos.w, 0, 1.0);
}