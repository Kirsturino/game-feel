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
		
		if (abs(yDifference) > forgivenessLimitHorizontal && yDifference < 0 && place_empty(x + sign(hsp), y + yDifference, oCollision))
		{
			//slide player until no longer colliding
			while (place_meeting(x + sign(hsp), y, oCollision))
			{
				y += sign(yDifference);
			}
			
			slidHorizontal = true;
			global.bonkPreventCounter++;
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