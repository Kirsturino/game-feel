//Init system
global.partSystem = part_system_create_layer("Particles", true);

global.ambientEmitter = part_emitter_create(global.partSystem);

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
part_type_life(global.ppPart,30,60);

//Secondary PP particles
global.ppPart2 = part_type_create();
part_type_shape(global.ppPart2,pt_shape_line);
part_type_size(global.ppPart2,0.02,0.07,0,0);
part_type_scale(global.ppPart2,1,1);
part_type_color1(global.ppPart2,16777215);
part_type_alpha2(global.ppPart2,1,0);
part_type_speed(global.ppPart2,0.25,0.8,-0.002,0);
part_type_direction(global.ppPart2,45,135,0,0);
part_type_gravity(global.ppPart2,0.001,270);
part_type_orientation(global.ppPart2,0,0,0,0,1);
part_type_blend(global.ppPart2,1);
part_type_life(global.ppPart2,60,120);

//Tertiary PP particles
global.ppPart3 = part_type_create();
part_type_shape(global.ppPart3,pt_shape_disk);
part_type_size(global.ppPart3,0.3,0.3,0,0);
part_type_scale(global.ppPart3,1.5,0.5);
part_type_color1(global.ppPart3,16777215);
part_type_alpha2(global.ppPart3,1,0);
part_type_speed(global.ppPart3,0,0,0,0);
part_type_direction(global.ppPart3,0, 0,0,0);
part_type_gravity(global.ppPart3,0,270);
part_type_orientation(global.ppPart3,0,0,0,0,1);
part_type_blend(global.ppPart3,1);
part_type_life(global.ppPart3,10, 10);
part_type_step(global.ppPart3, 1, global.ambientPart);

//Fourth PP particles
global.ppPart4 = part_type_create();
part_type_shape(global.ppPart4,pt_shape_line);
part_type_size(global.ppPart4,0.1,0.2,0,0);
part_type_scale(global.ppPart4,1,1);
part_type_color1(global.ppPart4,16777215);
part_type_alpha2(global.ppPart4,1,0);
part_type_speed(global.ppPart4,1,3,-0.002,0);
part_type_direction(global.ppPart4,45,135,0,0);
part_type_gravity(global.ppPart4,0.001,270);
part_type_orientation(global.ppPart4,0,0,0,10,1);
part_type_blend(global.ppPart4,1);
part_type_life(global.ppPart4,30,40);

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

//Secret particles
global.secretPart = part_type_create();
part_type_shape(global.secretPart,pt_shape_star);
part_type_size(global.secretPart,0.05,0.15,0,0);
part_type_scale(global.secretPart,0.5,0.5);
//Color stated in secret object
part_type_alpha3(global.secretPart,0,0.5,0);
part_type_speed(global.secretPart,0.1,0.2,0,0);
part_type_direction(global.secretPart,0,359,0,0);
part_type_orientation(global.secretPart,0,0,0,0,1);
part_type_blend(global.secretPart,1);
part_type_life(global.secretPart,120,160);