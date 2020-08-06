if (global.deathCounter == 0)
{
	text = "You've died a total of.. Hold up, zero times? Wow, start speedrunning this thing.";
} else if (global.deathCounter < 50)
{
	text = "You've died a total of " + string(global.deathCounter) + " times. Hey, that's pretty good.";
} else if (global.deathCounter > 100)
{
	text = "You've died a total of " + string(global.deathCounter) + " times. Oof.";
} 
{
	text = "You've died a total of " + string(global.deathCounter) + " times.";
}