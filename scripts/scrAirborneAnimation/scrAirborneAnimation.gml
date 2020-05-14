if (curSprite != sPlayerDash)
{
	if (hugLeft)
	{
		curSprite = sPlayerWallDragLeft;
	} else if (hugRight)
	{
		curSprite = sPlayerWallDragRight;
	} else if (vsp > 0 && hsp > 0)
	{
		animationSpeed = 2;
		curSprite = sPlayerAirborneDownRight;
	} else if (vsp > 0 && hsp < 0)
	{
		animationSpeed = 2;
		curSprite = sPlayerAirborneDownLeft;
	} else if (vsp < 0 && hsp > 0)
	{
		animationSpeed = 3;
		curSprite = sPlayerAirborneUpRight;
	} else if (vsp < 0 && hsp < 0)
	{
		animationSpeed = 3;
		curSprite = sPlayerAirborneUpLeft;
	}
}