//Draw shadow
//scrDrawShadow(sprite_index, drawX, drawY, xScale, yScale, rot);

//Draw an extra indication triangle to help player discern pp direction
scrPPLightIndicator(drawX, drawY, visualInteractRange, triDir, offset, 8, triAlpha, color);

//Draw representative sprite
if (!spawnRestore)
{
	draw_sprite_ext(sprite_index, 0, drawX, drawY, xScale, yScale, rot, color, 1);
}