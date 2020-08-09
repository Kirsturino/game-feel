global.spawnX = -1;
global.spawnY = -1;

var press = keyboard_check_pressed(vk_anykey);
global.usingController = !press;

global.speedrunning = false;
global.runIsOver = false;
room_goto(global.roomTo);