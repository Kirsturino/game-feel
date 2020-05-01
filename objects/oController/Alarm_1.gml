/// @description Room transition
if (oPlayer.state != scrDead)
{
	room_goto(global.destination);
}

scrStartRoomStartAnimation();