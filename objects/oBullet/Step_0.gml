x += lengthdir_x(spd,direction);
y += lengthdir_y(spd,direction);


if (place_meeting(x,y,oEnemy))
{
	with (instance_place(x,y,oEnemy))
	{
		hp_cur--;
		flash = 3;	
			//because this other. is nested inside a condition already pointing at a with, 
			//this other refers back to the original object, oBullet. this will write the angle
			//the bullet hit the enemy back to oEnemy Begin Step
		hitFrom = other.direction;
		ScreenShake(3,10)
		//audio_sound_pitch(snTakeDamage,(choose(0.5,0.75,1.0,1.25)/(size/2)));
		//audio_play_sound(snTakeDamage, 10, false);
	}
	//if (place_meeting(x,y,oCrate))
	//{
	//	with (instance_nearest(x,y,oCrate))
	//	{
	//		if image_index < 2
	//		{
	//			image_index++;	
	//		}
	//	}
	//}
	instance_destroy();
}
if (place_meeting (x,y,oStandable))
{
	while (place_meeting(x,y,oStandable))
	{
		x -= lengthdir_x(1,direction);
		y -= lengthdir_y(1,direction);	
	}
	spd = 0;
	instance_change(oHitSpark,true);
	//audio_sound_pitch(snWallHit,choose(0.5,0.75,1.0,1.25,1.5));
	//audio_play_sound(snWallHit,4,false)
}