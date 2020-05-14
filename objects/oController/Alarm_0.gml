/// @description Music
//Make audio go brr
if (!audio_is_playing(sndAmbient))
{
	audio_play_sound(sndAmbient, 0, true);
}

if (!audio_is_playing(sndBGM))
{
	audio_play_sound(sndBGM, 0, true);
}

scrGetController();