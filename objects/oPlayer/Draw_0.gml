//Draw player shadow
scrDrawShadow(curSprite, x, y, xDrawScale, yDrawScale, spriteRot);
	
//Custom animation system because of the way I draw character sprites
if (animationFrame < sprite_get_number(curSprite))
{
	animationFrameIncrement++;
	
	if (animationFrameIncrement >= animationSpeed)
	{
		animationFrame++;
		animationFrameIncrement = 0;
	}
} else if (animationFrame >= sprite_get_number(curSprite))
{
	animationFrame = 0;
}

//Draw player sprite
if (global.highContrast)
{
	shader_set(shdOutline);
	shader_set_uniform_f(upixelW, texelW);
	shader_set_uniform_f(upixelH, texelH);
	draw_sprite_ext(curSprite, animationFrame, x, y + 1, xDrawScale, yDrawScale, spriteRot, color, spriteAlpha);
	shader_reset();
} else
{
	draw_sprite_ext(curSprite, animationFrame, x, y + 1, xDrawScale, yDrawScale, spriteRot, color, spriteAlpha);
}

color = merge_color(color, colorTo, 0.2);

//PP Reset animation
scrPPResetAnimation();

if (global.debugging)
{
	draw_sprite_ext(sprite_index, 0, x, y, 1, 1, 0, global.cOrange, 0.5);
}