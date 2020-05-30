if (down && !wantsToJump)
{
	scrCrouchSquash();
	
	sprite_index = sPlayerCollisionCrouched;
	scrResetAnimation();
	
	state = scrCrouched;
}