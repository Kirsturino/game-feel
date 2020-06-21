if (oPlayer.down && oPlayer.state == scrCrouched)
{
	if (downTimer >= downTimerMax)
	{
		cameraOffsetY = offsetAmount;
	} else
	{
		downTimer++;
	}
} else
{
	downTimer = 0;
}

if (oPlayer.up && oPlayer.state == scrGrounded)
{
	if (upTimer >= upTimerMax)
	{
		cameraOffsetY = -offsetAmount;
	} else
	{
		upTimer++;
	}
} else
{
	upTimer = 0;
}

if (upTimer == 0 && downTimer == 0)
{
	cameraOffsetY = 0;
}