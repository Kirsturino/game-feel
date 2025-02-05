//Debug

//if (global.debugging)
//{
//	draw_set_alpha(0.8);
//	draw_rectangle_color(0, 0, viewWidth / 3, viewHeight, global.cBlack, global.cBlack, global.cBlack, global.cBlack, false);
//	draw_set_alpha(1);
	
//	draw_set_font(fDebug);
	
//	with (oPlayer)
//	{
//		switch (state)
//		{
//			case scrGrounded:
//			draw_text(10, 10, "State: Grounded");
//			break;
	
//			case scrAirborne:
//			draw_text(10, 10, "State: Airborne");
//			break;
			
//			case scrCrouched:
//			draw_text(10, 10, "State: Crouched");
//			break;
			
//			case scrDead:
//			draw_text(10, 10, "State: Dead");
//			break;
//		}
	
//		draw_text(10, 20, "hsp: " + string(hsp));
//		draw_text(60, 20, "vsp: " + string(vsp));
//		draw_text(10, 30, "x: " + string(x));
//		draw_text(50, 30, "y: " + string(y));
//		draw_text(10, 40, "push frames: " + string(ppFrames));
//		draw_text(10, 50, "push speed: " + string(ppSpeed));
//		draw_text(10, 60, "air axl: " + string(airAxl));
//		draw_text(10, 70, "air drag: " + string(airDrag));
//		draw_text(10, 80, "max hsp: " + string(hspMax));
//		draw_text(10, 90, "interactDir: " + string(ppDir));
//		draw_text(10, 100, "ledge timer: " + string(ledgeTimer));
//		draw_text(10, 110, "walljump timer: " + string(wallJumpTimer));
//		draw_text(10, 120, "fall speed: " + string(curFallSpeed));
//		draw_text(10, 130, "ppDir: " + string(ppDir));
//		draw_text(10, 140, "fps: " + string(fps) + "/" + string(fps_real));
//		draw_text(10, 150, "wantsToJump: " + string(wantsToJump));
//	}
	
//	draw_set_font(fDefault);
//}

//if (global.debugging)
//{
//	draw_set_font(fDebug);
//	draw_set_halign(fa_left);
//	draw_text(0, 0, oPlayer.vsp);
//	draw_text(0, 10, oPlayer.vspMax);
//	draw_text(0, 20, oPlayer.alarm[5]);
//	draw_set_font(fDefault);
//}

//Speedrunning timer
if (global.speedrunning && !global.runIsOver)
{
	draw_set_halign(fa_center);
	var c = global.cWhite;
		
	//Calculate minutes, hours and seconds
	var timer = (current_time - global.speedrunningTimerOffset) / 1000;
	var seconds = timer mod 60;
	var minutes = timer div 60;
	var hours = minutes div 60;
		
	//Draw text
	if (hours > 0)
	{
		scrDrawTextColorShadow(viewWidth / 2, 8, string(hours) + "h " + string(minutes) + "m " + string(seconds) + "s", c, c, c, c, 1);
	} else if (minutes > 0)
	{
		scrDrawTextColorShadow(viewWidth / 2, 8, string(minutes) + "m " + string(seconds) + "s", c, c, c, c, 1);
	} else
	{
		scrDrawTextColorShadow(viewWidth / 2, 8, string(seconds) + "s", c, c, c, c, 1);
	}

} else if (global.speedrunning && global.runIsOver)
{
	draw_set_halign(fa_center);
	var c = global.cWhite;
		
	//Calculate minutes, hours and seconds
	var seconds = global.speedrunningTimer mod 60;
	var minutes = global.speedrunningTimer div 60;
	var hours = minutes div 60;
	
	scrDrawTextColorShadow(viewWidth / 2, 8, "FINAL TIME: \n" + string(hours) + "h " + string(minutes) + "m " + string(seconds) + "s", c, c, c, c, 1);
}