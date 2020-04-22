//Apply gravity and do slowfall if holding jumpd
if (!isPull && !isPush && state != scrGrounded)
{
	if (jumpHeld)
	{
		vsp += grv * grvModifier;
	} else
	{
		vsp += grv;
	}
}