	//this sets up oEnemy to switch to oDead upon reaching 0hp
if (hp_cur <= 0)
{
		//anything that happens here must be referenced in oDead
		//put other."instance" to reference "instance" in oEnemy
	with(instance_create_layer(x,y,layer,oDeadR))
	{
			//this value is pulled from oBullet, based on the angle of oBullet upon collision with oEnemy
		direction = other.hitfrom;	
			//sets hsp on death, so horizontal knockback essentially
		hsp = lengthdir_x((other.hp_max*(other.size/2)),direction);
			//sets vsp on death, so how high the enemy is flung into the air. 
		vsp = lengthdir_y(((other.hp_max) * (grv * grv)),direction)-3;
			//this ensures that the enemy orients towards the hsp it's launched at. 
			//it also accounts for the freak chance that you hit the enemy perfectly at 0 degrees,
			//setting image_xscale to 0. It also properly scales the dead body with size.
		if (sign(hsp) !=0) image_xscale = sign(hsp) * size; image_yscale = size;
	}
	instance_destroy(mygun);
	if (instance_exists(oPlayer)) 
	{
		global.kills++;
		global.killsthisroom++;
		with (oGame) killtextscale = 2;
	}
	instance_destroy();
}