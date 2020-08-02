surface_set_target(global.parSurf);

//Background color
draw_clear(global.cBlueDark);

//Stars, filling the entire screen, waiting to get obscured by anything else that's drawn afterwards
var starFrequency = blockSize * 2;
var i = 0;
var ii = 0;
for (i = 0; i < viewWidth;  i += starFrequency)
{
    for (ii = 0; ii < viewHeight; ii += starFrequency) {
		var rnd = irandom_range(-blockSize, blockSize);
	    draw_sprite_ext(sStar, 0, i + rnd, ii + rnd, 1, 1, 0, global.cWhite, 1);
	}
}

//Mountains in the distance, wider and taller triangles
var triangleFrequency = blockSize * 3;

for (var i = 0; i < viewWidth;  i += triangleFrequency + irandom_range(-blockSize, blockSize))
{
	var triangleWidth = blockSize * 12 + irandom_range(-blockSize * 2, blockSize * 2);
	var triangleHeight = blockSize * 8 + irandom_range(-blockSize * 2, blockSize * 2);

    draw_triangle_color(i - triangleWidth, viewHeight, i + triangleWidth, viewHeight, i, viewHeight - triangleHeight, global.cBlue, global.cBlue, global.cBlue, false);
}

surface_reset_target();