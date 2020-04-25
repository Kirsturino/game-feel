//Animate
rot += rotSpeed + scrWave(-5, 2, 2, 0);

if (active)
{
	xScaleTo = scrWave(0.7, 1.2, 0.5, offset);
	yScaleTo = scrWave(1.2, 0.7, 0.3, offset);
	
	colorTo = activeColor;
} else
{
	xScaleTo = scrWave(0.3, 0.6, 0.5, offset);
	yScaleTo = scrWave(0.6, 0.3, 0.3, offset);
	
	colorTo = inactiveColor;
}

xScale = lerp(xScale, xScaleTo, 0.2);
yScale = lerp(yScale, yScaleTo, 0.2);

//drawXTo = lerp(drawXTo, x + scrWave(-4, 2, 2, offset), 0.1);
//drawYTo = lerp(drawYTo, y + scrWave(-2, 4, 3, offset), 0.1);

//drawX = lerp(drawX, drawXTo, 0.2);
//drawY = lerp(drawY, drawYTo, 0.2);

color = merge_color(color, colorTo, 0.1);