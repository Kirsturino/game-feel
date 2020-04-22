if (place_meeting(x + wallJumpDistance, y - sprite_height / 2, oCollision) && jump)
{
	wallJumpDir = "left";
	var walljump = true;
} else if (place_meeting(x - wallJumpDistance, y - sprite_height / 2, oCollision) && jump)
{
	wallJumpDir = "right";
	var walljump = true;
} else
{
	var walljump = false;
}

if (place_meeting(x + 1, y - sprite_height / 2, oCollision) || place_meeting(x - 1, y - sprite_height / 2, oCollision))
{
	curFallSpeed = fallSpeedWall;
}


if (walljump && wallJumpTimer == wallJumpTimerMax)
{
	
	wallJumping = true;
	
	//Apply vertical momentum
	vsp = -jumpSpeed * wallJumpVMultiplier;
	
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
}

//Increase max speeds, axl and drag when pushing/pulling
if (wallJumping)
{
	//Apply horizontal momentum throughout walljump based on wall collision
	switch (wallJumpDir)
	{
	    case "right":
	        hsp = wallJumpHSpeed;
	        break;
			
			case "left":
	        hsp = -wallJumpHSpeed;
	        break;
	    default:
	        show_debug_message("this should never be printed");
	        break;
	}
	
	//Disable drag and player strafing to prevent wallclimbing
	hspMax = hspMaxWallJump;
	airDrag = 0;
	airAxl = 0;
	if (wallJumpTimer > 0)
	{
		wallJumpTimer--;
	} else 
	{
		airAxl = airAxlMax;
		airDrag = airdragMax;
		wallJumpTimer = wallJumpTimerMax;
		wallJumping = false;
	}
}