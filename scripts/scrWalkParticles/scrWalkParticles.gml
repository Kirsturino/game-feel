if (leftPress)
{
	part_type_direction(global.walkPart,0,30,0,0);
} else if (rightPress)
{
	part_type_direction(global.walkPart,150,180,0,0);
}

part_particles_create(global.partSystem, x, y, global.walkPart, 5);