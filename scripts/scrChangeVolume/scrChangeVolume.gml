var type = menu_option[page];

switch (type)
{
	case 0:
		global.masterVolume = argument0;
		audio_master_gain(argument0);
	break;
	
	case 1:
		global.sfxVolume = argument0;
		audio_group_set_gain(agSFX, argument0, 0);
	break;
	
	case 2:
		global.musicVolume = argument0;
		audio_group_set_gain(agMusic, argument0, 500);
	break;
	
	case 3:
		global.ambientVolume = argument0;
		audio_group_set_gain(agAmbient, argument0, 500);
	break;
}