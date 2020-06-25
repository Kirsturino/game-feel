//Check if behind hidden walls
hidden = place_meeting(x, y, oFakeCollision);

//Animate
rot += rotSpeed + scrWave(-5, 2, 5, 0);

if (active)
{
	xScaleTo = scrWave(1.1, 1.5, 1.0, offset);
	yScaleTo = scrWave(1.5, 1.1, 2.0, offset);
	
	colorTo = activeColor;
} else
{
	xScaleTo = scrWave(0.3, 0.6, 1.0, offset);
	yScaleTo = scrWave(0.6, 0.3, 2.0, offset);
	
	colorTo = inactiveColor;
}

xScale = lerp(xScale, xScaleTo, 0.25);
yScale = lerp(yScale, yScaleTo, 0.25);

//drawXTo = lerp(drawXTo, x + scrWave(-4, 2, 2, offset), 0.1);
//drawYTo = lerp(drawYTo, y + scrWave(-2, 4, 3, offset), 0.1);

//drawX = lerp(drawX, drawXTo, 0.2);
//drawY = lerp(drawY, drawYTo, 0.2);

color = merge_color(color, colorTo, 0.1);