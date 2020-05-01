surface_set_target(parSurfTwo);

//Clouds, rolling in the top of the screen. Several layers for depth
draw_set_circle_precision(32);
var circleFrequency = blockSize * 3;
for (var i = 0; i < room_width;  i += circleFrequency + irandom_range(-blockSize, blockSize))
{
	var circleRadius = blockSize * 3;
	var circleY = irandom(circleRadius / 2);
	
    draw_circle_color(i, circleY, circleRadius, global.cBlueLight, global.cBlueLight, false);
}

var triangleFrequency = blockSize * 3;

//Spiky mountains more up close, smaller, but also way narrower
for (var i = 0; i < room_width;  i += triangleFrequency + irandom_range(-blockSize, blockSize))
{
	var triangleWidth = blockSize * 6 + irandom_range(-blockSize * 2, blockSize * 2);
	var triangleHeight = blockSize * 6 + irandom_range(-blockSize * 2, blockSize * 2);

    draw_triangle_color(i - triangleWidth, room_height, i + triangleWidth, room_height, i, room_height - triangleHeight, global.cBrownDark, global.cBrownDark, global.cBrownDark, false);
}

surface_reset_target();