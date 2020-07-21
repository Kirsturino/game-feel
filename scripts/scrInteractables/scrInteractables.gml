var obj = collision_circle(x, y, interactDistance, oSign, false, false);

if (obj != noone)
{
	//Toggle bool to display interact hint on top of sign
	if (!obj.active)
	{
		obj.active = true;
		lastSign = obj;
	}
	
	//If press interact button, start drawing text. If already drawing text, make whole string visible.
	if (pullPress && !obj.drawText)
	{
		obj.alarm[0] = 1;
		obj.drawText = true;
		
		audio_play_sound(sndMenu, 10, false);
	} else if (pullPress && obj.index < string_length(obj.text))
	{
		obj.index = string_length(obj.text);
		audio_play_sound(sndMenu, 10, false);
	} else if (pullPress && obj.index == string_length(obj.text) && obj.drawText)
	{
		obj.drawText = false;
		obj.index = 0;
		audio_play_sound(sndMenu, 10, false);
	}
} else if (lastSign != noone)
{
	lastSign.active = false;
	lastSign = noone;
}