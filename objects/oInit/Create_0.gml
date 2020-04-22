//World properties
#macro grv 0.25
#macro blockSize 16

//Meta stuff
global.debugging = false;

//Initialize particles
scrParticleInit();

//Move to actual room after initializing everything
room_goto_next();

//Init audio groups
audio_group_load(agAmbient);
audio_group_load(agMusic);
audio_group_load(agSFX);