surface_set_target(parSurf);

//Background color
draw_clear(backgroundColor);

//Stars, filling the entire screen, waiting to get obscured by anything else that's drawn afterwards
var starFrequency = blockSize;
var i = 0;
var ii = 0;
for (i = 0; i < viewWidth;  i += starFrequency)
{
    for (ii = 0; ii < viewHeight; ii += starFrequency) {
		var rnd = irandom_range(-blockSize, blockSize);
	    draw_point_color(i + rnd, ii + rnd, starColor);
	}
}

//Clouds, rolling in the top of the screen. Several layers for depth
var circleFrequency = blockSize * 3;
draw_set_circle_precision(32);

for (var i = 0; i < viewWidth;  i += circleFrequency + irandom_range(-blockSize, blockSize))
{
	var circleRadius = blockSize * 2.5;
	var circleY = irandom(circleRadius);
	
    draw_circle_color(i, circleY, circleRadius, cloudColor3, cloudColor3, false);
}


for (var i = 0; i < viewWidth;  i += circleFrequency + irandom_range(-blockSize, blockSize))
{
	var circleRadius = blockSize * 3;
	var circleY = irandom(circleRadius / 1.5);
	
    draw_circle_color(i, circleY, circleRadius, cloudColor2, cloudColor2, false);
}


for (var i = 0; i < viewWidth;  i += circleFrequency + irandom_range(-blockSize, blockSize))
{
	var circleRadius = blockSize * 3;
	var circleY = irandom(circleRadius / 2);
	
    draw_circle_color(i, circleY, circleRadius, cloudColor, cloudColor, false);
}


//Mountains in the distance, wider and taller triangles
var triangleFrequency = blockSize * 3;

for (var i = 0; i < viewWidth;  i += triangleFrequency + irandom_range(-blockSize, blockSize))
{
	var triangleWidth = blockSize * 12 + irandom_range(-blockSize * 2, blockSize * 2);
	var triangleHeight = blockSize * 5 + irandom_range(-blockSize * 2, blockSize * 2);

    draw_triangle_color(i - triangleWidth, viewHeight, i + triangleWidth, viewHeight, i, viewHeight - triangleHeight, mountainColor2, mountainColor2, mountainColor2, false);
}

surface_reset_target();