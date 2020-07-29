global.allowPull = false;
global.allowPush = false;
global.allowFreeCam = false;

//Init speedrunning timers
global.speedrunning = true;
global.speedrunningTimerOffset = current_time;
global.runIsOver = false;

global.spawnX = -1;
global.spawnY = -1;
global.roomTo = rmSurfaceOne;

room_goto(global.roomTo);