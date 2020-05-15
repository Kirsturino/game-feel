//Do a little shuffle
if (hsp != 0)
{
	var squashShuffle = scrWave(-0.2, 0.2, 0.5, 0);
	xScaleTarget = 1.5;
	yScaleTarget = 0.5;
	xScaleTarget -= squashShuffle;
	yScaleTarget += squashShuffle;
} else
{
	//var squashShuffle = scrWave(-0.1, 0.1, 0.5, 0);
	xScaleTarget = 1.5;
	yScaleTarget = 0.5;
	//yScaleTarget += squashShuffle;
}