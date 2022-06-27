/// @desc Progress the transition
if (mode != TRANS_MODE.OFF)
{
	if (mode == TRANS_MODE.INTRO)
	{
		percent = max(0,percent-max((percent/10),0.005));
	}
	else
	{
		percent = min(1.2,percent+max(((1.2-percent)/10),0.005));
	}
	if (percent == 1.2) || (percent ==0)
	{
		switch (mode)
		{
			case TRANS_MODE.INTRO:
			{
				mode = TRANS_MODE.OFF;
				break;	
			}
			
			//Will send player to next room on Rooms list
			case TRANS_MODE.NEXT:
			{
				mode = TRANS_MODE.INTRO;
				room_goto_next();
				break;	
			}
			
			//Will send player to targeted room
			case TRANS_MODE.GOTO:
			{
				mode = TRANS_MODE.INTRO;
				room_goto(target);  //go to the room we specified in the creation code
				break;	
			}
			
			//Restarts game
			case TRANS_MODE.RESTART:
			{
				game_restart();
				break;	
			}
		}
	}
}