//Follow any object
var wiggle = scrWave(-6, 6, 2, 0) * shouldWiggle;
var wiggle2 = scrWave(-8, 4, 3, 1) * shouldWiggle;


x = lerp(x, followTarget.x + wiggle, 0.15);
y = lerp(y, followTarget.y - yOffset + wiggle2, 0.15);

//Particles
var part = scrChance(0.1);
if (part)
{
	part_particles_create(global.partSystem, x, y, global.ambientPart, 1);
}

if (followTarget == oPlayer.id)
{
	if (oPlayer.ppFrames == oPlayer.ppFramesMax && oPlayer.state != scrDead)
	{
		part_type_color1(global.trailPart,global.cWhite);
		part_particles_create(global.partSystem, x, y, global.trailPart, 1);
	}
} else
{
	part_type_color1(global.trailPart,global.cOrangeDark);
	part_particles_create(global.partSystem, x, y, global.trailPart, 1);
}