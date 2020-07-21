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

//Init notification variables
notificationTimeMax = 360;
notificationTime = 0;
notificationText = "";
notificationYTarget = 16;
notificationY = 0;
notificationAlpha = 1;