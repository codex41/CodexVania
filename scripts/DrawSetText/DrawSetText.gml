/// @argument0 color
/// @argument1 font
/// @argument2 halign
/// @argument3 valign


function DrawSetText(argument0, argument1, argument2, argument3) 
{
	draw_set_color(argument0);
	draw_set_font(argument1);
	draw_set_halign(argument2);
	draw_set_valign(argument3);
}