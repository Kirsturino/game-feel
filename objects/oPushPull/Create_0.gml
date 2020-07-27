depth = 10;

rot = 0;
rotSpeed = 2;
triRotSpeed = 20;

xScale = 1;
yScale = 1;
drawX = x;
drawY = y;

color = global.cBlueDark;
activeColor = global.cYellow;
inactiveColor = global.cWhite;
colorTo = global.cBlueLight;

circleAlpha = 0.1;


visualInteractRange = interactRange;

//Variables for indicator triangle
drawTri = false;
triDirTo = 0;
triSpeed = 0;
triDir = 0;
triAlpha = 0;
offset = 22.5;

//Init particles
if (global.allowPull)
{
	ppEmitter = part_emitter_create(global.partSystem);
	var partAmount = clamp(interactRange / 40, 1, 4);
	part_emitter_stream(global.partSystem, ppEmitter, global.ppEmitterPart, partAmount);
} else
{
	ppEmitter = noone;
}

//Spawn restore object for cool gameplay
if (spawnRestore)
{
	instance_create_layer(x, y, "Interactables", oPushPullRestore);
}