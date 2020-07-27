if (part_emitter_exists(global.partSystem, ppEmitter))
{
	part_emitter_region(global.partSystem, ppEmitter, drawX - interactRange, drawX + interactRange, drawY - interactRange, drawY + interactRange, ps_shape_ellipse, ps_distr_gaussian);
}