if (file_exists("options.sav"))
{
	var wrapper = scrLoadJSONFromFile("options.sav");
		
	var list = wrapper[? "ROOT"];
		
	for (var i = 0; i < ds_list_size(list); i++)
	{
		var map = list[| i];
			
		//Audio
		global.masterVolume = map[? "masterVolume"];
		global.musicVolume = map[? "musicVolume"];
		global.sfxVolume = map[? "sfxVolume"];
		global.ambientVolume = map[? "ambientVolume"];
			
		//Video
		global.windowScale = map[? "windowScale"];
		global.resolution = map[? "resolution"];
		global.fullscreen = map[? "fullscreen"];
		window_set_fullscreen(!global.fullscreen);
		global.highContrast = map[? "highContrast"];
			
		//Controls
		global.key_back = map[? "key_back"];
		global.key_pull = map[? "key_pull"];
		global.key_enter = map[? "key_enter"];
		global.key_confirm = map[? "key_confirm"];
		global.key_push = map[? "key_push"];
		global.key_left = map[? "key_left"];
		global.key_right = map[? "key_right"];
		global.key_up = map[? "key_up"];
		global.key_down = map[? "key_down"];
		global.key_jump = map[? "key_jump"];
		global.key_restart = map[? "key_restart"];
		global.key_camToggle = map[? "key_camToggle"];
			
		//Controller controls
		global.button_back = map[? "button_back"];
		global.button_pull = map[? "button_pull"];
		global.button_enter = map[? "button_enter"];
		global.button_confirm = map[? "button_confirm"];
		global.button_push = map[? "button_push"];
		global.button_left = map[? "button_left"];
		global.button_right = map[? "button_right"];
		global.button_up = map[? "button_up"];
		global.button_down = map[? "button_down"];
		global.button_jump = map[? "button_jump"];
		global.button_restart = map[? "button_restart"];
		global.button_camToggle = map[? "button_camToggle"];
	}
		
	ds_map_destroy(wrapper);
}