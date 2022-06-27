if (isOpen = true) or place_meeting(x,y+1,oCharacter)
{
	image_yscale--;
	if (sprite_height <=0) image_yscale = 0;
}
if (isOpen = false)
{
	image_yscale++;
	if(place_meeting(x,y,oStandable)) image_yscale = barrier_max;
}