//Make audio go brr
if (!audio_is_playing(sndAmbient))
{
	audio_play_sound(sndAmbient, 0, true);
}

if (!audio_is_playing(sndBGM))
{
	audio_play_sound(sndBGM, 0, true);
}

//Get controllers
show_debug_message("------------------");
for (var i = 0; i < global.gp_num; i++;)
{
	if (gamepad_is_connected(i))
	{
		global.controller = i;
		show_debug_message("Slot " + string(i) + " found a gamepad");
	}
}