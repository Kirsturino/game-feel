//Create root list
var rootList = ds_list_create();
		
//Create map
var map = ds_map_create();
ds_list_add(rootList, map);
ds_list_mark_as_map(rootList, ds_list_size(rootList) - 1);

//Save current room player was in
ds_map_add(map, "room", room);
ds_map_add(map, "spawnX", global.spawnX);
ds_map_add(map, "spawnY", global.spawnY);
ds_map_add(map, "allowPush", global.allowPush);
ds_map_add(map, "allowPull", global.allowPull);
	
//Temporary lists that gets destroyed with the wrapper
	
//This is a list of all rooms the player has cleared
var rmList = ds_list_create();
	
for (var i = 0; i < ds_list_size(global.roomList); ++i)
{
	ds_list_add(rmList, global.roomList[| i]);
}
	
ds_map_add_list(map, "roomList", rmList);
	
//This is a list of all collectibles the player has collected
var cList = ds_list_create();
	
for (var i = 0; i < ds_list_size(global.collectibleList); ++i)
{
	ds_list_add(cList, global.collectibleList[| i]);
}
	
ds_map_add_list(map, "collectibleList", cList);
	
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