//Register input
if (jump)
{
	//Track stats
	if (state != scrGrounded && !wantsToJump && !canWallJump)
	{
		global.missedJumpCounter++;
	}
	
	wantsToJump = true;
	//Set buffer length
	alarm[0] = jumpBufferLength;
}