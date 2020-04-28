if (!surface_exists(parSurf))
{
	parSurf = surface_create(room_width, room_height);
} else
{
	draw_surface(parSurf, 0, 0);
}

//Ambient particles
part_emitter_stream(global.partSystem, global.ambientEmitter, global.ambientPart, -5);

repeat (4)
{
	var xx = irandom_range(-room_width * 0.75, room_width);
	part_particles_create(global.partSystem, xx, 0, global.rainPart, 1);
}