image_blend = global.cOrange;
drawX = x;
drawY = y;
rotSpeed = 2;

//Init variables for destroy animation
following = false;
destroy = false;
riseSpeed = -1;

if (place_meeting(x, y, oFakeCollision))
{
	hidden = true;
} else
{
	hidden = false;
}

//Check if collectible has been collected
if (ds_list_find_index(global.collectibleList, name) != -1)
{
	image_blend = global.cBlueLight;
	image_alpha = 0.5;
	var collected = true;
} else
{
	//Timer for SFX
	alarm[0] = 240;
	
	var collected = false;
}

if (name == "unlockPull")
{
	image_blend = global.cYellow;
	
	if (collected  && global.allowPull) 
	{
		instance_destroy(); 
	}
}

if (name == "unlockPush")
{
	image_blend = global.cYellow;
	
	if (collected && global.allowPush) 
	{
		instance_destroy(); 
	}
}