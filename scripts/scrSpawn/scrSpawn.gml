with (oCamera)
{
	camera_set_view_pos(view, other.x - viewWidth, other.y - viewHeight);
}

//Spawn player in wanted position, if not possible, spawn in default room position
if (global.spawnX != -1 && global.spawnY != -1)
{
	if (global.spawnX > room_width)
	{
		x = room_width - 16;
		curSprite = sPlayerIdleLeft;
	} else
	{
		x = global.spawnX;
		curSprite = sPlayerIdleRight;
	}
	
	if (global.spawnY > room_height)
	{
		y = room_height - 16;
	} else
	{
		y = global.spawnY;
	}
}

if (place_meeting(x, y, oCollision))
{
	x = defaultX;
	y = defaultY;
}

hsp = global.spawnhsp;
vsp = global.spawnvsp;