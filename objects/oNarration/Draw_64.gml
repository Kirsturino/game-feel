/// @description Draw text

if (!drawText) exit;

var drawX = padding;
var drawY = padding;
var boxPadding = 4;

draw_set_halign(fa_left);
draw_set_font(fDebug);


//Draw text background
if (alarm[0] != -1 || alarm[1] != -1)
{
	draw_set_alpha(0.7);
	draw_roundrect_color(drawX, drawY * 1.05, viewWidth - padding, boxPadding , global.cGray, global.cGray, false);
	draw_set_alpha(1);
}

//Offset shadow
draw_text_ext_color(drawX + 5, drawY * 0.2 + 1, string(string_copy(text, 1, index)), 16, viewWidth - padding * 2 + 1,  global.cBlack, global.cBlack, global.cBlack, global.cBlack, 1);

draw_text_ext_color(drawX + 4, drawY * 0.2, string(string_copy(text, 1, index)), 16, viewWidth - padding * 2,  c, c, c, c, 1);