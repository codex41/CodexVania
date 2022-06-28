function EnemyRBShake(argument0, argument1) 
{
	with (oEnemyRB)
	{
		if (argument0 > shake_remain)
		{
			shake_magnitude = argument0;
			shake_remain = argument0;
			shake_length = argument1;
		}
	}
}