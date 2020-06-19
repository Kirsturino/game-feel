//Determine grass type
width = sprite_width;
height = sprite_height;
bladeSize = 1;
bladeSeparation = 3;
grassColor = global.cGreenLight;

alarm[0] = 1;

uTime = shader_get_uniform(shdGrass, "uTime");
playerX = shader_get_uniform(shdGrass, "playerX");
playerY = shader_get_uniform(shdGrass, "playerY");
playerGround = shader_get_uniform(shdGrass, "playerGround");
rng = shader_get_uniform(shdGrass, "rng");
windDir = shader_get_uniform(shdGrass, "dir");
randomSway = 0;
time = 0;
dir = 1;