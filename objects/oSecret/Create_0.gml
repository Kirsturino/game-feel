image_blend = global.cYellow;

drawX = x;
drawY = y;
rotSpeed = 2;

//Init variables for destroy animation
destroy = false;
riseSpeed = 0;

//Check if collectible has been collected
collected = false;
if (ds_list_find_index(global.collectibleList, name) != -1)
{
	collected = true;
	image_alpha = 0.5;
	instance_destroy();
}

//Timer for SFX
if (!collected)
{
	alarm[0] = 120;
}