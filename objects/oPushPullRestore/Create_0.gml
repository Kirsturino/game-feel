depth = 5;

//Animation variables
xScale = 0;
yScale = 0;
xScaleTo = 0;
yScaleTo = 0;
drawX = x;
drawY = y;
drawXTo = x;
drawYTo = y;

rot = 0;
color = global.cWhite;
rotSpeed = 2;

active = true;
activeTimer = 120;

inactiveColor = global.cGray;
activeColor = global.cWhite;
colorTo = global.cWhite

offset = random(2);

//Check if behind hidden walls
hidden = place_meeting(x, y, oFakeCollision);