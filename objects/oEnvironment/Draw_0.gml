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

	if (!surface_exists(parSurfFarMountain))
	{
		parSurfFarMountain = surface_create(room_width, room_height);
	
		//Third parallax layer
		scrParallaxFarMountain();
	} else
	{
		draw_surface(parSurfFarMountain, camX / 1.5, camY / 3);
	}
	
	if (!surface_exists(parSurfFarCloud))
	{
		parSurfFarCloud = surface_create(room_width, room_height);
	
		//Third parallax layer
		scrParallaxFarCloud();
	} else
	{
		draw_surface(parSurfFarCloud, camX / 1.5, camY / 3);
	}

	if (!surface_exists(parSurfMiddleMountain))
	{
		parSurfMiddleMountain = surface_create(room_width, room_height);
	
		//First parallax layer
		scrParallaxMiddleMountain();
	} else
	{
		draw_surface(parSurfMiddleMountain, camX / 2, camY / 4);
	}
	
	if (!surface_exists(parSurfMiddleCloud))
	{
		parSurfMiddleCloud = surface_create(room_width, room_height);
	
		//First parallax layer
		scrParallaxMiddleCloud();
	} else
	{
		draw_surface(parSurfMiddleCloud, camX / 2, camY / 4);
	}

	if (!surface_exists(parSurfCloseMountain))
	{
		parSurfCloseMountain = surface_create(room_width, room_height);
	
		//Second parallax layer
		scrParallaxCloseMountain();
	} else
	{
		//shader_set(shdWaveStatic);
		//shader_set_uniform_f(uTime,current_time/1000 * spd);
		//shader_set_uniform_f(uFrequency, frequency);
		//shader_set_uniform_f(uIntensity, intensity);
		draw_surface(parSurfCloseMountain, camX / 4, camY / 8);
		//shader_reset();
	}
	
	if (!surface_exists(parSurfCloseCloud))
	{
		parSurfCloseCloud = surface_create(room_width, room_height);
	
		//Second parallax layer
		scrParallaxCloseCloud();
	} else
	{
		draw_surface(parSurfCloseCloud, camX / 4, camY / 8);
	}
}



//Rain particles
part_emitter_region(global.partSystem, global.rainEmitter, oPlayer.x - viewWidth * 0.75, oPlayer.x + viewWidth * 0.75, oPlayer.y - viewHeight, oPlayer.y - viewHeight, ps_shape_rectangle, ps_distr_linear);