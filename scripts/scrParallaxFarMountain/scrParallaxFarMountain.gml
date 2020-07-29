surface_set_target(global.parSurfFarMountain);

var triangleFrequency = blockSize * 3;

//Faraway mountains
for (var i = 0; i < room_width;  i += triangleFrequency + irandom_range(-blockSize, blockSize))
{
	var triangleWidth = blockSize * 8 + irandom_range(-blockSize * 2, blockSize * 2);
	var triangleHeight = blockSize * 8 + irandom_range(-blockSize * 2, blockSize);

    draw_triangle_color(i - triangleWidth, room_height, i + triangleWidth, room_height, i, room_height - triangleHeight, global.cBrownLight, global.cBrownLight, global.cBrownLight, false);
}

surface_reset_target();