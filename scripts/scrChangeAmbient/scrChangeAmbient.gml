///@description Change ambient
///@param ambientTo

if (argument0 != global.currentAmbient && alarm[4] == -1)
{
	alarm[4] = 60;
	audio_sound_gain(global.currentAmbient, 0, 1000);
	global.ambientTo = argument0;
}