/// @description Text things

var lowerEnd = 0.2;
var higherEnd = 0.4;

//Make sure we're not at the end of text
if (index < string_length(text))
{
	//Increment index
	index++;
	
	var char = string_char_at(text, index);
	
	switch (char)
	{
		case ".":
		case "!":
		case "?":
			var interval = 20;
			audio_sound_pitch(sndText, random_range(lowerEnd, higherEnd));
			audio_play_sound(sndText, 0, false);
		break;
		
		case ",":
			var interval = 10;
			audio_sound_pitch(sndText, random_range(lowerEnd, higherEnd));
			audio_play_sound(sndText, 0, false);
		break;
		
		case " ":
			var interval = 2;
		break;
		
		default:
			var interval = 2;
			audio_sound_pitch(sndText, random_range(lowerEnd, higherEnd));
			audio_play_sound(sndText, 0, false);
		break;
	}
	
	alarm[0] = interval;
} else
{
	//If at end of text, do something
	alarm[1] = 240;

}