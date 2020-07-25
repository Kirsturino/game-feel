if (oPlayer.freeCamToggle && oPlayer.state == scrGrounded)
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
			marginTarget = 8;
			audio_play_sound(sndFreeCamToggleOn, 10, false);
		break;
		
		case scrFreeCam:
			state = scrFollowCam;
			oPlayer.blockMovement = false;
			marginTarget = -8;
			audio_play_sound(sndFreeCamToggleOff, 10, false);
		break;
	}
}