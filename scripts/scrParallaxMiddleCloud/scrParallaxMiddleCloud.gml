surface_set_target(global.parSurfMiddleCloud);

//Clouds, rolling in the top of the screen. Several layers for depth
draw_set_circle_precision(32);
var circleFrequency = blockSize * 2;
for (var i = 0; i < room_width;  i += circleFrequency + irandom_range(-blockSize, blockSize))
{
	var circleRadius = blockSize * 2;
	var circleY = irandom(circleRadius / 1.5);
	
    draw_circle_color(i, circleY, circleRadius, global.cBlueLight, global.cBlueLight, false);
}

surface_reset_target();