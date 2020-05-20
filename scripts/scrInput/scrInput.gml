//Pause game
if (keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(global.controller, gp_start))
{
	global.pause = !global.pause;
	
	with (oPauseMenu)
	{
		page = 0;
		menu_option[page] = 0;
		inputting = false;
	}
	
	//Reset inputs
	left = false;
	right = false;
	down = false;
	leftPress = false;
	rightPress = false;
	leftRelease = false;
	rightRelease = false;
	jump = false;
	jumpHeld = false;
	pushPress = false;
	pullPress = false;
}

if (global.pause) exit;


//Gameplay inputs
if (gamepad_axis_value(global.controller, gp_axislh) < 0 || gamepad_button_check(global.controller, gp_padl) || keyboard_check(global.key_left))
{
	left = true;
} else
{
	left = false;
}

if (gamepad_axis_value(global.controller, gp_axislh) > 0 || gamepad_button_check(global.controller, gp_padr) || keyboard_check(global.key_right))
{
	right = true;
} else
{
	right = false;
}
	
if (gamepad_axis_value(global.controller, gp_axislv) > 0 || gamepad_button_check(global.controller, gp_padd) || keyboard_check(global.key_down))
{
	down = true;
} else
{
	down = false;
}

if (gamepad_axis_value(global.controller, gp_axislh) < 0 || keyboard_check_pressed(global.key_left) || gamepad_button_check_pressed(global.controller, gp_padl))
{
	leftPress = true;
} else
{
	leftPress = false;
}

if (gamepad_axis_value(global.controller, gp_axislh) > 0 || keyboard_check_pressed(global.key_right) || gamepad_button_check_pressed(global.controller, gp_padr))
{
	rightPress = true;
} else
{
	rightPress = false;
}


leftRelease = keyboard_check_released(global.key_left) || gamepad_button_check_released(global.controller, gp_padl);
rightRelease = keyboard_check_released(global.key_right) || gamepad_button_check_released(global.controller, gp_padr);
	
jump = keyboard_check_pressed(global.key_jump) || gamepad_button_check_pressed(global.controller, gp_face1) || gamepad_button_check_pressed(global.controller, gp_face2);
jumpHeld = keyboard_check(global.key_jump) || gamepad_button_check(global.controller, gp_face1) || gamepad_button_check(global.controller, gp_face2);

pushPress = keyboard_check_pressed(global.key_push) || gamepad_button_check_pressed(global.controller, gp_shoulderl) || gamepad_button_check_pressed(global.controller, gp_shoulderrb) || gamepad_button_check_pressed(global.controller, gp_face4);
pullPress = keyboard_check_pressed(global.key_pull) || gamepad_button_check_pressed(global.controller, gp_shoulderr) || gamepad_button_check_pressed(global.controller, gp_shoulderlb) || gamepad_button_check_pressed(global.controller, gp_face3);
