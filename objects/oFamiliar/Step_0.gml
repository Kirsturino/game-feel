//Follow player loosely

var wiggle = scrWave(-6, 6, 2, 0);
x = lerp(x, oPlayer.x + wiggle, 0.15);

wiggle = scrWave(-8, 4, 3, 1);
y = lerp(y, oPlayer.y - 20 + wiggle, 0.15);

//Particles
var part = scrChance(0.1);
if (part)
{
	part_particles_create(global.partSystem, x, y, global.ambientPart, 1);
}

if (oPlayer.ppFrames == oPlayer.ppFramesMax && oPlayer.state != scrDead)
{
	part_particles_create(global.partSystem, x, y, global.trailPart, 1);
}