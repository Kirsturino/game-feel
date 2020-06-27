//Apply gravity and do slowfall if holding jump
if (!isPull && !isPush && state != scrGrounded)
{
	if (jumpHeld || alarm[5] != -1)
	{
		vsp += grv * grvModifier;
	} else
	{
		vsp += grv;
	}
}