if (keyboard_check_pressed(ord("R")))
{
	room_restart();
}

//if (keyboard_check_pressed(vk_escape))
//{
//	game_end();
//}

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