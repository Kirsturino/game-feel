var obj = collision_circle(x, y, interactDistance, oSign, false, false);

if (obj != noone)
{
	//Toggle bool to display interact hint on top of sign
	if (!obj.active)
	{
		obj.active = true;
		lastSign = obj;
		audio_play_sound(sndSignActive, 0, false);
	}
	
	//If press interact button, start drawing text. If already drawing text, make whole string visible.
	if (pullPress && !obj.drawText && state == scrGrounded)
	{
		
		with (oSign)
		{
			drawText = false;
			index = 0;
			alarm[0] = -1;
		}
		
		obj.alarm[0] = 1;
		obj.alarm[1] = -1;
		obj.drawText = true;
		
		audio_play_sound(sndSign, 10, false);
	} else if (pullPress && obj.index < string_length(obj.text))
	{
		obj.index = string_length(obj.text);
		audio_play_sound(sndSignHurry, 10, false);
	} else if (pullPress && obj.index == string_length(obj.text) && obj.drawText)
	{
		obj.drawText = false;
		obj.index = 0;
		audio_play_sound(sndSignEnd, 10, false);
	}
} else if (lastSign != noone)
{
	lastSign.active = false;
	lastSign = noone;
}