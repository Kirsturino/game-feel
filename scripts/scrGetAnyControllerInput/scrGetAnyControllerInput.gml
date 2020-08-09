if (gamepad_button_check_pressed(global.controller, gp_face1))
{
	return true;
} else if (gamepad_button_check_pressed(global.controller, gp_face2))
{
	return true;
} else if (gamepad_button_check_pressed(global.controller, gp_face3))
{
	return true;
} else if (gamepad_button_check_pressed(global.controller, gp_face4))
{
	return true;
} else if (gamepad_button_check_pressed(global.controller, gp_padu))
{
	return true;
} else if (gamepad_button_check_pressed(global.controller, gp_padd))
{
	return true;
} else if (gamepad_button_check_pressed(global.controller, gp_padr))
{
	return true;
} else if (gamepad_button_check_pressed(global.controller, gp_padl))
{
	return true;
} else if (gamepad_button_check_pressed(global.controller, gp_shoulderl))
{
	return true;
} else if (gamepad_button_check_pressed(global.controller, gp_shoulderr))
{
	return true;
} else if (gamepad_button_check_pressed(global.controller, gp_shoulderlb))
{
	return true;
} else if (gamepad_button_check_pressed(global.controller, gp_shoulderrb))
{
	return true;
} else if (gamepad_button_check_pressed(global.controller, gp_stickr))
{
	return true;
} else if (gamepad_button_check_pressed(global.controller, gp_stickl))
{
	return true;
} else
{
	return false;
}