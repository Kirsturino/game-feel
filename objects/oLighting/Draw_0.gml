with (oFamiliar)
{
	//Draw light
	var wiggle = scrWave(-2, 2, 2, 0);
	var flicker = random_range(-0.2, 0.2);
	lightRadius += flicker;
	lightRadius = clamp(lightRadius, lightRadiusMin, lightRadiusMax);
	scrLightPlayer(oLighting.lightSurf, x + blockSize * 2, y - sprite_height / 2 + blockSize * 2, lightRadius + wiggle, 8);
}

with (oPushPull)
{
	scrPPLight(oLighting.lightSurf, x + blockSize * 2, y + blockSize * 2, visualInteractRange, 8, offset, circleAlpha, color);
}

with (oLight)
{
	var wiggle = 22.5 + scrWave(-4, 4, 6, 0);
	scrLight(oLighting.lightSurf, x + blockSize * 2, y + blockSize * 2, 64 + wiggle, 8);
}

draw_surface(lightSurf, -blockSize * 2, -blockSize * 2);