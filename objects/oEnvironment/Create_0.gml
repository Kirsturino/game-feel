//Init surfaces
parSurf = surface_create(room_width, room_height);
parSurfOne = surface_create(room_width, room_height);
parSurfTwo = surface_create(room_width, room_height);
parSurfThree = surface_create(room_width, room_height);

//Handle tileset layer transparency
global.uAlpha = shader_get_uniform(shdAlpha, "alpha");
var layerID = layer_get_id("FakeGroundTiles");
layer_script_begin(layerID, scrSetFakeGroundAlpha);
layer_script_end(layerID, scrResetFakeGroundAlpha);

//Init ambient & rain particles
part_emitter_region(global.partSystem, global.ambientEmitter, 0, room_width, 0, room_height, ps_shape_rectangle, ps_distr_linear);

////Wave shader uniforms
//uTime = shader_get_uniform(shdWave,"time")
//uFrequency = shader_get_uniform(shdWave,"frequency")
//uIntensity = shader_get_uniform(shdWave,"intensity")
//frequency = 50.0;
//intensity = 20.0;
//spd = 0.2;

//Surface jank
if (surface_exists(parSurf))
{
	//Generate a static background
	scrBackground();
}

if (surface_exists(parSurfOne))
{
	//First parallax layer
	scrParallaxOne();
}

if (surface_exists(parSurfTwo))
{
	//Second parallax layer
	scrParallaxTwo();
}

if (surface_exists(parSurfThree))
{
	//Third parallax layer
	scrParallaxThree();
}

//Generate grass on top of collision objects
with (oCollision)
{
	scrGenerateGrass();
}

with (oFakeCollision)
{
	scrGenerateGrass();
}