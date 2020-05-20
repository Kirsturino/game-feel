switch (argument0)
{
	case 0:
		global.fullscreen = 0;
		window_set_fullscreen(true);
	break;
	
	case 1:
		global.fullscreen = 1;
		window_set_fullscreen(false);
		window_set_size(viewWidth * global.windowScale, viewHeight * global.windowScale);
	break;
}