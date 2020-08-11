var amount = string(ds_list_size(global.collectibleList));
var maxCol = 21;

if (amount < maxCol)
{
	text = "You have collected " + amount + "/" + string(maxCol) +  "collectibles and secrets.";
} else
{
	text = "You have collected everything! Congratulations!";
}