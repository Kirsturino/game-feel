if (!down)
{
	//Change colllision sprite
	sprite_index = sPlayerCollision;
	
	//FX
	scrStandUpSquash();

	state = scrGrounded;
}