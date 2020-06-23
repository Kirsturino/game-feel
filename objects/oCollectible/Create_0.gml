image_blend = global.cOrange;
drawX = x;
drawY = y;
rotSpeed = 2;

//Init variables for destroy animation
following = false;
destroy = false;
riseSpeed = -1;

//Check if collectible has been collected
if (ds_list_find_index(global.collectibleList, name) != -1)
{
	image_blend = global.cBlueDark;
	var collected = true;
} else
{
	//Timer for SFX
	alarm[0] = 120;
	
	var collected = false;
}

if (name == "unlockPull" || name == "unlockPush")
{
	image_blend = global.cYellow;
	
	if (collected) instance_destroy(); else instance_create_layer(x, y, "Lighting", oLight);
}