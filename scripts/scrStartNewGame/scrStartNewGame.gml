if (file_exists("save.sav"))
{
	file_delete("save.sav");
}

if (file_exists("stats.sav"))
{
	file_delete("stats.sav");
}

scrClearStats();
scrClearSaveLists();

var press = keyboard_check_pressed(vk_anykey);
global.usingController = !press;

global.spawnX = -1;
global.spawnY = -1;
global.allowPull = false;
global.allowPush = false;
global.allowFreeCam = false;
global.speedrunning = false;
global.runIsOver = false;
room_goto(rmSurfaceOne);