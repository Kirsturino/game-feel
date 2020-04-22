//Get object to interact with
interact = instance_nearest(x, y - sprite_height / 2, oPushPull);
if (interact != noone)
{
	var interactDir = point_direction(x, y - sprite_height / 2, interact.x, interact.y);
} else
{
	var interactDir = 0;
}

//Round interactDir to 8 cardinal directions
if (!isPull && !isPush)
{
	if (interactDir <= 22.5 || interactDir > 337.5)
	{
		ppDir = 0;
	} else if (interactDir <= 67.5)
	{
		ppDir = 45;
	} else if (interactDir <= 112.5)
	{
		ppDir = 90;
	} else if (interactDir <= 157.5)
	{
		ppDir = 135;
	} else if (interactDir <= 202.5)
	{
		ppDir = 180;
	} else if (interactDir <= 247.5)
	{
		ppDir = 225;
	} else if (interactDir <= 292.5)
	{
		ppDir = 270;
	}else if (interactDir <= 337.5)
	{
		ppDir = 315;
	}
}

//Highlight interactable object, get initial keypress for pushing or pulling
if (distance_to_object(interact) < interactDistanceMax)
{
	with (interact)
	{
		
		if (!drawTri)
		{
			audio_sound_pitch(sndPPActive, 2);
			audio_play_sound(sndPPActive, 40, false);
		}
		drawTri = true;
		triDirTo = other.ppDir;
	}
	
	lastInteract = interact;

	//Stop natural momentum before applying force, get direction for force
	if ((pushPress || pullPress) && ppFrames == ppFramesMax && interact != noone)
	{
		if (pushPress)
		{
			isPush = true;
		} else if (pullPress)
		{
			isPull = true;
		}
		vsp = 0;
		hsp = 0;
		move = 0;
		
		//SFX
		var pitch = random_range(0.8, 1.2);
		audio_sound_pitch(sndPP, pitch);
		audio_play_sound(sndPP, 50, false);
		scrSetShake(15, 15);
		scrFreeze(80);
	}
} else
{
	with (interact)
	{
		if (drawTri)
		{
			audio_sound_pitch(sndPPActive, 1.5);
			audio_play_sound(sndPPActive, 40, false);
		}
		drawTri = false;
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
	hsp = lengthdir_x(ppSpeed, ppDir);
	vsp = lengthdir_y(ppSpeed, ppDir);
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
}