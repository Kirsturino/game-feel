var cp = instance_place(x, y, oCheckpoint);

if (cp != noone && global.spawnX != cp.x && global.spawnY != cp.y)
{
	global.spawnX = cp.x;
	global.spawnY = cp.y;
	
	//Destroy other checkpoint indicators
	with (oFamiliar)
	{
		if (followTarget != oPlayer.id) instance_destroy();
	}
	
	//Spawn checkpoint indicators
	with (instance_create_layer(cp.x, cp.y, "Lighting", oFamiliar))
	{
		followTarget = cp;
		shouldWiggle = false;
		yOffset = 8;
	}
	
	audio_play_sound(sndCheckpointGet, 50, false);
}