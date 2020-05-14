//Automatic squash and stretch based on movement
var passiveXStretch = abs(hsp) * 0.1 - abs(vsp) * 0.1;
var passiveYStretch = abs(vsp) * 0.1 - abs(hsp) * 0.1;

//Lerp image scales to desired value
if (state != scrGrounded)
{
	xDrawScale = lerp(xDrawScale, xScaleTarget + passiveXStretch, squashSpeed);
	yDrawScale = lerp(yDrawScale, yScaleTarget + passiveYStretch, squashSpeed);
} else
{

	xDrawScale = lerp(xDrawScale, xScaleTarget, squashSpeed);
	yDrawScale = lerp(yDrawScale, yScaleTarget, squashSpeed);
}