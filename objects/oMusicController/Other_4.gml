/// @description Music and ambient

//Change to different music
if (!instance_exists(oSecret))
{
	scrChangeMusic(sndBGM);
} else if (instance_exists(oSecret))
{
	scrChangeMusic(sndSecret);
}
//Change to different ambient
if (!instance_exists(oMovingDanger) && room != rmCaveFifteenPointEight)
{
	scrChangeAmbient(sndAmbient);
	audio_stop_sound(sndSmokeWhisper);
} else if (instance_exists(oMovingDanger) || room == rmCaveFifteenPointEight)
{
	scrChangeAmbient(sndAmbientSmoke);
	
	if (!audio_is_playing(sndSmokeWhisper))
	{
		audio_play_sound(sndSmokeWhisper, 0, true);
		audio_sound_gain(sndSmokeWhisper, 0, 0);
	}
}