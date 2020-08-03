///@description Change music
///@param musicTo

if (argument0 != global.currentMusic && alarm[3] == -1)
{
	alarm[3] = 60;
	audio_sound_gain(global.currentMusic, 0, 1000);
	global.musicTo = argument0;
}