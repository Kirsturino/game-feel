//scrDrawShadow(sprite_index, x, y, image_xscale, image_yscale, image_angle);
//draw_self();

//Get basic coordinates
var centreX = x;
var centreY = y;

var c = global.cBlack;
if (collected)
{
	var time = 1;
} else if (rainbow)
{
	var time = 0.2;
} else
{
	var time = 0.5;
}

var tilt = 180;
var tiltTime = 10;
var offset = 0;

var dir = scrWave(-tilt, tilt, tiltTime, offset);

//First corner
var length = scrWave(6, 10, time * 3, offset);
var x1 = lengthdir_x(length, dir);
var y1 = lengthdir_y(length, dir);
	
//Second corner
var length = scrWave(2, 6, time, 2);
var x2 = lengthdir_x(length, dir + 120);
var y2 = lengthdir_y(length, dir + 120);

//Third corner
var length = scrWave(4, 8, time * 2, 4);
var x3 = lengthdir_x(length, dir + 240);
var y3 = lengthdir_y(length, dir + 240);

draw_set_alpha(alpha);
draw_triangle_color(centreX + x1 + 3, centreY + y1 + 1, centreX + x2 + 3, centreY + y2 + 1, centreX + x3 + 3, centreY + y3 + 1, c, c, c, false);

c = color;

draw_triangle_color(centreX + x1, centreY + y1, centreX + x2, centreY + y2, centreX + x3, centreY + y3, c, c, c, false);
draw_set_alpha(1);