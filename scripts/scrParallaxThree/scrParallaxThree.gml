surface_set_target(parSurfThree);

//Clouds, rolling in the top of the screen. Several layers for depth
draw_set_circle_precision(32);
var circleFrequency = blockSize * 3;
draw_set_circle_precision(32);

for (var i = 0; i < room_width;  i += circleFrequency + irandom_range(-blockSize, blockSize))
{
	var circleRadius = blockSize * 2.5;
	var circleY = irandom(circleRadius * 1.5);
	
    draw_circle_color(i, circleY, circleRadius, global.cBlueDark, global.cBlueDark, false);
}

var triangleFrequency = blockSize * 3;

//Faraway mountains
for (var i = 0; i < room_width;  i += triangleFrequency + irandom_range(-blockSize, blockSize))
{
	var triangleWidth = blockSize * 8 + irandom_range(-blockSize * 2, blockSize * 2);
	var triangleHeight = blockSize * 16 + irandom_range(-blockSize * 2, blockSize * 2);

    draw_triangle_color(i - triangleWidth, room_height, i + triangleWidth, room_height, i, room_height - triangleHeight, global.cBrownLight, global.cBrownLight, global.cBrownLight, false);
}

surface_reset_target();