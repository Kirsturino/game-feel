//Music & ambient stuff
if (global.currentAmbient == global.ambientTo)
{
	if (!audio_is_playing(global.currentAmbient))
	{
		audio_play_sound(global.currentAmbient, 0, true);
	}
}

if (global.currentMusic == global.musicTo)
{
	if (!audio_is_playing(global.currentMusic))
	{
		audio_play_sound(global.currentMusic, 0, true);
	}
}