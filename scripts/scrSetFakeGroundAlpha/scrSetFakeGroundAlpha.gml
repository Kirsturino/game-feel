if (event_number == 0)
{
	shader_set(shdAlpha);
	shader_set_uniform_f(global.uAlpha, global.fakeLayerAlpha);
}