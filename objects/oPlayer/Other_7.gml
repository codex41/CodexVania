/// @description Footsteps!

if ((sprite_index == sPlayerRun) || (sprite_index == sPlayerStrafe)) 
{
	audio_play_sound(choose(snStep1,snStep2,snStep3,snStep4),1,false);
	gamepad_set_vibration(0,0,1);
	alarm[0] = 5;
}