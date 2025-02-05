lastButton = 0;
confirmPitch = 1.2;
xo = 0;

display_set_gui_size(viewWidth, viewHeight);

enum menu_page {
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

enum menu_element_type {
	script_runner,
	page_transfer,
	slider,
	shift,
	toggle,
	input,
	controllerinput
}

//Create pause menu pages
ds_menu_main = scrCreateMenu(
	["RESUME",		menu_element_type.script_runner,	scrResumeGame],
	["SETTINGS",	menu_element_type.page_transfer,	menu_page.settings],
	["EXIT",		menu_element_type.script_runner,	scrToMainMenu]
);

ds_settings = scrCreateMenu(
	["AUDIO",		menu_element_type.page_transfer,	menu_page.audio],
	["GRAPHICS",	menu_element_type.page_transfer,	menu_page.graphics],
	["CONTROLS",	menu_element_type.page_transfer,	menu_page.controls],
	["BACK",		menu_element_type.page_transfer,	menu_page.main]
);

ds_menu_audio = scrCreateMenu(
	["MASTER",		menu_element_type.slider,			scrChangeVolume,		global.masterVolume,	[0,1]],
	["SFX",			menu_element_type.slider,			scrChangeVolume,		global.sfxVolume,		[0,1]],
	["MUSIC",		menu_element_type.slider,			scrChangeVolume,		global.musicVolume,		[0,1]],
	["AMBIENT",		menu_element_type.slider,			scrChangeVolume,		global.ambientVolume,	[0,1]],
	["BACK",		menu_element_type.page_transfer,	menu_page.settings]
);

ds_menu_graphics = scrCreateMenu(
	["RESOLUTION",	menu_element_type.shift,			scrChangeResolution,		global.resolution,		["640 x 360", "1280 x 720", "1920 x 1080", "2560 x 1440", "4096 x 2160"]],
	["FULLSCREEN",	menu_element_type.toggle,			scrChangeWindowMode,		global.fullscreen,		["FULLSCREEN", "WINDOWED"]],
	["CHAR. OUTLINE",	main_menu_element_type.toggle,		scrChangeContrast,			!global.highContrast,	["NO", "YES"]],
	["BACK",		menu_element_type.page_transfer,	menu_page.settings]
);

ds_menu_controls = scrCreateMenu(
	["KEYBOARD",	menu_element_type.page_transfer,	menu_page.keyboardcontrols],
	["CONTROLLER",	menu_element_type.page_transfer,	menu_page.controllercontrols],
	["BACK",		menu_element_type.page_transfer,	menu_page.settings]
);

ds_menu_controls_keyboard = scrCreateMenu(
	["UP",			main_menu_element_type.input,			"key_up",				global.key_up],
	["LEFT",		main_menu_element_type.input,			"key_left",				global.key_left],
	["RIGHT",		main_menu_element_type.input,			"key_right",			global.key_right],
	["DOWN",		main_menu_element_type.input,			"key_down",				global.key_down],
	["JUMP",		main_menu_element_type.input,			"key_jump",				global.key_jump],
	["PULL/CONFIRM",main_menu_element_type.input,			"key_pull",				global.key_pull],
	["RESTART",		main_menu_element_type.input,			"key_restart",			global.key_restart],
	["FREECAM",		main_menu_element_type.input,			"key_camToggle",		global.key_camToggle],
	["BACK",		main_menu_element_type.page_transfer,	menu_page.controls]
);

ds_menu_controls_controller = scrCreateMenu(
	["UP",			main_menu_element_type.controllerinput,	"button_up",			global.button_up],
	["LEFT",		main_menu_element_type.controllerinput,	"button_left",			global.button_left],
	["RIGHT",		main_menu_element_type.controllerinput,	"button_right",			global.button_right],
	["DOWN",		main_menu_element_type.controllerinput,	"button_down",			global.button_down],
	["JUMP",		main_menu_element_type.controllerinput,	"button_jump",			global.button_jump],
	["DASH",		main_menu_element_type.controllerinput,	"button_pull",			global.button_pull],
	["RESTART",		main_menu_element_type.controllerinput,	"button_restart",		global.button_restart],
	["FREECAM",		main_menu_element_type.controllerinput,	"button_camToggle",		global.button_camToggle],
	["BACK",		main_menu_element_type.page_transfer,	menu_page.controls]
);


page = 0;
menu_pages =	[ds_menu_main, ds_settings, ds_menu_audio, 
				ds_menu_graphics, ds_menu_controls, ds_menu_controls_keyboard, 
				ds_menu_controls_controller];

var i = 0;
var array_length = array_length_1d(menu_pages);

repeat(array_length)
{
	menu_option[i] = 0;
	i++;
}

inputting = false;