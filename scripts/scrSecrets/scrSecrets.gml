var secret = instance_nearest(x, y, oFakeCollision);

if (secret != noone)
{
	if (place_meeting(x, y, oFakeCollision))
	{
		global.fakeLayerAlpha = scrApproach(global.fakeLayerAlpha, 0.5, 0.02);
	} else
	{
		global.fakeLayerAlpha = scrApproach(global.fakeLayerAlpha, 1, 0.02);
	}
}

var collectible = instance_place(x, y, oCollectible);

if (collectible != noone && !collectible.destroy)
{
	scrStartNotification("COLLECTIBLE GET!" + "\n\n" + collectible.name);
		
	//Add collectible to list of collected collectibles if it hasn't been collected before. Collectible. Great word.
	if (ds_list_find_index(global.collectibleList, collectible.name) == -1)
	{
		ds_list_add(global.collectibleList, collectible.name);
	}
	
	switch (collectible.name)
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

	//Effects
	audio_play_sound(sndRefreshBuildup2, 0, false);
	scrFreeze(100);
	scrSetShake(10, 10);
	audio_play_sound(sndRefresh, 0, false);
	audio_play_sound(sndCollectibleGet, 0, false);
	
	scrSaveGame();
		
	with (collectible)
	{
		if (!destroy)
		{
			part_particles_create(global.partSystemSecret, x, y, global.secretPart, 20);
			alarm[1] = 360;
			destroy = true;
			riseSpeed = -1;
		}
	}
}