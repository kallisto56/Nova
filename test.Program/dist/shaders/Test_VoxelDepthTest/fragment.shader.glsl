#version 450


layout(location = 0) in vec3 fragVertexColor;
layout(location = 1) in vec3 fragOrigin;
layout(location = 2) in vec3 fragDirection;
layout(location = 3) in flat uint instanceIndex;

layout(location = 0) out vec4 fragOutputColor;

layout(std140, set = 2, binding = 0) readonly buffer VolumeBuffer {
    vec4 data[];
} volume;

// Enabling conservative depth
layout(depth_any) out float gl_FragDepth;

// This determines how many voxels per axis we have;
// Note, that the more voxels you have, the more
// `COUNT_STEPS` it will require to traverse it.
#define COUNT_VOXELS 8

// Maximum count of steps DDA algorithm will perform
#define COUNT_STEPS 64


vec2 intersectAABB (vec3 rayOrigin, vec3 rayDir, vec3 boxMin, vec3 boxMax)
{
	// taken from: https://gist.github.com/DomNomNom/46bb1ce47f68d255fd5d
	// which was adapted from https://github.com/evanw/webgl-path-tracing/blob/master/webgl-path-tracing.js
	vec3 tMin = (boxMin - rayOrigin) / rayDir;
	vec3 tMax = (boxMax - rayOrigin) / rayDir;

	vec3 t1 = min(tMin, tMax);
	vec3 t2 = max(tMin, tMax);

	float tNear = max(max(t1.x, t1.y), t1.z);
	float tFar = min(min(t2.x, t2.y), t2.z);

	return vec2(tNear, tFar);
}


float sdBox (vec3 p, vec3 b)
{
	vec3 q = abs(p) - b;
	return length(max(q, 0.0)) + min(max(q.x, max(q.y,q.z)), 0.0);
}


vec3 closestPointOnFiniteLine (vec3 point, vec3 origin, vec3 direction, float magnitude)
{
	// Source: https://stackoverflow.com/questions/51905268/how-to-find-closest-point-on-line
	return origin + direction * clamp(dot(point - origin, direction), 0.0, magnitude);
}


float randUni (inout int sd)
{
	sd = (sd ^ 61) ^ (sd >> 16);
	sd *= 9;
	sd = sd ^ (sd >> 4);
	sd *= 0x27d4eb2d;
	sd = sd ^ (sd >> 15);
	return fract(float(sd) * 2.3283064e-10);
}


bool intersects (vec3 mapPos, vec3 p, vec3 direction, float radius, out float circleDistance)
{
	if (radius == 0.0) return false;
	// vec3 p = mapPos + direction * 2.0;
	vec3 center = vec3(mapPos) + vec3(0.5);
	vec3 intersection = closestPointOnFiniteLine(center, p, direction, 2.0);
	circleDistance = length(center - intersection);
	// int seed = int((circleDistance) * float(34359));//343, 3435;
	int seed = int(34359*circleDistance);
	// return circleDistance < randUni(seed) + radius;// && circleDistance <= radius;
	return circleDistance <= radius;
}


uint to1D (uint x, uint y, uint z)
{
	return (z * y * x) - 1;
	// return x + 8 * (y + 8 * z);
    //return (z * 4 * 4) + (y * 4) + x;
}

float Clamp01 (float value)
{
	if (value < 0.0)
	{
	    return 0.0;
	}
	else if (value > 1.0)
	{
		return 1.0;
	}

	return value;
}

float InverseLerp (float a, float b, float t)
{
	if (a != b)
	{
		return Clamp01((t - a) / (b - a));
	}

	return 0.0;
}


void main ()
{
	uint offset = uint(instanceIndex) * 512;

	float countVoxels = float(COUNT_VOXELS);
	vec3 direction = normalize(fragDirection);
	vec3 point = fragOrigin;
	
	// Move ray inside of the cube [-0.5...0.5]
	point = point + direction * max(0, intersectAABB(point, direction, vec3(-0.49), vec3(+0.49)).x);
	bool isOutside = false;
	if (point.x < -0.5 || point.x > +0.5 ||
		point.y < -0.5 || point.y > +0.5 ||
		point.z < -0.5 || point.z > +0.5)
	{
		isOutside = true;
	}

	// Convert from [-0.5...0.5] to [0.0...COUNT_VOXELS]
	point = (point + 0.5) * countVoxels;

	// DDA prep (source: https://www.shadertoy.com/view/4dX3zl)
	ivec3 mapPos = ivec3(floor(point));
	vec3 deltaDist = abs(vec3(length(direction)) / direction);
	vec3 rayDirSign = sign(direction);
	ivec3 rayStep = ivec3(rayDirSign);
	vec3 sideDist = (rayDirSign * (vec3(mapPos) - point) + (rayDirSign * 0.5) + 0.5) * deltaDist;
	bvec3 mask;

	ivec3 zero = ivec3(0);
	ivec3 seven = ivec3(COUNT_VOXELS - 1);

	float distanceTraveled = 0.0;

	// float depth = gl_FragDepth;
	float depth_far = 50.0;
	float depth_near = 0.01;
	float depth_diff = depth_far - depth_near;

	// Exit, if we are out of bounds
	if (clamp(mapPos, zero, seven) != mapPos)
	{
		// Advance along the ray
		mask = lessThanEqual(sideDist.xyz, min(sideDist.yzx, sideDist.zxy));
		sideDist += vec3(mask) * deltaDist;
		mapPos += ivec3(vec3(mask)) * rayStep;
	}

	// ...
	for (int n = 0; n < COUNT_STEPS; n++)
	{
		// Checking if currently sampled voxel is 'solid'
		uint index = (mapPos.z * 64 + mapPos.y * 8 + mapPos.x) + offset;
		vec4 color = volume.data[index];

		float d = length(vec3(mask) * (sideDist - deltaDist)) / length(direction);
		vec3 p = point + direction * d;

		float distanceToCenter = 0.0;

		if (intersects(mapPos, p, direction, color.w, distanceToCenter) == true)
		// if (color.w > 0)
		{
			vec3 ndc_pos = (vec3(mapPos) / 8.0) - vec3(+0.5);
			vec3 camera = clamp(fragOrigin, vec3(-0.5), vec3(+0.5));
			float ndc_depth = length(ndc_pos - fragOrigin) - InverseLerp(color.w, 0.0, distanceToCenter) / 8.0;

			float depth = (((depth_far-depth_near) * ndc_depth) + depth_near + depth_far) / 2.0;
			depth = InverseLerp(0.01, 50.0, ndc_depth);
			gl_FragDepth = depth;

			fragOutputColor = vec4(color.xyz, 1.0);
			return;
		}

		// Advance along the ray
		mask = lessThanEqual(sideDist.xyz, min(sideDist.yzx, sideDist.zxy));
		sideDist += vec3(mask) * deltaDist;
		mapPos += ivec3(vec3(mask)) * rayStep;

		distanceTraveled += d;

		// Exit, if we are out of bounds
		if (clamp(mapPos, zero, seven) != mapPos)
		{
			break;
		}
	}

	// Discard value
	discard;
	// fragOutputColor = vec4(fragVertexColor.xyz, 1) * vec4(0.5, 0.5, 0.5, 1);
}