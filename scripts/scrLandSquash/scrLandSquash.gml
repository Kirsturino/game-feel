if (!wantsToJump)
{
	//Splot
	xDrawScale = xScaleTarget + min(abs(lastVsp) * 0.4, 0.8);
	yDrawScale = yScaleTarget - min(abs(lastVsp) * 0.4, 0.8);
}

scrLandParticles();