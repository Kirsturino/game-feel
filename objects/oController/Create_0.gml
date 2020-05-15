draw_set_font(fDefault);

//Init ambient part system
if (!part_system_exists(global.partSystem))
{
	global.partSystem = part_system_create_layer("Particles", true);
}

if (!part_emitter_exists(global.partSystem, global.ambientEmitter))
{
	global.ambientEmitter = part_emitter_create(global.partSystem);
}

alarm[0] = 1;
audio_group_set_gain(agMusic, global.musicTarget, 0);

scrHideEditorLayers();

//Init screen change variables
animationLength = 20;
animationScale = 15;
scrStartRoomStartAnimation();