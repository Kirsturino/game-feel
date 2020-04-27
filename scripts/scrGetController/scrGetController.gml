//Get controller
if (global.controller == noone)
{
	show_debug_message("------------------");
	for (var i = 0; i < global.gp_num; i++;)
	{
		if (gamepad_is_connected(i))
		{
			global.controller = i;
			show_debug_message("Slot " + string(i) + " found a gamepad");
			break;
		}
	}
}