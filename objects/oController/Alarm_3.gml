/// @description Change music track

audio_stop_sound(global.currentMusic);
global.currentMusic = global.musicTo;
audio_play_sound(global.currentMusic, 0, true);
audio_sound_gain(global.currentMusic, global.musicTarget, 1000);