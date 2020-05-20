//Create root list
var rootList = ds_list_create();
		
with (instance_create_layer(0, 0, layer, oSave))
{
	//Create map
	var map = ds_map_create();
	ds_list_add(rootList, map);
	ds_list_mark_as_map(rootList, ds_list_size(rootList) - 1);

	var obj = object_get_name(object_index);
	ds_map_add(map, "obj", obj);
	ds_map_add(map, "room", room);
}
	
//Wrap the root list up in a map
var wrapper = ds_map_create();
ds_map_add_list(wrapper, "ROOT", rootList);
	
//Save everything to a string
var str = json_encode(wrapper);
scrSaveStringToFile("save.sav", str);
	
//Delete data
ds_map_destroy(wrapper);
	
with (oSave) instance_destroy();
	
show_debug_message("Saved!");