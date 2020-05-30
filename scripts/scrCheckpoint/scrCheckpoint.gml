var cp = instance_place(x, y, oCheckpoint);

if (cp != noone && global.spawnX != cp.x && global.spawnY != cp.y)
{
	global.spawnX = cp.x;
	global.spawnY = cp.y;
}