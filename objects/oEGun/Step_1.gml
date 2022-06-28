x = owner.x;
y = owner.y-(owner.sprite_height*0.5);

image_xscale = abs(owner.image_xscale/2);
image_yscale = abs(owner.image_yscale/2);

if(instance_exists(oPlayer))
{
	if (image_angle > 90) and (image_angle < 270) image_yscale = -image_yscale;
	if (point_distance(oPlayer.x,oPlayer.y,x,y) < 600)
	{
		image_angle = point_direction(x,y,oPlayer.x,oPlayer.y);
		countdown--;
		if (countdown <= 0)
		{
			if (!collision_line(x,y,oPlayer.x,oPlayer.y,oWall,false,false))
			{
				countdown = countdownrate;
				audio_play_sound(snShoot,5,false);
				//this creates the bullet
				with (instance_create_layer(x,y,"Bullets",oEBullet))
				{
					spd = 4;	
					//other.image_angle refers to oGun's angle, the parent of this setup
					direction = other.image_angle + random_range(-5,5);
					image_angle = direction;
				}
			}
		}
	}
}