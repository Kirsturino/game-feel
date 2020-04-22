if (keyboard_check_pressed(ord("R")))
{
	room_restart();
}

if (keyboard_check_pressed(vk_escape))
{
	game_end();
}

if (keyboard_check_pressed(ord("T")))
{
	global.debugging = !global.debugging;
}

if (keyboard_check_pressed(ord("F")))
{
	switch (room) {
	    case rmTest:
	        room_goto(rmOne);
	        break;
	    default:
	        room_goto(rmTest);
	        break;
	}
}

//Ambient particles
part_emitter_stream(global.partSystem, global.ambientEmitter, global.ambientPart, -5);