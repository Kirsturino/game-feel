var ds_grid = menu_pages[page]
var ds_height = ds_grid_height(ds_grid);
var y_buffer = 16;
var x_buffer = 16;

var start_y = (viewHeight / 2) - ((((ds_height-1)/2) * y_buffer))
var start_x = viewWidth / 2;

//Draw transparent background
var c = global.cGray;
draw_set_alpha(0.8);
draw_rectangle_color(0, 0, viewWidth, viewHeight, c, c, c, c, false);
draw_set_alpha(1);

//Draw elements on left side
draw_set_valign(fa_middle);
draw_set_halign(fa_right);
draw_set_font(fDefault);

var ltx = start_x - x_buffer;
var lty = 0;
var yy = 0;
var xoTarget = x_buffer - 32;

xo = lerp(xo, xoTarget, 0.2);

repeat(ds_height)
{
	lty = start_y + (yy * y_buffer);
	c = global.cWhite;
	
	if (yy == menu_option[page])
	{
		c = global.cYellow;	
		scrDrawTextColorShadow(ltx + xo, lty, ds_grid[# 0, yy], c, c, c, c, 1);
	} else
	{
		scrDrawTextColorShadow(ltx, lty, ds_grid[# 0, yy], c, c, c, c, 1);
	}
	
	yy++;
}

//Draw dividing line
c = global.cBlack;
draw_line_width_color(start_x + 1, start_y - y_buffer, start_x + 1, lty + y_buffer, 3, c, c);

c = global.cWhite;
draw_line_width_color(start_x, start_y - y_buffer, start_x, lty + y_buffer, 3, c, c);


//Draw elements on right side
draw_set_halign(fa_left);

var rtx = start_x + x_buffer, rty;

yy = 0;
repeat (ds_height)
{
	rty = start_y + (yy * y_buffer);
	
	switch (ds_grid[# 1, yy])
	{
		case main_menu_element_type.shift:
			var current_val = ds_grid[# 3, yy];
			var current_array = ds_grid[# 4, yy];
			var left_shift = "< ";
			var right_shift = " >";
			c = global.cWhite;
			
			if (inputting && yy == menu_option[page])
			{
				c = global.cYellow;
			}
			
			if (current_val == 0) left_shift = "";
			if (current_val == array_length_1d(ds_grid[# 4, yy]) - 1) right_shift = "";
			
			scrDrawTextColorShadow(rtx, rty, left_shift + current_array[current_val] + right_shift, c, c, c, c, 1);
		break;
			
		case main_menu_element_type.slider:
			var len = 64;
			var current_val = ds_grid[# 3, yy];
			var current_array = ds_grid[# 4, yy];
			var circle_pos = ((current_val - current_array[0]) / (current_array[1] - current_array[0]));
			
			c = global.cBlack;	
			draw_line_width_color(rtx + 1, rty, rtx + len + 1, rty, 2, c, c);
			
			c = global.cWhite
			draw_line_width_color(rtx, rty, rtx + len, rty, 2, c, c);
			
			draw_set_circle_precision(8);
			
			if (inputting && yy == menu_option[page])
			{
				c = global.cYellow;
			}
			
			var cc = global.cBlack;
			draw_line_width_color(rtx + (circle_pos * len) + 1, rty + 5, rtx + (circle_pos * len) + 1, rty - 5, 5, cc, cc);
			
			draw_line_width_color(rtx + (circle_pos * len), rty + 5, rtx + (circle_pos * len), rty - 5, 5, c, c);
			
			scrDrawTextColorShadow(rtx + (len * 1.2), rty, string(round(circle_pos * 100)) + " % ", c, c, c, c, 1);
		break;
		
		case main_menu_element_type.toggle:
			var current_val = ds_grid[# 3, yy];
			var c1, c2;
			c = global.cWhite;
			
			if (inputting && yy == menu_option[page])
			{
				c = global.cYellow;
			}
		
			if (current_val == 0)	{ c1 = c; c2 = global.cBrownLight; }
			else					{ c1 = global.cBrownLight; c2 = c; }
		
			scrDrawTextColorShadow(rtx, rty, "ON", c1, c1, c1, c1, 1);
			scrDrawTextColorShadow(rtx + 32, rty, "OFF", c2, c2, c2, c2, 1);
		break;
		
		case main_menu_element_type.input:
			var current_val = ds_grid[# 3, yy];
			
			current_val = scrGetUniqueKeys(current_val);
			
			c = global.cWhite;
			
			if (inputting && yy == menu_option[page])
			{
				c = global.cYellow;
			}
			
			scrDrawTextColorShadow(rtx, rty, current_val, c, c, c, c, 1);
			
			//Draw confirm prompt when rebinding
			c = global.cWhite;
			scrDrawTextColorShadow(viewWidth - 120, viewHeight - 16, "PRESS ENTER TO\nINPUT & CONFIRM", c, c, c, c, 1);
		break;
		
		case main_menu_element_type.controllerinput:
			var current_val = ds_grid[# 3, yy];
			
			current_val = scrGetUniqueKeys(current_val);
			
			c = global.cWhite;
			
			if (inputting && yy == menu_option[page])
			{
				c = global.cYellow;
			}
			
			scrDrawTextColorShadow(rtx, rty, current_val, c, c, c, c, 1);
			
			//Draw confirm prompt when rebinding
			c = global.cWhite;
			scrDrawTextColorShadow(viewWidth - 120, viewHeight - 16, "PRESS SELECT TO\nINPUT & CONFIRM", c, c, c, c, 1);
		break;
	}
	
	yy++;
}

draw_set_valign(fa_top);

//Draw logo and name when on certain menu parts
if (page == 0 || page == 1 || page == 2 || page == 5)
{
	//Get basic coordinates for trongles
	var centreX = viewWidth / 4 * 3;
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
	
	//Text
	draw_set_font(fDefault);
	xx = viewWidth / 4 * 3;
	yy = viewHeight / 2 + 24;
	
	scrDrawTextColorShadow(xx, yy, "BY KIRSTU", c, c, c, c, 1);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}

//Draw credits text
{
	if (page == main_menu_page.credits)
	{
		var centreX = viewWidth / 4 * 3;
		var c = global.cWhite;
		draw_set_halign(fa_center);
		var me = "Programming,\ndesign, \"art\", sounds, \nall that stuff:\n\nKristian \"Kirstu\" Kallio\n\n";
		var palette = "Palette:\n\nEQUPIX15\nby\nNight\n\n";
		var scripts = "Additional tool\nscripts:\n\nShaun Spalding\nGMLScripts.com\n\n";
		var fonts = "Additional fonts:\n\n Seraphim1\nby\nJosephKnightCom\n\n";
		var tutorials = "GameMaker content\ncreators whose\ncontent helped me:\n\nFriendlyCosmonaut\nGMWolf\nIDoZ\nPixelatedPope\nShaun Spalding\nThe Step Event\n\n";
		var playtesters = "Special thanks to my\nearly playtesters:\n\nArdns\nborb\nFudge\nGlain Glimbs\nHolf\nJebus\nlillamyy\nLinus\nMooses Suuri\nOsqu\nRocky Stein\nSensei Fry\ntams\n\n";
		var creditsText = me + palette + tutorials + fonts + scripts + playtesters;
		scrDrawTextColorShadow(centreX, creditsY, creditsText, c, c, c, c, 1);
		
		draw_set_halign(fa_left);
	}
}