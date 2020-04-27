part_system_clear(global.partSystem);

with (oPushPull)
{
	part_emitter_destroy(global.partSystem, ppEmitter);
}