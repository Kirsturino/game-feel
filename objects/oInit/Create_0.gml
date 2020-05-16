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
global.ambientVolume = audio_sound_get_gain(sndAmbient);
global.musicTarget = 0;
global.ambientTarget = audio_sound_get_gain(sndAmbient);
global.currentMusic = sndBGM;
global.musicTo = sndBGM;
global.currentAmbient = sndAmbient;
global.ambientTo = sndAmbient;

//Mute music
audio_group_set_gain(agMusic, global.musicTarget, 0);
audio_group_set_gain(agAmbient, global.ambientTarget, 0);

//Get controllers
global.gp_num = gamepad_get_device_count();
global.controller = noone;

//Default to fullscreen
//window_set_fullscreen(true);

//Accessibility
global.highContrast = false;

//Move to actual room after initializing everything
room_goto_next();