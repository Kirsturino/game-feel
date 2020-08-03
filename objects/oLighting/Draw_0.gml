with (oFamiliar)
{
	//Draw light
	var wiggle = scrWave(-2, 2, 2, 0);
	var flicker = random_range(-0.2, 0.2);
	lightRadius += flicker;
	lightRadius = clamp(lightRadius, lightRadiusMin, lightRadiusMax);
	
	if (followTarget == oPlayer.id)
	{
		scrLightPlayer(oLighting.lightSurf, x + blockSize * 2, y - sprite_height / 2 + blockSize * 2, lightRadius + wiggle, 8);
	} else
	{
		scrLightFamiliar(oLighting.lightSurf, x + blockSize * 2, y - sprite_height / 2 + blockSize * 2, lightRadius + wiggle, 8);
	}
}

with (oPushPull)
{
	if (global.allowPull || global.allowPush)
	{
		if (place_meeting(x, y, oFakeCollision))
		{
			scrPPLight(oLighting.lightSurf, x + blockSize * 2, y + blockSize * 2, visualInteractRange, 8, offset, circleAlpha - global.fakeLayerAlpha, color);
		} else
		{
			scrPPLight(oLighting.lightSurf, x + blockSize * 2, y + blockSize * 2, visualInteractRange, 8, offset, circleAlpha, color);
		}
	}
}

with (oLight)
{
	var wiggle = 22.5 + scrWave(-4, 4, 6, 0);
	scrLight(oLighting.lightSurf, x + blockSize * 2, y + blockSize * 2, radius + wiggle, 8);
}

if (global.allowPull || global.allowPush)
{
	with (oPushPullRestore)
	{
		var wiggle = 22.5 + scrWave(-4, 4, 6, 0);
		scrLight(oLighting.lightSurf, x + blockSize * 2, y + blockSize * 2, 8 + wiggle, 8);
	}
}

with (oCollectible)
{
	var wiggle = 22.5 + scrWave(-4, 4, 6, 0);
	if (!hidden)
	{
		scrLight(oLighting.lightSurf, x + blockSize * 2, y + blockSize * 2, 8 + wiggle, 8);
	}
}

with (oSign)
{
	scrLight(oLighting.lightSurf, x + blockSize * 2, y + blockSize * 2, 16 + wiggle, 8);
}

with (oCheckpoint)
{
	scrLight(oLighting.lightSurf, x + blockSize * 2, y + blockSize * 2, 16 + wiggle, 8);
}

draw_surface(lightSurf, -blockSize * 2, -blockSize * 2);