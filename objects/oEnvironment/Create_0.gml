parSurf = surface_create(room_width, room_height);
parSurfOne = surface_create(room_width, room_height);
parSurfTwo = surface_create(room_width, room_height);
parSurfThree = surface_create(room_width, room_height);

//Handle tileset layer transparency
global.uAlpha = shader_get_uniform(shdAlpha, "alpha");
var layerID = layer_get_id("FakeGroundTiles");
layer_script_begin(layerID, scrSetFakeGroundAlpha);
layer_script_end(layerID, scrResetFakeGroundAlpha);

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