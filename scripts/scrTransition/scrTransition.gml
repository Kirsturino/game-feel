var transitionTrigger = instance_place(x, y, oRoomTransition);

if (transitionTrigger != noone)
{
	if (transitionTrigger.type == "horizontal")
	{
		if (transitionTrigger.x > room_width)
		{
			global.spawnX = 0;
		} else
		{
			global.spawnX = 888888;
		}
		global.spawnY = y;
	} else if (transitionTrigger.type == "vertical")
	{
		if (transitionTrigger.y > room_height)
		{
			global.spawnY = 0;
		} else
		{
			global.spawnY = 888888;
		}
		global.spawnX = x;
	} else if (transitionTrigger.type == "custom")
	{
		global.spawnX = transitionTrigger.spawnX;
		global.spawnY = transitionTrigger.spawnY;
	}
	global.spawnhsp = hsp;
	global.spawnvsp = min(-jumpSpeed, vsp);
	
	global.destination = transitionTrigger.destination;
	if (oController.alarm[1] == -1 && oController.alarm[2] == -1)
	{
		oController.alarm[1] = oController.animationLength;
	}
}