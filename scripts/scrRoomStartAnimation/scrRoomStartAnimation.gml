if (alarm[2] != -1)
{
	var camX = camera_get_view_x(view) + viewWidth / 2;
	var camY = camera_get_view_y(view) + viewHeight / 2;
	var radius = alarm[2] * animationScale;
	
	draw_circle_color(camX, camY, radius, global.cBlack, global.cBlack, false);
}