//Init vertex buffer
vertex_format_begin();
vertex_format_add_position();
vertex_format_add_color();
vertex_format_add_custom(vertex_type_float1, vertex_usage_texcoord);
format = vertex_format_end();

vbuff = vertex_create_buffer();
vertex_begin(vbuff, format);

for (var i = 0; i < width; i += bladeSeparation)
{
	//Check if there is space to spawn grass
	if (collision_point(x + i, y, oCollision, false, true) == noone && collision_point(x + i, y + blockSize, oFakeCollision, false, true) == noone && collision_point(x + i, y + sprite_height + 2, oDanger, false, true) == noone && y > 0)
	{
		var rnd = irandom_range(-5, 5);
		var bladernd = irandom(5);
		scrGrassBladeVertex(vbuff, x + i + (rnd / 6), y + height, bladeSize + bladernd, height + rnd, 3);
	}
}

vertex_end(vbuff);