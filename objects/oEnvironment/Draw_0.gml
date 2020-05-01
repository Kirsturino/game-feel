var camX = camera_get_view_x(view);
var camY = camera_get_view_y(view);

if (!surface_exists(parSurf))
{
	parSurf = surface_create(room_width, room_height);
	
	//Generate a static background
	scrBackground();
} else
{
	draw_surface(parSurf, camX, camY);
}

if (!surface_exists(parSurfThree))
{
	parSurfThree = surface_create(room_width, room_height);
	
	//Third parallax layer
	scrParallaxThree();
} else
{
	draw_surface(parSurfThree, camX / 1.5, camY / 3);
}

if (!surface_exists(parSurfOne))
{
	parSurfOne = surface_create(room_width, room_height);
	
	//First parallax layer
	scrParallaxOne();
} else
{
	draw_surface(parSurfOne, camX / 2, camY / 4);
}

if (!surface_exists(parSurfTwo))
{
	parSurfTwo = surface_create(room_width, room_height);
	
	//Second parallax layer
	scrParallaxTwo();
} else
{
	draw_surface(parSurfTwo, camX / 4, camY / 8);
}

//Ambient particles
part_emitter_stream(global.partSystem, global.ambientEmitter, global.ambientPart, -5);

//Rain particles
repeat (4)
{
	var xx = irandom_range(-room_width * 0.75, room_width);
	part_particles_create(global.partSystem, xx, 0, global.rainPart, 1);
}