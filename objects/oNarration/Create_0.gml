c = global.cWhite;
padding = 32;
drawText = true;

textList = ds_list_create();

ds_list_add(textList, "Hi, I'm a test sentence. Please, just play the game. Don't mind me.");

index = 0;

text = ds_list_find_value(textList, 0);

alarm[0] = 1;