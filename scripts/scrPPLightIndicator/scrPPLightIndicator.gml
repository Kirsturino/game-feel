///@param x
///@param y
///@param radius
///@param direction
///@param offset
///@param segmentAngle
///@param alpha
///@param color

var dist = argument2;
var dir = argument3;
var seg = 360 / argument5;

//Draw a sector of the shape
var x1 = argument0 + lengthdir_x(dist, dir + argument4 + 180);
var y1 = argument1 + lengthdir_y(dist, dir + argument4 + 180);
var x2 = argument0 + lengthdir_x(dist, dir - seg + argument4 + 180);
var y2 = argument1 + lengthdir_y(dist, dir - seg + argument4 + 180);

draw_set_alpha(argument6);
gpu_set_blendmode(bm_add);
draw_triangle_color(argument0, argument1, x1, y1, x2, y2, argument7, c_black, c_black, false);
gpu_set_blendmode(bm_normal);
draw_set_alpha(1);

	