//Init surfaces
parSurf = surface_create(room_width, room_height);
parSurfMiddleMountain = surface_create(room_width, room_height);
parSurfCloseMountain = surface_create(room_width, room_height);
parSurfFarMountain = surface_create(room_width, room_height);
parSurfMiddleCloud = surface_create(room_width, room_height);
parSurfCloseCloud = surface_create(room_width, room_height);
parSurfFarCloud = surface_create(room_width, room_height);

//Handle tileset layer transparency
global.uAlpha = shader_get_uniform(shdAlpha, "alpha");
var layerID = layer_get_id("FakeGroundTiles");
layer_script_begin(layerID, scrSetFakeGroundAlpha);
layer_script_end(layerID, scrResetFakeGroundAlpha);

//Init ambient & rain particles
if (!part_system_exists(global.partSystem))
{
	global.partSystem = part_system_create_layer("Particles", true);
}

if (!part_emitter_exists(global.partSystem, global.ambientEmitter))
{
	global.ambientEmitter = part_emitter_create(global.partSystem);
}

if (!part_emitter_exists(global.partSystem, global.rainEmitter))
{
	global.rainEmitter = part_emitter_create(global.partSystem);
}

//Ambient particles
part_emitter_stream(global.partSystem, global.ambientEmitter, global.ambientPart, -5);
part_emitter_region(global.partSystem, global.ambientEmitter, 0, room_width, 0, room_height, ps_shape_rectangle, ps_distr_linear);

//Rain particles
part_emitter_stream(global.partSystem, global.rainEmitter, global.rainPart, 4);

//Surface jank
if (surface_exists(parSurf))
{
	//Generate a static background
	scrBackground();
}

if (surface_exists(parSurfMiddleMountain))
{
	//First parallax layer
	scrParallaxMiddleMountain();
}

if (surface_exists(parSurfCloseMountain))
{
	//Second parallax layer
	scrParallaxCloseMountain();
}

if (surface_exists(parSurfFarMountain))
{
	//Third parallax layer
	scrParallaxFarMountain();
}

if (surface_exists(parSurfMiddleCloud))
{
	//First parallax layer
	scrParallaxMiddleCloud();
}

if (surface_exists(parSurfCloseCloud))
{
	//Second parallax layer
	scrParallaxCloseCloud();
}

if (surface_exists(parSurfFarCloud))
{
	//Third parallax layer
	scrParallaxFarCloud();
}

//Generate grass on top of collision objects
with (oCollision)
{
	scrGenerateGrass();
}