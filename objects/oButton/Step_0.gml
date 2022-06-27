with (oCharacter)
{
	if place_meeting(x+1,y+4,oButton) or place_meeting(x-1,y+4,oButton)
	{
		other.isPressed = true;	
	}
	else
	{
		other.isPressed = false;
	}
}
if (isPressed = true)
{
	image_speed = 1;
	if (image_index > 4) image_speed = 0;
	with(oBarrier) isOpen = true;
}
else
{
	image_speed = -0.125;
	if image_index <= 1 
	{
		image_speed = 0;
		with(oBarrier) isOpen = false;
	}
}