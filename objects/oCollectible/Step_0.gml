//Some animation stuff
var wiggle = scrWave(drawX - 5, drawX + 5, 4, 0);
x = wiggle;

var wiggle = scrWave(drawY - 5, drawY + 5, 3, 1);
y = wiggle;

image_yscale = lerp(image_yscale, 1, 0.1);
image_xscale = lerp(image_xscale, 1, 0.1);

image_angle += rotSpeed;