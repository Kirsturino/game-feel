parSurf = surface_create(room_width, room_height);

surface_set_target(parSurf);

triangleFrequency = blockSize * 3;


for (var i = 0; i < room_width;  i += triangleFrequency)
{
	var triangleWidth = blockSize * 6 + irandom_range(-blockSize, blockSize);
	var triangleHeight = blockSize * 12 + irandom_range(-blockSize, blockSize);

    draw_triangle_color(i - triangleWidth, room_height, i + triangleWidth, room_height, i, room_height - triangleHeight, color2, color2, color2, false);
}


for (var i = 0; i < room_width;  i += triangleFrequency)
{
	var triangleWidth = blockSize * 6 + irandom_range(-blockSize, blockSize);
	var triangleHeight = blockSize * 6 + irandom_range(-blockSize, blockSize);

    draw_triangle_color(i - triangleWidth, room_height, i + triangleWidth, room_height, i, room_height - triangleHeight, color, color, color, false);
}

surface_reset_target();