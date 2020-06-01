var hidden = place_meeting(x, y, oFakeCollision);

//Draw shadow
//scrDrawShadow(sprite_index, drawX, drawY, xScale, yScale, rot);

//Draw an extra indication triangle to help player discern pp direction
if (hidden)
{
	scrPPLightIndicator(drawX, drawY, visualInteractRange, triDir, offset, 8, triAlpha - global.fakeLayerAlpha / 10, color);
} else
{
	scrPPLightIndicator(drawX, drawY, visualInteractRange, triDir, offset, 8, triAlpha, color);
}

//Draw representative sprite
if (!spawnRestore && hidden)
{
	draw_sprite_ext(sprite_index, 0, drawX, drawY, xScale, yScale, rot, color, 1 - global.fakeLayerAlpha);
} else if (!spawnRestore)
{
	draw_sprite_ext(sprite_index, 0, drawX, drawY, xScale, yScale, rot, color, 1);
}