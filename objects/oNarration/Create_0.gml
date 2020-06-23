//Init variables
c = global.cWhite;
padding = 32;
drawText = true;
textNumber = 0;
textAmount = 0;
curTextAmount = 0;
//\n
textList = ds_list_create();

//Get player input keys for tutorial
leftKey = scrGetUniqueKeys(global.key_left);
rightKey = scrGetUniqueKeys(global.key_right);
jumpKey = scrGetUniqueKeys(global.key_jump);
pullKey = scrGetUniqueKeys(global.key_pull);
pushKey = scrGetUniqueKeys(global.key_push);

leftButton = string_lower(scrGetUniqueKeys(global.button_left));
rightButton = string_lower(scrGetUniqueKeys(global.button_right));
jumpButton = scrGetUniqueKeys(global.button_jump);
pullButton = string_lower(scrGetUniqueKeys(global.button_pull));
pushButton = string_lower(scrGetUniqueKeys(global.button_push));

//Init text list
ds_list_add(textList, "Something went wrong. Oof.");

if (global.controller == noone)
{
	ds_list_add(textList, "You can move by pressing the " + leftKey + " and " + rightKey + " keys.\nOh, and jump by pressing " + jumpKey + ", I guess.");
	ds_list_add(textList, "But you probably already knew that, didn't you?");

	ds_list_add(textList, "You can pull on these things by pressing " + pullKey + ".\nThe pull will always direct you towards the centre.");
	ds_list_add(textList, "The pull works in 45 degree increments, indicated\nby the hexagon.");
	
	ds_list_add(textList, "I should mention, you dash further by\n holding the jump or pull key.");
	ds_list_add(textList, "It's pretty important for clearing most of the screens\nin the game, so uh... Yeah. Soz.");
	
	ds_list_add(textList, "While holding jump or pull you'll also fall slightly\nslower. Gives you some leeway in tight jumps.");
	
	ds_list_add(textList, "Wow, you made it! You can now push by pressing " + pushKey + ".\nTry it out! You totally didn't see this coming, right?");
	
	ds_list_add(textList, "You can fall through platforms by pressing down \nand jump.");
	
	ds_list_add(textList, "Get a sneak peek into the level by holding up or down.");
} else
{
	ds_list_add(textList, "You can move by using the " + leftButton + " and " + rightButton + " buttons or the joystick. Also, jump by pressing " + jumpButton + ".");
	ds_list_add(textList, "But you probably already knew that, didn't you?");

	ds_list_add(textList, "You can pull on these things by pressing " + pullKey + ".\nThe pull will always direct you towards the centre.");
	ds_list_add(textList, "The pull works in 45 degree increments, indicated\nby the hexagon.");
	
	ds_list_add(textList, "I should mention, you dash further by\n holding the jump or pull button.");
	ds_list_add(textList, "It's pretty important for clearing most of the screens\nin the game, so uh... Yeah. Soz.");
	
	ds_list_add(textList, "While holding jump or pull you'll also fall slightly\nslower. Gives you some leeway in tight jumps.");
	
	ds_list_add(textList, "Wow, you made it! You can now push by pressing\n" + pushButton + ".Try it out!");
	
	ds_list_add(textList, "You can fall through platforms by pressing down \nand jump.");
	
	ds_list_add(textList, "Get a sneak peek into the level by holding up or down.");
}

index = 0;

switch (room)
{
	case (rmSurfaceOne):
		textNumber = 1;
		textAmount = 1;
	break;
	
	case (rmCaveFour):
		textNumber = 3;
		textAmount = 1;
	break;
	
	case (rmCaveFive):
		textNumber = 5;
		textAmount = 1;
	break;
	
	case (rmCaveSix):
		textNumber = 7;
		textAmount = 0;
	break;
	
	case (rmCaveEight):
		textNumber = 8;
		textAmount = 0;
	break;
	
	case (rmSurfaceFour):
		textNumber = 9;
		textAmount = 0;
	break;
	
	case (rmCaveTwo):
		textNumber = 10;
		textAmount = 0;
	break;
	
	default:
		textNumber = 0;
		textAmount = 0;
	break;
}

text = ds_list_find_value(textList, textNumber);

if (textNumber != 0 && ds_list_find_index(global.roomList, room) == -1)
{
	alarm[0] = 1;
} else if (global.debugging)
{
	alarm[0] = 1;
}