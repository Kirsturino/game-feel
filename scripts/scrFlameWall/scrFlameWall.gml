surface_set_target(flameSurf);

var triangleFrequency = blockSize * 3;

//Flames, like mountains, but red and yellow
for (var i = -viewWidth / 2; i < room_width + viewWidth / 2;  i += triangleFrequency + irandom_range(-blockSize, blockSize))
{
	var triangleWidth = blockSize * 15 + irandom_range(-blockSize, blockSize);
	var triangleHeight = blockSize * 2 + irandom_range(0, blockSize);

	var c = global.cOrange;
    draw_triangle_color(i - triangleWidth, room_height + viewHeight, i + triangleWidth, room_height + viewHeight, i, room_height - triangleHeight, c, c, c, false);
}

for (var i = -viewWidth / 2; i < room_width + viewWidth / 2;  i += triangleFrequency + irandom_range(-blockSize, blockSize))
{
	triangleHeight *= 0.8;
	c = global.cYellow;
	draw_triangle_color(i - triangleWidth, room_height + viewHeight, i + triangleWidth, room_height + viewHeight, i, room_height  - triangleHeight, c, c, c, false);
}
surface_reset_target();