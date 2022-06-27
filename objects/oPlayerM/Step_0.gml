#region //Inputs
//listens for inputs, but can switch off if needed, ie room transitions
vsp = (vsp + grv);
if (hascontrol)
{
	//Get player input
	key_crouch = keyboard_check(vk_down) || keyboard_check(ord("S"));
	key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
	key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
	key_jump = keyboard_check(vk_up) || keyboard_check_pressed(vk_space);
	key_sprint = keyboard_check(vk_shift);
	//Calc movement
	var move = key_right - key_left;
	hsp = (move * walksp);
	//power modifiers
	if keyboard_check(key_sprint) && (hsp != 0)
	{
		walksp = 10;
		batt_cur -= 0.2; 
	}
	if keyboard_check_released(key_sprint) && (hsp != 0)
	{
		walksp = 5;
		batt_cur -= 0.05;
	}
	if ((batt_cur/batt_max)*100 < 50)
	{
		walksp = 2.5;
	}
}
else
{
	key_crouch = 0;
	key_jump = 0;
	key_left = 0;
	key_right = 0;
}
#endregion
#region //Movement + collision
//jump only if touching ground
canjump -= 1;
if (key_jump) && (canjump > 0)
{
	//jump speed
	vsp = -15;
	canjump = 0;
	canfly = 0;
	batt_cur = batt_cur - 10;
}
//horizontal collision
//if x position + speed intersects a wall
if (place_meeting(x+hsp,y,oStandable))
{
	//while not touching a wall
	while (!place_meeting(x+sign(hsp),y,oStandable))
	{
		//continue adding hsp to current direction
		x = x + sign(hsp);
	}

	//otherwise make speed 0
	hsp = 0;
}
if (!key_crouch) x += hsp;
//vertical collision
//if y position + vertical speed intersects a wall
if (place_meeting(x,y+vsp,oStandable))
{
	if (place_meeting(x,y+sign(vsp),oWallPwr))
	{
		//charging = true;
		batt_cur += 1;
	}
	else
	{
		//charging = false;
		batt_cur -= 0.02;
	}
	if (place_meeting(x,y+sign(vsp),oWallHeal))
	{
		batt_cur += 1;
		if (key_crouch)	hp_cur += 10;
	}
	if (batt_cur >= batt_max) batt_cur = batt_max;
	if (batt_cur <= 0) batt_cur = 0;
	if (hp_cur >= hp_max) hp_cur = hp_max;
	//continue vertical speed while not touching a floor
	while (!place_meeting(x,y + sign(vsp),oStandable))
	{
		y = y + sign(vsp);
	}
	//otherwise stop vertical speed
	vsp = 0;
}
y += vsp;
#endregion
#region //Jetpack
//jet_cur is fuel level, jet_max is max fuel, flydelay is how many frames into a jump
//it takes to enable jetpack. can be set in variable definitions
canfly += 1;
if (canfly >= flydelay) canfly = flydelay;

if (jet_cur > 0) && (canfly = flydelay) 
{
	if (keyboard_check(vk_space) && (!key_crouch))
	{
		jet_cur -= 1;
		vsp = -5;
	}
}
#endregion
#region //Animations
// If (not touching ground) use sPlayerAir as sprite, frame (image_index) 1 if rising, 0 if not
if (!place_meeting(x,y+1,oStandable))
{
	//sprite_index = sPlayerAir;
	//image_speed = 0;
	//if (sign(vsp) > 0) image_index = 1; else image_index = 0;
}
else
{
	//refuels jet_cur on the ground
	jet_cur += 1;
	//prevents jet_cur from exceeding jet_max
	if (jet_cur >= jet_max) jet_cur = jet_max;
	//prevents jetpack hopping
	if (jet_cur != jet_max) canfly = 0;
	//sets coyotejump pixel range
	canjump = 10;
	//if (sprite_index == sPlayerAir)
	//{
	//	audio_sound_pitch(snLand,choose(0.5,1.0,1.5));
	//	audio_play_sound(snLand,4,false);
	//	repeat(irandom_range(4,6))
	//	{
	//		with (instance_create_layer(x,bbox_bottom,"Entities",oDust))
	//		{
	//			vsp = 0;
	//		}
	//	}
	//}
	//image_speed = 1;
	if (hsp == 0)
	{
		
	}
	else
	{
		//image_speed = 1;
		//sprite_index = sPlayerRun;
		//with (instance_create_layer(x,bbox_bottom,"Bullets",oDust))
		//{
		//	image_speed = 0.3;			
		//	if (vsp > 0) vsp = 0;
		//	hsp = random_range(-5,5);
		//	image_xscale = choose(0.5,-0.5);
		//	image_yscale = choose(0.5,-0.5);
		//}
	}
	if (key_crouch)
		{
			canfly = 0;
			canjump = 0;
			batt_cur += 0.02;
			image_yscale = 0.5;
			//sprite_index = sPlayerCrouch;
			//mask_index = sPlayerCrouch;
			//if 	(image_index > 17)
			//{
			//	image_speed = 0;
			//} 
		}
		if (keyboard_check_released(key_crouch)) 
		{
			image_yscale = 1;
			//image_speed = -1
			//if image_index < 1
			//{
			//	sprite_index = sPlayer;
			//	mask_index = sPlayer;
			//	image_index = 0;
			//	image_speed = 1;
			//}
		}
}
//keeps orientation in direction of movement
if (hsp != 0) image_xscale = sign(hsp);
#endregion
#region //Damage recieved and death
//Triggers death on 0 HP
if (hp_cur <= 0)
{
	instance_change(oPMDead,true);

	direction = point_direction(other.x,other.y,x,y)
	hsp = lengthdir_x(3,direction);
	vsp = lengthdir_y(2,direction)-2;
	if (sign(hsp) != 0) image_xscale = sign(hsp)
}
//Damage knockback
if (place_meeting(x,y,oEnemy)) && disable_time = 0
{
	is_hurt = true;
	hascontrol = false;
	flash = 3;
	if (hsp >= oEnemy.hsp)
	{
		hsp = abs(oEnemy.hsp) * -oEnemy.knockback;
	}
	else
	{
		hsp = abs(oEnemy.hsp) * oEnemy.knockback;	
	}
	vsp = -15;
	hp_cur = hp_cur - oEnemy.deal_dmg;
	disable_time = 30;
	ScreenShake(5,10);
}
else
{
	disable_time -= 1;
	if (disable_time <=0) disable_time = 0;
	if disable_time  = 0
	{
		hascontrol = true;
	}
}
#endregion