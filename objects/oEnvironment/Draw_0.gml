var camX = camera_get_view_x(view);
var camY = camera_get_view_y(view);

if (!global.debugging)
{
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
		//shader_set(shdWaveStatic);
		//shader_set_uniform_f(uTime,current_time/1000 * spd);
		//shader_set_uniform_f(uFrequency, frequency);
		//shader_set_uniform_f(uIntensity, intensity);
		draw_surface(parSurfTwo, camX / 4, camY / 8);
		//shader_reset();
	}
}



//Rain particles
part_emitter_region(global.partSystem, global.rainEmitter, oPlayer.x - viewWidth * 0.75, oPlayer.x + viewWidth * 0.75, oPlayer.y - viewHeight, oPlayer.y - viewHeight, ps_shape_rectangle, ps_distr_linear);