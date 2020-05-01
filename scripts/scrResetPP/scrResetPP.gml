if(!isPull && !isPush && ppFrames != ppFramesMax)
{
	alarm[2] = 8;
	colorTo = canDashColor;
	audio_play_sound(sndPPMax, 100, false);
		
	var dirModifier = hsp * 10;
		
	part_type_direction(global.ppPart2, 45 - dirModifier, 135 - dirModifier, 0, 0);
	part_particles_create(global.partSystem, x, y, global.ppPart2, 10);
	ppFrames = ppFramesMax;
}