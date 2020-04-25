//Apply null movement
if (leftPress or rightRelease)
{
	newestDir = "left";
}

if (rightPress or leftRelease)
{
	newestDir = "right";
}

if (right && newestDir = "right")
{
	move = 1;
} else if (left && newestDir = "left")
{
	move = -1;
} else 
{
	move = 0;
}