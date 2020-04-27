//Reuse jump particles, change some stuff, then change back

if (isPull)
{
	part_type_direction(global.ppPart,ppDir-200,ppDir-160,0,0);
	part_type_direction(global.ppPart2,ppDir-10,ppDir+10,0,0);
	part_type_direction(global.ppPart4,ppDir,ppDir,0,30);
} else if (isPush)
{
	part_type_direction(global.ppPart,ppDir-20,ppDir+20,0,0);
	part_type_direction(global.ppPart2,ppDir-190,ppDir-170,0,0);
	part_type_direction(global.ppPart4,ppDir-180,ppDir-180,0,30);
}

part_particles_create(global.partSystem, x, y, global.ppPart2, 5);
part_particles_create(global.partSystem, x, y, global.ppPart4, 1);

if (ppFrames == ppFramesMax - 1)
{
	part_type_orientation(global.ppPart3,ppDir,ppDir,0,0,0);
	part_type_scale(global.ppPart3,1.5,0.5);
	part_particles_create(global.partSystem, x, y, global.ppPart3, 1);
	part_particles_create(global.partSystem, x, y, global.ppPart, 10);
}