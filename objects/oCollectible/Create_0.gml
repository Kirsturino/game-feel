image_blend = global.cOrange;

drawX = x;
drawY = y;

rotSpeed = 2;

//Check if collectible has been collected
collected = false;
if (ds_list_find_index(global.collectibleList, name) != -1)
{
	collected = true;
	image_alpha = 0.5;
}

//Timer for SFX
if (!collected)
{
	alarm[0] = 120;
}