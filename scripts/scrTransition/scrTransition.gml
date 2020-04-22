var transitionTrigger = instance_place(x, y, oRoomTransition);

if (transitionTrigger != noone)
{
	room_goto(transitionTrigger.destination);
}