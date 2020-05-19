if (keyboard_check_pressed(ord("R")))
{
	room_restart();
}

//Saving
if (keyboard_check_pressed(ord("Q")))
{
	//Create root list
	var rootList = ds_list_create();
		
	with (oSave)
	{
		//Create map
		var map = ds_map_create();
		ds_list_add(rootList, map);
		ds_list_mark_as_map(rootList, ds_list_size(rootList) - 1);

		var obj = object_get_name(object_index);
		ds_map_add(map, "obj", obj);
		ds_map_add(map, "x", x);
		ds_map_add(map, "y", y);
	}
	
	//Wrap the root list up in a map
	var wrapper = ds_map_create();
	ds_map_add_list(wrapper, "ROOT", rootList);
	
	//Save everything to a string
	var str = json_encode(wrapper);
	scrSaveStringToFile("save.sav", str);
	
	//Delete data
	ds_map_destroy(wrapper);
	
	show_debug_message("Saved!");
}

//Loading
if (keyboard_check_pressed(ord("E")))
{
	with (oSave) instance_destroy();
	
	if (file_exists("save.sav"))
	{
		var wrapper = scrLoadJSONFromFile("save.sav");
		
		var list = wrapper[? "ROOT"];
		
		for (var i = 0; i < ds_list_size(list); i++)
		{
			var map = list[| i];
			
			var obj = map[? "obj"];
			with (instance_create_layer(0, 0, "Controllers", asset_get_index(obj)))
			{
				x = map[? "x"];
				y = map[? "y"];
			}
		}
		
		ds_map_destroy(wrapper);
		show_debug_message("Loaded!");
	}
}

if (keyboard_check_pressed(ord("T")))
{
	global.debugging = !global.debugging;
	
	var layerID = layer_get_id("Collision");
	layer_set_visible(layerID, global.debugging);
	
	var layerID = layer_get_id("Triggers");
	layer_set_visible(layerID, global.debugging);
	
	layerID = layer_get_id("GroundTiles");
	layer_set_visible(layerID, !global.debugging);
	
	layerID = layer_get_id("FakeGroundTiles");
	layer_set_visible(layerID, !global.debugging);
	
	layerID = layer_get_id("Decoration");
	layer_set_visible(layerID, !global.debugging);
	
	layerID = layer_get_id("ForegroundEnvironment");
	layer_set_visible(layerID, !global.debugging);
	
	layerID = layer_get_id("BackgroundEnvironment");
	layer_set_visible(layerID, !global.debugging);
}

if (keyboard_check_pressed(ord("F")))
{
	switch (room) {
	    case rmTest:
	        room_goto(rmOne);
	        break;
	    default:
	        room_goto(rmTest);
	        break;
	}
}

if (keyboard_check_pressed(ord("G")))
{
	repeat(5) show_debug_message("------------");
}

if (keyboard_check_pressed(ord("B")))
{
	global.highContrast = !global.highContrast;
}