//Check if hidden behind fake walls
hidden = place_meeting(x, y, oFakeCollision);

//Check if should drawtri
if (oPlayer.interact == self)
{
	if (!drawTri)
	{
		audio_sound_pitch(sndPPActive, 2);
		audio_play_sound(sndPPActive, 40, false);
	}
	drawTri = true;
} else
{
	drawTri = false;
}

//Indication triangle variables
var dd = angle_difference(triDir, triDirTo);

//Turn indicator triangle and sprite
triSpeed = lerp(triSpeed, min(abs(dd), triRotSpeed) * sign(dd), 0.4);
triDir -= triSpeed;

//Animate a lot of stuff
if (drawTri)
{
	visualInteractRange = lerp(visualInteractRange, interactRange, 0.1);
	offset = lerp(offset, 22.5, 0.1);
	triAlpha = scrApproach(triAlpha, 0.5, 0.05);
	rot = lerp(rot, triDir, 0.2);
	//xScale = lerp(xScale, scrWave(0.6, 1.4, 0.5, 0.25), 0.1);
	//yScale = lerp(yScale, scrWave(0.6, 1.4, 0.5, 0.0), 0.1);
	drawX = lerp(drawX, x, 0.1);
	drawY = lerp(drawY, y, 0.1);
	colorTo = activeColor;
	circleAlpha = lerp(circleAlpha, 1, 0.1);
} else
{
	visualInteractRange = lerp(visualInteractRange, interactRange + scrWave(-2, 2, 2, 0), 0.1);
	offset = lerp(offset, 22.5 + scrWave(-4, 4, 6, 0), 0.1);
	triAlpha = scrApproach(triAlpha, 0, 0.05);
	var wiggle = scrWave(-22, 22, 5, 0);
	rot = lerp(rot, wiggle, 0.1);
	//xScale = lerp(xScale, scrWave(0.7, 1.2, 3.0, 0.0), 0.1);
	//yScale = lerp(yScale, scrWave(1.2, 0.7, 4.0, 0.0), 0.1);
	drawX = lerp(drawX, x + scrWave(-2, 2, 2, 0), 0.1);
	drawY = lerp(drawY, y + scrWave(-2, 2, 3, 0), 0.1);
	colorTo = inactiveColor;
	circleAlpha = lerp(circleAlpha, 0.1, 0.1);
}

color = merge_color(color, colorTo, .2);

//Particles
scrPPEmitter();