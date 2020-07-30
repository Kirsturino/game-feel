if (ds_list_find_index(global.roomList, rmSurfaceSeven) != -1)
{
	ds_menu_levelselect = scrCreateMenu(
	["PULL ALTAR",	main_menu_element_type.script_runner,	scrGoToPullAltar],
	["PUSH ALTAR",	main_menu_element_type.script_runner,	scrGoToPushAltar],
	["BRIEF RESPITE",main_menu_element_type.script_runner,	scrGoToBriefRespite],
	["THE END",		main_menu_element_type.script_runner,	scrGoToEnd],
	["BACK",		main_menu_element_type.page_transfer,	main_menu_page.main]
	);
} else if (ds_list_find_index(global.roomList, rmSurfaceSeven) != -1)
{
	ds_menu_levelselect = scrCreateMenu(
	["PULL ALTAR",	main_menu_element_type.script_runner,	scrGoToPullAltar],
	["PUSH ALTAR",	main_menu_element_type.script_runner,	scrGoToPushAltar],
	["BRIEF RESPITE",	main_menu_element_type.script_runner,	scrGoToBriefRespite],
	["BACK",		main_menu_element_type.page_transfer,	main_menu_page.main]
	);
} else if (ds_list_find_index(global.roomList, rmCaveSeven) != -1)
{
	ds_menu_levelselect = scrCreateMenu(
	["PULL ALTAR",	main_menu_element_type.script_runner,	scrGoToPullAltar],
	["PUSH ALTAR",	main_menu_element_type.script_runner,	scrGoToPushAltar],
	["BACK",		main_menu_element_type.page_transfer,	main_menu_page.main]
	);
} else if (ds_list_find_index(global.roomList, rmCaveThree) != -1)
{
	ds_menu_levelselect = scrCreateMenu(
	["PULL ALTAR",	main_menu_element_type.script_runner,	scrGoToPullAltar],
	["BACK",		main_menu_element_type.page_transfer,	main_menu_page.main]
	);
} else
{
	ds_menu_levelselect = scrCreateMenu(
	["BACK",		main_menu_element_type.page_transfer,	main_menu_page.main]
	);
}