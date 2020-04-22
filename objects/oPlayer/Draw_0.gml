//Draw player shadow
scrDrawShadow(curSprite, x, y, xDrawScale, yDrawScale, spriteRot);

//Draw visible player
draw_sprite_ext(curSprite, 0, x, y + 1, xDrawScale, yDrawScale, spriteRot, c_white, spriteAlpha);

////Draw indicator for pushing
////visualPPDir = lerp(visualPPDir, ppDir, 0.2);
//var dd = angle_difference(visualPPDir, ppDir);
//visualPPDir -= min(abs(dd), 15) * sign(dd);

//if (distance_to_object(interact) < interactDistanceMax && ppFrames > 0)
//{
//	var ppIndicatorX = lengthdir_x(30, visualPPDir);
//	var ppIndicatorY = lengthdir_y(30, visualPPDir);
//	draw_sprite(sPPIndicator, 0, x + ppIndicatorX, y + ppIndicatorY);
//}

if (global.debugging)
{
	draw_sprite_ext(sprite_index, 0, x, y, 1, 1, 0, c_red, 0.5);
}