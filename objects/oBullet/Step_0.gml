x += lengthdir_x(spd,direction);
y += lengthdir_y(spd,direction); 

if (place_meeting(x,y,pShootable))
{
	with (instance_place(x,y,pShootable))
	{
		hp_cur--;
		flash = 3;	
			//because this other. is nested inside a condition already pointing at a with, 
			//this other refers back to the original object, oBullet. this will write the angle
			//the bullet hit the enemy back to pShootable Begin Step
		hitfrom = other.direction;
		hitcount++;
		ScreenShake(3,10)
		gamepad_set_vibration(0,0.5,1)
		with(pShootable) alarm[0] = 10;
		audio_sound_pitch(snTakeDamage,(choose(0.5,0.75,1.0,1.25)/(size/2)));
		audio_play_sound(snTakeDamage, 10, false);
	}
	with (instance_place(x,y,oCrate))
	{
		if image_index < 2
		{
			image_index++;	
		}
	}
	instance_destroy();
}
if (place_meeting (x,y,oWall))
{
	while (place_meeting(x,y,oWall))
	{
		x -= lengthdir_x(1,direction);
		y -= lengthdir_y(1,direction);	
	}
	with (oGun)
	{
		gamepad_set_vibration(0,0.25,0)
		alarm[0] = 10;
	}
	spd = 0;
	instance_change(oHitSpark,true);
	audio_sound_pitch(snWallHit,choose(0.5,0.75,1.0,1.25,1.5));
	audio_play_sound(snWallHit,4,false)
}