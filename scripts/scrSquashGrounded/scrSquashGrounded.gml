//Do a little shuffle
if (hsp != 0)
{
	var squashShuffle = scrWave(-0.3, 0.3, 0.5, 0);
	xScaleTarget = 1;
	yScaleTarget = 1;
	xScaleTarget -= squashShuffle;
	yScaleTarget += squashShuffle;
} else
{
	var squashShuffle = scrWave(-0.2, 0.2, 0.5, 0);
	xScaleTarget = 1;
	yScaleTarget = 1;
	yScaleTarget += squashShuffle;
}