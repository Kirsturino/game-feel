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

for (var i = 0; i < ds_list_size(global.collectibleList); ++i)
{
    show_debug_message(ds_list_find_value(global.collectibleList, i));
}

scrSaveGame();