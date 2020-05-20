if (down && !left && !right)
{
	scrCrouchSquash();
	
	sprite_index = sPlayerCollisionCrouched;
	scrResetAnimation();
	
	state = scrCrouched;
}