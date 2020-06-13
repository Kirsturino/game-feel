/// @description Timer for text to disappear

if(curTextAmount < textAmount)
{
	index = 0;
	textNumber++;
	curTextAmount++;
	text = ds_list_find_value(textList, textNumber);
	alarm[0] = 1;
} else
{
	drawText = false;
}