/// @description Music and ambient

//Change to different music
if (!instance_exists(oSecret))
{
	scrChangeMusic(sndBGM);
} else if (instance_exists(oSecret))
{
	scrChangeMusic(sndSecret);
}

//Change to different ambient
if (!instance_exists(oMovingDanger))
{
	scrChangeAmbient(sndAmbient);
} else if (instance_exists(oMovingDanger))
{
	scrChangeAmbient(sndAmbientSmoke);
}