//Debug

if (global.debugging)
{
	with (oPlayer)
	{
		switch (state)
		{
			case scrGrounded:
			draw_text(10, 10, "State: Grounded");
			break;
	
			case scrAirborne:
			draw_text(10, 10, "State: Airborne");
			break;
			
			case scrCrouched:
			draw_text(10, 10, "State: Crouched");
			break;
		}
	
		draw_text(10, 20, "hsp: " + string(hsp));
		draw_text(100, 20, "vsp: " + string(vsp));
		draw_text(10, 30, "x: " + string(x));
		draw_text(100, 30, "y: " + string(y));
		draw_text(10, 40, "push frames: " + string(ppFrames));
		draw_text(10, 50, "push speed: " + string(ppSpeed));
		draw_text(10, 60, "air axl: " + string(airAxl));
		draw_text(10, 70, "air drag: " + string(airDrag));
		draw_text(10, 80, "max hsp: " + string(hspMax));
		draw_text(10, 90, "interactDir: " + string(ppDir));
		draw_text(10, 100, "ledge timer: " + string(ledgeTimer));
		draw_text(10, 110, "walljump timer: " + string(wallJumpTimer));
		draw_text(10, 120, "fall speed: " + string(curFallSpeed));
		draw_text(10, 130, "ppDir: " + string(ppDir));
		draw_text(10, 140, "input device: " + global.inputDevice);
	}
}
