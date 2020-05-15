//Check if player is near enough to a wall
var rCollision = collision_point(bbox_right + wallJumpDistance, y - sprite_height / 2, oCollision, false, false);
var lCollision = collision_point(bbox_left - wallJumpDistance, y - sprite_height / 2, oCollision, false, false);

//Get direction for walljump, set up coyote jump timer for walljump
if (rCollision || lCollision)
{
	huggedWall = true;
	canWallJump = true;
	
	if (rCollision != noone)
	{
		wallJumpDir = "left";
	} else if (lCollision != noone)
	{
		wallJumpDir = "right";
	}
} else if(huggedWall)
{
	//Coyote timer, huggedWall is used solely for not triggering this part multiple times
	alarm[4] = wallJumpCoyoteBufferLength;
	huggedWall = false;
}

//
if (wantsToJump && !isPull && !isPush && !wasGrounded && canWallJump)
{
	var walljump = true;
} else
{
	var walljump = false;
}


//Make player drag against wall and fall slowly, these variables are also used for animation purposes
hugRight = collision_point(bbox_right + 1, y - sprite_height / 2, oCollision, false, false);
hugLeft = collision_point(bbox_left - 1, y - sprite_height / 2, oCollision, false, false);

if ((hugRight != noone && right) || (hugLeft != noone && left))
{
	curFallSpeed = fallSpeedWall;
}


//Commit walljump
if (walljump)
{
	//Switch player state to walljump
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

//Things that happen when player is in walljumping state
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