surface_set_target(parSurfThree);

var triangleFrequency = blockSize * 3;

//Spiky mountains more up close, smaller, but also way narrower
for (var i = 0; i < room_width;  i += triangleFrequency + irandom_range(-blockSize, blockSize))
{
	var triangleWidth = blockSize * 8 + irandom_range(-blockSize * 2, blockSize * 2);
	var triangleHeight = blockSize * 16 + irandom_range(-blockSize * 2, blockSize * 2);

    draw_triangle_color(i - triangleWidth, room_height, i + triangleWidth, room_height, i, room_height - triangleHeight, mountainColor4, mountainColor4, mountainColor4, false);
}

surface_reset_target();