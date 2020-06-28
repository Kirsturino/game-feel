if (oPlayer.freeCamToggle)
{
	switch (state)
	{
		case scrFollowCam:
			state = scrFreeCam;
			with (oPlayer)
			{
				blockMovement = true;
				scrNullifyMovement();
			}
		break;
		
		case scrFreeCam:
			state = scrFollowCam;
			oPlayer.blockMovement = false;
			margin = 0;
		break;
	}
}