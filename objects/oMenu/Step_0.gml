if(!global.pause) exit;

up_p = keyboard_check_pressed(global.key_up);
down_p = keyboard_check_pressed(global.key_down);
left_p = keyboard_check_pressed(global.key_left);
right_p = keyboard_check_pressed(global.key_right);
enter_p = keyboard_check_pressed(global.key_enter);
confirm_p = keyboard_check_pressed(global.key_confirm);
back_p = keyboard_check_pressed(global.key_back);

var ds_grid = menu_pages[page]
var ds_height = ds_grid_height(ds_grid);
	
if (inputting)
{
	switch (ds_grid[# 1, menu_option[page]])
	{
		case menu_element_type.shift:
			var hinput = right_p - left_p;
			
			if (hinput != 0)
			{
				//put audio here later
				
				ds_grid[# 3, menu_option[page]]	+= hinput;
				ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], 0, array_length_1d(ds_grid[# 4, menu_option[page]]) - 1);
			}
		break;
		case menu_element_type.slider:
			
			var hinput = right_p - left_p;
			if (hinput != 0)
			{
				ds_grid[# 3, menu_option[page]]	+= hinput * 0.1;
				ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], 0, 1);
				script_execute(ds_grid[# 2, menu_option[page]], ds_grid[# 3, menu_option[page]]);
				
				//put audio here later
			}
		break
		case menu_element_type.toggle:
			var hinput = right_p - left_p;
			
			if (hinput != 0)
			{
				//put audio here later
				
				ds_grid[# 3, menu_option[page]]	+= hinput;
				ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], 0, 1);
			}
		break;
		case menu_element_type.input:
			var kk = keyboard_lastkey;
			
			if (kk != ds_grid[# 3, menu_option[page]]) //audio
			
			if (kk != global.key_confirm)
			{
				ds_grid[# 3, menu_option[page]] = kk;
				variable_global_set(ds_grid[# 2, menu_option[page]], kk);
			}
			
			if (kk != global.key_confirm && menu_option[page] == 5)
			{
				global.key_enter = kk;
			}
			
			if (kk != global.key_confirm && menu_option[page] == 6)
			{
				global.key_back = kk;
			}
		break;
	}
} else
{
	var ochange = down_p - up_p;

	if (ochange != 0)
	{
		//audio here
		
		menu_option[page] += ochange;
	
		if (menu_option[page] > ds_height - 1)
		{
			menu_option[page] = 0;
		}
	
		if (menu_option[page] < 0)
		{
			menu_option[page] = ds_height - 1;
		}
	}
}
if (enter_p || confirm_p)
{
	//audio here
	
	switch (ds_grid[# 1, menu_option[page]])
	{
		case menu_element_type.script_runner:
			script_execute(ds_grid[# 2, menu_option[page]]);
		break;
		
		case menu_element_type.page_transfer:
			page = ds_grid[# 2, menu_option[page]];
		break;
		
		case menu_element_type.shift:
		case menu_element_type.slider:
		case menu_element_type.toggle: 
			if (inputting)
			{
				script_execute(ds_grid[# 2, menu_option[page]], ds_grid[# 3, menu_option[page]]);
			}
			inputting = !inputting;
		break;
		
		case menu_element_type.input:
			if (!enter_p)
			{
				inputting = !inputting;
			}
		break;
	}
}

if (back_p && !inputting)
{
	switch (menu_pages[page])
	{
		case 0:
			global.pause = false;
		break;
		
		case 1:
			page = 0;
		break;
		
		case 2:
		case 3:
		case 4:
			page = 1;
		break;
	}
}