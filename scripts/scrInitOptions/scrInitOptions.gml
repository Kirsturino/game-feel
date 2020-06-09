if (file_exists("options.sav"))
{
	scrLoadOptions();
} else
{
	//Audio
	global.masterVolume = 0.5;
	global.musicVolume = 0.5;
	global.ambientVolume = 0.5;
	global.sfxVolume = 0.5;
	
	//Video
	global.windowScale = 4;
	global.fullscreen = 1;
	global.resolution = 1;
	
	//Accessibility options
	global.highContrast = 0;
	
	//Controls
	scrInitControls();
	
	//Make options file
	scrSaveOptions();
}

audio_master_gain(global.masterVolume);
audio_group_set_gain(agMusic, global.musicVolume, 0);
audio_group_set_gain(agSFX, global.sfxVolume, 0);
audio_group_set_gain(agAmbient, global.ambientVolume, 0);