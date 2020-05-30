if (file_exists("save.sav"))
{
	file_delete("save.sav");
}

scrClearSaveLists();

global.spawnX = -1;
global.spawnY = -1;
room_goto(rmSurfaceOne);