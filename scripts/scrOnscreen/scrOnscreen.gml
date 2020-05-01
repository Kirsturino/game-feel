var camX = camera_get_view_x(view) + viewWidth / 2;
var camY = camera_get_view_y(view) + viewHeight / 2;

if (abs(x - camX) < viewWidth / 2 && abs(y - camY) < viewHeight / 2)
{
	return true;
} else
{
	return false;
}