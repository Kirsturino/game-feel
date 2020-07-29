/// @description Music and autosave

if (!instance_exists(oSecret))
{
	scrChangeMusic(sndBGM);
} else if (instance_exists(oSecret))
{
	scrChangeMusic(sndSecret);
}

//Check if player has been in this room, if not, add the index of the room to the list of rooms the player has reached
if (ds_list_find_index(global.roomList, room) == -1)
{
	ds_list_add(global.roomList, room);
}

//Check for final room for speedrunning purposes
{
	if (room == rmSurfaceSeven && !global.runIsOver)
	{
		global.speedrunningTimer = string(current_time - global.speedrunningTimerOffset) / 1000;
		global.runIsOver = true;
	}
}

//Autosave
scrSaveGame();
scrSaveStats();