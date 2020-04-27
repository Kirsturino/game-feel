if (alarm[2] != -1)
{
	var camX = camera_get_view_x(view) + oCamera.viewWidth / 2;
	var camY = camera_get_view_y(view) + oCamera.viewHeight / 2;
	var radius = alarm[2] * animationScale;
	
	draw_circle_color(camX, camY, radius, c_black, c_black, false);
}