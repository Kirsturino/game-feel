var rCollision = collision_point(bbox_right + wallJumpDistance, y - sprite_height / 2, oCollision, false, false);
var lCollision = collision_point(bbox_left - wallJumpDistance, y - sprite_height / 2, oCollision, false, false);

if (rCollision || lCollision)
{
	huggedWall = true;
	canWallJump = true;
} else if(huggedWall)
{
	alarm[4] = wallJumpCoyoteBufferLength;
	huggedWall = false;
}

if (rCollision != noone && wantsToJump && !isPull && !isPush && !wasGrounded && canWallJump)
{
	wallJumpDir = "left";
	var walljump = true;
} else if (lCollision != noone && wantsToJump && !isPull && !isPush && !wasGrounded && canWallJump)
{
	wallJumpDir = "right";
	var walljump = true;
} else
{
	var walljump = false;
}

var hugRight = collision_point(bbox_right + 1, y - sprite_height / 2, oCollision, false, false);
var hugLeft = collision_point(bbox_left - 1, y - sprite_height / 2, oCollision, false, false);
if ((hugRight != noone && right) || (hugLeft != noone && left))
{
	curFallSpeed = fallSpeedWall;
}


//Commit walljump
if (walljump)
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
		airAxl = airAxlMax / 2;
		airDrag = airdragMax / 2;
		wallJumpTimer = wallJumpTimerMax;
		wallJumping = false;
	}
}