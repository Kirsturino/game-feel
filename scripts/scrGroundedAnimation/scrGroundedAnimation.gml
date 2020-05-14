animationSpeed = 2;

if (hsp > 0)
{
	curSprite = sPlayerMoveRight;
} else if (hsp < 0)
{
	curSprite = sPlayerMoveLeft;
} else if (newestDir == "left" && hsp == 0)
{
	curSprite = sPlayerIdleRight;
} else if (newestDir == "right" && hsp == 0)
{
	curSprite = sPlayerIdleLeft;
}