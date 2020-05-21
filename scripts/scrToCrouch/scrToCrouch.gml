if (down)
{
	scrCrouchSquash();
	
	sprite_index = sPlayerCollisionCrouched;
	scrResetAnimation();
	
	state = scrCrouched;
}