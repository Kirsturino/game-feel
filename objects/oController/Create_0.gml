draw_set_font(fDefault);

//Setup music
alarm[0] = 1;
alarm[5] = 1;

scrHideEditorLayers();

//Init screen change variables
animationLength = 20;
animationScale = 15;
scrStartRoomStartAnimation();

//Init pause menu
instance_create_layer(0, 0, layer, oPauseMenu);