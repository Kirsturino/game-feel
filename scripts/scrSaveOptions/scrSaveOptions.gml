//Create root list
var rootList = ds_list_create();
		
with (instance_create_layer(0, 0, layer, oOptionsSave))
{
	//Create map
	var map = ds_map_create();
	ds_list_add(rootList, map);
	ds_list_mark_as_map(rootList, ds_list_size(rootList) - 1);

	var obj = object_get_name(object_index);
	ds_map_add(map, "obj", obj);
	
	//Audio
	ds_map_add(map, "masterVolume", global.masterVolume);
	ds_map_add(map, "musicVolume", global.musicVolume);
	ds_map_add(map, "sfxVolume", global.sfxVolume);
	ds_map_add(map, "ambientVolume", global.ambientVolume);
	
	//Video
	ds_map_add(map, "windowScale", global.windowScale);
	ds_map_add(map, "resolution", global.resolution);
	ds_map_add(map, "fullscreen", global.fullscreen);
	ds_map_add(map, "highContrast", global.highContrast);
	
	//Controls
	ds_map_add(map, "key_back", global.key_back);
	ds_map_add(map, "key_pull", global.key_pull);
	ds_map_add(map, "key_enter", global.key_enter);
	ds_map_add(map, "key_confirm", global.key_confirm);
	ds_map_add(map, "key_push", global.key_push);
	ds_map_add(map, "key_left", global.key_left);
	ds_map_add(map, "key_right", global.key_right);
	ds_map_add(map, "key_up", global.key_up);
	ds_map_add(map, "key_down", global.key_down);
	ds_map_add(map, "key_jump", global.key_jump);
	
	//Controller controls
	ds_map_add(map, "button_back", global.button_back);
	ds_map_add(map, "button_pull", global.button_pull);
	ds_map_add(map, "button_enter", global.button_enter);
	ds_map_add(map, "button_confirm", global.button_confirm);
	ds_map_add(map, "button_push", global.button_push);
	ds_map_add(map, "button_left", global.button_left);
	ds_map_add(map, "button_right", global.button_right);
	ds_map_add(map, "button_up", global.button_up);
	ds_map_add(map, "button_down", global.button_down);
	ds_map_add(map, "button_jump", global.button_jump);
}
	
//Wrap the root list up in a map
var wrapper = ds_map_create();
ds_map_add_list(wrapper, "ROOT", rootList);
	
//Save everything to a string
var str = json_encode(wrapper);
scrSaveStringToFile("options.sav", str);
	
//Delete data
ds_map_destroy(wrapper);

with (oOptionsSave) instance_destroy();
	
show_debug_message("Saved options!");