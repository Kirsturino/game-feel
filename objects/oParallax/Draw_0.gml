if (!surface_exists(parSurf))
{
	parSurf = surface_create(room_width, room_height);
} else
{
	draw_surface(parSurf, 0, 0);
}