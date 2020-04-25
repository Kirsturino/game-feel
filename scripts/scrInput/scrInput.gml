if (global.inputDevice == "kb")
{
	left = keyboard_check(ord("A"));
	right = keyboard_check(ord("D"));
	leftPress = keyboard_check_pressed(ord("A"));
	rightPress = keyboard_check_pressed(ord("D"));
	leftRelease = keyboard_check_released(ord("A"));
	rightRelease = keyboard_check_released(ord("D"));
	down = keyboard_check(ord("S"));
	
	jump = keyboard_check_pressed(vk_space);
	jumpHeld = keyboard_check(vk_space);
	
	pushPress = keyboard_check_pressed(ord("K"));
	pullPress = keyboard_check_pressed(ord("J"));
} else if (global.inputDevice == "controller")
{
	if (gamepad_axis_value(global.controller, gp_axislh) < -0.2 || gamepad_button_check(global.controller, gp_padl))
	{
		left = true;
	} else
	{
		left = false;
	}

	if (gamepad_axis_value(global.controller, gp_axislh) > 0.2 || gamepad_button_check(global.controller, gp_padr))
	{
		right = true;
	} else
	{
		right = false;
	}
	
	//if (gamepad_axis_value(global.controller, gp_axislv) > 0.2 || gamepad_button_check(global.controller, gp_padd))
	//{
	//	down = true;
	//} else
	//{
	//	down = false;
	//}
	
	//Jank controller stuff
	down = false;
	
	//This should be face1 for xbox controllers
	jump = gamepad_button_check_pressed(global.controller, gp_face3);
	jumpHeld = gamepad_button_check(global.controller, gp_face3);
	
	pushPress = gamepad_button_check_pressed(global.controller, gp_shoulderl);
	pullPress = gamepad_button_check_pressed(global.controller, gp_shoulderr);
}