if (!destroy && !following)
{
	//Some animation stuff
	var wiggle = scrWave(-3, 3, 4, 0);
	x = lerp(x, drawX + wiggle, 0.1);

	wiggle = scrWave(-3, 3, 3, 1);
	y = lerp(y, drawY + wiggle, 0.1);
	
	if (scrChance(0.2))
	{
		part_type_color1(global.secretPart, color);
		part_particles_create(global.partSystem, x, y, global.secretPart, 1);
	}
} else if (destroy)
{
	//Some animation stuff
	y -= riseSpeed;
	riseSpeed += 0.05;
	
	part_type_color1(global.secretPart, color);
	part_particles_create(global.partSystem, x, y, global.secretPart, 1);
} else if (following)
{
	
	//Some animation stuff
	var wiggle = scrWave(-3, 3, 4, 0);
	x = lerp(x, drawX + wiggle, 0.4);

	wiggle = scrWave(-3, 3, 3, 1);
	y = lerp(y, drawY + wiggle, 0.4);
	
	
	//Some animation stuff
	drawX = lerp(drawX, oPlayer.x, 0.05);

	drawY = lerp(drawY, oPlayer.y, 0.05);
}

if (rainbow && !collected)
{
	color = make_color_hsv(scrWave(0, 255, 8, 0), 255, 255);
} else if (rainbow)
{
	color = make_color_hsv(scrWave(0, 255, 8, 0), 100, 100);
} else
{
	color = merge_color(color, colorTo, 0.1);
}