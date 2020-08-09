//Init variables
c = global.cWhite;
padding = 32;
textPadding = 34;
drawText = false;
textNumber = 0;
textAmount = 0;
curTextAmount = 0;
index = 0;
active = false;
popUpY = 0;
popUpAlpha = 0;

alarm[2] = 10;

//Get player input keys for tutorial
if (!global.usingController)
{
	leftKey = scrGetUniqueKeys(global.key_left);
	rightKey = scrGetUniqueKeys(global.key_right);
	jumpKey = scrGetUniqueKeys(global.key_jump);
	pullKey = scrGetUniqueKeys(global.key_pull);
	pushKey = scrGetUniqueKeys(global.key_push);
	freeCamKey = scrGetUniqueKeys(global.key_camToggle);
	resetKey = scrGetUniqueKeys(global.key_restart);
} else
{
	leftKey = scrGetUniqueKeys(global.button_left);
	rightKey = scrGetUniqueKeys(global.button_right);
	jumpKey = scrGetUniqueKeys(global.button_jump);
	pullKey = scrGetUniqueKeys(global.button_pull);
	pushKey = scrGetUniqueKeys(global.button_push);
	freeCamKey = scrGetUniqueKeys(global.button_camToggle);
	resetKey = scrGetUniqueKeys(global.button_restart);
}

if (place_meeting(x, y, oFakeCollision))
{
	hidden = true;
} else
{
	hidden = false;
}