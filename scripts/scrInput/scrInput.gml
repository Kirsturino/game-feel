//Pause game
if ((keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(global.controller, gp_start)) && oController.alarm[1] == -1 && oController.alarm[2] == -1)
{
	global.pause = !global.pause;
	
	audio_play_sound(sndMenu, 0, false);
	
	with (oPauseMenu)
	{
		page = 0;
		menu_option[page] = 0;
		inputting = false;
	}
	
	scrNullifyMovement();
}

//Non-movement inputs
if (global.allowFreeCam)
{
	freeCamToggle = keyboard_check_pressed(global.key_camToggle) || gamepad_button_check_pressed(global.controller, global.button_camToggle);
}

if (global.pause || blockMovement) exit;

restartPress = keyboard_check_pressed(global.key_restart) || gamepad_button_check_pressed(global.controller, global.button_restart);

//Gameplay inputs
if (gamepad_axis_value(global.controller, gp_axislh) < 0 || gamepad_button_check(global.controller, global.button_left) || keyboard_check(global.key_left))
{
	left = true;
} else
{
	left = false;
}

if (gamepad_axis_value(global.controller, gp_axislh) > 0 || gamepad_button_check(global.controller, global.button_right) || keyboard_check(global.key_right))
{
	right = true;
} else
{
	right = false;
}

if (gamepad_axis_value(global.controller, gp_axislv) > 0.5 || gamepad_button_check(global.controller, global.button_down) || keyboard_check(global.key_down))
{
	down = true;
} else
{
	down = false;
}

if (gamepad_axis_value(global.controller, gp_axislv) < -0.5 || gamepad_button_check(global.controller, global.button_up) || keyboard_check(global.key_up))
{
	up = true;
} else
{
	up = false;
}

if (keyboard_check_pressed(global.key_left) || gamepad_button_check_pressed(global.controller, global.button_left))
{
	leftPress = true;
} else
{
	leftPress = false;
}

if (keyboard_check_pressed(global.key_right) || gamepad_button_check_pressed(global.controller, global.button_right))
{
	rightPress = true;
} else
{
	rightPress = false;
}

leftRelease = keyboard_check_released(global.key_left) || gamepad_button_check_released(global.controller, global.button_left);
rightRelease = keyboard_check_released(global.key_right) || gamepad_button_check_released(global.controller, global.button_right);

//Joystick jank
var joyH = gamepad_axis_value(global.controller, gp_axislh);
if (joyH < -global.deadzone && !joyActive)
{
	joyActive = true;
	leftPress = true;
	releaseJoyDir = -1;
} else if (joyH > global.deadzone && !joyActive)
{
	joyActive = true;
	rightPress = true;
	releaseJoyDir = 1;
} else if (abs(joyH) < global.deadzone && joyActive)
{
	if (releaseJoyDir > 0)
	{
		rightRelease = true;
	} else if (releaseJoyDir < 0)
	{
		leftRelease = true;
		
	}
	
	joyActive = false;
}

if (sign(joyH) != releaseJoyDir)
{
	joyActive = false;
}

if (alarm[9] == -1)
{
	jump = keyboard_check_pressed(global.key_jump) || gamepad_button_check_pressed(global.controller, global.button_jump);
}

jumpHeld = keyboard_check(global.key_jump) || gamepad_button_check(global.controller, global.button_jump) || keyboard_check(global.key_pull) || keyboard_check(global.key_push) || gamepad_button_check(global.controller, global.button_push) || gamepad_button_check(global.controller, global.button_pull);

pushPress = keyboard_check_pressed(global.key_push) || gamepad_button_check_pressed(global.controller, global.button_push);
pullPress = keyboard_check_pressed(global.key_pull) || gamepad_button_check_pressed(global.controller, global.button_pull);