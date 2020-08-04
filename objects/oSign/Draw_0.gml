scrDrawShadow(sprite_index, x, y - 1, 1, 1, 0);
draw_self();
	
draw_set_halign(fa_center);
draw_set_font(fDefault);
var c = global.cBlack;
draw_text_color(x + 1, y - sprite_height - popUpY, pullKey, c, c, c, c, popUpAlpha);
c = global.cWhite;
draw_text_color(x, y - sprite_height - popUpY, pullKey, c, c, c, c, popUpAlpha);
