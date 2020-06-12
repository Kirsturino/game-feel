/// @description Text things

//Make sure we're not at the end of text
if (index < string_length(text))
{
	//Increment index
	index++;
	
	var char = string_char_at(text, index);
	
	switch (char)
	{
		case ".":
		var interval = 20;
		break;
		
		case ",":
		var interval = 10;
		break;
		
		case " ":
		var interval = 2;
		break;
		
		default:
			var interval = 2;
			//audio_play_sound(sndMenu, 0, false);
		break;
	}
	
	alarm[0] = interval;
} else
{
	//If at end of text, do something
	alarm[1] = 180;

}