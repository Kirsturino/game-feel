if (global.allowPull || global.allowPush)
{
	//Draw shadow
	scrDrawShadow(sprite_index, drawX, drawY, xScale, yScale, rot);

	//Draw representative sprite
	draw_sprite_ext(sprite_index, 0, drawX, drawY, xScale, yScale, rot, color, 1);
}