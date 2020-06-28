//Camera manipulation
scrCameraManipulation();

//Follow player
if (instance_exists(oPlayer))
{
	scrShake();
	scrPush();
	
	curX = camera_get_view_x(view);
	curY = camera_get_view_y(view);

	var spd = .11;
	
	xx = clamp(oPlayer.x - viewWidth / 2, 0, room_width - viewWidth);
	yy = clamp(oPlayer.y - viewHeight / 2 + cameraOffsetY, 0, room_height - viewHeight);
	
	xTo = lerp(curX, xx + shakeX + pushX, spd);
	yTo = lerp(curY, yy + shakeY + pushY, spd);

	camera_set_view_pos(view, xTo, yTo);
}