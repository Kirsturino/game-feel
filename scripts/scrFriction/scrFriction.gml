if (state == scrGrounded)
{
	hsp = scrApproach(hsp, 0, drag);
} else if (state == scrAirborne)
{
	hsp = scrApproach(hsp, 0, airDrag);
} else if (state == scrCrouched)
{
	hsp = scrApproach(hsp, 0, crouchDrag);
}