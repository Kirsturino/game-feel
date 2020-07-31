var hor = right - left;
var ver = down - up;

if (hor == 1 && ver == 1) //Right and down
{
	return 315;
} else if (hor == 1 && ver == -1) //Right and up
{
	return 45;
} else if (hor == -1 && ver == 1) //Left and down
{
	return 225;
} else if (hor == -1 && ver == -1) //Left and up
{
	return 135;
} else if (hor == 1 && ver == 0) //Right
{
	return 0;
} else if (hor == -1 && ver == 0) //Left
{
	return 180;
} else if (hor == 0 && ver == 1) //Down
{
	return 270;
} else if (hor == 0 && ver == -1) //Up
{
	return 90;
} else
{
	return 90;
}