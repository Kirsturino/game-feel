draw_set_font(fDefault);

scrHideEditorLayers();

//Init screen change variables
animationLength = 20;
animationScale = 15;
scrStartRoomStartAnimation();

//Init controller
alarm[5] = 1;

//Init pause menu
instance_create_layer(0, 0, "Controllers", oPauseMenu);

//Init notification variables
notificationTimeMax = 360;
notificationTime = 0;
notificationText = "";
notificationYTarget = 16;
notificationY = 0;
notificationAlpha = 1;

instance_create_layer(0, 0, "Controllers", oMusicController);

test = 0;
test2 = 100;