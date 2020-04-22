//Check if on ground, is going to hit ground or was recently on ground
if ((jump or wantsToJump) and state == scrCrouched)
{
	var willJump = true;
} else
{
	var willJump = false;
}


if (willJump)
{
	//Apply movement
	vsp = -crouchJumpSpeed;
	
	//Reset buffer
	wantsToJump = false;
	
	//Squash and stretch
	scrCrouchJumpSquash();
	
	//Change state
	state = scrAirborne;
}