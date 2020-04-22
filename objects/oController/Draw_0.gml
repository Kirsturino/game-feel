if (global.debugging)
{
	with (oPlayer)
	{
		if (isPull || isPush)
		{
			draw_arrow(x, y - sprite_height / 2, x + lengthdir_x(32, ppDir), y + lengthdir_y(32, ppDir), 10);
		}
	}
}