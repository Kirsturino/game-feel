if (curSprite != sPlayerDash)
{
	if (curSprite = sPlayerAirborneUpLeft && vsp > 0)
	{
		curSprite = sPlayerAirborneDownLeft;
	} else if (curSprite = sPlayerAirborneUpRight && vsp > 0)
	{
		curSprite = sPlayerAirborneDownRight;
	} else if (hugLeft)
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
	} else if (vsp < 0 && hsp < 0)
	{
		var sl = sprite_get_number(sPlayerAirborneUpLeft);
		if (animationFrame < sl)
		{
			animationSpeed = 3;
			curSprite = sPlayerAirborneUpLeft;
		} else
		{
			animationSpeed = 0;
			animationFrame = sl;
		}
	} else if (vsp < 0 && hsp > 0)
	{
		var sl = sprite_get_number(sPlayerAirborneUpRight);
		if (animationFrame < sl)
		{
			animationSpeed = 3;
			curSprite = sPlayerAirborneUpRight;
		} else
		{
			animationSpeed = 0;
			animationFrame = sl;
		}
	}
}