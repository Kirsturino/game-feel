//Adjust ledge grab speed depending on if slowfalling
if (jumpHeld)
{
	ledgeGrabSpeed = ledgeGrabSpeedHeld;
} else
{
	ledgeGrabSpeed = ledgeGrabSpeedNormal;
}

//Ledge grab
var rightLedge = instance_place(x + 1, y, oCollision);
if (place_meeting(x + 1, y, oCollision))
{
	//See if there is space above ledge
	if (instance_place(x + blockSize, y - ledgeGrabLength, oCollision) == noone)
	{
		var rightLedgeVacant = true;
	} else
	{
		var rightLedgeVacant = false;
	}

	//Grab. that. ledge! But only when holding the direction the ledge is in
	if (rightLedge != noone && rightLedgeVacant && move == 1 && vsp >= 0)
	{
		vsp = -ledgeGrabSpeed;
	}
}

var leftLedge = instance_place(x - 1, y, oCollision);
if (place_meeting(x - 1, y, oCollision))
{
	//See if there is space above ledge
	if (instance_place(x - blockSize, y - ledgeGrabLength, oCollision) == noone)
	{
		var leftLedgeVacant = true;
	} else
	{
		var leftLedgeVacant = false;
	}

	//Grab. that. ledge! But only when holding the direction the ledge is in
	if (leftLedge != noone && leftLedgeVacant && move == -1 && vsp >= 0)
	{
		vsp = -ledgeGrabSpeed;
	}
}