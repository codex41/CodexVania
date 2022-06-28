if (disable_time = 0) && (global.kills > 1)
{
	hp_cur -= 1;
}
gamepad_set_vibration(0,1,1)
alarm[0] = 10;
with (other) instance_destroy();