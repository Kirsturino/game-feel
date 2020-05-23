//Horizontal collision
if (place_meeting(x + hsp, y, oOneway))
{
	//Edge allowance, meaning that player will slide on top of ledge instead of colliding with it
	//Get difference between player and the ledge the player is colliding with
	if (place_meeting(x + sign(hsp), y, oOneway))
	{
		var colliderHorizontal = instance_place(x + sign(hsp), y, oOneway);
		var yDifference = y - colliderHorizontal.y;

		//This is kinda jank
		if (abs(yDifference) > minLedgeDifferenceY / 6 && yDifference < 0 && !jumpHeld)
		{
			//slide player until no longer colliding
			while (place_meeting(x + sign(hsp), y, oOneway))
			{
				y += sign(yDifference);
			}
		}
	}
}


//Check if oneway is under player, but also that player is falling down and not already colliding with a oneway
if (vsp > 0)
{
	if (place_meeting(x, y + vsp, oOneway) && !place_meeting(x, y, oOneway))
	{
		while (!place_meeting(x, y+1, oOneway))
		{
			y += 1;
		}
		vsp = 0;
	}
}