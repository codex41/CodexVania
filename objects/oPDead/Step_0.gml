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
			repeat(irandom_range(30,40))
			{
				with (instance_create_layer(x,bbox_bottom,"Player",oDust))
				{
					image_speed = random_range(0.0001,0.0025);
					vsp = random_range(-20,0);
					hsp = random_range(-15,15);
				}
			}
			alarm[0] = 60;
		}
		while (!place_meeting(x,y + sign(vsp),oWall))
		{
			y = y + sign(vsp);	
		}
		vsp = 0;
	}
	y = y + vsp;
}