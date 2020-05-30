//Check if on ground, is going to hit ground or was recently on ground
if ((jump or wantsToJump) and state == scrCrouched && !place_meeting(x, y + 1, oOneway))
{
	var willJump = true;
} else
{
	var willJump = false;
}

if (willJump)
{
	//Apply movement
	vsp = -longJumpSpeed;
	
	//Do a little forward momentum
	hspMax = hspMaxNormal + 1.5;
	hsp = hspMax * sign(hsp);
	
	//Reset buffer
	wantsToJump = false;
	jump = false;
	
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