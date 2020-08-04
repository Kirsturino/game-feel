//Get object to interact with

if (global.allowPull || global.allowPush)
{
	var centerOffset = sprite_get_height(curSprite) / 2;
	interact = instance_nearest(x, y - centerOffset, oPushPull);
}

//See if player wants to dash
if (pushPress && !global.oneKeyDash)
{
	wantsToPush = true;
	alarm[7] = ppBufferLength;
} else if (pullPress && alarm[9] == -1)
{
	wantsToPull = true;
	alarm[7] = ppBufferLength;
}

if (interact != noone)
{
	var interactDir = point_direction(x, y - centerOffset, interact.x, interact.y);

	#region Get direction that ppObjects should show
	
	//Round interactDir to 8 cardinal directions
	if (!isPull && !isPush && !global.omniDash)
	{
		if (interactDir <= 22.5 || interactDir > 337.5)
		{
			interact.triDirTo = 0;
		} else if (interactDir <= 67.5)
		{
			interact.triDirTo = 45;
		} else if (interactDir <= 112.5)
		{
			interact.triDirTo = 90;
		} else if (interactDir <= 157.5)
		{
			interact.triDirTo = 135;
		} else if (interactDir <= 202.5)
		{
			interact.triDirTo = 180;
		} else if (interactDir <= 247.5)
		{
			interact.triDirTo = 225;
		} else if (interactDir <= 292.5)
		{
			interact.triDirTo = 270;
		}else if (interactDir <= 337.5)
		{
			interact.triDirTo = 315;
		}
	} else if (!isPull && !isPush && global.omniDash)
	{
		interact.triDirTo = interactDir;
	}
	#endregion

	//Get initial keypress for pushing or pulling
	if (distance_to_object(interact) < interact.interactRange)
	{
		//Stop natural momentum before applying force, get direction for force
		if (((wantsToPush && global.allowPush) || (wantsToPull && global.allowPull)) && ppFrames == ppFramesMax && interact != noone)
		{
			if (wantsToPush)
			{
				isPush = true;
				scrSetPush(15, ppDir - 180);
			} else if (wantsToPull)
			{
				isPull = true;
				scrSetPush(15, ppDir);
			}
			
			ppDir = interact.triDirTo;
			
			if (global.oneKeyDash)
			{
				//See which way player is wanting to go
				inputDir = scrGetPlayerInputDirection();
				ang = abs(angle_difference(ppDir, inputDir));
			}
			vsp = 0;
			hsp = 0;
			move = 0;
			wallJumping = false;
			wallJumpTimer = wallJumpTimerMax;
			wantsToJump = false;
			canWallJump = false;
			wantsToPull = false;
			wantsToPush = false;
		
			//Animate character to turn towards or away from pp objects
			#region sprite rotation shenanigans
		
			var rotDir = ppDir;
		
			if (rotDir > 180)
			{
				rotDir = rotDir - 360;
			}
			
			//Up and down pushing rotations will remain at 0
			if (isPush || (global.oneKeyDash && ang > 90) && isPull)
			{
				if (ppDir == 45)
				{
					spriteRot = -45;
				} else if (ppDir == 135)
				{
					spriteRot = 45;
				} else if (ppDir == 180)
				{
					spriteRot = -90;
				} else if (rotDir != 90)
				{
					spriteRot = rotDir + 90;
				}
			} else if (isPull)
			{
				if (ppDir == 225)
				{
					spriteRot = -45;
				} else if (ppDir == 315)
				{
					spriteRot = 45;
				} else if (rotDir != -90)
				{
					spriteRot = rotDir - 90;
				}
			}
			
			
			colorTo = cantDashColor;
			
			#endregion
		
			//Animation
			scrDashAnimation();
			scrPPSquash();
			
			//SFX
			var pitch = random_range(0.8, 1.2);
			audio_sound_pitch(sndPP, pitch);
			audio_play_sound(sndPP, 50, false);
			scrSetShake(15, 10);
			scrFreeze(100);
		}
	}
}

//Apply force over a number of frames
if (isPush && ppFrames > 0)
{
	ppSpeed = clamp(ppSpeed + ppAxl, -ppSpeedMax, ppSpeedMax);
	hsp = lengthdir_x(ppSpeed, ppDir - 180);
	vsp = lengthdir_y(ppSpeed, ppDir - 180);
	ppFrames--;
	
	//Reduce air drag when pushing or pulling
	airDrag = 0;
	
	scrPPParticles();
} else if (isPush)
{
	isPush = false;
	ppSpeed = 0;
}

if (isPull && ppFrames > 0)
{
	ppSpeed = clamp(ppSpeed + ppAxl, -ppSpeedMax, ppSpeedMax);
	
	if (global.oneKeyDash)
	{
		if (ang <= 90 || !global.allowPush)
		{
			hsp = lengthdir_x(ppSpeed, ppDir);
			vsp = lengthdir_y(ppSpeed, ppDir);
		} else if (ang > 90)
		{
			hsp = lengthdir_x(ppSpeed, ppDir - 180);
			vsp = lengthdir_y(ppSpeed, ppDir - 180);
		}
	} else
	{
		hsp = lengthdir_x(ppSpeed, ppDir);
		vsp = lengthdir_y(ppSpeed, ppDir);
	}
	ppFrames--;

	//Reduce air drag when pushing or pulling
	airDrag = 0;
	
	scrPPParticles();
}  else if (isPull)
{
	isPull = false;
	ppSpeed = 0;
}

//Increase max speeds, axl and drag when pushing/pulling
if (isPull || isPush)
{
	hspMax = hspMaxPP;
	vspMax = vspMaxPP;
	airAxl = 0;
	curFallSpeed = fastFallSpeed;
	
	//Prevent walljump jank after dashing
	canWallJump = false;
} else
{
	if (state == scrGrounded)
	{
		hspMax = scrApproach(hspMax, hspMaxNormal, spChangeSpeed * 2);
	} else
	{
		hspMax = scrApproach(hspMax, hspMaxNormal, spChangeSpeed);
	}
	
	vspMax = scrApproach(vspMax, vspMaxNormal, spChangeSpeed);
	airAxl = scrApproach(airAxl, airAxlMax, airAxlChangeSpeed);
	airDrag = scrApproach(airDrag, airdragMax, airDragChangeSpeed);
	
	//Animate spinny boi back to default rot
	spriteRot = lerp(spriteRot, 0, 0.15);
}

//Dash particle trail
scrDashTrail();

//Extra particle trail if people are doing MLG tech
if (alarm[8] != -1)
{
	part_particles_create(global.partSystem, x, y, global.techPart, 1);
}