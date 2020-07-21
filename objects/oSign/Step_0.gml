if (active)
{
	popUpY = lerp(popUpY, 8, 0.1);
	popUpAlpha = lerp(popUpAlpha, 1, 0.1);
} else
{
	popUpY = lerp(popUpY, 0, 0.1);
	popUpAlpha = lerp(popUpAlpha, 0, 0.15);
}