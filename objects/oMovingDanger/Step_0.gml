if !active exit;

//Catch up to player, but slow down when close
var dist = y - oPlayer.y;
if (dist < viewHeight)
{
	scrJumpInDirection(moveSpeed, moveDir);
} else
{
	y = oPlayer.y + viewHeight;
}

//SFX
if (audio_is_playing(sndSmokeWhisper))
{
	var gain = min(global.ambientVolume, 1 - dist / 200);
	audio_sound_gain(sndSmokeWhisper, gain, 500);
}