/// @description Draw freecam indicators

margin = lerp(margin, marginTarget, 0.1);
var c = global.cWhite;
var curXX = camera_get_view_x(view);
var curYY = camera_get_view_y(view);

if (margin > -7)
{
	draw_roundrect_color(curXX + margin, curYY + margin, curXX + viewWidth - margin, curYY + viewHeight - margin, c, c, true);
}