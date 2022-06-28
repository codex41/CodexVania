/// @desc Control Menu

//item ease in
menu_x += (menu_x_target - menu_x) / menu_speed;

//keyboard controls
if (menu_control)
{
	if (keyboard_check_pressed(vk_up)) or (keyboard_check_pressed(ord("W")))  or (gamepad_button_check_pressed(0,gp_padu))
	{
		audio_play_sound(snEnemyDeath, 10, false);
		gamepad_set_vibration(0,0,1)
		menu_cursor++;
		alarm[0] = 20;
		if (menu_cursor >= menu_items) menu_cursor = 0;
	}
	
	if (keyboard_check_pressed(vk_down)) or (keyboard_check_pressed(ord("S"))) or (gamepad_button_check_pressed(0,gp_padd))
	{
		audio_play_sound(snEnemyDeath, 10, false);
		gamepad_set_vibration(0,0,1)
		menu_cursor--;
		alarm[0] = 20;
		if (menu_cursor < 0) menu_cursor = menu_items-1;
	}

	if (keyboard_check_pressed(vk_enter)) or (keyboard_check_pressed(vk_space)) or (gamepad_button_check_pressed(0,gp_face1))
	{
		audio_play_sound(snEnemyDeath, 10, false);
		gamepad_set_vibration(0,1,0)
		alarm[0] = 60;
		menu_x_target = gui_width+200;
		menu_committed = menu_cursor;
		menu_control = false;
	}
	var mouse_x_gui = device_mouse_x_to_gui(0);
	var mouse_y_gui = device_mouse_y_to_gui(0);
	if (mouse_y_gui < menu_y) && (mouse_y_gui > menu_top) && (mouse_x_gui >= menu_x_target - 200) && (mouse_x_gui < menu_x_target)
	{
		menu_cursor = (menu_y - mouse_y_gui) div (menu_itemheight * 1.5);
		if (mouse_check_button_pressed(mb_left))
		{
			window_set_cursor(cr_none);
			audio_play_sound(snEnemyDeath, 10, false);
			menu_x_target = gui_width+200;
			menu_committed = menu_cursor;
			menu_control = false;
		}
	}
	

}

if (menu_x > gui_width+150) and (menu_committed != -1)
{

	switch (menu_committed)
	{
		case 2: SlideTransition(TRANS_MODE.GOTO,rOne); break;
		case 1: {
					if (!file_exists(SAVEFILE))
					{
						SlideTransition(TRANS_MODE.NEXT);
					}
					else
					{	
						var file = file_text_open_read(SAVEFILE);
						var target = file_text_read_real(file);
						global.kills = file_text_read_real(file);
						global.hasgun = file_text_read_real(file);
						file_text_close(file);
						SlideTransition(TRANS_MODE.GOTO,target);
					}
				}				
				break;
		case 0: game_end(); break;
	}
}
