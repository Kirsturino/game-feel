//Setup camera variables
camera_set_view_pos(view, 0, 0);

window_set_size(viewWidth * global.windowScale, viewHeight * global.windowScale);
alarm[0] = 1;

#macro menuView view_camera[0]
camera_set_view_size(menuView, viewWidth, viewHeight);

surface_resize(application_surface, viewWidth , viewHeight);