/// @description Draw healthbar
DrawSetText(c_white,fUI,fa_center,fa_top);
//Health readout
draw_sprite(sHBarBG,0,healthbar_x,healthbar_y);
draw_sprite_stretched(sHBar,0,healthbar_x,healthbar_y,(hp_cur/hp_max)*healthbar_width,healthbar_height);
draw_sprite(sHBarBordDiv,0,healthbar_x,healthbar_y);
//draw_sprite(sHeart,0,healthbar_x-32,healthbar_y+4);

if (Debug = true)
{

	draw_text((healthbar_x - 41),(healthbar_y - 8),(string(hp_cur)/10));
	draw_text((healthbar_x - 41),(healthbar_y + 40),(string(disable_time)));
}