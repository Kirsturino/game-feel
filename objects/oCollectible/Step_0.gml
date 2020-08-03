if (!destroy && !following)
{
	//Some animation stuff
	var wiggle = scrWave(-3, 3, 4, 0);
	x = lerp(x, drawX + wiggle, 0.1);

	wiggle = scrWave(-3, 3, 3, 1);
	y = lerp(y, drawY + wiggle, 0.1);

	image_yscale = lerp(image_yscale, 1, 0.1);
	image_xscale = lerp(image_xscale, 1, 0.1);

	image_angle += rotSpeed;
	
	if (scrChance(0.2))
	{
		part_type_color1(global.secretPart, image_blend);
		part_particles_create(global.partSystem, x, y, global.secretPart, 1);
	}
} else if (destroy)
{
	//Some animation stuff
	y -= riseSpeed;
	riseSpeed += 0.05;

	image_yscale = scrApproach(image_yscale, 0, 0.01);
	image_xscale = scrApproach(image_xscale, 0, 0.01);

	image_angle += rotSpeed * 10;
	
	part_type_color1(global.secretPart, image_blend);
	part_particles_create(global.partSystem, x, y, global.secretPart, 1);
} else if (following)
{
	//Some animation stuff
	x = lerp(x, oPlayer.x, 0.05);

	var wiggle = scrWave(drawY - 5, drawY + 5, 3, 1);
	y = lerp(y, oPlayer.y, 0.05);

	image_yscale = lerp(image_yscale, 1, 0.1);
	image_xscale = lerp(image_xscale, 1, 0.1);

	image_angle += rotSpeed * 5;
}