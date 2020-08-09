//if (global.allowPull || global.allowPush)
//{
//	//Draw representative sprite
//	if (hidden)
//	{
//		draw_sprite_ext(sprite_index, 0, drawX, drawY, xScale, yScale, rot, color, 1 - global.fakeLayerAlpha);
//	} else
//	{
//		//Draw shadow
//		scrDrawShadow(sprite_index, drawX, drawY, xScale, yScale, rot);
		
//		draw_sprite_ext(sprite_index, 0, drawX, drawY, xScale, yScale, rot, color, 1);
//	}
//}


if (!global.allowPull) exit;

//Draw a wibbly wobbly FX for visuals
var size = 8;

var xOffset = lengthdir_x(size * xScale / 2, rot);
var yOffset = lengthdir_y(size * yScale / 2, rot);

if (hidden) draw_set_alpha(1 - global.fakeLayerAlpha);

var c = global.cBlack;
draw_ellipse_color(x - xOffset + 3, y - yOffset + 1, x + xOffset + 3, y + yOffset + 1, c, c, true);
draw_ellipse_color(x - yOffset + 3, y - xOffset + 1, x + yOffset + 3, y + xOffset + 1, c, c, true);

c = color;
draw_ellipse_color(x - xOffset, y - yOffset , x + xOffset, y + yOffset, c, c, true);

c = color;
draw_ellipse_color(x - yOffset, y - xOffset , x + yOffset, y + xOffset, c, c, true);

draw_set_alpha(1);