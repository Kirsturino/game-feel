if (instance_exists(oPlayer))
{
	scrShake();
	
	curX = camera_get_view_x(view);
	curY = camera_get_view_y(view);

	var spd = .1;
	
	xx = clamp(oPlayer.x - viewWidth / 2, 0, room_width - viewWidth);
	yy = clamp(oPlayer.y - viewHeight / 2, 0, room_height - viewHeight);
	
	xTo = lerp(curX, xx + shakeX, spd);
	yTo = lerp(curY, yy + shakeY, spd);

	
	camera_set_view_pos(view, xTo, yTo);
}