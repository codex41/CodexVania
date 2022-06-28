	//with (other) sends hp, timeshit, flash, and hitfrom to oEnemy
with (other)
{
	hp--;
	
		//keeps a counter of how many hits an enemy took
	hitcount++;
	flash = 3;
	
		//because this other. is nested inside a condition already pointing at an other, 
		//this other refers back to the original object, oBullet. this will write the direction
		//the bullet hit the enemy back to oEnemy Begin Step
	hitfrom = other.direction;
}
ScreenShake(3,10)
audio_sound_pitch(snTakeDamage,(choose(0.5,0.75,1.0,1.25)/(other.size/2)));
audio_play_sound(snTakeDamage, 10, false);
instance_destroy();