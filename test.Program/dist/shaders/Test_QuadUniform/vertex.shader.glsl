#version 450

layout(set = 0, binding = 0) uniform UniformBufferObject {
	mat4 matrix;
} ubo;

layout(location = 0) in vec4 Position;
layout(location = 1) in vec4 Color;

layout(location = 0) out vec4 outColor;

void main(void)
{
	gl_Position = ubo.matrix * Position;
	outColor = Color;
}