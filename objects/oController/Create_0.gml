draw_set_font(fDefault);

//Init ambient particles
part_emitter_region(global.partSystem, global.ambientEmitter, 0, room_width, 0, room_height, ps_shape_rectangle, ps_distr_linear);

alarm[0] = 1;
musicVolume = audio_sound_get_gain(sndBGM);
audio_group_set_gain(agMusic, global.musicTarget, 0);