//Make player fall through oneway when wanted
if (place_meeting(x, y + 1, oOneway) && down && jump)
{
	//Fall through platform
	y++;
	vsp = 1;
	
	//Change state
	scrToAir();
}