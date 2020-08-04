var cp = instance_place(x, y, oCheckpoint);

if (cp != noone && (global.spawnX != cp.x || global.spawnY != cp.y))
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
		part_type_color1(global.secretPart, global.cGreen);
		part_particles_create(global.partSystem, x, y, global.secretPart, 20);
	}
	
	audio_play_sound(sndCheckpointGet, 50, false);
}