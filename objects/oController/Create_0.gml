draw_set_font(fDefault);

//Setup music
alarm[0] = 1;

//Init save object
instance_create_layer(irandom(100), irandom(100), "Controllers", oSave);

scrHideEditorLayers();

//Init screen change variables
animationLength = 20;
animationScale = 15;
scrStartRoomStartAnimation();