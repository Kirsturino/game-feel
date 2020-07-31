//var camY = camera_get_view_y(view);

//if (!surface_exists(flameSurf))
//{
//	flameSurf = surface_create(room_width + viewWidth, room_height + viewHeight);
	
//	//Generate a static wall of flames
//	scrFlameWall();
//} else
//{
//	//Wiggle the flames a bit
//	var wiggle = scrWave(-blockSize, 0, 2, 0);
//	var wiggle2 = scrWave(-blockSize * 2, 0, 3, 2);
//	var drawY = min(camY + viewHeight - room_height, oMovingDanger.y - room_height) + wiggle + introY;
	
//	//Animate flames with simple shader
//	shader_set(shdWave);
//	shader_set_uniform_f(uTime,current_time/1000 * spd);
//	shader_set_uniform_f(uFrequency, frequency);
//	shader_set_uniform_f(uIntensity, intensity);
//	draw_surface(flameSurf, -viewWidth / 2 + wiggle2, drawY);
//	shader_reset();
//}

//Particle storm
var targ = oMovingDanger;

if (targ.active)
{
	repeat (10)
	{
		var xx = irandom_range(targ.bbox_left, targ.bbox_right);
		var yy = irandom_range(targ.bbox_top, targ.bbox_bottom);
		part_particles_create(global.topPartSystem, xx, yy, global.smokePart, 1);
		part_particles_create(global.topPartSystem, xx, yy, global.sparkPart, 1);
	}

	//Ambient spark particles
	var camX = camera_get_view_x(view);
	var camY = camera_get_view_y(view);
	xx = irandom_range(camX, camX + viewWidth);
	yy = camY + viewHeight;
	part_particles_create(global.topPartSystem, xx, yy, global.ambientSparkPart, 1);
}
////Flamewall intro spaghetti
//introY = scrApproach(introY, 0, 0.5);