//Init system
global.partSystem = part_system_create_layer("Particles", true);

global.ambientEmitter = part_emitter_create(global.partSystem);

//Jump particles
global.jumpPart = part_type_create();
part_type_shape(global.jumpPart,pt_shape_pixel);
part_type_size(global.jumpPart,1,1,0,0);
part_type_scale(global.jumpPart,1,1);
part_type_color1(global.jumpPart,16777215);
part_type_alpha2(global.jumpPart,1,0);
part_type_speed(global.jumpPart,0.50,1,0,0);
part_type_direction(global.jumpPart,45,135,0,0);
part_type_gravity(global.jumpPart,0.01,270);
part_type_orientation(global.jumpPart,0,0,0,0,1);
part_type_blend(global.jumpPart,1);
part_type_life(global.jumpPart,5,20);

//PP particles
global.ppPart = part_type_create();
part_type_shape(global.ppPart,pt_shape_star);
part_type_size(global.ppPart,0.05,0.15,0,0);
part_type_scale(global.ppPart,1,1);
part_type_color1(global.ppPart,16777215);
part_type_alpha2(global.ppPart,1,0);
part_type_speed(global.ppPart,0.50,1,-0.005,0);
part_type_direction(global.ppPart,45,135,0,0);
part_type_gravity(global.ppPart,0.001,270);
part_type_orientation(global.ppPart,0,359,2,0,1);
part_type_blend(global.ppPart,1);
part_type_life(global.ppPart,60,120);

//Push & Pull object emitter particles
global.ppEmitterPart = part_type_create();
part_type_shape(global.ppEmitterPart,pt_shape_flare);
part_type_size(global.ppEmitterPart,0.05,0.15,0,0);
part_type_scale(global.ppEmitterPart,0.5,0.5);
part_type_color1(global.ppEmitterPart,c_yellow);
part_type_alpha3(global.ppEmitterPart,0,0.5,0);
part_type_speed(global.ppEmitterPart,0.1,0.2,0,0);
part_type_direction(global.ppEmitterPart,0,359,0,0);
part_type_orientation(global.ppEmitterPart,0,0,0,0,1);
part_type_blend(global.ppEmitterPart,1);
part_type_life(global.ppEmitterPart,120,160);

//Ambient emitter particles
global.ambientPart = part_type_create();
part_type_shape(global.ambientPart,pt_shape_flare);
part_type_size(global.ambientPart,0.05,0.1,0,0.01);
part_type_scale(global.ambientPart,1,1);
part_type_color1(global.ambientPart,c_white);
part_type_alpha3(global.ambientPart,0,0.2,0);
part_type_speed(global.ambientPart,0.05,0.2,0,0);
part_type_direction(global.ambientPart,0,359,0.5,10);
part_type_orientation(global.ambientPart,0,0,0,0,1);
part_type_blend(global.ambientPart,1);
part_type_life(global.ambientPart,240,360);

//Restore particles
global.restorePart = part_type_create();
part_type_shape(global.restorePart,pt_shape_line);
part_type_size(global.restorePart,0.05,0.15,0,0);
part_type_scale(global.restorePart,1,1);
part_type_color1(global.restorePart,c_yellow);
part_type_alpha2(global.restorePart,1,0);
part_type_speed(global.restorePart,1,2,-0.04,0);
part_type_direction(global.restorePart,0,359,0,0);
part_type_gravity(global.restorePart,0.001,270);
part_type_orientation(global.restorePart,0,359,5,0,0);
part_type_blend(global.restorePart,1);
part_type_life(global.restorePart,30,50);