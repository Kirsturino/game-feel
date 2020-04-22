draw_set_font(fDefault);

//Init ambient particles
part_emitter_region(global.partSystem, global.ambientEmitter, 0, room_width, 0, room_height, ps_shape_rectangle, ps_distr_linear);

alarm[0] = 1;