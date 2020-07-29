if (file_exists("save.sav"))
{
	file_delete("save.sav");
}

if (file_exists("stats.sav"))
{
	file_delete("stats.sav");
}

scrClearSaveLists();

global.spawnX = -1;
global.spawnY = -1;
global.allowPull = false;
global.allowPush = false;
global.allowFreeCam = false;
global.speedrunning = false;
global.runIsOver = false;
room_goto(rmSurfaceOne);