//Visuals for resetting PP. This is literally just Downwell
if (alarm[2] != -1)
{
	var x1 = x - blockSize / 2;
	var x2 = x + blockSize / 2;
	var y1 = y - blockSize + alarm[2];
	var y2 = y1 + alarm[2] * 2;
	
	draw_rectangle_color(x1, y1, x2, y2, global.cYellow, global.cYellow, global.cYellow, global.cYellow, false);
}