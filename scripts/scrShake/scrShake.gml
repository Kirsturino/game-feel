var amount = irandom_range(-shakeAmount, shakeAmount);


if (shakeDuration > 0)
{
	shakeX = amount;
	shakeY = amount;
	shakeDuration--;
} else
{
	shakeX = 0;
	shakeY = 0;
}

