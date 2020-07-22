var camY = camera_get_view_y(view);

if (!surface_exists(flameSurf))
{
	flameSurf = surface_create(room_width + viewWidth, room_height + viewHeight);
	
	//Generate a static wall of flames
	scrFlameWall();
} else
{
	//Wiggle the flames a bit
	var wiggle = scrWave(-blockSize, 0, 2, 0);
	var wiggle2 = scrWave(-blockSize * 2, 0, 3, 2);
	var drawY = min(camY + viewHeight - room_height, oMovingDanger.y - room_height) + wiggle + introY;
	
	//Animate flames with simple shader
	shader_set(shdWave);
	shader_set_uniform_f(uTime,current_time/1000 * spd);
	shader_set_uniform_f(uFrequency, frequency);
	shader_set_uniform_f(uIntensity, intensity);
	draw_surface(flameSurf, -viewWidth / 2 + wiggle2, drawY);
	shader_reset();
}

//Particle storm
var xx = irandom(room_width);
part_particles_create(global.partSystem, xx, oMovingDanger.y, global.smokePart, 5);
part_particles_create(global.partSystem, xx, oMovingDanger.y, global.sparkPart, 5);

//Flamewall intro spaghetti
introY = scrApproach(introY, 0, 0.5);