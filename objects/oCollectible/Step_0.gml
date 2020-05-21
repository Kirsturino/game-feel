var wiggle = scrWave(drawX - 5, drawX + 5, 4, 0);
x = wiggle;

var wiggle = scrWave(drawY - 5, drawY + 5, 3, 1);
y = wiggle;

image_angle += rotSpeed;

if (!collected)
{
	part_particles_create(global.partSystem, x, y, global.secretPart, 1);
}