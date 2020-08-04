/// @description Spawn familiar if this is spawn point

if (global.spawnX == x && global.spawnY == y)
{
	with (instance_create_layer(x, y, "Lighting", oFamiliar)) {followTarget = other; yOffset = 8;}
}

if (place_meeting(x, y, oFakeCollision))
{
	hidden = true;
} else
{
	hidden = false;
}