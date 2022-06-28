/// @description Flash

if (flash > 0)
{
		//subtracts 1 flash/frame, set in damage portion of Step
	flash--;
	shader_set(shWhite);
	draw_self();
	shader_reset();
}
else
{
	draw_self();
}