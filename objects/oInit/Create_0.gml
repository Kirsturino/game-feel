//World properties
#macro grv 0.25
#macro blockSize 16

//Save stuff
scrInitSaveLists();

//Persistent player properties
global.spawnX = -1;
global.spawnY = -1;
global.spawnhsp = 0;
global.spawnvsp = 0;
global.allowPush = 0;
global.allowPull = 0;
global.allowFreeCam = 0;
global.oneKeyDash = false;
global.omniDash = false;

//Meta stuff
global.debugging = false;
global.destination = noone;
global.speedrunning = false;
global.speedrunningTimer = 0;
global.speedrunningTimerOffset = 0;
global.runIsOver = false;

//Menu things
global.pause = false;

//Secret layer
global.fakeLayerAlpha = 1;
global.uAlpha = 1;

//Init surfaces
global.parSurf = noone;
global.parSurfMiddleMountain = noone;
global.parSurfCloseMountain = noone;
global.parSurfFarMountain = noone;
global.parSurfMiddleCloud = noone;
global.parSurfCloseCloud = noone;
global.parSurfFarCloud = noone;
global.debugSurf = noone;

//Camera dimensions
#macro viewWidth 320
#macro viewHeight 180

//Make a global palette
scrInitPalette();

//Initialize particles
scrParticleInit();

//Init options
scrInitOptions();

//Init stattracking
scrInitStatTracking();

//Init audio groups
audio_group_load(agAmbient);
audio_group_load(agMusic);
audio_group_load(agSFX);
global.currentMusic = sndBGM;
global.musicTo = sndBGM;
global.currentAmbient = sndAmbient;
global.ambientTo = sndAmbient;

audio_master_gain(0.5);

//Get controllers
global.gp_num = gamepad_get_device_count();
global.controller = noone;
global.deadzone = 0.2;
scrGetController();

//Hide mouse
window_set_cursor(cr_none);

//Move to actual room after initializing everything
room_goto_next();