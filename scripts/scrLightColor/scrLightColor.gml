///@param surface
///@param x
///@param y
///@param radius
///@param corners
///@param color

if (surface_exists(argument0))
{
	surface_set_target(argument0);
	
	gpu_set_blendmode(bm_subtract);
	
	//Set shape
	draw_set_circle_precision(argument4);
	
	//Inner circle
	draw_circle_color(argument1, argument2, argument3 / 2, c_black, c_black, false);
	
	//Outer circle
	draw_set_alpha(0.5);
	draw_circle_color(argument1, argument2, argument3, c_black, c_black, false);
	draw_set_alpha(1);
	
	//Draw color circles
	gpu_set_blendmode(bm_zero);
	
	//Inner circle with color
	draw_set_alpha(0.3);
	draw_circle_color(argument1, argument2, argument3 / 2, argument5, argument5, false);
	draw_set_alpha(1);
	
	//Outer circle with color
	draw_set_alpha(0.2);
	draw_circle_color(argument1, argument2, argument3, argument5, argument5, false);
	draw_set_alpha(1);
	
	gpu_set_blendmode(bm_normal);
	
	surface_reset_target();
}