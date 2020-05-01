if (state == scrDead)
{
	state = scrGrounded;
	colorTo = c_white;
}

with (oCamera)
{
	camera_set_view_pos(view, other.x - viewWidth, other.y - viewHeight);
}

//Spawn player in wanted position, if not possible, spawn in default room position
if (global.spawnX != -1 && global.spawnY != -1 && !place_meeting(global.spawnX, global.spawnY, oCollision))
{
	if (global.spawnX > room_width)
	{
		x = room_width;
	} else
	{
		x = global.spawnX;
	}
	
	if (global.spawnY > room_height)
	{
		y = room_height;
	} else
	{
		y = global.spawnY;
	}
} else
{
	x = defaultX;
	y = defaultY;
}

hsp = global.spawnhsp;
vsp = global.spawnvsp;