
//move player towards center
layer_x("TitleAssets",min(layer_get_x("TitleAssets")+1,RES_W * 0.25));

letters += spd;
text = string_copy(endtext[currentline],1,floor(letters));

if (letters >= length) && ((keyboard_check_pressed(vk_anykey)) || (gamepad_button_check_pressed(0,gp_face1)))
{
	gamepad_set_vibration(0,0,0.5);
	alarm[0] = 20;
	if (currentline+1 == array_length(endtext))
	{
		SlideTransition(TRANS_MODE.RESTART);
	}
	else
	{
		currentline++;
		letters=0;
		length = string_length(endtext[currentline]);
	}
}