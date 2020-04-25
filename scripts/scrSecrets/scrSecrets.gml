var secret = instance_nearest(x, y, oFakeCollision);

if (secret != noone)
{
	if (place_meeting(x, y, oFakeCollision))
	{
		secret.image_alpha = scrApproach(secret.image_alpha, 0, 0.05);
	} else
	{
		secret.image_alpha = scrApproach(secret.image_alpha, 1, 0.05);
	}
}

var collectible = instance_place(x, y, oSecret);

if (collectible != noone)
{
	collectible.despawn = true;
}