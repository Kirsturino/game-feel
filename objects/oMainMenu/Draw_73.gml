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
repeat(ds_height)
{
	lty = start_y + (yy * y_buffer);
	c = global.cWhite;
	var xo = 0;
	
	if (yy == menu_option[page])
	{
		c = global.cYellow;
		xo = -(x_buffer / 2);
	}
	
	draw_text_color(ltx + xo, lty, ds_grid[# 0, yy], c, c, c, c, 1);
	
	yy++;
}

//Draw dividing line
draw_line_width_color(start_x, start_y - y_buffer, start_x, lty + y_buffer, 3, global.cWhite, global.cWhite);


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
			var left_shift = "<< ";
			var right_shift = " >>";
			c = global.cWhite;
			
			if (inputting && yy == menu_option[page])
			{
				c = global.cYellow;
			}
			
			if (current_val == 0) left_shift = "";
			if (current_val == array_length_1d(ds_grid[# 4, yy]) - 1) right_shift = "";
			
			draw_text_color(rtx, rty, left_shift + current_array[current_val] + right_shift, c, c, c, c, 1);
		break;
			
		case main_menu_element_type.slider:
			var len = 64;
			var current_val = ds_grid[# 3, yy];
			var current_array = ds_grid[# 4, yy];
			var circle_pos = ((current_val - current_array[0]) / (current_array[1] - current_array[0]));
			c = global.cWhite;
				
			draw_line_width_color(rtx, rty, rtx + len, rty, 2, c, c);
			
			draw_set_circle_precision(8);
			
			if (inputting && yy == menu_option[page])
			{
				c = global.cYellow;
			}
			
			draw_line_width_color(rtx + (circle_pos * len), rty + 5, rtx + (circle_pos * len), rty - 5, 5, c, c);
			draw_text_color(rtx + (len * 1.2), rty, string(floor(circle_pos * 100)) + " % ", c, c, c, c, 1);
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
		
			draw_text_color(rtx, rty, "ON", c1, c1, c1, c1, 1);
			draw_text_color(rtx + 32, rty, "OFF", c2, c2, c2, c2, 1);
		break;
		
		case main_menu_element_type.input:
			var current_val = ds_grid[# 3, yy];
			
			current_val = scrGetUniqueKeys(current_val);
			
			c = global.cWhite;
			
			if (inputting && yy == menu_option[page])
			{
				c = global.cYellow;
			}
			
			draw_text_color(rtx, rty, current_val, c, c, c, c, 1);
			
			//Draw confirm prompt when rebinding
			draw_set_halign(fa_center);
			c = global.cWhite;
			draw_text_color(viewWidth / 2, viewHeight - 8, "PRESS ENTER TO INPUT & CONFIRM", c, c, c, c, 1);
			draw_set_halign(fa_left);
		break;
		
		case main_menu_element_type.controllerinput:
			var current_val = ds_grid[# 3, yy];
			
			current_val = scrGetUniqueKeys(current_val);
			
			c = global.cWhite;
			
			if (inputting && yy == menu_option[page])
			{
				c = global.cYellow;
			}
			
			draw_text_color(rtx, rty, current_val, c, c, c, c, 1);
			
			//Draw confirm prompt when rebinding
			draw_set_halign(fa_center);
			c = global.cWhite;
			draw_text_color(viewWidth / 2, viewHeight - 8, "PRESS SELECT TO INPUT & CONFIRM", c, c, c, c, 1);
			draw_set_halign(fa_left);
		break;
	}
	
	yy++;
}

draw_set_valign(fa_top);

//Draw logo and name
if (page == 0 || page == 1 || page == 2 || page == 5)
{
	//Draw quick little triangle graphics
	draw_set_alpha(0.5);
	
	//Rotating trongle
	var centreX = viewWidth / 4 * 3;
	var centreY = viewHeight / 2;
	c = global.cYellow;
	var length = 64;
	var dir = scrWave(-120, 120, 32, 0);
	
	var x1 = lengthdir_x(length, dir);
	var y1 = lengthdir_y(length, dir);
	
	var x2 = lengthdir_x(length, dir + 120);
	var y2 = lengthdir_y(length, dir + 120);
	
	var x3 = lengthdir_x(length, dir + 240);
	var y3 = lengthdir_y(length, dir + 240);
	
	draw_triangle_color(centreX + x1, centreY + y1, centreX + x2, centreY + y2, centreX + x3, centreY + y3, c, c, c, false);
	
	//Other rotating trongle
	var dir = scrWave(-90, 90, 24, 0);
	
	var x1 = lengthdir_x(length, dir);
	var y1 = lengthdir_y(length, dir);
	
	var x2 = lengthdir_x(length, dir + 120);
	var y2 = lengthdir_y(length, dir + 120);
	
	var x3 = lengthdir_x(length, dir + 240);
	var y3 = lengthdir_y(length, dir + 240);
	
	draw_triangle_color(centreX + x1, centreY + y1, centreX + x2, centreY + y2, centreX + x3, centreY + y3, c, c, c, false);
	
	//Another rotating trongle
	var dir = scrWave(-180, 180, 48, 0);
	
	var x1 = lengthdir_x(length, dir);
	var y1 = lengthdir_y(length, dir);
	
	var x2 = lengthdir_x(length, dir + 120);
	var y2 = lengthdir_y(length, dir + 120);
	
	var x3 = lengthdir_x(length, dir + 240);
	var y3 = lengthdir_y(length, dir + 240);
	
	draw_triangle_color(centreX + x1, centreY + y1, centreX + x2, centreY + y2, centreX + x3, centreY + y3, c, c, c, false);
	
	draw_set_alpha(1);
	
	//Logo
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(fLogo);
	
	c = global.cBlack;
	draw_text_color(centreX + 2, centreY + 2, "OCDA", c, c, c, c, 1);
	
	c = global.cWhite;
	draw_text_color(centreX, centreY, "OCDA", c, c, c, c, 1);
	
	//Text
	draw_set_font(fDefault);
	xx = viewWidth / 4 * 3;
	yy = viewHeight / 2 + 24;
	
	c = global.cBlack;
	draw_text_color(xx + 1, yy + 1, "BY KIRSTU", c, c, c, c, 1);
	
	c = global.cWhite;
	draw_text_color(xx, yy, "BY KIRSTU", c, c, c, c, 1);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}