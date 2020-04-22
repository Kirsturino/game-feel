if (instance_exists(oPlayer))
{
	var xx = clamp(oPlayer.x - viewWidth / 2, 0, room_width - viewWidth);
	var yy = clamp(oPlayer.y - viewHeight / 2, 0, room_height - viewHeight);
	
	var curX = camera_get_view_x(view);
	var curY = camera_get_view_y(view);
	var spd = .1;
	
	scrShake();
	
	var xTo = lerp(curX, xx + shakeX, spd);
	var yTo = lerp(curY, yy + shakeY, spd);
	
	camera_set_view_pos(view, xTo, yTo);
}