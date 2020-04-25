var transitionTrigger = instance_place(x, y, oRoomTransition);

if (transitionTrigger != noone)
{
	if (transitionTrigger.type == "horizontal")
	{
		global.spawnX = transitionTrigger.spawnX;
		global.spawnY = y;
	} else if (transitionTrigger.type == "vertical")
	{
		global.spawnX = x;
		global.spawnY = transitionTrigger.spawnY;
	} else if (transitionTrigger.type == "custom")
	{
		global.spawnX = transitionTrigger.spawnX;
		global.spawnY = transitionTrigger.spawnY;
	}
	global.spawnhsp = hsp;
	global.spawnvsp = vsp;
	part_particles_clear(global.partSystem);
	room_goto(transitionTrigger.destination);
}