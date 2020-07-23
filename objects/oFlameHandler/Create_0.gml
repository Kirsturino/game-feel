/// @description Make visuals for flame hazard

flameSurf = surface_create(room_width + viewWidth, room_height + viewHeight);
introY = 64;

//Wave shader uniforms
uTime = shader_get_uniform(shdWave,"time")
uFrequency = shader_get_uniform(shdWave,"frequency")
uIntensity = shader_get_uniform(shdWave,"intensity")
frequency = 100.0;
//Lower value = more intense
intensity = 2;
spd = 1;

//if (surface_exists(flameSurf))
//{
//	scrFlameWall();
//}