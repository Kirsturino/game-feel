
if (place_meeting(x, y, oFakeCollision))
{
	global.fakeLayerAlpha = scrApproach(global.fakeLayerAlpha, 0.2, 0.02);
	behindWall = true;
} else
{
	global.fakeLayerAlpha = scrApproach(global.fakeLayerAlpha, 1, 0.02);
	behindWall = false;
}

var collectible = instance_place(x, y, oCollectible);

if (collectible != noone && !collectible.following && !collectible.destroy)
{
	//Effects
	audio_play_sound(sndRefreshBuildup2, 0, false);
	scrFreeze(80);
	scrSetShake(10, 10);
	audio_play_sound(sndRefresh, 0, false);
	
	//Set collectible to follow player visually
	with (collectible)
	{
		if (!following)
		{
			part_particles_create(global.partSystemSecret, x, y, global.secretPart, 20);
			following = true;
		}
	}
	
	followingCollectible = collectible;
	
	if (state == scrGrounded)
	{
		scrGetSecret();
	}
}