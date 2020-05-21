if (!file_exists("save.sav")) exit;

//Clear	global lists just in case so that we don't save duplicates into the lists
scrClearSaveLists();
	
var wrapper = scrLoadJSONFromFile("save.sav");
		
var list = wrapper[? "ROOT"];
		
var map = list[| 0];
				
//Load data of cleared worlds/rooms
var rmList = ds_map_find_value(map, "roomList");
var size = ds_list_size(rmList);
			
for (var i = 0; i < size; ++i)
{
	var listValue = ds_list_find_value(rmList,i);
	ds_list_add(global.roomList, listValue);
}

//Load data of found collectibles
var cList = ds_map_find_value(map, "collectibleList");
size = ds_list_size(cList);
			
for (var i = 0; i < size; ++i)
{
	listValue = ds_list_find_value(cList,i);
	ds_list_add(global.collectibleList, listValue);
}
			
global.roomTo = map[? "room"];

ds_map_destroy(wrapper);
show_debug_message("Loaded!");