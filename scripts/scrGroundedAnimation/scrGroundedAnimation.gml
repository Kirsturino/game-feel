animationSpeed = 2;

//Track if player is hugging a wall
hugRight = collision_point(bbox_right + 1, y - sprite_height / 2, oCollision, false, false);
hugLeft = collision_point(bbox_left - 1, y - sprite_height / 2, oCollision, false, false);

if (hsp > 0)
{
	curSprite = sPlayerMoveRight;
} else if (hsp < 0)
{
	curSprite = sPlayerMoveLeft;
} else if (newestDir == "left" && hsp == 0 && hugLeft == noone || hugRight != noone)
{
	curSprite = sPlayerIdleRight;
} else if (newestDir == "right" && hsp == 0 && hugRight == noone || hugLeft != noone)
{
	curSprite = sPlayerIdleLeft;
}