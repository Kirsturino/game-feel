var camX = camera_get_view_x(view) + oCamera.viewWidth / 2;
var camY = camera_get_view_y(view) + oCamera.viewHeight / 2;

if (abs(x - camX) < oCamera.viewWidth / 2 && abs(y - camY) < oCamera.viewHeight / 2)
{
	return true;
} else
{
	return false;
}