if (active)
{
	popUpY = lerp(popUpY, 8, 0.1);
	popUpAlpha = lerp(popUpAlpha, 1, 0.1);
} else
{
	popUpY = lerp(popUpY, 0, 0.1);
	popUpAlpha = lerp(popUpAlpha, 0, 0.15);
}

//See if player is pressing a key on the keyboard or a button on a controller
var keyPress = keyboard_check_pressed(vk_anykey);
var buttonPress = 0;
scrGetControllerButtons(buttonPress);
buttonPress = scrGetAnyControllerInput();

if (keyPress)
{
	global.usingController = false;
} else if (buttonPress)
{
	global.usingController = true;
}