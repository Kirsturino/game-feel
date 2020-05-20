if (file_exists("save.sav"))
{
	var wrapper = scrLoadJSONFromFile("save.sav");
		
	var list = wrapper[? "ROOT"];
		
	for (var i = 0; i < ds_list_size(list); i++)
	{
		var map = list[| i];
			
		var obj = map[? "obj"];
		with (instance_create_layer(0, 0, layer, asset_get_index(obj)))
		{
			curRoom = map[? "room"];
			room_goto(curRoom);
		}
	}
		
	ds_map_destroy(wrapper);
	show_debug_message("Loaded!");
}

with (oSave) instance_destroy();