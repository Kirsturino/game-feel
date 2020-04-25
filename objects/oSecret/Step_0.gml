var wiggle = scrWave(drawX - 5, drawX + 5, 4, 0);
x = wiggle;

var wiggle = scrWave(drawY - 5, drawY + 5, 3, 1);
y = wiggle;

image_angle += rotSpeed;

part_particles_create(global.partSystem, x, y, global.secretPart, 1);

if (despawn)
{
	part_particles_create(global.partSystem, x, y, global.secretPart, 100);
	scrSetShake(10, 10);
	scrFreeze(60);
	instance_destroy();
}