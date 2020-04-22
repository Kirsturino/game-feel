if (global.inputDevice == "keyboard")
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
	
	push = keyboard_check(ord("K"));
	pull = keyboard_check(ord("J"));
	pushPress = keyboard_check_pressed(ord("K"));
	pullPress = keyboard_check_pressed(ord("J"));
} else if (global.inputDevice == "controller")
{
	//Stuff soon
}