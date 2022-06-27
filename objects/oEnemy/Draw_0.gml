draw_self();
DrawSetText(c_white,fUI,fa_center,fa_bottom);
draw_self();
var hpdisp = (string(hp_cur) + "/" + string(hp_max));
var FloatSpace = (sprite_height/2);
var xx = abs(x)
var yy = y - 25
if (hp_cur > 0)
{
	draw_text(xx,yy-FloatSpace,hpdisp);
}
if (flash > 0)
{
	//subtracts 1 flash/frame, set in oBullet
	flash--;
	shader_set(shWhite);
	draw_self();
	shader_reset();
}