oController.alarm[2] = oController.animationLength;


if (instance_exists(oPlayer))
{
	if (oPlayer.state == scrDead)
	{
		with (oPlayer)
		{
			scrSpawn();
		}
	}
}