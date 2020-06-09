if (file_exists("options.sav"))
{
	var wrapper = scrLoadJSONFromFile("options.sav");
		
	var list = wrapper[? "ROOT"];
		
	for (var i = 0; i < ds_list_size(list); i++)
	{
		var map = list[| i];
			
		var obj = map[? "obj"];
		with (instance_create_layer(0, 0, layer, asset_get_index(obj)))
		{
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
		}
	}
		
	ds_map_destroy(wrapper);
	show_debug_message("Loaded options!");
}

with (oOptionsSave) instance_destroy();