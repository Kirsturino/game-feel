//Color
colorTo = cantDashColor;
merge_color(color, colorTo, 0.1);

spriteRot = lerp(spriteRot, 360, .02);
xDrawScale = lerp(xDrawScale, 0, .02);
yDrawScale = lerp(yDrawScale, 0, .02);

y--;

curSprite = sPlayerDead;