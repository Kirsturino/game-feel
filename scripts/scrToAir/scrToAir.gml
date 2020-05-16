//Check if ground below player
if (!place_meeting(x, y + 1, oCollision) && (!place_meeting(x, y + 1, oOneway) || vsp > 1))
{
	//Coyote time
	wasGrounded = true;
	alarm[1] = coyoteBufferLength;
	
	//Ledge grab
	ledgeTimer = ledgeTimerMax;
	
	//Change colllision sprite
	sprite_index = sPlayerCollision;
	
	scrResetAnimation();
	
	state = scrAirborne;
}