with (oFamiliar)
{
	//Draw light
	var wiggle = scrWave(-2, 2, 2, 0);
	var flicker = random_range(-0.2, 0.2);
	lightRadius += flicker;
	lightRadius = clamp(lightRadius, lightRadiusMin, lightRadiusMax);
	scrLightPlayer(oLighting.lightSurf, x, y - sprite_height / 2, lightRadius + wiggle, 8);
}

with (oPushPull)
{
	scrPPLight(oLighting.lightSurf, x, y, visualInteractRange, 8, offset, circleAlpha, color);
}

with (oLight)
{
	var wiggle = 22.5 + scrWave(-4, 4, 6, 0);
	scrLight(oLighting.lightSurf, x, y, 64 + wiggle, 8);
}

draw_surface(lightSurf, 0, 0);