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
	
	if (!surface_exists(parSurfFarCloud))
	{
		parSurfFarCloud = surface_create(room_width, room_height);
	
		//Third parallax layer
		scrParallaxFarCloud();
	} else
	{
		var drawX = clamp(camX / 1.25, 0, room_width);
		var drawY = clamp(camY / 1.5, 0, room_height);
		draw_surface(parSurfFarCloud, drawX, drawY);
	}


	
	if (!surface_exists(parSurfMiddleCloud))
	{
		parSurfMiddleCloud = surface_create(room_width, room_height);
	
		//First parallax layer
		scrParallaxMiddleCloud();
	} else
	{
		var drawX = clamp(camX / 1.5, 0, room_width);
		var drawY = clamp(camY / 2, 0, room_height);
		draw_surface(parSurfMiddleCloud, drawX, drawY);
	}
	
	if (!surface_exists(parSurfCloseCloud))
	{
		parSurfCloseCloud = surface_create(room_width, room_height);
	
		//Second parallax layer
		scrParallaxCloseCloud();
	} else
	{
		var drawX = clamp(camX / 2, 0, room_width);
		var drawY = clamp(camY / 2.5, 0, room_height);
		draw_surface(parSurfCloseCloud, drawX, drawY);
	}

	if (!surface_exists(parSurfFarMountain))
	{
		parSurfFarMountain = surface_create(room_width, room_height);
	
		//Third parallax layer
		scrParallaxFarMountain();
	} else
	{
		var drawX = clamp(camX / 1.5, 0, room_width);
		var drawY = clamp(camY / 3, -room_height, 0);
		
		draw_surface(parSurfFarMountain, drawX, drawY);
	}
	
	if (!surface_exists(parSurfMiddleMountain))
	{
		parSurfMiddleMountain = surface_create(room_width, room_height);
	
		//First parallax layer
		scrParallaxMiddleMountain();
	} else
	{
		var drawX = clamp(camX / 2, 0, room_width);
		var drawY = clamp(camY / 4, -room_height, 0);
		draw_surface(parSurfMiddleMountain, drawX, drawY);
	}
	
	if (!surface_exists(parSurfCloseMountain))
	{
		parSurfCloseMountain = surface_create(room_width, room_height);
	
		//Second parallax layer
		scrParallaxCloseMountain();
	} else
	{
		var drawX = clamp(camX / 4, 0, room_width);
		var drawY = clamp(camY / 8, -room_height, 0);
		draw_surface(parSurfCloseMountain, drawX, drawY);
	}
}

//Rain particles
if (rain)
{
	var camX = camera_get_view_x(view);
	var camY = camera_get_view_y(view);
	part_emitter_region(global.partSystem, global.rainEmitter, camX - viewWidth * 0.75, camX + viewWidth + viewWidth * 0.75, camY - viewHeight, camY - viewHeight, ps_shape_rectangle, ps_distr_linear);
}