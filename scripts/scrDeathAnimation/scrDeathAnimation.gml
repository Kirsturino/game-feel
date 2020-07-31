//Color
colorTo = cantDashColor;
merge_color(color, colorTo, 0.1);

spriteRot = scrWave(-45, 45, 1, 0);
xDrawScale = lerp(xDrawScale, 0, .02);
yDrawScale = lerp(yDrawScale, 0, .02);

curSprite = sPlayerDead;