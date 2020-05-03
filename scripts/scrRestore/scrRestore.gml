var restore = instance_place(x, y, oPushPullRestore);

if (restore != noone && restore.active && ppFrames != ppFramesMax)
{
	with (restore)
	{
		active = false;
		alarm[0] = activeTimer;
	}
	
	//Juice & SFX
	alarm[2] = 8;
	colorTo = canDashColor;
	audio_play_sound(sndRefreshBuildup2, 40, false);
	if (ppFrames == 0)
	{
		scrSetShake(10, 10);
		scrFreeze(80);
		audio_play_sound(sndPPMax, 100, false);
		ppFrames = ppFramesMax;
	} else
	{
		scrSetShake(15, 30);
		scrFreeze(120);
		audio_play_sound(sndRefreshMega, 50, false);
		ppFrames = floor(ppFramesMax * 3.5);
	}
	
	//SFX after screen freeze
	audio_play_sound(sndRefresh, 50, false);
	audio_sound_pitch(sndRefreshPunch, refreshPitch);
	audio_play_sound(sndRefreshPunch, 50, false);
	audio_play_sound(sndRefreshBuildup, 40, false);
	refreshPitch += 0.1;
	
	//Particles
	part_particles_create(global.partSystem, restore.x, restore.y, global.restorePart, 10);
}