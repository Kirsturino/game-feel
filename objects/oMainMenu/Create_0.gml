alarm[0] = 1;
lastButton = 0;

scrLoadOptions();
display_set_gui_size(viewWidth, viewHeight);

enum main_menu_page {
	main,
	settings,
	audio,
	graphics,
	controls,
	keyboardcontrols,
	controllercontrols,
	credits,
	quit,
	height
}

enum main_menu_element_type {
	script_runner,
	page_transfer,
	slider,
	shift,
	toggle,
	input,
	controllerinput
}

//Create pause main_menu pages
if (!file_exists("save.sav"))
{
	ds_menu_main = scrCreateMenu(
		["START",		main_menu_element_type.script_runner,	scrStartGame],
		["SETTINGS",	main_menu_element_type.page_transfer,	main_menu_page.settings],
		["QUIT",		main_menu_element_type.script_runner,	scrExitGame]
	);
} else
{
	ds_menu_main = scrCreateMenu(
	["CONTINUE",		main_menu_element_type.script_runner,	scrContinueGame],
	["NEW GAME",		main_menu_element_type.script_runner,	scrStartGame],
	["SETTINGS",	main_menu_element_type.page_transfer,	main_menu_page.settings],
	["QUIT",		main_menu_element_type.script_runner,	scrExitGame]
	);
}

ds_settings = scrCreateMenu(
	["AUDIO",		main_menu_element_type.page_transfer,	main_menu_page.audio],
	["GRAPHICS",	main_menu_element_type.page_transfer,	main_menu_page.graphics],
	["CONTROLS",	main_menu_element_type.page_transfer,	main_menu_page.controls],
	["BACK",		main_menu_element_type.page_transfer,	main_menu_page.main]
);

ds_menu_audio = scrCreateMenu(
	["MASTER",		main_menu_element_type.slider,			scrChangeVolume,		global.masterVolume,	[0,1]],
	["SFX",			main_menu_element_type.slider,			scrChangeVolume,		global.sfxVolume,		[0,1]],
	["MUSIC",		main_menu_element_type.slider,			scrChangeVolume,		global.musicVolume,		[0,1]],
	["AMBIENT",		main_menu_element_type.slider,			scrChangeVolume,		global.ambientVolume,	[0,1]],
	["BACK",		main_menu_element_type.page_transfer,	main_menu_page.settings]
);

ds_menu_graphics = scrCreateMenu(
	["RESOLUTION",	main_menu_element_type.shift,			scrChangeResolution,	global.resolution,		["640 x 360", "1280 x 720", "1920 x 1080", "2560 x 1440", "4096 x 2160"]],
	["FULLSCREEN",	main_menu_element_type.toggle,			scrChangeWindowMode,	global.fullscreen,		["FULLSCREEN", "WINDOWED"]],
	["BACK",		main_menu_element_type.page_transfer,	main_menu_page.settings]
);

ds_menu_controls = scrCreateMenu(
	["KEYBOARD",	main_menu_element_type.page_transfer,	main_menu_page.keyboardcontrols],
	["CONTROLLER",	main_menu_element_type.page_transfer,	main_menu_page.controllercontrols],
	["BACK",		main_menu_element_type.page_transfer,	main_menu_page.settings]
);

ds_menu_controls_keyboard = scrCreateMenu(
	["UP",			main_menu_element_type.input,			"key_up",				global.key_up],
	["LEFT",		main_menu_element_type.input,			"key_left",				global.key_left],
	["RIGHT",		main_menu_element_type.input,			"key_right",			global.key_right],
	["DOWN",		main_menu_element_type.input,			"key_down",				global.key_down],
	["JUMP",		main_menu_element_type.input,			"key_jump",				global.key_jump],
	["PULL/CONFIRM",main_menu_element_type.input,			"key_pull",				global.key_pull],
	["PUSH/RETURN",	main_menu_element_type.input,			"key_push",				global.key_push],
	["BACK",		main_menu_element_type.page_transfer,	main_menu_page.controls]
);

ds_menu_controls_controller = scrCreateMenu(
	["UP",			main_menu_element_type.controllerinput,			"button_up",				global.button_up],
	["LEFT",		main_menu_element_type.controllerinput,			"button_left",				global.button_left],
	["RIGHT",		main_menu_element_type.controllerinput,			"button_right",				global.button_right],
	["DOWN",		main_menu_element_type.controllerinput,			"button_down",				global.button_down],
	["JUMP",main_menu_element_type.controllerinput,					"button_jump",				global.button_jump],
	["PULL",main_menu_element_type.controllerinput,					"button_pull",				global.button_pull],
	["PUSH",	main_menu_element_type.controllerinput,				"button_push",				global.button_push],
	["BACK",		main_menu_element_type.page_transfer,	main_menu_page.controls]
);

page = 0;
menu_pages = [ds_menu_main, ds_settings, ds_menu_audio, ds_menu_graphics, ds_menu_controls, ds_menu_controls_keyboard, ds_menu_controls_controller];

var i = 0;
var array_length = array_length_1d(menu_pages);

repeat(array_length)
{
	menu_option[i] = 0;
	i++;
}

inputting = false;