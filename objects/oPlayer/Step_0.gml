#region //Control Basics
if (hascontrol)
{
	#region keyboard/mouse controls
	//Get player input
	key_crouch = keyboard_check(vk_down) || keyboard_check(ord("S"));
	key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
	key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
	key_jump = keyboard_check(vk_up) || keyboard_check_pressed(vk_space);
	key_sprint = keyboard_check(vk_shift);
	#endregion
	#region Gamepad Controls
	//sets horizontal deadzone
	if (key_left) || (key_right) || (key_jump) || (key_crouch)
	{
		controller = 0;
	}
	if (abs(gamepad_axis_value(0,gp_axislh)) > 0.2)
	{
		key_left = ((abs(min(gamepad_axis_value(0,gp_axislh),0))) || (gamepad_button_check(0,gp_padl)));
		key_right = ((max(gamepad_axis_value(0,gp_axislh),0)) || (gamepad_button_check(0,gp_padr)));
		controller = 1;		
	}
	if gamepad_button_check(0,gp_padl) 
	{
		key_left = 1;
		controller = 1;
	}
	if gamepad_button_check(0,gp_padr)
	{
		key_right = 1;
		controller = 1;	
	}
	if (gamepad_button_check_pressed(0,gp_face1))
	{
		key_jump = 1;
		controller = 1;
	}
	if (gamepad_button_check(0,gp_face2))
	{
		key_sprint = 1;
		controller = 1;
	}
	//if inside h_deadzone and press down, then crouch
	if (abs(gamepad_axis_value(0,gp_axislh)) <= 0.2 && max(gamepad_axis_value(0,gp_axislv),0) || (gamepad_button_check(0,gp_padd)))
	{
		key_crouch = 1;
		controller = 1;
	}	
	#endregion
	//Calc movement
	var move = key_right - key_left;
	hsp = move * walksp;
	//allows gravity to work
	vsp = vsp + grv;
}
else
// if hascontrol is false, disable input
{
    key_aim_45_left = 0;
	key_aim_45_right = 0;
	key_crouch = 0;
	key_jump = 0;
	key_left = 0;
	key_right = 0;
}
#endregion
#region //Movement
//jump only if touching ground
canjump -= 1;
if (canjump > 0) && (key_jump) && (!key_crouch)
{
	//jump speed + vibration
	audio_play_sound(snJump,4,false);
	gamepad_set_vibration(0,0.8,0.4);
	alarm[0] = 5;
	if (key_sprint) vsp = -5.5;
	else vsp = -5;
	canjump = 0;
}

//horizontal collision
//if x position + speed intersects a wall
if (place_meeting(x+hsp,y,oWall))
{
	//while not touching a wall
	while (!place_meeting(x + sign(hsp),y,oWall))
	{
		//continue adding hsp to current direction
		x = x + sign(hsp);
	}
	//otherwise make speed 0
	hsp = 0;
}
x = x + hsp;
//vertical collision
//if y position + vertical speed intersects a wall
if (place_meeting(x,y+vsp,oWall))
{
	//continue vertical speed while not touching a wall
	while (!place_meeting(x,y + sign(vsp),oWall))
	{
		y = y + sign(vsp);	
	}
	//otherwise stop vertical speed
	vsp = 0;
}
y = y + vsp;
#endregion
#region //Animations
	#region //Aiming Behavior
	if (controller == 0) // Mouse Aim
	{
		if (global.hasgun)
		{
			var aimside = sign(mouse_x - x);
			if (aimside != 0) image_xscale = aimside;
		}
		else 
		{
			var aimside = sign(hsp);
			if (aimside != 0) image_xscale = aimside
		}
	}
	else // Gamepad Aim
	{
		var aimside = sign(hsp);
		if (aimside != 0) image_xscale = aimside;
	}
	#endregion
	#region //Airborne Behavior
	// If(not touching ground) use sPlayerAir as sprite, frame (image_index) 1 if rising, 0 if falling
	if (!place_meeting(x,y+1,oWall))
	{
		landanim = 0;
		sprite_index = sPlayerAir;
		image_speed = 0;
		if (sign(vsp) > 0) image_index = 1; else image_index = 0;
	}
	#endregion
	#region //Ground Behavior
	else
	{
		//ensures landanim doesn't run away, keeps it capped at 2.
		if (landanim > 1) landanim = 2;
		//coyote time
		canjump = 30;
		//triggers dust, vibration and landing animation
		if (sprite_index == sPlayerAir)
		{
			audio_sound_pitch(snLand,choose(0.5,1.0,1.5));
			audio_play_sound(snLand,4,false);
			gamepad_set_vibration(0,0.8,0.2);
			alarm[0] = 10;
			repeat(irandom_range(4,6))
			{
				with (instance_create_layer(x,bbox_bottom,"Entities",oDust))
				{
					vsp = 0;
				}
			}
		}
		//if not moving
		if (hsp == 0)
		{
			#region //Crouch and Landing behavior
			//sets crouch and stand variables
			if (key_crouch) crouching = true;
			else crouching = false;
			
			if crouching = true
			{
				standing = false;
				walksp = 0;
				image_speed = 1;
				sprite_index = sPlayerCrouch;
				mask_index = sPlayerCrouch;
				if (image_index >= 4)
				{
					image_speed = 0;
					landanim++;
				}
			}
			if crouching = false && sprite_index != sPlayer
			{
				image_speed = -1;
				if (image_index < 1)
				{
					crouching = false;
					standing = true;
				}
				//When crouch animation ends, or if it never began, play landing animation. after 
				//landing animation, set sprite to sPlayer.
				if standing = true 
				{
					walksp = 1.5;
					image_speed = 1;
					mask_index = sPlayer;
					sprite_index = sPlayerLand;
					if (image_index > 4) landanim++;
					if (landanim > 1) sprite_index = sPlayer;
				}
			}
			#endregion			
		}
		//If moving
		else
		{
			#region //running and strafing landing anims
			image_speed = 1;
			
			sprite_index = sPlayerRunLand;
			if (image_index > 4) landanim++;
			if (landanim > 1) sprite_index = sPlayerRun;
				
			if (aimside != sign(hsp))
			{
				sprite_index = sPlayerStrafeLand;
				if (image_index > 4) landanim++;
				if (landanim > 1) sprite_index = sPlayerStrafe;
			}
			#endregion
			#region //Dust Layer when sprinting, boost walksp and anim speed
			if (key_sprint)
			{
				walksp = 2.3;
				if (aimside != sign(hsp)) sprite_set_speed(sPlayerStrafe, 24, spritespeed_framespersecond)
				else sprite_set_speed(sPlayerRun, 24, spritespeed_framespersecond)
				with (instance_create_layer(x,bbox_bottom,"Bullets",oDust))
				{
					image_speed = 0.3;			
					if (vsp > 0) vsp = 0;
					hsp = random_range(-5,5);
					image_xscale = choose(0.5,-0.5);
					image_yscale = choose(0.5,-0.5);
				}
			}
			#endregion
			else //set anim speed and walksp back down to default
			{
				if (aimside != sign(hsp)) sprite_set_speed(sPlayerStrafe, 15, spritespeed_framespersecond)
				else sprite_set_speed(sPlayerRun, 15, spritespeed_framespersecond)
				walksp = 1.5;
			}
		}
	}
#endregion
#endregion
#region //Damage recieved, death, and knockback
//Triggers death on 0 HP
if (hp_cur <= 0)
{
	instance_change(oPDead,true); 

	direction = point_direction(other.x,other.y,x,y)
	hsp = lengthdir_x(3,direction);
	vsp = lengthdir_y(2,direction)-2;
	if (sign(hsp) != 0) image_xscale = -sign(hsp)
}
//Damage knockback
if (place_meeting(x,y,pShootable)) && disable_time = 0
{
	if global.kills > 0 && is_hurt = false
	{
		var kdir = x - pShootable.x
		hp_cur -= pShootable.deal_dmg;
		audio_play_sound(snTakeDamage,0,0)
		is_hurt = true;
		hascontrol = false;
		flash = 3;
		with (oGun) flash = 3;
		alarm[1] = 45;
		if (kdir <= 0)
		{
			hsp = abs(pShootable.hsp)/2 * -pShootable.knockback;
		}
		else
		{
			hsp = abs(pShootable.hsp)/2 * pShootable.knockback;	
		}
		vsp = -pShootable.knockback;
		disable_time = 480;
		ScreenShake(5,10);
	}
}
else
{
	disable_time -= 1;
	if (disable_time < 1) disable_time = 0;
	if disable_time < 420 hascontrol = true;
	if disable_time = 0
	{
		is_hurt = false;
	}
}
#endregion