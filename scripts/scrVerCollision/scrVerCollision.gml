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