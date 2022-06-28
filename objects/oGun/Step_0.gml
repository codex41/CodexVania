//position of gun
if (instance_exists(oPlayer))
{
	x = oPlayer.x;
	y = oPlayer.bbox_top-10;
	
	//check for crouching
	key_crouch = oPlayer.key_crouch;
	//check for 45 degree aiming
	key_aim_45_right = keyboard_check(ord("E")) or (gamepad_button_check(0,gp_shoulderrb));
	key_aim_45_left = keyboard_check(ord("Q")) or (gamepad_button_check(0,gp_shoulderlb));	
	var aim = key_aim_45_left - key_aim_45_right
	var analog_aim = false;
	if (key_crouch == 1) && (oPlayer.hsp == 0)
	{
		sprite_index = sGunEngage;
		image_speed = -1;
		image_angle = 0;
		if (!oPlayer.controller)
		{
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
			if (image_speed < 0)
			{	
				if (image_index < 1)
				{
					image_speed = 0;
				}
			}
		}
		else
		{
			image_angle = 0;
			//if pointing right
			if (oPlayer.image_xscale = -1)
			{
				image_angle = 180;
				image_yscale = -1;	
				image_xscale = 1;
				if (image_index < 1)
				{
					image_speed = 0;
				}
			}
			//if pointing left
			if (oPlayer.image_xscale = 1)
			{
				image_angle = 0;
				image_yscale = 1;
				image_xscale = 1;
				if (image_index < 1)
				{
					image_speed = 0;
				}
			}
		}
	}
	//Normal Gun behavior
	else
	//sets gun deploy animation, the freezes sprite on last frame. 
	//Effectively sGun with an animation before it.	
	{
		sprite_index = sGunEngage;
		image_speed = 1;
		if (!oPlayer.controller)
		{
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
		}
		else
		{
			if (oPlayer.image_xscale = -1)
			//if pointing left 
			{	
				image_angle = 180;
				image_yscale = -1;	
				image_xscale = 1;
			}	
			if (oPlayer.image_xscale = 1)
			//if pointing right
			{
				image_angle = 0;
				image_yscale = 1;
				image_xscale = 1;
			}
		}
		if (image_speed < 0)
		{	
			if (image_index < 1)
			{
				image_speed = 0;
			}
		}
	}
	if (image_speed > 0)
		{	
			if (image_index > 30)
			{
				image_speed = 0;
			}
		}
	if (image_speed = 0)
	{
		if (aim = 1)
		{
			image_angle = 135;
			image_yscale = -1;
		}
		if (aim = -1)
		{
			image_angle = 45;
			image_yscale = 1;
		}
		aim = 0;
	}
	if (aim = 0) && (image_index > 30) && (key_crouch == 0)
	{	
		if (oPlayer.controller == 0)
		{
			image_angle = point_direction(x,y,mouse_x,mouse_y);
		}
		else
		{
			var controllerh = gamepad_axis_value(0,gp_axisrh)
			var controllerv = gamepad_axis_value(0,gp_axisrv)

			if (abs(controllerh) > 0.4) || (abs(controllerv) > 0.4) && (!key_crouch)
			{
				var analog_aim = true;
				controllerangle = point_direction(0,0,controllerh,controllerv)
				if (abs(controllerh) < 0.4) oPlayer.image_xscale = oPlayer.image_xscale;
				if (controllerh >= 0.4) oPlayer.image_xscale = 1;
				if (controllerh <= -0.4) oPlayer.image_xscale = -1;
			}
			image_angle = controllerangle;
			if (analog_aim = false) 
			{
				if (oPlayer.image_xscale = -1)
				//if pointing left 
				{	
					image_angle = 180;
				}	
				if (oPlayer.image_xscale = 1)
				//if pointing right
				{
					image_angle = 0;
				}
			}
		}
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
	if ((mouse_check_button(mb_left)) || gamepad_button_check(0,gp_shoulderrb)) && (firingdelay < 0)
	{
		firingdelay = 40;
		recoil = 6;
		//bullet code
		audio_play_sound(snShoot,5,false);
		gamepad_set_vibration(0,0,0.5)
		alarm[0] = 15;
		//this creates the bullet
		with (instance_create_layer(x,y,"Bullets",oBullet))
		{
			spd = 7;	
			//other.image_angle refers to oGun's angle, the parent of this setup
			direction = other.image_angle;
			image_angle = direction;
		}
	//recoil function
	x =	x - lengthdir_x(recoil,image_angle);
	y = y - lengthdir_y(recoil,image_angle);
	}
}
else
{
	instance_destroy();
}