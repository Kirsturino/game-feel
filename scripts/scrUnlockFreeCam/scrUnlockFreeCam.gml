if global.allowFreeCam exit;

if (place_meeting(x, y, oUnlockFreeCam))
{
	global.allowFreeCam = 1;
	scrSaveGame();
}