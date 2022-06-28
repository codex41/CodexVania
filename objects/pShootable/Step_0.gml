if (isEnemy)
{
	if (place_meeting(x+sign(hsp),y,oPlayer)) && (oPlayer.disable_time = 0)
	{
		hp_cur -= 1;
	}
}