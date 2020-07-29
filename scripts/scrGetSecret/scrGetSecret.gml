//Check if we have collectibles in tow, if yes, collect them
if (followingCollectible != noone && state != scrDead)
{
	with (followingCollectible)
	{	
		part_particles_create(global.partSystemSecret, x, y, global.secretPart, 20);
		alarm[1] = 360;
		destroy = true;
		following = false;
	}
		
	var secret = instance_place(followingCollectible.x, followingCollectible.y, oSecret);
	if (secret == noone)
	{
		scrStartNotification("COLLECTIBLE GET!" + "\n\n" + followingCollectible.name);
	} else
	{
		scrStartNotification("SECRET GET!" + "\n\n" + followingCollectible.name);
	}
		
	//Add followingCollectible to list of collected followingCollectibles if it hasn't been collected before. Collectible. Great word.
	if (ds_list_find_index(global.collectibleList, followingCollectible.name) == -1)
	{
		ds_list_add(global.collectibleList, followingCollectible.name);
	}
	
	switch (followingCollectible.name)
	{
		case "unlockPull":
			global.allowPull = 1;
			scrStartNotification("PULL UNLOCKED!");
		break;
		
		case "unlockPush":
			global.allowPush = 1;
			scrStartNotification("PUSH UNLOCKED!");
		break;
	}
		
	followingCollectible = noone;
	audio_play_sound(sndCollectibleGet, 0, false);
	
	scrSaveGame();
}