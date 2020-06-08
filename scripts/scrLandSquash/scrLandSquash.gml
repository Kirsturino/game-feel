if (!wantsToJump)
{
	//Splot
	xDrawScale = xScaleTarget + min(abs(lastVsp) * 0.1, 0.4);
	yDrawScale = yScaleTarget - min(abs(lastVsp) * 0.1, 0.4);
}

scrLandParticles();