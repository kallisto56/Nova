#version 450

const vec4 vertices[4] = vec4[4](
	vec4(-1.00, +1.00, +0.00, +0.00),
	vec4(+1.00, +1.00, +0.00, +0.00),
	vec4(-1.00, -1.00, +0.00, +0.00),
	vec4(+1.00, -1.00, +0.00, +0.00)
);

const vec4 colors[4] = vec4[4](
	vec4(+1.00, +0.00, +0.00, +1.00),
	vec4(+0.00, +1.00, +0.00, +1.00),
	vec4(+0.00, +0.00, +1.00, +1.00),
	vec4(+1.00, +1.00, +1.00, +1.00)
);

layout(location = 0) in vec4 Position;
layout(location = 1) in vec4 Color;

layout(location = 0) out vec4 outColor;

void main(void)
{
	vec4 pos = vertices[gl_VertexIndex];
	vec4 col = vec4(colors[gl_VertexIndex]);
	gl_Position = Position;//vec4(pos.x * 0.2, pos.y * 0.2, 0.0, 1.0);//pos;
	outColor = Color;
}