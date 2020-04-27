//Draw player shadow
scrDrawShadow(curSprite, x, y, xDrawScale, yDrawScale, spriteRot);
	
//Draw visible player
draw_sprite_ext(curSprite, 0, x, y + 1, xDrawScale, yDrawScale, spriteRot, color, spriteAlpha);

//Indicate when player can dash
if (ppFrames == ppFramesMax)
{
	colorTo = canDashColor;
} else
{
	color = cantDashColor;
}

color = merge_color(color, colorTo, 0.2);

//Visuals for resetting PP. This is literally just Downwell
if (alarm[2] != -1)
{
	var x1 = x - blockSize / 2;
	var x2 = x + blockSize / 2;
	var y1 = y - blockSize;
	var y2 = y1 + alarm[2] * 4;
	
	draw_rectangle_color(x1, y1, x2, y2, color, color, color, color, false);
}

if (global.debugging)
{
	draw_sprite_ext(sprite_index, 0, x, y, 1, 1, 0, c_red, 0.5);
}