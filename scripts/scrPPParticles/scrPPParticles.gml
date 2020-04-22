//Reuse jump particles, change some stuff, then change back

part_type_direction(global.ppPart,ppDir-200,ppDir-160,0,0);
part_particles_create(global.partSystem, x, y, global.ppPart, 2);