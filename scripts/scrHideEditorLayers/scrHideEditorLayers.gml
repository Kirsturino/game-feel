//Hide layers if they are for some reason visible in the editor
var layerID = layer_get_id("FakeCollision");
layer_set_visible(layerID, false);
layerID = layer_get_id("Collision");
layer_set_visible(layerID, false);
layerID = layer_get_id("Triggers");
layer_set_visible(layerID, false);
//layerID = layer_get_id("Controllers");
//layer_set_visible(layerID, false);