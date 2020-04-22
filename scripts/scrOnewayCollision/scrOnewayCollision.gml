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