var amount = string(ds_list_size(global.collectibleList));

if (amount < 18)
{
	text = "You have collected " + amount + "/18 collectibles and secrets.";
} else
{
	text = "You have collected everything!";
}