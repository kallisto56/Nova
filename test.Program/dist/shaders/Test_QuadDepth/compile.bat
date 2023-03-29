glslc --target-env=vulkan1.2 -fshader-stage=vertex vertex.shader.glsl -o vertex.shader.spirv
glslc --target-env=vulkan1.2 -fshader-stage=fragment fragment.shader.glsl -o fragment.shader.spirv
pause