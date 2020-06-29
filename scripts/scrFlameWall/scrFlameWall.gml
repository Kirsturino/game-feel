surface_set_target(flameSurf);

var triangleFrequency = blockSize * 3;

//Spiky mountains more up close, smaller, but also way narrower
for (var i = 0; i < room_width;  i += triangleFrequency + irandom_range(-blockSize, blockSize))
{
	var triangleWidth = blockSize * 2 + irandom_range(-blockSize * 2, blockSize);
	var triangleHeight = blockSize * 2 + irandom_range(0, blockSize);

	var c = global.cOrange;
    draw_triangle_color(i - triangleWidth, room_height, i + triangleWidth, room_height, i, room_height - triangleHeight, c, c, c, false);
	
	triangleHeight *= .5;
	triangleWidth *= .9;
	c = global.cYellow;
	draw_triangle_color(i - triangleWidth, room_height, i + triangleWidth, room_height, i, room_height - triangleHeight, c, c, c, false);
}

surface_reset_target();