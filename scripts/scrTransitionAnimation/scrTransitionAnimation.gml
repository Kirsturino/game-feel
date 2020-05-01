if (alarm[1] != -1)
{
	var camX = camera_get_view_x(view) + viewWidth / 2;
	var camY = camera_get_view_y(view) + viewHeight / 2;
	var radius = animationLength * animationScale - alarm[1] * animationScale;
	
	draw_circle_color(camX, camY, radius, global.cBlack, global.cBlack, false);
}