/// @description Room transition animation
if (oPlayer.state != scrDead)
{
	room_goto(global.destination);
} else if (oPlayer.state == scrDead)
{
	room_restart();
}

scrStartRoomStartAnimation();