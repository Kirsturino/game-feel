if (gamepad_button_check_pressed(global.controller, gp_face1))
{
	argument0 = gp_face1;
} else if (gamepad_button_check_pressed(global.controller, gp_face2))
{
	argument0 = gp_face2;
} else if (gamepad_button_check_pressed(global.controller, gp_face3))
{
	argument0 = gp_face3;
} else if (gamepad_button_check_pressed(global.controller, gp_face4))
{
	argument0 = gp_face4;
} else if (gamepad_button_check_pressed(global.controller, gp_padu))
{
	argument0 = gp_padu;
} else if (gamepad_button_check_pressed(global.controller, gp_padd))
{
	argument0 = gp_padd;
} else if (gamepad_button_check_pressed(global.controller, gp_padr))
{
	argument0 = gp_padr;
} else if (gamepad_button_check_pressed(global.controller, gp_padl))
{
	argument0 = gp_padl;
} else if (gamepad_button_check_pressed(global.controller, gp_shoulderl))
{
	argument0 = gp_shoulderl;
} else if (gamepad_button_check_pressed(global.controller, gp_shoulderr))
{
	argument0 = gp_shoulderr;
} else if (gamepad_button_check_pressed(global.controller, gp_shoulderlb))
{
	argument0 = gp_shoulderlb;
} else if (gamepad_button_check_pressed(global.controller, gp_shoulderrb))
{
	argument0 = gp_shoulderrb;
} else if (gamepad_button_check_pressed(global.controller, gp_stickr))
{
	argument0 = gp_stickr;
} else if (gamepad_button_check_pressed(global.controller, gp_stickl))
{
	argument0 = gp_stickl;
}

return argument0;