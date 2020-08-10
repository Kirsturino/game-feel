if(!global.pause) exit;

var ds_grid = menu_pages[page]
var ds_height = ds_grid_height(ds_grid);
var y_buffer = 16;
var x_buffer = 16;

var camX = camera_get_view_x(view);
var camY = camera_get_view_y(view);
var start_y = camY + (viewHeight / 2) - ((((ds_height-1)/2) * y_buffer))
var start_x = camX + viewWidth / 2;

//Draw pause menu "back"
var c = global.cGray;
draw_set_alpha(0.5);
draw_rectangle_color(camX, camY, camX + viewWidth, camY + viewHeight, c, c, c, c, false);
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
		case menu_element_type.shift:
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
			
		case menu_element_type.slider:
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
		
		case menu_element_type.toggle:
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
		
		case menu_element_type.input:
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
			scrDrawTextColorShadow(camX + viewWidth - 120, camY + viewHeight - 16, "PRESS ENTER TO\nINPUT & CONFIRM", c, c, c, c, 1);
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
			scrDrawTextColorShadow(camX + viewWidth - 120, camY + viewHeight - 16, "PRESS SELECT TO\nINPUT & CONFIRM", c, c, c, c, 1);
		break;
	}
	
	yy++;
}

draw_set_valign(fa_top);