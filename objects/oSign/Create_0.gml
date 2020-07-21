//Init variables
c = global.cWhite;
padding = 32;
drawText = false;
textNumber = 0;
textAmount = 0;
curTextAmount = 0;
index = 0;
active = false;
popUpY = 0;
popUpAlpha = 0;

//Get player input keys for tutorial
if (global.controller == noone)
{
	leftKey = scrGetUniqueKeys(global.key_left);
	rightKey = scrGetUniqueKeys(global.key_right);
	jumpKey = scrGetUniqueKeys(global.key_jump);
	pullKey = scrGetUniqueKeys(global.key_pull);
	pushKey = scrGetUniqueKeys(global.key_push);
	freeCamKey = scrGetUniqueKeys(global.key_camToggle);
} else
{
	leftKey = string_lower(scrGetUniqueKeys(global.button_left));
	rightKey = string_lower(scrGetUniqueKeys(global.button_right));
	jumpKey = scrGetUniqueKeys(global.button_jump);
	pullKey = string_lower(scrGetUniqueKeys(global.button_pull));
	pushKey = string_lower(scrGetUniqueKeys(global.button_push));
	freeCamKey = string_lower(scrGetUniqueKeys(global.button_camToggle));
}


//Outline shader stuff
upixelH = shader_get_uniform(shdOutline, "pixelH");
upixelW = shader_get_uniform(shdOutline, "pixelW");
texelW = texture_get_texel_width(sprite_get_texture(sprite_index, 0));
texelH = texture_get_texel_height(sprite_get_texture(sprite_index, 0));