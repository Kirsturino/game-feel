if (!file_exists("save.sav")) exit;

//Clear	global lists just in case so that we don't save duplicates into the lists
scrClearSaveLists();
	
var wrapper = scrLoadJSONFromFile("stats.sav");
		
var list = wrapper[? "ROOT"];
		
var map = list[| 0];
				
//Load stats
global.deathCounter = map[? "deathCounter"];
global.ledgeGrabCounter = map[? "ledgeGrabCounter"];
global.missedJumpCounter = map[? "missedJumpCounter"];
global.bonkPreventCounter = map[? "bonkPreventCounter"];

ds_map_destroy(wrapper);