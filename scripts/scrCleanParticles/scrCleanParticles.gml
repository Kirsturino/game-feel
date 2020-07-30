//part_system_clear(global.partSystem);
part_particles_clear(global.partSystem);
part_particles_clear(global.topPartSystem);

with (oPushPull)
{
	part_emitter_destroy(global.partSystem, ppEmitter);
}