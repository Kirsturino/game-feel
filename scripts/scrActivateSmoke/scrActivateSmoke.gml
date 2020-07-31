var trigger = instance_place(x, y, oActivateSmoke);

if (trigger != noone)
{
	with (oMovingDanger) active = true;
	instance_destroy(trigger);
}