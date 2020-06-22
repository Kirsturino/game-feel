if (global.allowPull || global.allowPush)
{
	//Draw representative sprite
	if (hidden)
	{
		draw_sprite_ext(sprite_index, 0, drawX, drawY, xScale, yScale, rot, color, 1 - global.fakeLayerAlpha);
	} else
	{
		//Draw shadow
		scrDrawShadow(sprite_index, drawX, drawY, xScale, yScale, rot);
		
		draw_sprite_ext(sprite_index, 0, drawX, drawY, xScale, yScale, rot, color, 1);
	}
}