var camY = camera_get_view_y(view);

if (!surface_exists(flameSurf))
{
	flameSurf = surface_create(room_width, room_height);
	
	//Generate a static background
	scrFlameWall();
} else
{
	var drawY = min(camY + viewHeight - room_height, oMovingDanger.y - room_height);
	
	shader_set(shdWave);
	shader_set_uniform_f(uTime,current_time/1000 * spd);
	shader_set_uniform_f(uFrequency, frequency);
	shader_set_uniform_f(uIntensity, intensity);
	draw_surface(flameSurf, -viewWidth / 2, drawY);
	shader_reset();
}