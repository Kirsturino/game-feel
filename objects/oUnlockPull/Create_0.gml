image_blend = global.cWhite;

drawX = x;
drawY = y;

rotSpeed = 2;

//Timer for SFX
alarm[0] = 120;

//Check if collectible has been collected
collected = false;
if (ds_list_find_index(global.collectibleList, name) != -1)
{
	collected = true;
	image_alpha = 0.5;
}