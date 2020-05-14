//World properties
#macro grv 0.25
#macro blockSize 16

//Persistent player properties
global.spawnX = -1;
global.spawnY = -1;
global.spawnhsp = 0;
global.spawnvsp = 0;

//Meta stuff
global.debugging = false;
global.musicTarget = 0;
global.destination = noone;

//Secret layer
global.fakeLayerAlpha = 1;
global.uAlpha = 1;

//Camera dimensions
#macro viewWidth 320
#macro viewHeight 180

//Make a global palette
scrInitPalette();

//Initialize particles
scrParticleInit();

//Init audio groups
audio_group_load(agAmbient);
audio_group_load(agMusic);
audio_group_load(agSFX);
global.musicVolume = audio_sound_get_gain(sndBGM);

//Get controllers
global.gp_num = gamepad_get_device_count();
global.controller = noone;

//Default to fullscreen
//window_set_fullscreen(true);

//Move to actual room after initializing everything
room_goto_next();