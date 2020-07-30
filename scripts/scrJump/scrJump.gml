//Check if on ground, is going to hit ground or was recently on ground
if ((jump or wantsToJump) and state != scrAirborne and !isPull and !isPush)
{
	var willJump = true;
	var longJump = down;
} else if (jump and state == scrAirborne and wasGrounded and !isPull and !isPush)
{
	var willJump = true;
	var longJump = down;
	
} else
{
	var willJump = false;
	var longJump = false;
}


if (willJump)
{
	//If jumping directly after dashing sideways or diagonally down
	if (alarm[5] != -1 && ppDir != 90 && ppDir != 270)
	{
		//Apply movement
		vsp = -longJumpSpeed;
	
		//Do specialized forward momentum
		hspMax = hspMaxPP;
		hsp = hspMaxPP * sign(hsp);
		
		//FX
		alarm[8] = techFXTimerLength;
		audio_play_sound(sndTech, 0, false);
		
	} else if (longJump)
	{
		//Apply movement
		vsp = -longJumpSpeed;
	
		//Do a little forward momentum
		hspMax = hspMaxNormal + 1.5;
		hsp = hspMax * sign(hsp);
	} else
	{
		//Apply movement
		vsp = -jumpSpeed;
	
		//Reset buffer
		wantsToJump = false;
		jump = false;
	}
	
	//Squash and stretch
	scrJumpSquash();
	
	//Emit particles
	scrJumpParticles();
	
	//SFX
	audio_play_sound(sndJump, 50, false);
	var jumpPitch = random_range(0.8, 1.2);
	audio_sound_pitch(sndJumpRetro, jumpPitch);
	audio_play_sound(sndJumpRetro, 50, false);
		
	//Change state
	scrToAir();
}