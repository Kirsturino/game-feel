draw_set_font(fDefault);

//Init system
if (!part_system_exists(global.partSystem))
{
	global.partSystem = part_system_create_layer("Particles", true);
}

if (!part_emitter_exists(global.partSystem, global.ambientEmitter))
{
	global.ambientEmitter = part_emitter_create(global.partSystem);
}

//Init ambient particles
part_emitter_region(global.partSystem, global.ambientEmitter, 0, room_width, 0, room_height, ps_shape_rectangle, ps_distr_linear);

alarm[0] = 1;
audio_group_set_gain(agMusic, global.musicTarget, 0);

//Init screen change variables
animationLength = 20;
animationScale = 15;
alarm[2] = animationLength;