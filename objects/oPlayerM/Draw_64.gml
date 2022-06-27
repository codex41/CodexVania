/// @desc Draw things
DrawSetText(c_white,fUI,fa_center,fa_top);
//Health readout
draw_sprite(sHBarBG,0,healthbar_x,healthbar_y);
draw_sprite_stretched(sHBar,0,healthbar_x,healthbar_y,(hp_cur/hp_max)*healthbar_width,healthbar_height);
draw_sprite(sHBarBordDiv,0,healthbar_x,healthbar_y);
draw_sprite(sHeart,0,healthbar_x-32,healthbar_y+4);
// Jetpack fuel readout
draw_sprite(sHBarBG,0,jetbar_x,jetbar_y);
draw_sprite_stretched(sJPBar,0,jetbar_x,jetbar_y,(jet_cur/jet_max)*jetbar_width,jetbar_height);
draw_sprite(sHBarBord,0,jetbar_x,jetbar_y);
draw_sprite(sFuel,0,jetbar_x-32,jetbar_y+4);
//Batt readout
draw_sprite(sHBarBG,0,Battbar_x,Battbar_y);
draw_sprite_stretched(sBattBar,0,Battbar_x,Battbar_y,(batt_cur/batt_max)*Battbar_width,Battbar_height);
draw_sprite(sHBarBord,0,Battbar_x,Battbar_y);
draw_sprite(sBattery,0,Battbar_x-32,Battbar_y+4);
//canfly/canjump debug
if (Debug = true)
{
	draw_text((Battbar_x - 32),(Battbar_y + 32),string(canfly));
	draw_text((Battbar_x - 32),(Battbar_y + 64),string(canjump));
	draw_text((Battbar_x - 41),(Battbar_y - 8),floor(string((batt_cur/batt_max)*100)));
	draw_text((jetbar_x - 41),(jetbar_y - 8),string(jet_cur));
	draw_text((healthbar_x - 41),(healthbar_y - 8),(string(hp_cur)/10));
	draw_text((healthbar_x - 41),(healthbar_y - 40),(string(oButton.isPressed)));
}