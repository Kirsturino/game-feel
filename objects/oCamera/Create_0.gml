//Setup camera variables
viewWidth = 1920 / 6;
viewHeight = 1080 / 6;
windowScale = 4;

window_set_size(viewWidth * windowScale, viewHeight * windowScale);
alarm[0] = 1;

#macro view view_camera[0]
camera_set_view_size(view, viewWidth, viewHeight);

surface_resize(application_surface, viewWidth , viewHeight);


var xx = clamp(oPlayer.x - viewWidth / 2, 0, room_width - viewWidth);
var yy = clamp(oPlayer.y - viewHeight / 2, 0, room_height - viewHeight);
camera_set_view_pos(view, xx, yy);

//Camera shake variables
shakeDuration = 0;
shakeAmount = 0;
shakeX = 0;
shakeY = 0;