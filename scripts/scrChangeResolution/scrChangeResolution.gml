switch (argument0)
{
	case 0:
		global.windowScale = 2;
	break;
	
	case 1:
		global.windowScale = 4;
	break;
	
	case 2:
		global.windowScale = 6;
	break;
	
	case 3:
		global.windowScale = 8;
	break;
	
	case 4:
		global.windowScale = 12;
	break;
}

global.resolution = argument0;

window_set_size(viewWidth * global.windowScale, viewHeight * global.windowScale);