if (file_exists("save.sav"))
{
	file_delete("save.sav");
}

scrClearSaveLists();

global.spawnX = -1;
global.spawnY = -1;
global.allowPull = false;
global.allowPush = false;
global.allowFreeCam = false;
room_goto(rmSurfaceOne);