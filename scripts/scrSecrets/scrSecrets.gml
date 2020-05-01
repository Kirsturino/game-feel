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

var collectible = instance_place(x, y, oSecret);

if (collectible != noone)
{
	with (collectible)
	{
		part_particles_create(global.partSystem, x, y, global.secretPart, 100);
		scrSetShake(10, 10);
		scrFreeze(60);
		instance_destroy();
	}
}