if (keyboard_check_pressed(ord("R")))
{
	room_restart();
}

//Saving
if (keyboard_check_pressed(ord("Q")))
{
	if (room_exists(room - 1))
	{
		room_goto(room - 1);
	}
}

//Loading
if (keyboard_check_pressed(ord("E")))
{
	if (room_exists(room + 1))
	{
		room_goto(room + 1);
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

if (keyboard_check_pressed(ord("G")))
{
	repeat(5) show_debug_message("------------");
}

if (keyboard_check_pressed(ord("B")))
{
	global.highContrast = !global.highContrast;
}