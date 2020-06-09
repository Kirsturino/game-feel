///@desc Draw text, but funky
///@param x
///@param y
///@param text
///@param alpha

var xx = argument0;
var yy = argument1;
var txt = argument2;
var c = global.cBlack;
var alpha = argument3;

//Funk-a-lize text, yo
xx += scrWave(-4, 2, 2, 0);
yy += scrWave(-3, 5, 3, 0);

var angle = scrWave(-5, 5, 4, 0);
var scale = scrWave(1, 1.2, 2, 0.5);

draw_text_transformed_color(xx + 1, yy + 1, txt, scale, scale, angle, c, c, c, c, alpha);

var c = global.cWhite;

draw_text_transformed_color(xx, yy, txt, scale, scale, angle, c, c, c, c, alpha);