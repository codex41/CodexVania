//position of gun
x = oPlayerM.x;
y = oPlayerM.y-38;

//check for crouching
key_crouch = keyboard_check(vk_down) || keyboard_check(ord("S"));

//check for 45 degree aiming
key_aim_45_right = keyboard_check(ord("E"));
key_aim_45_left = keyboard_check(ord("Q"));	

var aim = key_aim_45_left - key_aim_45_right


if (key_crouch = true) && (oPlayerM.hsp == 0)
{
//	sprite_index = sGun;
//	image_speed = -1;
//	if (mouse_x < x) 
//	//mouse on left side
//	{	
//		image_angle = 180;
//		image_yscale = -1;	
//		image_xscale = 1;
//	}	
//	else
//	//mouse on right side
//	{
//		image_angle = 0;
//		image_yscale = 1;
//		image_xscale = 1;
//	}
//	if (image_speed < 0)
//	{	
//		if (image_index < 1)
//		{
//			image_speed = 0;
//		}
//	}
}
//Normal Gun behavior
else
//sets gun deploy animation, the freezes sprite on last frame. 
//Effectively sGun with an animation before it.	
{
	sprite_index = sGun;
	image_speed = 0;
	if (mouse_x < x) 
	//mouse on left side
	{	
		image_angle = 180;
		image_yscale = -1;	
		image_xscale = 1;
	}	
	else
	//mouse on right side
	{
		image_angle = 0;
		image_yscale = 1;
		image_xscale = 1;
	}
	if (image_speed > 0)
		{	
			if (image_index > 30)
			{
				image_speed = 0;
			}
		}
	//if (image_speed = 0)
	//{
	//	if (aim = 1) && (reading = 0)
	//	{
	//		image_angle = 135;
	//		image_yscale = -1;
	//	}
	//	if (aim = -1) && (reading = 0)
	//	{
	//		image_angle = 45;
	//		image_yscale = 1;
	//	}
	//	aim = 0;
	//}
	if (aim = 0) 
	{
		image_angle = point_direction(x,y,mouse_x,mouse_y);
	}
		//keeps gun topside up
	if (image_angle > 90) && (image_angle < 270) 
	{	
		image_yscale = -1;	
	}
	else
	{	
		image_yscale = 1;
	}	
	//shooting section//
	//firing cooldown	
	firingdelay = firingdelay - 1;
	//recoil calc, recoil - x where x is how recoil reset multiplyer
	recoil = max(0,recoil - 0.8);
	if (mouse_check_button(mb_left)) && (firingdelay < 0)
	{
		firingdelay = 10;
		recoil = 6;
		with (oPlayerM) batt_cur -= 1;
		//audio_play_sound(snShoot,5,false);
		//this creates the bullet
		with (instance_create_layer(x,y,"Bullets",oBullet))
		{
			spd = 30;	
			//other.image_angle refers to oGun's angle, the parent of this setup
			direction = other.image_angle;
			image_angle = direction;
		}
	}
	//recoil function
	x =	x - lengthdir_x(recoil,image_angle);
	y = y - lengthdir_y(recoil,image_angle);
}
