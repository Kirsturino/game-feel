///@param surface
///@param x
///@param y
///@param radius
///@param corners


lightAlpha = scrApproach(lightAlpha, 1, 0.05);

if (surface_exists(argument0))
{
	surface_set_target(argument0);
	
	gpu_set_blendmode(bm_subtract);
	
	//Set shape
	draw_set_circle_precision(argument4);
	
	//Inner circle
	draw_set_alpha(lightAlpha);
	draw_circle_color(argument1, argument2, argument3 / 2, c_black, c_black, false);
	
	//Outer circle
	draw_set_alpha(lightAlpha / 2);
	draw_circle_color(argument1, argument2, argument3, c_black, c_black, false);
	draw_set_alpha(1);
	gpu_set_blendmode(bm_normal);
	
	surface_reset_target();
}