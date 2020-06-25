if (alarm[3] == -1)
{
	audio_play_sound(sndDeath, 70, false);
	audio_play_sound(sndDeath2, 70, false);
	audio_play_sound(sndRefreshBuildup2, 70, false);
	audio_play_sound(sndRefresh, 70, false);
	
	scrSetShake(40, 10);
	part_particles_create(global.partSystem, x, y, global.deathPart, 40);
}

alarm[3] = 30;

//Remove collectibles from tow upon death
with (followingCollectible)
{
	following = false;
}
followingCollectible = noone;

colorTo = cantDashColor;

state = scrDead;