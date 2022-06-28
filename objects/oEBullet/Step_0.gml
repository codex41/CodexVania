x += lengthdir_x(spd,direction);
y += lengthdir_y(spd,direction);



if (place_meeting (x,y,oWall))
{
	while (place_meeting(x,y,oWall))
	{
		x -= lengthdir_x(1,direction);
		y -= lengthdir_y(1,direction);	
	}
	spd = 0;
	instance_change(oHitSpark,true);
	audio_sound_pitch(snWallHit,choose(0.5,0.75,1.0,1.25,1.5));
	audio_play_sound(snWallHit,4,false)
}