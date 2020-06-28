/// @description Draw freecam indicators

if (state == scrFreeCam)
{
	margin = lerp(margin, maxMargin, 0.1);
	var c = global.cWhite;
	var curXX = camera_get_view_x(view);
	var curYY = camera_get_view_y(view);
	
	draw_roundrect_color(curXX + margin, curYY + margin, curXX + viewWidth - margin, curYY + viewHeight - margin, c, c, true);
}