//Check if on ground, is going to hit ground or was recently on ground
if ((jump or wantsToJump) and state == scrGrounded)
{
	var willJump = true;
} else if (jump and state == scrAirborne and wasGrounded)
{
	var willJump = true;
} else
{
	var willJump = false;
}


if (willJump)
{
	//Apply movement
	vsp = -jumpSpeed;
	
	//Reset buffer
	wantsToJump = false;
	
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