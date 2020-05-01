rot = 0;
rotSpeed = 2;
triRotSpeed = 20;

xScale = 1;
yScale = 1;
drawX = x;
drawY = y;

color = global.cYellow;
inactiveColor = global.cWhite;
colorTo = global.cYellow;

circleAlpha = 0.1;

interactRange = 70;
visualInteractRange = interactRange;

//Variables for indicator triangle
drawTri = false;
triDirTo = 0;
triSpeed = 0;
triDir = 0;
triAlpha = 0;
offset = 22.5;

//Init particles
ppEmitter = part_emitter_create(global.partSystem);

//Spawn restore object for cool gameplay
if (spawnRestore)
{
	instance_create_layer(x, y, "Interactables", oPushPullRestore);
}