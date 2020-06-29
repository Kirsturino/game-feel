/// @description Spawn familiar if this is spawn point

if (global.spawnX == x && global.spawnY == y)
{
	with (instance_create_layer(x, y, "Lighting", oFamiliar)) followTarget = other;
}