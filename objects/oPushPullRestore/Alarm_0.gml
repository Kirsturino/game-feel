active = true;

//Particles
part_particles_create(global.partSystem, x, y, global.restorePart, 5);

//SFX
if (scrOnscreen())
{
	audio_play_sound(sndRestoreActive, 5, false);
}