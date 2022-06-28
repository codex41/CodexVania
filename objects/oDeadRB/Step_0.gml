if (done == 0)
{
	//allows gravity to work
	vsp = vsp + grv;
	
	//horizontal collision
	if (place_meeting(x+hsp,y,oWall))
	{
		while (!place_meeting(x + sign(hsp),y,oWall))
		{
			x = x + sign(hsp);	
		}
		hsp = 0;
	}
	x = x + hsp;

	//vertical collision
	if (place_meeting(x,y+vsp,oWall))
	{
		if (vsp > 0) 
		{
			done = 1;
			image_index = 1;
			repeat(irandom_range(300,400))
			{
				with (instance_create_layer(x,bbox_bottom,"Enemy",oDust))
				{
					image_speed = random_range(0.01,0.25);
					vsp = random_range(-250,0);
					hsp = random_range(-100,100);
				}
			}
		}
		while (!place_meeting(x,y + sign(vsp),oWall))
		{
			y = y + sign(vsp);	
		}
		vsp = 0;
	}
	y = y + vsp; 
	with (oPlayer)
	{
		if (hascontrol)
		{
			audio_play_sound(snDoor,4,false);
			hascontrol = false;
			SlideTransition(TRANS_MODE.GOTO,rEnding);
		}	
	}
}
