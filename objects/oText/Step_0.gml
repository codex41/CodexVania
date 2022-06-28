/// @desc Progress text

letters += spd;
text_current = string_copy(text,1,floor(letters));

draw_set_font(fMenu);
if (h == 0) h = string_height(text);
w = string_width(text_current);
with (oPlayer) TouchingSign = 1;
with (oGun) reading = 1;
//destroy when done
if (letters >= length) && (keyboard_check_released(vk_anykey)) || (mouse_check_button_released(mb_right)) || (gamepad_button_check_released(0,gp_face3))
{
	with (oGun) reading = 0;
	with (oPlayer) TouchingSign = 0;
	instance_destroy();
	instance_destroy(oIndicate,false)	
	with (oCamera) follow = oPlayer;
}