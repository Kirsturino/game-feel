/// @description Change ambient track

audio_stop_sound(global.currentAmbient);
global.currentAmbient = global.ambientTo;
audio_play_sound(global.currentAmbient, 0, true);
audio_sound_gain(global.currentAmbient, global.ambientTarget, 1000);