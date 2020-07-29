//Init system
global.partSystem = part_system_create_layer("Particles", true);
global.partSystemSecret = part_system_create_layer("BackgroundEnvironment", true);

global.ambientEmitter = part_emitter_create(global.partSystem);
global.rainEmitter = part_emitter_create(global.partSystem);

//Ambient emitter particles
global.ambientPart = part_type_create();
part_type_shape(global.ambientPart,pt_shape_flare);
part_type_size(global.ambientPart,0.05,0.1,0,0.01);
part_type_scale(global.ambientPart,1,1);
part_type_color1(global.ambientPart,global.cWhite);
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
part_type_color1(global.jumpPart,global.cWhite);
part_type_alpha2(global.jumpPart,1,0);
part_type_speed(global.jumpPart,0.50,1,0,0);
part_type_direction(global.jumpPart,45,135,0,0);
part_type_gravity(global.jumpPart,0.05,270);
part_type_orientation(global.jumpPart,0,0,0,0,1);
part_type_blend(global.jumpPart,1);
part_type_life(global.jumpPart,20,30);

//PP particles
global.ppPart = part_type_create();
part_type_shape(global.ppPart,pt_shape_star);
part_type_size(global.ppPart,0.05,0.15,0,0);
part_type_scale(global.ppPart,1,1);
part_type_color1(global.ppPart,global.cWhite);
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
part_type_color1(global.ppPart2,global.cWhite);
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
part_type_color1(global.ppPart3,global.cWhite);
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
part_type_color1(global.ppPart4,global.cWhite);
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
part_type_color1(global.ppEmitterPart,global.cYellow);
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
part_type_color1(global.restorePart,global.cWhite);
part_type_alpha2(global.restorePart,1,0);
part_type_speed(global.restorePart,1,2,-0.04,0);
part_type_direction(global.restorePart,0,359,0,0);
part_type_gravity(global.restorePart,0.001,270);
part_type_orientation(global.restorePart,0,359,5,0,0);
part_type_blend(global.restorePart,1);
part_type_life(global.restorePart,30,50);

//Secret particles
global.secretPart = part_type_create();
part_type_shape(global.secretPart,pt_shape_flare);
part_type_size(global.secretPart,0.05,0.15,0,0);
part_type_scale(global.secretPart,0.5,0.5);
part_type_color3(global.secretPart,global.cYellow, global.cOrange, global.cOrangeDark);
part_type_alpha3(global.secretPart,0,0.5,0);
part_type_speed(global.secretPart,0.1,0.2,0,0);
part_type_direction(global.secretPart,0,359,0,0);
part_type_orientation(global.secretPart,0,0,0,0,1);
part_type_blend(global.secretPart,1);
part_type_life(global.secretPart,120,160);

//Rain particles
global.rainPart = part_type_create();
part_type_shape(global.rainPart,pt_shape_line);
part_type_size(global.rainPart,0.1,0.2,0,0);
part_type_scale(global.rainPart,1,1);
part_type_color1(global.rainPart,global.cBlueLight);
part_type_alpha1(global.rainPart,0.2);
part_type_speed(global.rainPart,5,7,0,0);
part_type_direction(global.rainPart,280,280,0,0);
part_type_gravity(global.rainPart,0.001,270);
part_type_orientation(global.rainPart,0,0,0,0,1);
part_type_blend(global.rainPart,1);
part_type_life(global.rainPart,180,180);

//Death particles
global.deathPart = part_type_create();
part_type_shape(global.deathPart,pt_shape_line);
part_type_size(global.deathPart,0.2,0.4,0,0);
part_type_scale(global.deathPart,1,1);
part_type_color1(global.deathPart,global.cOrange);
part_type_alpha2(global.deathPart,1, 0);
part_type_speed(global.deathPart,3,6,-0.04,0);
part_type_direction(global.deathPart,0,359,0,0);
part_type_gravity(global.deathPart,0.001,270);
part_type_orientation(global.deathPart,0,0,0,0,1);
part_type_blend(global.deathPart,1);
part_type_life(global.deathPart,20,40);

//Familiar particles
global.trailPart = part_type_create();
part_type_shape(global.trailPart,pt_shape_flare);
part_type_size(global.trailPart,0.15,0.2,-0.01,0);
part_type_scale(global.trailPart,1,1);
part_type_color1(global.trailPart,global.cWhite);
part_type_alpha2(global.trailPart,0.5,0);
part_type_speed(global.trailPart,0,0,0,0);
part_type_life(global.trailPart,60,60);

//Walldrag particles
global.wallDragPart = part_type_create();
part_type_shape(global.wallDragPart,pt_shape_pixel);
part_type_size(global.wallDragPart,1,1,0,0);
part_type_scale(global.wallDragPart,1,1);
part_type_color1(global.wallDragPart,global.cBrownDark);
part_type_alpha2(global.wallDragPart,1,0);
part_type_speed(global.wallDragPart,0.1,0.2,0,0);
part_type_direction(global.wallDragPart,110,70,0,0);
part_type_blend(global.wallDragPart,1);
part_type_life(global.wallDragPart,5,20);

//Landing particles
global.landPart = part_type_create();
part_type_shape(global.landPart,pt_shape_explosion);
part_type_size(global.landPart,0.1,0.1,0,0);
part_type_scale(global.landPart,1,1);
part_type_color1(global.landPart,global.cWhite);
part_type_alpha2(global.landPart,0.2,0);
part_type_speed(global.landPart,0.05,0.1,0,0);
part_type_direction(global.landPart,0,180,0,0);
part_type_blend(global.landPart,1);
part_type_life(global.landPart,60,120);

//Walk particles
global.walkPart = part_type_create();
part_type_shape(global.walkPart,pt_shape_line);
part_type_size(global.walkPart,0.02,0.07,0,0);
part_type_scale(global.walkPart,1,1);
part_type_color1(global.walkPart,global.cWhite);
part_type_alpha2(global.walkPart,1,0);
part_type_speed(global.walkPart,0.25,0.8,-0.002,0);
part_type_direction(global.walkPart,45,135,0,0);
part_type_gravity(global.walkPart,0.001,270);
part_type_orientation(global.walkPart,0,0,0,0,1);
part_type_blend(global.walkPart,1);
part_type_life(global.walkPart,30,60);

//Rising smoke particles
global.smokePart = part_type_create();
part_type_shape(global.smokePart,pt_shape_explosion);
part_type_size(global.smokePart,1,2,0,0);
part_type_scale(global.smokePart,1,1);
part_type_color1(global.smokePart,global.cBlack);
part_type_alpha2(global.smokePart,0.2,0);
part_type_speed(global.smokePart,1,1.5,0.01,0);
part_type_direction(global.smokePart,90,90,0,0);
part_type_orientation(global.smokePart,0,360,0,10,1);
part_type_blend(global.smokePart,false);
part_type_life(global.smokePart,60,120);

//Rising sparks and stuff
global.sparkPart = part_type_create();
part_type_shape(global.sparkPart,pt_shape_flare);
part_type_size(global.sparkPart,0.01,0.1,0,0);
part_type_scale(global.sparkPart,1,1);
part_type_color3(global.sparkPart,global.cYellow, global.cOrange, global.cBlack);
part_type_alpha3(global.sparkPart, 1, 1, 0);
part_type_speed(global.sparkPart,1,2,0.01,0);
part_type_direction(global.sparkPart,90,90,0,30);
part_type_orientation(global.sparkPart,0,360,0,90,1);
part_type_blend(global.sparkPart,1);
part_type_life(global.sparkPart,60,120);

//Ambient sparks
global.ambientSparkPart = part_type_create();
part_type_shape(global.ambientSparkPart,pt_shape_flare);
part_type_size(global.ambientSparkPart,0.01,0.1,0,0);
part_type_scale(global.ambientSparkPart,1,1);
part_type_color3(global.ambientSparkPart,global.cYellow, global.cOrange, global.cBlack);
part_type_alpha3(global.ambientSparkPart, 0, 1, 0);
part_type_speed(global.ambientSparkPart,1,2,0.01,0);
part_type_direction(global.ambientSparkPart,90,90,0,30);
part_type_orientation(global.ambientSparkPart,0,360,0,90,1);
part_type_blend(global.ambientSparkPart,1);
part_type_life(global.ambientSparkPart,120,180);