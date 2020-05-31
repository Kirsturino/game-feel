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

if (collectible != noone)
{
	//Add collectible to list of collected collectibles if it hasn't been collected before. Collectible. Great word.
	if (ds_list_find_index(global.collectibleList, collectible.name) == -1)
	{
		ds_list_add(global.collectibleList, collectible.name);
	}
	
	if (collectible.name == "unlockPull")
	{
		global.allowPull = 1;
	}
	
	if (collectible.name == "unlockPush")
	{
		global.allowPush = 1;
	}
	
	scrSaveGame();
		
	with (collectible)
	{
		part_particles_create(global.partSystemSecret, x, y, global.secretPart, 100);
		instance_destroy();
	}
}