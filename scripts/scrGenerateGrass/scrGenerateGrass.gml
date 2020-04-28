with (instance_create_layer(bbox_left + 2, bbox_top - blockSize / 2, "ForegroundEnvironment", oGrass))
{
	image_xscale = other.image_xscale;
	width = sprite_width - 7;
	
	image_yscale *= .5;
	height = sprite_height + 1;
}

with (instance_create_layer(bbox_left + 2, bbox_top - blockSize / 2, "BackgroundEnvironment", oGrass))
{
	image_xscale = other.image_xscale;
	width = sprite_width - 7;
	
	image_yscale *= .5;
	height = sprite_height + 1;
}