//Reuse jump particles, change some stuff, then change back
part_type_direction(global.jumpPart,0,22.5,0,0);
part_type_speed(global.jumpPart,0.5,lastVsp/4,0,0);
	
part_particles_create(global.partSystem, x, y, global.jumpPart, 5);
part_type_direction(global.jumpPart,157.5,180,0,0);
part_particles_create(global.partSystem, x, y, global.jumpPart, 5);
	
part_type_direction(global.jumpPart,22.5,157.5,0,0);
part_type_speed(global.jumpPart,0.50,1,0,0);