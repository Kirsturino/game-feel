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
	var land = min(lastVsp / 140 , 0.02);
	audio_sound_gain(sndLand, land, 0);
	audio_sound_pitch(sndLand, 1.5 - land * 30);
	audio_play_sound(sndLand, 50, false);
	refreshPitch = 1;
	
	//Change state
	state = scrGrounded;
}