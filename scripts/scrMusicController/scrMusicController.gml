//if (keyboard_check_pressed(ord("M")))
//{
//	if (global.musicTarget == 0)
//	{
//		global.musicTarget = global.musicVolume;
//	} else 
//	{
//		global.musicTarget = 0;
//	}
//	audio_group_set_gain(agMusic, global.musicTarget, 1000);
//}

if (keyboard_check_pressed(ord("N")))
{
	if (global.currentMusic == sndBGM)
	{
		scrChangeMusic(sndSecret);
	} else if (global.currentMusic == sndSecret)
	{
		scrChangeMusic(sndBGM);
	}
}