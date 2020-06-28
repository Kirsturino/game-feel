//Setup camera variables
curX = camera_get_view_x(view);
curY = camera_get_view_y(view);
xTo = 0;
yTo = 0;
xx = clamp(oPlayer.x - viewWidth / 2, 0, room_width - viewWidth);
yy = clamp(oPlayer.y - viewHeight / 2, 0, room_height - viewHeight);
camera_set_view_pos(view, xx, yy);

window_set_size(viewWidth * global.windowScale, viewHeight * global.windowScale);
alarm[0] = 1;

#macro view view_camera[0]
camera_set_view_size(view, viewWidth, viewHeight);

surface_resize(application_surface, viewWidth , viewHeight);

//Camera shake variables
shakeDuration = 0;
shakeAmount = 0;
shakeX = 0;
shakeY = 0;

//Camera push variables
pushX = 0;
pushY = 0;

//Player camera manipulation
downTimerMax = 30;
downTimer = 0;

upTimerMax = 30;
upTimer = 0;

cameraOffsetY = 0;
offsetAmount = 96;

state = scrFollowCam;

//Freecam variables
moveSpeed = 5;
hsp = 0;
vsp = 0;
left = false;
right = false;
up = false;
down = false;
margin = 0;
maxMargin = 8;