namespace Game
{
	using System;
	using System.Collections;
	using System.IO;
	using System.Threading;

	using Engine;

	public class Notes
	{

	}

	// 4,294,967,295 => FFFFFFFF << 8BIT 
	//   268,435,455 => 0FFFFFFF << 7BIT 
	//    16,777,215 => 00FFFFFF << 6BIT 
	//     1,048,575 => 000FFFFF << 5BIT 
	//        65,535 => 0000FFFF << 4BIT 
	//         4,095 => 00000FFF << 3BIT 
	//           255 => 000000FF << 2BIT 
	//            15 => 0000000F << 1BIT

	// 18,446,744,073,709,551,615 => FFFFFFFFFFFFFFFF :: 64bit
	//  1,152,921,504,606,846,975 => 0FFFFFFFFFFFFFFF :: 60bit
	//     72,057,594,037,927,935 => 00FFFFFFFFFFFFFF :: 56bit
	//      4,503,599,627,370,495 => 000FFFFFFFFFFFFF :: 52bit
	//        281,474,976,710,655 => 0000FFFFFFFFFFFF :: 48bit
	//         17,592,186,044,415 => 00000FFFFFFFFFFF :: 44bit
	//          1,099,511,627,775 => 000000FFFFFFFFFF :: 40bit
	//             68,719,476,735 => 0000000FFFFFFFFF :: 36bit
	//              4,294,967,295 => 00000000FFFFFFFF :: 32bit
	//                268,435,455 => 000000000FFFFFFF :: 28bit
	//                 16,777,215 => 0000000000FFFFFF :: 24bit
	//                  1,048,575 => 00000000000FFFFF :: 20bit
	//                     65,535 => 000000000000FFFF :: 16bit
	//                      4,095 => 0000000000000FFF :: 12bit
	//                        255 => 00000000000000FF :: 08bit
	//                         15 => 000000000000000F :: 04bit


	// Currently, after intialization, engine enters cycle-mode.
	// During each cycle we check if it's time to render.
	// Each cycle, game world is updated once, and during update
	// it is known if we are rendering right now or not.

	// So, it is time to talk about scenes. Let's imagine a scene,
	// where we have every type of element we can have. For example,
	// we have cars, and updating them one by one as if they were
	// GameObjects like in Unity will consume whole frame.
	// Basicaly, the question is: how and when we can update any
	// object in scene. Note: there will be objects, that do not
	// change constantly.

	// Some elements update only during rendering inside compute
	// shaders, like leafs on the trees, grass and water.
	// At this moment, i think that our game will have water
	// only as decoration, and not as simulation, with exception
	// of the wind.

	// Cars on the other hand, requires constant update of position
	// and rotation. Each car requires access to navigation system.
	// Each car is driven by someone, which uses the car to reach
	// certain goal. From this, we can deduce, that at some point
	// person sitting in his home, can decide, that it is time to
	// go to work. Already here, we can deduce, that there is a
	// decision, and there for a set of rules, that used to find
	// next steps. And all this is a system, that uses rules, that
	// decides what happens next. This means, that we can create
	// somewhat abstract system, that works like so:
	// System contains elements, each of them contains internal
	// state they are in. Person is sitting home, person is walking
	// towards car, person is sitting in a car, driving somewhere,
	// person is at the job, restourant, etc.
	// So, Element changes its location, sometimes "being" as another
	// element. Person is inside a car, thus we do not need to worry
	// about the person anymore, we only process a car until, a car
	// reached its destination, then a switch happens, person goes
	// out of the car and enters building. Until conditions met,
	// person will be in the building.

	// Behaviours, state of which we can render onto the screen.
	// Let's say, that while a person is inside a bus, in memory,
	// it sits in a list of "disabled" elements. This means,
	// when person switches location (building, car, bus etc),
	// person either have location field, or is moved from
	// one list to another.

	// Alternative is pretty simple, we have a root scene,
	// which can contain scenes, multiple of them can be
	// active at the same time.
	// Each scene is a list of game objects. Each game object
	// will have predefined fileds for available components,
	// like MeshComponent or CameraComponent.
	// Alternative approach goes in a very simple manner,
	// we iterate over all active scenes and active
	// game objects in them, call update methods,
	// providing with EngineState for game object to
	// be aware of current situation.
	// There are systems, but all of this is a responsibility
	// of the game and not an engine. So any system, like
	// navigation, traffic or building network is a game object.
	// Yes, this approach is not optimized at all, but this,
	// like our SoftwareRenderer is start, from which we
	// can test things and possibly even make a prototype
	// of the game. On small scales, this will work okay,
	// which is what i think will be good enough to
	// A build a prototype to play with and play in,
	// and B, this prototype can potentially reveal game
	// structure to us.

	// Altough, we could add a second type of game object
	// which is a SystemObject, that acts as a container
	// for storing grouped game objects within it.

	// Biggest issue right now is preparation before
	// rendering. Basic idea, is that we need know
	// where are meshes are stored and where game objects
	// are placed in the world.

	// Right before render, we have multiple arrays, that
	// can tell us:
	// - What meshes we need to include in the buffer
	// - Where each mesh should be rendered
	// - Which clusters of each mesh should be rendered.
	// Altough, actually, i'm thinking that we will have
	// a list of instruction, draw this cluster, from that
	// mesh, with this set of normals, this set of colors,
	// using this two matrices (gameobject and camera).
	// This set of instruction also tells us, which meshes
	// we will need to prepare in the buffer.
	// There are some concerns regarding multiple buffers,
	// because we are 'rendering' clusters to special buffer.


	/*public class Scene
	{
		public List<GameObject> gameObjects;
	}


	public class GameObject;
	public class MeshComponent;
	public class CameraComponent;*/


	// There is an idea to store sets of components and game objects
	// inside each scene. This means that disabling scene will mean
	// that no system will work on their game objects.
	// What's interesting in this situation, is that we can still
	// work with disabled scene from another scene, it's just 'frozen'.
	// Altough, we would have to spin certain systems manually,
	// for example rendering system, in order to render disabled scene.
	// Another thing is - pausing the game could actually work exactly
	// like we described. We pause the game, switch to main menu scene
	// and from there manually invoking certain systems, that are
	// responsible for rendering only.

	// Now, since we have scene and systems inside them, we have
	// collections of game objects and components, each type in its
	// own array/list. When we just loading scene, it's fine,
	// we have everything we need to work properly, but let's imagine
	// that some game object decided to spawn new game objects
	// during runtime. Just creating new game object will not work,
	// because we have set of systems, and in each of them we are
	// required to register our fresh game object with fresh components.
	// Here is the problem, - game object does not have a pointer to a scene.

	// Naive solution would be to define such field. Second option would
	// be to change scene structure. Instead of having list of game objects
	// scene will have single, root game object, that will contain whole
	// scene in itself, and will have a pointer, which will help child
	// game objects to figure out, in which scene they are in.
	// This option has a drawback, because game objects are viewed as
	// a hierarchy of objects, we are using them to calculate model matrix
	// inside Transform. This means, that game object model matrix
	// will be calculated including root game object, and in some cases,
	// this might be helpful. Quick idea is that we could make layers
	// out of scenes, here is surface of the world, here is the underground.
	// As for transform, we could use scene as a chunk, but i'm not sure
	// about it.

	// So, meshes. What properties they have?
	// Each splat requires position, normal and color. But besides that,
	// there are material roughness and metalness*, animation speed,
	// animation offset. There was something else...
	// Basicaly, we have uint32 values, some of which decoded to
	// signed Vector4, other to unsigned Vector4. All of them are
	// normalized.
	// - Position xyz + w as ****
	// - Normal xyz + w as ****
	// - Color xyz + w as ****
	// - Roughness / metalness / anim.speed / anim.offset

	// Okay, i remember wanting for splats to have unique splat radius.
	// So, when we transform position to screen space, we also get depth,
	// or distance from camera to the splat. Without additional property,
	// radius of each splat will depend only on depth.
	// Here comes an additional property, that helps us make radius of
	// each splat a bit different. It could be either an offset, or
	// magnifier.

	// Besides that, there was an idea to store three values, that adjust
	// resistance against modifiers. For example, let's take grass. Splats
	// at the bottom have more resistance, that splats at the top.
	// This way, during wind transformation stage, grass will move more
	// naturaly? This example is about resistance to change of position.
	// Basicaly, multiplier in range from 0 to 1. Zero will mean, that
	// splat will sit where it is, and 1 means that full transformation will
	// be applied to the splat position.

	// Next, normals. For normals, let's take tree leafs as an example.
	// Also, let's assume, that single splat is a tree leaf. Let's also
	// imagine, that whole tree, including leafs stored in a single mesh.
	// This means, that tree itself will not change its normals, while
	// its leafs will. Right out of the bat, i can't think of other examples
	// where this could be applied. Maybe it will be good for water, but
	// i think water will be worked on in completly different shader.

	// Okay, now what about colors. After we determined what splats will
	// be on the screen, we start blending them, the closer one splat
	// to the other, the more they blend into each other. And in some
	// cases we want certain splats to be resistant to that.

	// As of right now, i'm thinking, that we can store 5 uint32 values
	// which gets us 20 uint8 values, 2 of which are free at this moment.
	// Question is, how do we pack them
	// 01 -  int8: x position
	// 02 -  int8: y position
	// 03 -  int8: z position
	// 04 -  int8: x normal
	// 05 -  int8: y normal
	// 06 -  int8: z normal
	// 07 - uint8: r color
	// 08 - uint8: g color
	// 09 - uint8: b color
	// 10 - uint8: position strength
	// 11 - uint8: normal strength
	// 12 - uint8: color strength
	// 13 - uint8: splat radius
	// 14 - uint8: animation speed
	// 15 - uint8: animation offset
	// 16 - uint8: roughness
	// 17 - uint8: metalness
	// x,y,z position + w for resistance
	// nx,ny,nz for normal + w for resistance



	// Here is the problem, in order to get to a point, where
	// we work on compute shaders, we are required to figure out
	// how our stuff stored and structured.
	// Essentially, we have buffers of different types and
	// textures (for 2D stuff, like user interface).
	// Right now, the idea is to have single large buffer,
	// just to get our game on the rails.
	// This buffer, will take instance of the mesh, iterate
	// over its clusters, and set indices for each of them.
	// Buffer itself, contains ShaderStorageBuffer instance,
	// and an array with metadata, what is stored and where.
	// As of right now, i'm thinking, that we will have
	// only one situation, where during frustum culling stage,
	// we will gather a list of meshes, that are used.
	// After that we can construct list of instructions,
	// each will point to cluster inside that buffer.

	// Here we go again about packing data. So, there is an idea,
	// that we can store some data more tightly, using only four
	// bytes in uint32 value, which gives us 8 values per uint32.
	// Each value however is either signed range from -7 to +8 or
	// unsigned range from 0 to 15.

	// Our splats are stored in the cluster, and because of the
	// range, our bounding volume is 16 by 16 by 16 = 4096 possible
	// positions and normals. I do not think that storing color
	// in just 16 value range will work good, but for positions
	// and normals i _think_ we will be okay.
	// Okay, here is the thing, uint32 is:
	// 0x12345678
	// 0xFFF00000 - position
	// 0x000FFF00 - normal
	// 0x000000FF - splat radius

	// 0xFF000000 - position.strength;
	// 0x00FF0000 - normal.strength;
	// 0x0000FF00 - anim.speed;
	// 0x000000FF - anim.offset;

	// 0xFF000000 - color.r;
	// 0x00FF0000 - color.g;
	// 0x0000FF00 - color.b;
	// 0x000000FF - color.strength;

	// 0xFF000000 - material.roughness;
	// 0x00FF0000 - material.metalness;
	// 0x0000FF00 - material.intensity;
	// 0x000000FF - local ambient occlusion;

	// With this setup, we have 4 uint32 values to describe single splat.
	// 64 splats equals to 2048 bytes.
	// Each cluster contains bounding sphere, center of which we are required to
	// pass to GPU. Idea there, is that splats are local to cluster, so we'll need
	// a center, to which we add local position of the splat, perform transformations
	// based on animations and then transform result point onto the screen.
	// So we have three buffers, Matrix4x4[], Vector4[] and uint32[].
	// Besides that, we'll need camera matrix.

	// Now, if we store meshes per scene, it can lead to duplicates, which is not good.
	// Let's define a global mesh storage.

	// So, lets talk about coordination buffer. It's a class, that contains data
	// for several buffers, that will be used by compute shaders. We have scenes,
	// each scene can have one active camera. Scenes also have game objects with
	// mesh component in them, each mesh component contains mesh. Game objects
	// have transform, which produces model matrix, that will be used to transform
	// splats. Current question is,

	// -------------------------------

	// Okay, right now we are required to figure out idea. Initially, i had an
	// idea, that mesh is splitted into clusters, and each cluster contains
	// exactly 64 splats. Each splat contains large amount of data.
	// I'm not sure that packing position like 0xXYZ00000 is a good idea,
	// because each splat can be in range between 0 and 15 or -7 and 8.
	// Basically, only 16 positions on each axis.
	// With 0xXXYYZZ00 pattern, each axis can be in range between 0 and 255
	// or -127 and 128.
	// Next question is cluster center. Idea is, that each cluster is a fixed
	// volume, in which our splats lie in. It is worth noting, that both
	// cases (16 and 255 range in positon) work in this volume, it's just
	// that 16x16x16 volume is less than 255x255x255 and that's about it.
	// Well, ofcourse in 16.3 volume each splat has much less room.
	// So, a cluster is a set of splats, that are close to a certain point,
	// center of the cluster. Using bounding box or sphere we can determine
	// if certain cluster is visible or not.
	// Side note: in theory, we could use 255³ for LOD0 and 16³ for LOD1.

	// Okay, so, center of the cluster depends on position of the splats
	// that it contains. Idea is, that when we want to know position of the spat,
	// we take center of the cluster and add local position of the splat to it.
	// Resulted position then multiplied by model matrix to get world-space position
	// and then multiplied by viewProjection matrix to get position in screen-space.

	// Question: if all clusters contain exactly 64 points, what if each splat in the cluster
	// is always the same, but position of the cluster and mesh it sits in changes?

	// Here is an idea. Let's first assume, that each cluster has a bounding sphere, and exactly
	// bounding sphere. Sphere has a radius, which we can use to unpack splats. During
	// transformation stage, we first multiple sphere radius by model matrix, then we
	// take splat position and multiply it by resulted radius and only then add that
	// with the cluster center. Now we have a position, which is relative to center of the cluster.
	// This way, we are required to first, find center point and then modify vertices so that
	// they lie inside 16³ volume and their position is a approximated vector from center of
	// the cluster to splat in volume. This way, meshes can be any size, long, tall, wide,
	// as long as splats can be grouped in clusters of 64 splats, it's gonna work.
	// But, if we're gonna choose this way, we are required to find a an algorithm, that can
	// find cluster center point and it's radius.

	// So back to coordinate buffer. So we have a mesh component system, which when invoked
	// calls coordination buffer when mesh it iterates over is inside frustum view. Each time,
	// CB adds an instruction, that then is send to compute shader. Instruction tells compute
	// shader which cluster to render with what set of matrices. Additionally, instruction
	// contains cluster center position and bounding sphere radius (because Vector4 alignment
	// in OpenGL).

	// Okay, now, there is an idea to have an instruction buffer designed in such a way,
	// so that we would be able to extend it. Basically, imagine we first had only [MVP,clusterID]
	// values in each instruction and then decided to store [camera, model, clusterID] after some
	// time. Only requirement is that each value would be stored as uint32 and that's all.
	// Also, there is an idea to have somekind of structure for storing multiple values in single
	// uint32 and being able to read/write those data at ease. Main reason for that is that
	// we will be in development/beta mode for quiet a long time, so interation speed is a key right now.

	// In total we have N buffers, each containing:
	// - matrices (meshes and cameras)
	// - bounding spheres of the clusters
	// - splats
	// - instructions
	// - depth buffer

	// There is one thing, regarding matrices. Currently, we're computing them on the CPU, which is okay
	// only for some time. As soon as we get to hundred* objects, it will get very slow.
	// One the ideas is to calculate mesh matrices on the GPU, but in this case, we are required to
	// transfer data, position, rotation and scale, which (3,4,3) = 10 floats per transform and 16 floats
	// per matrix.

	// Pipeline.
	// Stage I
	// Cluster culling stage rejects all the clusters, normal of which is very similiar to direction of the camera.
	// As an input, we get a set [camera, mesh, clusterPosition, clusterNormal]. We do DotProduct and if result is
	// above threshold, we reject the cluster. Clusters that passed this stage, written to output index buffer using
	// atomicAdd for counter.
	// Stage II
	// Transforming 64 splats for specified clusters. At this stage, we want to know, position, radius, animation speed
	// animation offset. There are atleast two options, first is to use different compute shaders for different types
	// of meshes (foliage, water, static). Second options is to have an attribute in either cluster or splat, that
	// determines behaviour of the splat(s). With first option, we get multiple shaders, which are quiet similiar
	// and maybe we will be able to make "include" directives in them, to reuse generic methods.

	// I forgot about matrix transformation stage. There are three types of game objects.
	// - Static objects, like terrain chunks, that sit where you place them and stay there for the duration of game.
	// - Game objects, that change non-regurarly, like player moving road lanes, position of trees and buildings.
	// - Game objects, that change very frequently, for example: cars.
	// Updating everything does not seem a good idea and as an alternative to this approach i was thinking about
	// looking glass, or culling system.

	// So there is a situation, when player can copy/paste blueprints containing lots of objects, and the question
	// is: what we can do to allow it? One of the solutions, is to create a single mesh, that will be shown during
	// placement stage, that will roughly look the same, sketches, set of primitives, bunch of clusters with splats,
	// radius of each is very large. Another idea is to have nested matrices. Idea goes like this: we have an object
	// that contains many other objects. When we move root object, nested matrices do not change, but computed
	// on gpu. This requires the pipeline to be in a hierarchical manner, where we first 'render' objects, calculate
	// matrix, go inside children of that object, calculate matrices for them, and then we go into clusters. In this
	// example, i only went one level deep, but even if i specified, that object can have many levels of nested objects,
	// this means, that each thread can take arbitrarily long, which is not good, because in those kind of cases,
	// some threads will be idlying, while single GPU thread is working on large set of data.
	// Calculation of matrices for cars might be done on GPU, while we're updating position and rotations on CPU, then
	// we upload this data to GPU and bam... question is, how much will it cost?

	// Working on sorting stage, trying to figure out how to make it. First, we have an input, a depth buffer
	// where each pixel is stored in specific order. To get int2(x, y), we need to use (y * width + x) formula.
	// What i'm doing at first, is copying from depth buffer to sorting buffer. But, in sorting buffer, we are
	// storing each pixel as a flat array.

	// Small note: so we have some OpenGL stuff, and almost all of them have three methods, constructor without
	// arguments, which allows us to create instance even before OpenGL is initialized, Initialize and Shutdown
	// methods. Destructor will free everything, that was allocated on our side, while Shutdown will notify
	// for example OpenGL, that this buffer/texture/shader should be destroyed. So, from here, a pattern emerges,
	// which makes me think, that MAYBE we want to define an interface. The only problem is that Initialize might
	// have arguments in it. Beef does not have exceptions, which means, that if something goes wrong, we're screwed.

	// Back to buffers. So i have an idea to use an quad-tree for storing buffer pixels, sorting and searching in least
	// amount of steps. Quadtree requires additional information, which we can either embeed, or write

	// --------------------

	// So i've seen a video where parallax raymarching overviewed. Basic idea is that for each cluster of points,
	// we create a cube, project its vertices, form triangles and upon rasterizing them, we trace rays into the
	// volume, where we check if we hit anything. This got me thinking. Rasterization on compute shaders.
	// First, we are required to figure out how to find those vertices. We could have actual vertices, but that's
	// eight per cluster. Alternatively, we could construct them on the GPU. Basic idea is that each cluster
	// has a fixed size, and having center point, we could construct 8 other points, though this will mean,
	// that we need to transform 9 points in total. Right after that, we are making triangles, calculating baricentrics
	// and preparing to go over uv coordinates. In theory, we could skip this stage and test our theory by constructing
	// fake triangles. Anyway, when triangles constructed, we rasterize each pixel. By raserization in this case,
	// we mean that for each pixel, we construct a ray inside the volume of the cluster and start marching to certain
	// limit. We either reach limit, or hit something, and if that happens, we output index of the splat we've hit.
	// After that, there are three more stages, sorting, splatting and blitting stage, just like in previous implementation.
	// However, i'm not sure about splatting, because in case of rasterization, we already doing sort of splatting.
	// Two things - first, there will be situation, when multiple pixels will output same splat index. Second, what
	// if we can detect stride in screen space, and then just do splatting. This is by the way under the question.
	// What will be faster, rasterization or splatting? Additionally, we could try to find a way to detect, that neighbour
	// pixel already has infromation and we could just copy results.

	// First, we have an instruction, that tells us which cluster with what parameters to render.
	// Second, after projecting cube and constructing triangles, we will have another set of instructions.
	// Third, after rasterization, we have a buffer, where each pixel contains information about splat.
	// There is also an idea to work in tiles, where we put triangles in buckets, then sort them and then rasterize
	// from front to bottom. When we processing certain pixel, we take triangles from the bucket and if during
	// rasterization nothing was hit, we proceed to the next triangle in the bucket, until we reach the end.

	// After some time i've found some source code that makes it so that we can have multiple quads, which
	// when rasterized, traverse some volume inside fragment shader, BUT, and this is pretty BIG BUT,
	// for every pixel we will process on that quad, we use camera matrix to find ray position and direction...
	// Ray origin, its direction and then normal which we hit with our ray.
	// In our implementation, we calculate MVP matrix per cluster, which i think can be optimized. We transform
	// each point to world space and then transform to screen space, plus we will use normal transformation, but
	// we depend on the count of points we have in our viewport, where as voxel renderer depends on doing so
	// per pixel of the cluster, which means we can hit same splat/voxel in the volume multiple times, and we will
	// pay atleast 2 vector transformations per ray.

	// So i've been thinking about our implementation and what else we are required to do before we can relatively
	// safely traverse our code from CPU to GPU. There were several questions regarding calculation of the matrices,
	// especially for case, where we have a large number of them, for example car simulation, where each car
	// has a matrix. Using this example, we can clearly see, that with small amount of them, it will be okay, but
	// i think as soon as we get to thousands of them, performance hit will become noticable. Anyway, right now,
	// i'm thinking, that this type of issue has a solution using special compute shader, that will calculate
	// matrices for each car based on our arguments and then we will use same pipeline with instructions to
	// draw each cluster for each car. Also, i thought about premature optimization and i think this might be
	// the case where i'm trying to optimize a field in which i am not certain how it would work.
	// Okay, so if our pipeline will likely be the same as now, there are two things left to do before we can
	// proceed to transfer our code to the GPU. First, we are required to fix current bugs. I think, there is
	// something wrong with how sorting and splatting stage works. Second, for our pipeline to be relatevly
	// complete, we are required to have some form of lighting.

	// I'm thinking, how much memory we would need to store whole world lightmap? Basic idea is that
	// we can update each splat to some degree each frame, so any changes in position/rotation/scale
	// will become actual over several frames.

	// Okay, one of the ideas is to use a hierarchy light points. Every splat we have will ask at some point,
	// if it's occluded or not, and when that happens, we ask nearby light point about its state. So if the
	// light point is occluded, it will be dark, otherwise light. 

	// SDFGI, screen-space GI an hybrids.

	// Okay, right now i'm thinking to skip lighting stage, because right now i'm not sure how big/details our
	// meshes will be. So if we go that road, then before transfering code to GPU, we are required to fix some the
	// bugs and establish bridges (buffers). For example, for some reason, sorting stage, if not cleared, it will
	// have artifacts in it, even tho in theory, it should copy whole depth buffer, every frame.

	// As for buffers, we basically need to define all the buffer we will need and make them part of the pipeline.
	// Another thing is, we have is that our instruction count per dispatch is 16,777,215. This means, that we can
	// render up to 262,143 cluster per dispatch, which is almost 256 bunnies, each of them 1024 clusters.
	// But, 262,143 clusters is already 335 megabytes, if each splat will have 5 uint32 values. However, this means
	// only unique clusters, and i think we can reuse alot of the meshes. Also, i think 335mb is okay, i think
	// our GPU limit will be around 1gb.

	// IDEA: 30 bit for depth, 28 bit for instructionID and 4 bit for splatID

	// One more thing we are required to fix is that we are currently having exact amount of tiles. I want to have
	// arbitrary resolution, to which we add additional tiles horizontally and vertically. The way i think it could
	// be done, is that blitting stage recieves an offset coordinates, from which it should start copying data.

	// There is an idea, that instruction buffer should be sorted in such a way, that when compute shader
	// performs, it will roughly go over whole buffer from left to right (0 to ...). This way, maybe GPU will be
	// able to cache stuff for each tread. Basically, idea is to help GPU understand what data we will be using.

	// Currently, i'm trying to figure out, how to use all three dimensions of the invocation.
	// 
	// transformationStage.Dispatch(Engine.instructionSet.count, 1, 1);
	//        sortingStage.Dispatch(Program.geometryBuffer.countRows, Program.geometryBuffer.countColumns, 1);
	//      splattingStage.Dispatch(Program.surface.screenSize.width, Program.surface.screenSize.height, 1);
	//       blittingStage.Dispatch(Program.surface.screenSize.width, Program.surface.screenSize.height, 1);
	//
	// Currently, we have four stages, one of them uses only 1 dimension, while other use 2 dimensions.
	// Question, do we need to alter? And how we can do it?

	// 440 pixel can contribute to center pixel. For every pixel we iterate over 49 cells, each 3x3 pixels.
	// Each cell is sorted from largest/closest to smallest/furthest point. Currently, if everything is correct,
	// then we're doing 3 peeks at max, which means we do 147 lookups and comparisons across two buffers
	// (radius and contender).

	// Different idea regarding splatting. So instead of current sorting, we sort contenders by placing them in
	// quad-tree. I'm not sure yet how it's gonna work, but the rough idea, is that with a quad tree we can
	// process even large splats fairly fast. Each node of the tree starts with the radius and depth. This
	// gives us pretty accurate information on where we will go next decision. If current node is smaller
	// or further than currently processed contender, then there is no need to go deeper in current node, so
	// we can skip it.

	// Okay, first idea, is that our each GPU thread is given certain node within quadtree. So if each thread
	// is given a square with 16x16 pixels (256 pixels in total), it will go over each pixel from top to bottom.
	// The idea is that while it will go down, it will search for largest splat in the area.
	// However, previously we were working from current pixel to iterating over tiles it was surrounded.
	// So we have three components, by which we can sort splats: 2D coordinates, radius and depth.
	// In naive solution, we would draw everything checking only depth. This approach will result in alot of
	// overdraw. Imagine 16x16 circle, that would be ~256 pixels, now imagine most of that circle is covered
	// with smaller circles...

	// I have an idea. First, we store depth and radius in single 32 or 64-bit unsigned integer. Next,
	// during sorting stage, we calculate values and store it as if it was a quad-tree.
	// Each tile starts with 4 cells, TL, TR, BR, RL. Then we describe 4 cells of TL, then 4 cells of TR
	// and so on. I'm not sure, but maybe leaf layout is the same with gbuffer.
	// If layout is the same, then we will be able to get xy coordinates, which means we will have access
	// to contender that sits on the same position in geometry buffer.
	// Okay, so the question is, how we are traversing quad-tree. There are atleast two ways, we can go
	// from level of tiles, down to target pixel, which means we are collecting data and in the end
	// we are arriving at the coordinates, which we will update. But, in this case, we still need to
	// first, access target coordinates, because we need something to compare against.
	// Alternative solution is to go upwards, we start from target coordinates and go up. It's abit
	// chaotic, because we first moving level by level to tiles, and then going over each neighbour tile
	// collecting data from there. So at first we go up, but then we iterate over each tile by going down.
	// First variant is more 'linear', or has only one direction, where we go down, and after finishing
	// tile, we proceed to read next tile. The only issue, we might want to process target tile last, although,
	// am not sure if it matters.
	// Actually, idea is that each we find smaller depth but affecting radius, we replace local contender.
	// I think, that by going from target tile first, can give us an advantage, where we might find some
	// contender, that is closer to camera and affects target pixel. So we save this depth|radius value
	// and start going after neighbour tiles, but in this case, in theory, we might skip more nodes.

	// SIDENOTE: We are adding camera view-projection matrix to the matrices buffer because this way
	// we can render multiple scenes in one dispatch. Otherwise we would have to dispatch multiple times,
	// segregate splats into batches and so on, and then we would have a problem where we have data
	// from multiple instruction sets inside one geometry buffer.

	// I have an idea. We store Vector4 for each circle:
	// - x and y components are coordinates on the screen
	// - z is depth
	// - w is radius
	// With this, we have a Vector4[] buffer.
	// First, we have an array of circles, so at this stage we are will sort circles into blocks.
	// There is an idea, that we distribute circles over tiles size of 64x64. Then we iterate
	// over each tile and split it into tiles by 2, so now we have 4 32x32 tiles. We repeat
	// this process until we get to tiles size of 4x4. Next stage is processing 4x4 tiles.
	// In each 4x4 tile, we iterate over list of circles and pick closest largest circle.
	// If our circles are not Vecto4, but packed uint32, we can unpack that into candidate.
	// With uint32 we have to store depth and radius in most significant bits, while origin
	// in least significant bits. Now, on CPU this is i think quiet possible, almost easy even.
	// But on GPU, we cannot allocate more memory.
	// Okay, how do we sort contenders?
	// Can circle be divided?
	// Can we use uint64 for storing information? Is it possible to compress depth? We do not
	// need real depth, we have it in depth buffer.
	// What we need actually?
	// - Contender ID
	// - Depth
	// - Radius
	// - Center
	// Depth to sort circles, radius to determine if currently processed pixel is covered by circle
	// and center to calculate distance from currently processed pixel to center of circle in order
	// to determine if pixel is inside radius of that circle.
	// Okay, i have this idea, where we take circle, split it into lines and now we have an array
	// of lines where each of them has n properties we need:
	// - y coordinate where this line sits
	// - x coordinate where this line starts
	// - length of the line
	// - depth of the splat
	// - id of the splat.
	// Then we can sort lines by y coordinate, which gives us an ability to get rid of y component.
	// Now we have 4 integers to pack into single uint32 or uint64
	// Here is the thing - if we can pack all five components into uint64, we can sort it very easily.
	// More over, not only they will be sorted vertically, but also horizontally.
	// So first important value is Y, 4 bits to store value from 0 to 65,535. (0xFFFF0000)
	// Next, another 4 bits for X component. (0x0000FFFF)
	// Now, depth is stored in 7-bit unsigned integer (0x0FFFFFFF)
	// Only one bit left.
	// So, there was an idea to generate circle from splat, then split it into horizontal lines,
	// then sort those lines over buffer by y coordinate first. And if we store yx coordinates in uint32
	// we could not only sort them vertically, but also horizontally inside each row with a single pass.
	// However, for this to happen, we are required to figure out how to:
	// - How we construct circle
	// - How we split circle into lines
	// - Where do we place those lines
	// - How do we sort them?
	// - After sorting, how do we know, where each row starts?
	// All those questions are bounded to ways of working with threads and data. So during construction of
	// circle, does one thread creates single line or multiple lines? If later, then this means that one
	// thread will be access many places of the buffer, that can overlap with other threads. What if we
	// will construct single line from single thread? Well, it can still overlap, if we try to put this line
	// inside the buffer.
	// 0xDDDDDDDIIIIIIISS - depth | instruction | splat
	// 0xDDDDDDDYYYYXXXXR - depth | y | x | radius(0-16)
	// 2073600 pixels for 1920x1080 resolution
	// 132710400 bits multiplied by 64 we get 8493465600 bits which is 1061683200 bytes which is 1036800 kbytes which is 1012,5 mbytes...

	// I have an idea that was lingering in my mind for quite a while. Right after transformation stage,
	// we dispatch next stage in rows, so each thread is given a line to work with. First, thread goes
	// from left to right, then from right to left. Next stage does the same, but vertically.
	// Idea is that we are splatting contenders over the line, but we need a radius to store.
	// I'm thinking maybe this stage will be dispatched when all splats are ready, meaning we've calculated
	// radiuses, color and other things and only after we start working with splatting. This means,
	// that there will be a waste, but i think it will be more or less okay.
	// Anyway, when thread goes from left to right, it takes first actual contender, takes its radius
	// marks how many times this contender should be copied. When we're done, we move cursor further and proceed
	// with the next contender. However, there will be situations, where we have multiple contenders with varius
	// radiuses, so in some cases, edges of the contenders will be visible. Basically, imagine two circles
	// one inside another, one is bigger and sits in background, while smaller circle sits in the foreground.
	// When we go in lines, we first render background circle, then we encounter foreground circle, and after
	// we finished rendering foreground circle, we continue rendering background circle. Now imagine there are
	// many such situations. Same happens in vertical stage.
	// What algorithm requires:
	// - contender's index in depth buffer, which can be stored in 7-bit integer (0x0FFFFFFF = 268,435,455)
	// - radius, 2-bit intenger (0x000000FF = 255)
	// - depth, 7-bit intenger (0x0FFFFFFF = 268,435,455)
	// This fits into 64-bit intenger as depth first, radius second and contender's index last.
	// This way we can quickly check, which of the two contenders is a winner.

	// So at this point i do not understand how to do this without branching...
	// Basic idea is this: Everything is done in two stages. In first stage, each thread is given a row
	// it will work on. Thread will go from the left to right. Idea is that we are picking contender
	// and copying it over to the next pixel until it distance from center exceeds contender's radius.
	// Now, idea is that even contender has a radius and depth, but, pixel is occupied by winner, who's radius
	// reaches said pixel and distance is nearest of all the other contenders for that pixel.
	// There is one more variable that requires to exist for all of it to work with second stage,
	// which is vertical splatting. This variable determines how many steps currently residing contender
	// can perform before it can no longer propagate. So, we have contender ID, depth, radius and remaining
	// steps.
	//
	// One of the ideas it to split contenders into two two types, start and end. In first pass, we create
	// them in our buffer, then we sort them, deleting those, that 
	//


	// Current contender layout
	// 0x0FFFFFFF: depth - 268,435,455
	// 0x0FFFFFFF: instruction - 268,435,455
	// 0x000000FF: splat index - 255
	// 0xFFFFFFF000000000

	// I have an idea, for which we need to either split data into pairs or find a way to pack it.
	// Parallel thought is that packing and unpacking might be not a good thing for the idea i'm thinking about.
	// Lets imagine that we have two quads and we want to determine a winner for particular pixel.
	// Our way is to iterate over quads that can contribute to that pixel and find the one with closest distance
	// to camera. Now, with naive approach, for each pixel we would probably have an array of contenders.
	// My idea is that we do the job in two stages, first we go over horizontal lines, simultaniusly collecting
	// and copying data to scanline-buffer. Each element in that buffer contains information about origin of
	// the contender.
	// - contender index in depth-buffer
	// - depth
	// - radius

	// 0xFFFFFFFFFFFFFFFF
	// 0xFFFFFFF000000000: depth  - 268,435,455
	// 0x0000000FFFFFFF00: index  - 268,435,455
	// 0x00000000000000FF: radius - 255
	// Having index pointing to the depth-buffer, we can calculate center of the contender.

	// So today i was thinking about scanline algorithm. Idea was to create lines where each line contains
	// index, depth, start and end of it. In some variations, we would intersect all lines in the row
	// in order to get down to winners. This however has an unsolved problem, each line does not account
	// for neighbouring lines above and bellow. For that there was an idea to use same technique, but
	// using vertical lines. Calculate rows, then calculate columns with account of row per pixel.
	//

	// Yesterday, i tried naive implementation of splatting, where for each pixel we check a square
	// of 16x16, which is 256 pixels. To my surprise, our existing sorting/splatting was far better
	// than naive implementation, like 10-15 times better. The only problem this implementation has
	// is that when we will play this game on higher resolution of monitors, not only circles will
	// be 'smaller', but there will be gaps between them. One way to resolve this, is by fixing
	// camera matrix to be at the same proportions no matter what resolution we have. So basically,
	// with bigger monitor, user will see bigger map, but i'm not sure about that.
	// In other worlds current approach does not scale. Also, i have no clue, if the end result
	// is even worth the effort, meaning i do not know if this implementation will look good on
	// my monitor... One way to figure that out, is to fix problems with tiling, then convert all
	// code to GPU and start experimenting with it. Idea is that we will have a working prototype,
	// which we will improve over time. Also, having prototype engine and being able to test
	// game prototype on it will answer MANY question regarding requirements, visually, technically.

	
}