if (surface_exists(lightSurf))
{
	surface_set_target(lightSurf);
	var black = make_color_hsv(240, 56 , 14);
	draw_clear_alpha(black, 0.5);
	surface_reset_target();
} else
{
	lightSurf = surface_create(room_width + blockSize * 4, room_height + blockSize * 4);
	surface_set_target(lightSurf);
	var black = make_color_hsv(240, 56 , 14);
	draw_clear_alpha(black, 0.5);
	surface_reset_target();
}