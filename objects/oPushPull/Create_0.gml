rot = 0;
rotSpeed = 2;
triRotSpeed = 20;

xScale = 1;
yScale = 1;
drawX = x;
drawY = y;

color = c_white;
inactiveColor = c_white;
activeColor = c_yellow;
colorTo = c_white;

circleAlpha = 0.1;

interactRange = oPlayer.interactDistanceMax;

//Variables for indicator triangle
drawTri = false;
triDirTo = 0;
triSpeed = 0;
triDir = 0;
triAlpha = 0;
offset = 22.5;

//Init particles
ppEmitter = part_emitter_create(global.partSystem);

//Test
instance_create_layer(x, y, "Interactables", oPushPullRestore);