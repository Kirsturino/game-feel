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

if (!part_system_exists(global.topPartSystem))
{
	global.topPartSystem = part_system_create_layer("TopParticles", true);
}

if (!part_emitter_exists(global.topPartSystem, global.ambientEmitter))
{
	global.ambientEmitter = part_emitter_create(global.topPartSystem);
}

if (!part_emitter_exists(global.topPartSystem, global.rainEmitter))
{
	global.rainEmitter = part_emitter_create(global.topPartSystem);
}

//Ambient particles
if (room == rmCaveFifteenPointNine || room == rmCaveSixteen || room == rmCaveSeventeen)
{
	part_emitter_stream(global.topPartSystem, global.ambientEmitter, global.ambientSparkPart, -5);
} else
{
	part_emitter_stream(global.topPartSystem, global.ambientEmitter, global.ambientPart, -5);
}

part_emitter_region(global.topPartSystem, global.ambientEmitter, 0, room_width, 0, room_height, ps_shape_rectangle, ps_distr_linear);

//Rain particles
if (rain)
{
	part_emitter_stream(global.topPartSystem, global.rainEmitter, global.rainPart, 4);
}

//Generate grass on top of collision objects
with (oCollision)
{
	scrGenerateGrass();
}