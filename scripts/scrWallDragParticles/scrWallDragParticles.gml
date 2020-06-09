if (wallJumpDir = "right" && vsp > 0)
{
	part_particles_create(global.partSystem, x - 4, y, global.wallDragPart, 2);
} else if (vsp > 0)
{
	part_particles_create(global.partSystem, x + 7, y, global.wallDragPart, 2);
}