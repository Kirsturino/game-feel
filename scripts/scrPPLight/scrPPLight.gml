///@param surface
///@param x
///@param y
///@param radius
///@param segments
///@param offset
///@param outlineAlpha
///@param outlineColor

if (surface_exists(argument0))
{
	surface_set_target(argument0);
	
	gpu_set_blendmode(bm_subtract);
	
	//Set shape	
	var dir = 360 / argument4;
	var dist = argument3;
	
	if (!place_meeting(x, y, oFakeCollision))
	{
		draw_set_alpha(1);
	} else
	{
		draw_set_alpha(argument6);
	}
	
	//Draw the outer fill of the shape
	for (var i = 0; i < argument4; ++i) 
	{
		//Draw each sector of the shape
		var x1 = argument1 + lengthdir_x(dist, dir * i + argument5);
		var y1 = argument2 + lengthdir_y(dist, dir * i + argument5);
		var x2 = argument1 + lengthdir_x(dist, dir * (i + 1) + argument5);
		var y2 = argument2 + lengthdir_y(dist, dir * (i + 1) + argument5);
	    draw_triangle_color(argument1, argument2, x1, y1, x2, y2, c_black, c_black, c_black, false);
	}
	
	//dist = argument3 / 3.5;
	
	//draw_set_alpha(1);
	
	////Draw the inner fill of the shape
	//for (var i = 0; i < argument4; ++i) 
	//{
	//	//Draw each sector of the shape
	//	var x1 = argument1 + lengthdir_x(dist, dir * i + argument5);
	//	var y1 = argument2 + lengthdir_y(dist, dir * i + argument5);
	//	var x2 = argument1 + lengthdir_x(dist, dir * (i + 1) + argument5);
	//	var y2 = argument2 + lengthdir_y(dist, dir * (i + 1) + argument5);
	//    draw_triangle_color(argument1, argument2, x1, y1, x2, y2, c_black, c_black, c_black, false);
	//}
	
	gpu_set_blendmode(bm_normal);
	
	dist = argument3;
	
	surface_reset_target();
	
	//Draw outline of shape
	for (var i = 0; i < argument4; ++i) 
	{
		//Draw each sector of the shape
		var x1 = argument1 + lengthdir_x(dist, dir * i + argument5) - blockSize * 2;
		var y1 = argument2 + lengthdir_y(dist, dir * i + argument5) - blockSize * 2;
		var x2 = argument1 + lengthdir_x(dist, dir * (i + 1) + argument5) - blockSize * 2;
		var y2 = argument2 + lengthdir_y(dist, dir * (i + 1) + argument5) - blockSize * 2;
		draw_set_alpha(argument6);
	    draw_line_width_color(x1, y1, x2, y2, 2, argument7, argument7);
		draw_set_alpha(1);
	}
}