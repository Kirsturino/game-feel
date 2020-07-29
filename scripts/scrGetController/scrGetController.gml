//Get controller
for (var i = 0; i < global.gp_num; i++;)
{
	if (gamepad_is_connected(i))
	{
		global.controller = i;
		//show_debug_message("Slot " + string(i) + " found a gamepad");
		break;
	} else
	{
		global.controller = noone;
	}
}

gamepad_set_axis_deadzone(global.controller, global.deadzone);

if (global.controller = noone)
{
	alarm[5] = 60;
}