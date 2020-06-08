//Check if ground below player or if colliding with oneway while going down

if (place_meeting(x, y + 1, oOneway) && !place_meeting(x, y, oOneway) && vsp >= 0)
{
	var oneway = true;
} else
{
	var oneway = false;
}

if (place_meeting(x, y + 1, oCollision) || oneway)
{
	//Change colllision sprite
	sprite_index = sPlayerCollision;
	spriteRot = 0;
	
	//Squash
	scrLandSquash();
	
	//Landing SFX && reset refresh pitch
	//Bad magic numbers
	var land = global.sfxVolume / 8 + lastVsp * 0.1 * global.sfxVolume;
	audio_sound_gain(sndLand, land, 0);
	audio_play_sound(sndLand, 50, false);
	refreshPitch = 1;
	
	scrResetAnimation();
	
	//Change state
	state = scrGrounded;
}