if (!global.debugging)
{
	//Hide layers if they are for some reason visible in the editor
	var layerID = layer_get_id("Collision");
	layer_set_visible(layerID, false);
	layerID = layer_get_id("Triggers");
	layer_set_visible(layerID, false);
	//layerID = layer_get_id("Controllers");
	//layer_set_visible(layerID, false);
} else
{
	var layerID = layer_get_id("ForegroundEnvironment");
	layer_set_visible(layerID, false);
	layerID = layer_get_id("BackgroundEnvironment");
	layer_set_visible(layerID, false);
	layerID = layer_get_id("GroundTiles");
	layer_set_visible(layerID, false);
	layerID = layer_get_id("FakedGroundTiles");
	layer_set_visible(layerID, false);
}