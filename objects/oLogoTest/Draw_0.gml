//Draw logo and name when on certain menu parts

//Get basic coordinates for trongles
var centreX = viewWidth / 2;
var centreY = viewHeight / 2;
	
if (surface_exists(global.trongleSurf))
{
	//Draw quick little triangle graphics
	surface_set_target(global.trongleSurf);
	var col = make_color_rgb(3, 5, 9);
	draw_clear_alpha(col, 0);
		
	gpu_set_blendmode(bm_max);
		
	//Rotating trongle
	c = global.cYellow;
	var length = 64;
	var time = 30;
	var tilt = 30;
	var offset = 15;
	var dir = scrWave(-tilt, tilt, time, offset);
	
	var x1 = lengthdir_x(length, dir);
	var y1 = lengthdir_y(length, dir);
	
	var x2 = lengthdir_x(length, dir + 120);
	var y2 = lengthdir_y(length, dir + 120);
	
	var x3 = lengthdir_x(length, dir + 240);
	var y3 = lengthdir_y(length, dir + 240);
	
	draw_triangle_color(centreX + x1, centreY + y1, centreX + x2, centreY + y2, centreX + x3, centreY + y3, c, c, c, false);
	
	//Other rotating trongle
	var dir = scrWave(-tilt / 3 * 2, tilt / 3 * 2, time, offset / 3 * 2);
	
	var x1 = lengthdir_x(length, dir);
	var y1 = lengthdir_y(length, dir);
	
	var x2 = lengthdir_x(length, dir + 120);
	var y2 = lengthdir_y(length, dir + 120);
	
	var x3 = lengthdir_x(length, dir + 240);
	var y3 = lengthdir_y(length, dir + 240);
	
	draw_triangle_color(centreX + x1, centreY + y1, centreX + x2, centreY + y2, centreX + x3, centreY + y3, c, c, c, false);
	
	//Another rotating trongle
	var dir = scrWave(-tilt / 3, tilt / 3, time, offset / 3);
	
	var x1 = lengthdir_x(length, dir);
	var y1 = lengthdir_y(length, dir);
	
	var x2 = lengthdir_x(length, dir + 120);
	var y2 = lengthdir_y(length, dir + 120);
	
	var x3 = lengthdir_x(length, dir + 240);
	var y3 = lengthdir_y(length, dir + 240);
	
	draw_triangle_color(centreX + x1, centreY + y1, centreX + x2, centreY + y2, centreX + x3, centreY + y3, c, c, c, false);
		
	gpu_set_blendmode(bm_normal);
		
	surface_reset_target();
		
	draw_set_alpha(0.3);
		
	draw_surface(global.trongleSurf, 0, 0);
		
	draw_set_alpha(1);
} else
{
	global.trongleSurf = surface_create(viewWidth, viewHeight);
}
	
//Logo
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(fLogo);
c = global.cWhite;
	
scrDrawTextColorShadow(centreX, centreY, "OCDA", c, c, c, c, 1);

draw_set_halign(fa_left);
draw_set_valign(fa_top);