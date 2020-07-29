var dist = y - oPlayer.y;
if (dist < viewHeight)
{
	scrJumpInDirection(moveSpeed, moveDir);
} else
{
	y = oPlayer.y + viewHeight;
}