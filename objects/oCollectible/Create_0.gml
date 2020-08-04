if (!object_is_ancestor(object_index, oCollectible))
{
	rainbow = false;
} else
{
	rainbow = true;
}

color = global.cOrange;
colorTo = global.cOrange;
alpha = 1;
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
	color = global.cBlueLight;
	alpha = 0.5;
	collected = true;
} else
{
	//Timer for SFX
	alarm[0] = 240;
	
	collected = false;
}

if (name == "unlockPull")
{
	color = global.cYellow;
	
	if (collected  && global.allowPull) 
	{
		instance_destroy(); 
	}
}

if (name == "unlockPush")
{
	color = global.cYellow;
	
	if (collected && global.allowPush) 
	{
		instance_destroy(); 
	}
}