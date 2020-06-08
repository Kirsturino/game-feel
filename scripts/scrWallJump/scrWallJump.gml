//Check if player is near enough to a wall
var rCollision = collision_point(bbox_right + wallJumpDistance, y - sprite_height / 2, oCollision, false, false);
var lCollision = collision_point(bbox_left - wallJumpDistance, y - sprite_height / 2, oCollision, false, false);

//Get direction for walljump, set up coyote jump timer for walljump
if ((rCollision || lCollision) && !wallJumping)
{
	if (!canWallJump)
	{
		audio_sound_gain(sndLand, global.sfxVolume / 6, 0);
		audio_play_sound(sndLand, 0, false);
	}
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

//Check condition for walljumping
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
	curFallSpeed = scrApproach(curFallSpeed, fallSpeedWall, fallSpeedChangeSpeed * 2.5);
	
	if (wallJumpDir = "right")
	{
		part_particles_create(global.partSystem, x - 4, y, global.wallDragPart, 2);
	} else
	{
		part_particles_create(global.partSystem, x + 7, y, global.wallDragPart, 2);
	}
	
	
	if (!audio_is_playing(sndWalldrag) && vsp > 0)
	{
		audio_play_sound(sndWalldrag, 0, true);
	}
} else if (audio_is_playing(sndWalldrag))
{
	audio_stop_sound(sndWalldrag);
}


//Commit walljump
if (walljump)
{
	//Switch player state to walljump
	wallJumping = true;
	
	//Apply vertical momentum, if player is going up, preserve some of that momentum
	vsp = min(vsp, 0) - jumpSpeed * wallJumpVMultiplier;
	
	//Reset buffer
	wantsToJump = false;
	canWallJump = false;
	
	//Squash and stretch
	scrJumpSquash();
	
	//Emit particles
	scrJumpParticles();
	
	//SFX
	audio_play_sound(sndJump, 50, false);
	var jumpPitch = random_range(0.8, 1.2);
	audio_sound_pitch(sndJumpRetro, jumpPitch);
	audio_play_sound(sndJumpRetro, 50, false);
	
	audio_stop_sound(sndWalldrag);
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