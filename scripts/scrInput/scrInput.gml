for (var i = 0; i < global.gp_num; i++;)
   {
	left = keyboard_check(ord("A")) || gamepad_button_check(i, gp_padl);
	right = keyboard_check(ord("D")) || gamepad_button_check(i, gp_padr);;
	leftPress = keyboard_check_pressed(ord("A")) || gamepad_button_check_pressed(i, gp_padl);
	rightPress = keyboard_check_pressed(ord("D")) || gamepad_button_check_pressed(i, gp_padr);
	leftRelease = keyboard_check_released(ord("A")) || gamepad_button_check_released(i, gp_padl);
	rightRelease = keyboard_check_released(ord("D")) || gamepad_button_check_released(i, gp_padr);
	down = keyboard_check(ord("S")) || gamepad_button_check(i, gp_padd);;
	
	jump = keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(i, gp_face1);
	jumpHeld = keyboard_check(vk_space) || gamepad_button_check(i, gp_face1);
	
	pushPress = keyboard_check_pressed(ord("K")) || gamepad_button_check(i, gp_shoulderr);
	pullPress = keyboard_check_pressed(ord("J")) || gamepad_button_check(i, gp_shoulderl);
}