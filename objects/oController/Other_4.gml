/// @description Check if music needs to be changed

if (!instance_exists(oSecret))
{
	scrChangeMusic(sndBGM);
} else if (instance_exists(oSecret))
{
	scrChangeMusic(sndSecret);
}