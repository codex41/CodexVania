//allows gravity to work
vsp = vsp + grv;

	//horizontal collision
if (place_meeting(x+hsp,y,oWall))
{
	while (!place_meeting(x+sign(hsp),y,oWall))
	{
		
		x = x + sign(hsp);	
	}
	hsp = -hsp;
}
x = x + hsp;
	//vertical collision
if (place_meeting(x,y+vsp,oWall))
{
	while (!place_meeting(x,y+sign(vsp),oWall))
	{
		y = y + sign(vsp);	
		repeat(irandom_range(4,6))
		{
			with (instance_create_layer(x,bbox_bottom,"Entities",oDust))
			{
				image_speed = random_range(0.1,0.5);
				hsp = random_range(-3,3);
				vsp = random_range(-4,0);
			}
		}
	}
	vsp = 0;
}
y = y + vsp;

	//Animations
	// If(not touching ground) use sEnemyAir as sprite, frame (image_index) 1 if rising, 0 if not
if (!place_meeting(x,y+1,oWall))
{
	sprite_index = sEnemyAir;
	image_speed = 0;
	if (sign(vsp) > 0) image_index = 1; else image_index = 0;
}
	//otherwise, use sEnemy as sprite if standing still. If moving, use sEnemyRun as sprite
else
{
	image_speed = 1;
	if (hsp == 0)
	{
		sprite_index = sEnemy;
	}
	else
	{
		sprite_index = sEnemyRun;
	}
}
	//keeps orientation in direction of movement
if (hsp != 0) 
	{
		image_xscale = -sign(hsp) * size;
		image_yscale = size;
	}