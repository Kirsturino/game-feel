//World properties
#macro grv 0.25
#macro blockSize 16

//Persistent player properties
global.spawnX = 9999;
global.spawnY = 9999;
global.spawnhsp = 0;
global.spawnvsp = 0;

//Meta stuff
global.debugging = false;
global.musicTarget = 0;

//Initialize particles
scrParticleInit();

//Init audio groups
audio_group_load(agAmbient);
audio_group_load(agMusic);
audio_group_load(agSFX);

//Get controllers
global.gp_num = gamepad_get_device_count();
for (var i = 0; i < global.gp_num; i++;)
   {
   if gamepad_is_connected(i) global.gp[i] = true else global.gp[i] = false;
   }

//Move to actual room after initializing everything
room_goto_next();