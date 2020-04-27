if (surface_exists(lightSurf))
{
	surface_set_target(lightSurf);
	draw_clear_alpha(c_black, 0.3);
	surface_reset_target();
} else
{
	lightSurf = surface_create(room_width, room_height);
	surface_set_target(lightSurf);
	draw_clear_alpha(c_black, 0.3);
	surface_reset_target();
}