//Get movement direction

if (global.inputDevice == "kb")
{
	scrNullMovement();
} else if (global.inputDevice == "controller")
{
	scrMovement();
}

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

//Horizontal collision
if (place_meeting(x + hsp, y, oCollision))
{
	xCollision = true;
	
	while (!place_meeting(x + sign(hsp), y, oCollision))
	{
		x += sign(hsp);
	}
	
	//Edge allowance, meaning that player will slide on top of ledge instead of colliding with it
	
	//Track if assistance was used
	var slidHorizontal = false;
	
	//Get difference between player and the ledge the player is colliding with
	if (place_meeting(x + sign(hsp), y, oCollision))
	{
		var colliderHorizontal = instance_place(x + sign(hsp), y, oCollision);
		var yDifference = y - colliderHorizontal.y;
		var forgivenessLimitHorizontal = minLedgeDifferenceY + (colliderHorizontal.image_yscale - 1) * blockSize / 2;
		
		if (abs(yDifference) > forgivenessLimitHorizontal && yDifference < 0)
		{
			//slide player until no longer colliding
			while (place_meeting(x + sign(hsp), y, oCollision))
			{
				y += sign(yDifference);
			}
			
			slidHorizontal = true;
		} else
		{
			hsp = 0;
		}
	}
	
	if (!slidHorizontal)
	{
		hsp = 0;
	}
} else
{
	xCollision = false;
}

//Aid player in reaching ledges
if (state != scrCrouched && ledgeTimer == 0)
{
	scrLedgeGrab();
}

ledgeTimer = scrApproach(ledgeTimer, 0, 1);

//Apply movement
x += hsp;

//Apply friction
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

//Increase player control by allowing control of fall speed
scrSlowfall();

//Clamp movement speeds to max values
vsp = clamp(vsp, -vspMax, curFallSpeed);

//Vertical collision
if (place_meeting(x, y + vsp, oCollision))
{
	yCollision = true;
	
	while (!place_meeting(x, y + sign(vsp), oCollision))
	{
		y += sign(vsp);
	}
	
	//Edge allowance, meaning that player will slide out instead of colliding if only hitting roof with a couple pixels
	
	//Track if assistance was used
	var slid = false;
	
	//Get difference between player and the roof the player is colliding with
	if (place_meeting(x, y - 1, oCollision))
	{
		var collider = instance_place(x, y - 1, oCollision);
		var xDifference = x - collider.x;
		var forgivenessLimit = minLedgeDifferenceX + (collider.image_xscale - 1) * blockSize / 2;
	
		if (abs(xDifference) > forgivenessLimit)
		{
			//Slide player until no longer colliding
			while (place_meeting(x, y - 1, oCollision))
			{
				x += sign(xDifference);
			}
			
			slid = true;
		} else
		{
			vsp = 0;
		}
	}
	
	if (!slid)
	{
		vsp = 0;
	}
} else
{
	yCollision = false;
}

//Collision with oneways
scrOnewayCollision();

//Apply movement
y += vsp;