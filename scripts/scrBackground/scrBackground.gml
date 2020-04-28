surface_set_target(parSurf);

//Stars, filling the entire screen, waiting to get obscured by anything else that's drawn afterwards
var starFrequency = blockSize;
var i = 0;
var ii = 0;
for (i = 0; i < room_width;  i += starFrequency)
{
    for (ii = 0; ii < room_height; ii += starFrequency) {
		var rnd = irandom_range(-blockSize, blockSize);
	    draw_point_color(i + rnd, ii + rnd, starColor);
	}
}

//Clouds, rolling in the top of the screen
var circleFrequency = blockSize * 3;
draw_set_circle_precision(32);

for (var i = 0; i < room_width;  i += circleFrequency + irandom_range(-blockSize, blockSize))
{
	var circleRadius = blockSize * 4;
	var circleY = irandom(circleRadius);
	
    draw_circle_color(i, circleY, circleRadius, cloudColor, cloudColor, false);
}


//Mountains in the distance, wider and taller triangles
var triangleFrequency = blockSize * 3;

for (var i = 0; i < room_width;  i += triangleFrequency + irandom_range(-blockSize, blockSize))
{
	var triangleWidth = blockSize * 24 + irandom_range(-blockSize * 2, blockSize * 2);
	var triangleHeight = blockSize * 10 + irandom_range(-blockSize * 2, blockSize * 2);

    draw_triangle_color(i - triangleWidth, room_height, i + triangleWidth, room_height, i, room_height - triangleHeight, mountainColor2, mountainColor2, mountainColor2, false);
}

//Spiky mountains more up close, smaller, but also way narrower
for (var i = 0; i < room_width;  i += triangleFrequency + irandom_range(-blockSize, blockSize))
{
	var triangleWidth = blockSize * 6 + irandom_range(-blockSize * 2, blockSize * 2);
	var triangleHeight = blockSize * 6 + irandom_range(-blockSize * 2, blockSize * 2);

    draw_triangle_color(i - triangleWidth, room_height, i + triangleWidth, room_height, i, room_height - triangleHeight, mountainColor, mountainColor, mountainColor, false);
}

surface_reset_target();