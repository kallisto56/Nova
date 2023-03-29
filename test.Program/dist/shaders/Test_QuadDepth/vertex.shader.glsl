#version 450

layout(set = 0, binding = 0) uniform UniformBufferObject {
	mat4 matrix;
} ubo;

layout(location = 0) in vec4 Position;
layout(location = 1) in vec4 Color;

layout(location = 0) out vec4 outColor;
layout(location = 1) out vec4 outPos;

void main(void)
{
	outPos = ubo.matrix * Position;
	gl_Position = outPos;
	// outPos = vec4(outPos.xyz / outPos.w, 1.0);
	outColor = Color;
}