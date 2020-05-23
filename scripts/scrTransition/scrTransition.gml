var transitionTrigger = instance_place(x, y, oRoomTransition);

if (transitionTrigger != noone)
{
	global.spawnhsp = hsp;
	global.spawnvsp = vsp;
	
	if (transitionTrigger.type == "horizontal")
	{
		if (transitionTrigger.x > room_width)
		{
			global.spawnX = 16;
		} else
		{
			global.spawnX = 888888;
		}
		global.spawnY = y;
	} else if (transitionTrigger.type == "vertical")
	{
		if (transitionTrigger.y > room_height)
		{
			global.spawnY = 16;
		} else
		{
			global.spawnY = 888888;
			global.spawnvsp = min(-jumpSpeed, vsp);
		}
		global.spawnX = x;
	} else if (transitionTrigger.type == "custom")
	{
		global.spawnX = transitionTrigger.spawnX;
		global.spawnY = transitionTrigger.spawnY;
	}
	
	global.destination = transitionTrigger.destination;
	
	scrStartTransitionAnimation();
}