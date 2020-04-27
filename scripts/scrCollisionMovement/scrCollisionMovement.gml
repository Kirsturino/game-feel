//Get movement direction
scrNullMovement();

//Calculate movement speed
if (state == scrGrounded)
{
	hsp = clamp(hsp + move * axl, -hspMax, hspMax);
} else if (state == scrAirborne)
{
	hsp = clamp(hsp + move * airAxl, -hspMax, hspMax);
} else if (state == scrCrouched)
{
	hsp = clamp(hsp + move * crouchAxl, -hspMax, hspMax);
}

//Clamp movement speeds to max values
if (state == scrGrounded or state == scrAirborne)
{
	hsp = clamp(hsp, -hspMax, hspMax);
} else if (state == scrCrouched)
{
	hsp = clamp(hsp, -hspMaxCrouched, hspMaxCrouched);
}

//Give horizontal collision floored values, add fractions back to movement to preserve proper speed
hsp += hspFraction;

//Store and remove fractions
hspFraction = hsp - (floor(abs(hsp)) * sign(hsp));
hsp -= hspFraction;

scrHorCollision();

//Aid player in reaching ledges
if (state != scrCrouched && ledgeTimer == 0)
{
	scrLedgeGrab();
}

ledgeTimer = scrApproach(ledgeTimer, 0, 1);

//Apply movement
x += hsp;

//Apply friction
scrFriction();

//Increase player control by allowing control of fall speed
scrSlowfall();

//Clamp movement speeds to max values
vsp = clamp(vsp, -vspMax, curFallSpeed);

//Vertical collision
scrVerCollision();

//Collision with oneways
scrOnewayCollision();

//Apply movement
y += vsp;