if global.allowReset exit;

if (place_meeting(x, y, oUnlockReset))
{
	global.allowReset = 1;
	scrSaveGame();
}