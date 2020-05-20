//Get controller
if (global.controller == noone)
{
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

gamepad_set_axis_deadzone(global.controller, 0.2);

if (global.controller = noone)
{
	alarm[5] = 60;
}