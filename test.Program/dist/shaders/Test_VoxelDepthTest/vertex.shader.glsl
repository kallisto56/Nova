#version 450

struct Instruction
{
	mat4 modelViewProjection;
    mat4 inverseModel;
};


layout(set = 0, binding = 0) uniform UniformBufferObject {
	vec4 cameraPosition;
} ubo;

layout(std140, set = 1, binding = 0) readonly buffer ObjectBuffer {
    Instruction instructions[];
} meta;

layout(location = 0) in vec4 vertexPosition;

layout(location = 0) out vec3 fragVertexColor;
layout(location = 1) out vec3 fragOrigin;
layout(location = 2) out vec3 fragDirection;
layout(location = 3) out flat uint instanceIndex;


void main()
{
	uint instanceIndex = gl_InstanceIndex;
	// ...
	Instruction instruction = meta.instructions[instanceIndex];

	// Transform vertex position from local-space to clip-space
	gl_Position = instruction.modelViewProjection * vertexPosition;

	// Convert camera position from world-space to local-space of the model
	vec3 cameraLocal = (instruction.inverseModel * ubo.cameraPosition).xyz;

	// Ray origin and direction
	fragOrigin = cameraLocal;
	fragDirection = vertexPosition.xyz - cameraLocal;

	// Providing color to fragment shader
	fragVertexColor = vertexPosition.xyz + vec3(0.5);
}