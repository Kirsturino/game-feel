if (file_exists("stats.sav"))
{
	scrLoadStats();
} else
{
	global.deathCounter = 0;
	global.ledgeGrabCounter = 0;
	global.missedJumpCounter = 0;
	global.bonkPreventCounter = 0;
}