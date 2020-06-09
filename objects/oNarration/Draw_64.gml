/// @description Draw text

if (!drawText) exit;

var drawX = padding;
var drawY = viewHeight - padding;

draw_set_halign(fa_left);
draw_set_font(fDebug);

//Offset shadow
draw_text_ext_color(drawX + 1, drawY + 1, string(string_copy(text, 1, index)), 16, viewWidth - padding + 1,  global.cBlack, global.cBlack, global.cBlack, global.cBlack, 1);

draw_text_ext_color(drawX, drawY, string(string_copy(text, 1, index)), 16, viewWidth - padding,  c, c, c, c, 1);