var camX = camera_get_view_x(view);
var camY = camera_get_view_y(view);


if (!global.debugging)
{
	if (!surface_exists(global.parSurf))
	{
		global.parSurf = surface_create(room_width, room_height);
	
		//Generate a static background
		scrBackground();
	} else
	{
		draw_surface(global.parSurf, camX, camY);
	}
	
	if (!surface_exists(global.parSurfFarCloud))
	{
		global.parSurfFarCloud = surface_create(room_width, room_height);
	
		//Third parallax layer
		scrParallaxFarCloud();
	} else
	{
		var drawX = clamp(camX / 1.25, 0, room_width);
		var drawY = clamp(camY / 1.5, 0, room_height);
		draw_surface(global.parSurfFarCloud, drawX, drawY);
	}


	
	if (!surface_exists(global.parSurfMiddleCloud))
	{
		global.parSurfMiddleCloud = surface_create(room_width, room_height);
	
		//First parallax layer
		scrParallaxMiddleCloud();
	} else
	{
		var drawX = clamp(camX / 1.5, 0, room_width);
		var drawY = clamp(camY / 2, 0, room_height);
		draw_surface(global.parSurfMiddleCloud, drawX, drawY);
	}
	
	if (!surface_exists(global.parSurfCloseCloud))
	{
		global.parSurfCloseCloud = surface_create(room_width, room_height);
	
		//Second parallax layer
		scrParallaxCloseCloud();
	} else
	{
		var drawX = clamp(camX / 2, 0, room_width);
		var drawY = clamp(camY / 2.5, 0, room_height);
		draw_surface(global.parSurfCloseCloud, drawX, drawY);
	}

	if (!surface_exists(global.parSurfFarMountain))
	{
		global.parSurfFarMountain = surface_create(room_width, room_height);
	
		//Third parallax layer
		scrParallaxFarMountain();
	} else
	{
		var drawX = clamp(camX / 1.5, 0, room_width);
		var drawY = clamp(camY / 3, -room_height, 0);
		
		draw_surface(global.parSurfFarMountain, drawX, drawY);
	}
	
	if (!surface_exists(global.parSurfMiddleMountain))
	{
		global.parSurfMiddleMountain = surface_create(room_width, room_height);
	
		//First parallax layer
		scrParallaxMiddleMountain();
	} else
	{
		var drawX = clamp(camX / 2, 0, room_width);
		var drawY = clamp(camY / 4, -room_height, 0);
		draw_surface(global.parSurfMiddleMountain, drawX, drawY);
	}
	
	if (!surface_exists(global.parSurfCloseMountain))
	{
		global.parSurfCloseMountain = surface_create(room_width, room_height);
	
		//Second parallax layer
		scrParallaxCloseMountain();
	} else
	{
		var drawX = clamp(camX / 4, 0, room_width);
		var drawY = clamp(camY / 8, -room_height, 0);
		draw_surface(global.parSurfCloseMountain, drawX, drawY);
	}
}

if (global.debugging)
{
	//Player trail when debugging
	if (surface_exists(global.debugSurf))
	{
		surface_set_target(global.debugSurf);
		draw_point(oPlayer.x, oPlayer.y)
		surface_reset_target();
		
		draw_surface(global.debugSurf, 0, 0);
	} else
	{
		global.debugSurf = surface_create(room_width, room_height);
	}
}

//Rain particles
if (rain)
{
	var camX = camera_get_view_x(view);
	var camY = camera_get_view_y(view);
	part_emitter_region(global.partSystem, global.rainEmitter, camX - viewWidth * 0.75, camX + viewWidth + viewWidth * 0.75, camY - viewHeight, camY - viewHeight, ps_shape_rectangle, ps_distr_linear);
}