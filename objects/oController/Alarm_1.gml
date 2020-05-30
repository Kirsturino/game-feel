/// @description Room transition
if (oPlayer.state != scrDead)
{
	if (room_exists(global.destination))
	{
		room_goto(global.destination);
	}
} else if (oPlayer.state == scrDead)
{
	room_restart();
}

scrStartRoomStartAnimation();