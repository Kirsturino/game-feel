//Draw shadow
//scrDrawShadow(sprite_index, drawX, drawY, xScale, yScale, rot);

//Draw an extra indication triangle to help player discern pp direction
if (hidden)
{
	scrPPLightIndicator(drawX, drawY, visualInteractRange, triDir, offset, 8, triAlpha - global.fakeLayerAlpha / 2, color);
} else
{
	scrPPLightIndicator(drawX, drawY, visualInteractRange, triDir, offset, 8, triAlpha, color);
}

//Draw representative sprite
if (!spawnRestore && hidden)
{
	if (drawTri)
	{
		draw_sprite_ext(sprite_index, 0, drawX, drawY, xScale, yScale, triDir, color, 1 - global.fakeLayerAlpha);
	} else
	{
		draw_sprite_ext(sprite_index, 0, drawX, drawY, xScale, yScale, rot, color, 1 - global.fakeLayerAlpha);
	}
	
} else if (!spawnRestore)
{
	if (drawTri)
	{
		draw_sprite_ext(sprite_index, 0, drawX, drawY, xScale, yScale, triDir, color, 1);
	} else
	{
		draw_sprite_ext(sprite_index, 0, drawX, drawY, xScale, yScale, rot, color, 1);
	}
}