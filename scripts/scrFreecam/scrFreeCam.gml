//Move camera
var spd = .11;

curX = camera_get_view_x(view);
curY = camera_get_view_y(view);

xTo = lerp(curX, xx, spd);
yTo = lerp(curY, yy, spd);

camera_set_view_pos(view, xTo, yTo);

//Don't move camera if paused
if global.pause exit;

//Gameplay inputs
if (gamepad_axis_value(global.controller, gp_axislh) < 0 || gamepad_button_check(global.controller, global.button_left) || keyboard_check(global.key_left))
{
	left = true;
} else
{
	left = false;
}

if (gamepad_axis_value(global.controller, gp_axislh) > 0 || gamepad_button_check(global.controller, global.button_right) || keyboard_check(global.key_right))
{
	right = true;
} else
{
	right = false;
}
	
if (gamepad_axis_value(global.controller, gp_axislv) > 0 || gamepad_button_check(global.controller, global.button_down) || keyboard_check(global.key_down))
{
	down = true;
} else
{
	down = false;
}

if (gamepad_axis_value(global.controller, gp_axislv) < 0 || gamepad_button_check(global.controller, global.button_up) || keyboard_check(global.key_up))
{
	up = true;
} else
{
	up = false;
}

//Calculate where to move camera
var hMove = right - left;
var vMove = down - up;

hsp = hMove * moveSpeed;
vsp = vMove * moveSpeed;
	
xx += hsp;
yy += vsp;

xx = clamp(xx, 0, room_width - viewWidth);
yy = clamp(yy, 0, room_height - viewHeight);