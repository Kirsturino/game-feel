var press = argument0;

if (gamepad_button_check_pressed(global.controller, gp_face1))
{
	press = gp_face1;
} else if (gamepad_button_check_pressed(global.controller, gp_face2))
{
	press = gp_face2;
} else if (gamepad_button_check_pressed(global.controller, gp_face3))
{
	press = gp_face3;
} else if (gamepad_button_check_pressed(global.controller, gp_face4))
{
	press = gp_face4;
} else if (gamepad_button_check_pressed(global.controller, gp_padu))
{
	press = gp_padu;
} else if (gamepad_button_check_pressed(global.controller, gp_padd))
{
	press = gp_padd;
} else if (gamepad_button_check_pressed(global.controller, gp_padr))
{
	press = gp_padr;
} else if (gamepad_button_check_pressed(global.controller, gp_padl))
{
	press = gp_padl;
} else if (gamepad_button_check_pressed(global.controller, gp_shoulderl))
{
	press = gp_shoulderl;
} else if (gamepad_button_check_pressed(global.controller, gp_shoulderr))
{
	press = gp_shoulderr;
} else if (gamepad_button_check_pressed(global.controller, gp_shoulderlb))
{
	press = gp_shoulderlb;
} else if (gamepad_button_check_pressed(global.controller, gp_shoulderrb))
{
	press = gp_shoulderrb;
} else if (gamepad_button_check_pressed(global.controller, gp_stickr))
{
	press = gp_stickr;
} else if (gamepad_button_check_pressed(global.controller, gp_stickl))
{
	press = gp_stickl;
}

return press;