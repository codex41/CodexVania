if (position_meeting(x,y-10,oPlayer1))
{
	image_speed = 1;
		image_index = 0;
	if image_index >= 1
	{
		image_speed = 0;
		isPressed = true;
	}
}
image_speed = -1;
if (image_index <= 0) image_speed = 0;