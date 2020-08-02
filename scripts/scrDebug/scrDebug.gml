if (oPlayer.restartPress && global.allowReset)
{
	//Kill player to restart room
	with (oPlayer)
	{
		scrToDead();
		oPlayer.restartPress = false;
	}
}

//Toggle between one key dashing
if (global.debugging && keyboard_check_pressed(ord("G")))
{
	global.oneKeyDash = !global.oneKeyDash;
	if (global.oneKeyDash)
	{
		scrStartNotification("Toggled one button dashing on");
	} else
	{
		scrStartNotification("Toggled one button dashing off");
	}
}

//Toggle between omnidirectional dashes
if (global.debugging && keyboard_check_pressed(ord("B")))
{
	global.omniDash = !global.omniDash;
	if (global.omniDash)
	{
		scrStartNotification("Toggled omnidashing on");
	} else
	{
		scrStartNotification("Toggled omnidashing off");
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
	
	layerID = layer_get_id("BackgroundWall");
	layer_set_visible(layerID, !global.debugging);
}

if (global.debugging)
{
	//Debug between rooms
	if (keyboard_check_pressed(ord("Q")))
	{
		if (room_exists(room - 1))
		{
			room_goto(room - 1);
			global.spawnX = -1;
			global.spawnY = -1;
		}
	}

	if (keyboard_check_pressed(ord("E")))
	{
		if (room_exists(room + 1))
		{
			room_goto(room + 1);
			global.spawnX = -1;
			global.spawnY = -1;
		}
	}
}