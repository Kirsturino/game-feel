var amount = string(ds_list_size(global.collectibleList));

if (amount < 20)
{
	text = "You have collected " + amount + "/20 collectibles and secrets.";
} else
{
	text = "You have collected everything! Congratulations!";
}