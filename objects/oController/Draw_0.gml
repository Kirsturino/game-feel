//Debugging stuff
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

//Draw notification text
if (notificationTime != 0)
{
	notificationY = lerp(notificationY, notificationYTarget, 0.1);
	notificationAlpha = min(1, notificationTime * 0.1);

	draw_set_halign(fa_center);
	scrDrawFunkyText( oCamera.xTo + viewWidth / 2, oCamera.yTo + notificationY, notificationText, notificationAlpha);
	draw_set_halign(fa_left);
	
	notificationTime--;
}

//Transition animations
scrTransitionAnimation();
scrRoomStartAnimation();