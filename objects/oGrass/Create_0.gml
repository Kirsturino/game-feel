//Get area size for grass
width = sprite_width;
height = sprite_height;

//Determine grass type
bladeSize = 1;
bladeSeparation = 3;

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
	var rnd = irandom_range(-5, 5);
	var bladernd = irandom(5);
	scrGrassBladeVertex(vbuff, x + i + (rnd / 4), y + height, bladeSize + bladernd, height + rnd, 3);
}
vertex_end(vbuff);

uTime = shader_get_uniform(shdGrass, "uTime");
playerX = shader_get_uniform(shdGrass, "playerX");
playerY = shader_get_uniform(shdGrass, "playerY");
playerGround = shader_get_uniform(shdGrass, "playerGround");
rng = shader_get_uniform(shdGrass, "rng");
windDir = shader_get_uniform(shdGrass, "dir");
randomSway = 0;
time = 0;
dir = 1;