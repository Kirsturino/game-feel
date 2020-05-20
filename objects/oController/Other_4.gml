/// @description Check if music needs to be changed, also autosave

if (!instance_exists(oSecret))
{
	scrChangeMusic(sndBGM);
} else if (instance_exists(oSecret))
{
	scrChangeMusic(sndSecret);
}

scrSaveGame();