//Create root list
var rootList = ds_list_create();
		
//Create map
var map = ds_map_create();
ds_list_add(rootList, map);
ds_list_mark_as_map(rootList, ds_list_size(rootList) - 1);

//Save current room player was in
ds_map_add(map, "deathCounter", global.deathCounter);
ds_map_add(map, "ledgeGrabCounter", global.ledgeGrabCounter);
ds_map_add(map, "missedJumpCounter", global.missedJumpCounter);
ds_map_add(map, "bonkPreventCounter", global.bonkPreventCounter);
	
//Wrap the root list up in a map
var wrapper = ds_map_create();
ds_map_add_list(wrapper, "ROOT", rootList);
	
//Save everything to a string
var str = json_encode(wrapper);
scrSaveStringToFile("stats.sav", str);
	
//Delete data
ds_map_destroy(wrapper);
	
with (oSave) instance_destroy();
	
show_debug_message("Saved stats!");