surface_set_target(parSurfMiddleMountain);

var triangleFrequency = blockSize * 3;

//Spiky mountains more up close, smaller, but also way narrower
for (var i = 0; i < room_width;  i += triangleFrequency + irandom_range(-blockSize, blockSize))
{
	var triangleWidth = blockSize * 8 + irandom_range(-blockSize * 2, blockSize * 2);
	var triangleHeight = blockSize * 6 + irandom_range(-blockSize * 2, blockSize);

    draw_triangle_color(i - triangleWidth, room_height, i + triangleWidth, room_height, i, room_height - triangleHeight, global.cBrown, global.cBrown, global.cBrown, false);
}

surface_reset_target();