//Variable jump height + slowfall
if (vsp < 0 && !jumpHeld && !isPull && !isPush && state != scrGrounded && alarm[5] == -1)
{
	vsp += grv;
}

//Slowfall limit and fastfall
if (jumpHeld)
{
	curFallSpeed = scrApproach(curFallSpeed, fallspeedHeld, fallSpeedChangeSpeed);
} else if (down)
{
	curFallSpeed = scrApproach(curFallSpeed, fastFallSpeed, fallSpeedChangeSpeed);
} else
{
	curFallSpeed = scrApproach(curFallSpeed, defaultFallSpeed, fallSpeedChangeSpeed);
}